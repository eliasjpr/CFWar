/**
* My Plugin Hint
*/
component {
    variables.from =  'eperez@imtechgraphics.com';
    mailer function init(){

        // Plugin Properties
        setPluginName( "" );
        setPluginVersion( "1.0" );
        setPluginDescription( "My Plugin" );
        setPluginAuthor( "" );
        setPluginAuthorURL( "http://www." );


        return this;
    }


    /**
     * Sends a welcome email to the specified user
     * @user takes a user object
     */
    function welcome(required any user){
        // Used by the email layout to render this e-mail's view

        local.tmpl_html = renderLayout(layout='mailer',view='mailer/welcome_email_html', args={user= arguments.user});
        local.tmpl_txt  = renderView(view='mailer/welcome_email_txt', args={user: arguments.user});

        // Create a new mail object
        local.Email = getPlugin('MailService').newMail( from = variables.from , to = user.emailaddress , subject = 'Welcome to media manager');

        // Add plain text email
        local.Email.addMailPart(charset='utf-8',type='text/plain',body=local.tmpl_txt);

        // Add HTML email
        local.Email.addMailPart(charset='utf-8',type='text/html',body=local.tmpl_html);

        // Send the email. MailResult is a boolean.
        return getPlugin('MailService').send(local.Email);
    }

    /**
     * Generates a new password for the user and sends an email
     * @user takes a user object
     */
    function recover(required any user){
        // Used by the email layout to render this e-mail's view
        var pass = arguments.user.generatePassword();

        arguments.user.save();

        local.tmpl_html = renderLayout(layout='mailer',view='mailer/recover_html', args={user= arguments.user, password= pass});
        local.tmpl_txt  = renderView(view='mailer/recover_txt', args={user: arguments.user, password=pass});

        // Create a new mail object
        local.Email = getPlugin('MailService').newMail( from = variables.from , to = user.emailaddress , subject = 'Your password recovery instructions.');

        // Add plain text email
        local.Email.addMailPart(charset='utf-8',type='text/plain',body=local.tmpl_txt);

        // Add HTML email
        local.Email.addMailPart(charset='utf-8',type='text/html',body=local.tmpl_html);

        // Send the email. MailResult is a boolean.
        return getPlugin('MailService').send(local.Email);
    }

    /**
     * Send digest email reports at a specific interval
     * @interval {string} required string        interval [description]
     * @return {[type]}          [description]
     */
    function digest(required string interval){
        var results = [];
        // Get query of users to email
        var users = ormExecuteQuery('SELECT u
                                    FROM setting as s
                                    JOIN s.user as u
                                    WHERE s.interval=:interval', {interval: arguments.interval});


        for(var user in users){
            local.tmpl_html = renderLayout(layout='mailer',view='mailer/digest_html', args={user= user});
            local.tmpl_txt  = renderView(view='mailer/digest_txt', args={user= user});

            // Create a new mail object
            local.Email = getPlugin('MailService').newMail( from = variables.from , to = user.emailaddress , subject = 'Daily Project Report for #user.fullname()#.');

            // Add plain text email
            local.Email.addMailPart(charset='utf-8',type='text/plain',body=local.tmpl_txt);

            // Add HTML email
            local.Email.addMailPart(charset='utf-8',type='text/html',body=local.tmpl_html);

            // Send the email. MailResult is a boolean.
            results.append(getPlugin('MailService').send(local.Email));
        }

        return results;
    }

    function notify( required string people, required any media, required any activity){
        var results = [];


        var users = listFindNoCase(arguments.people, 'Everyone')? arguments.media.recipients : EntityNew('user').getAllByIDs(arguments.people);

        for( var user in users){

            local.tmpl_html = renderLayout(layout='mailer',view='mailer/notify_html', args={ user= user, activity= arguments.activity, media= arguments.media});
            local.tmpl_txt  = renderView(view='mailer/notify_txt', args={user= user, activity= arguments.activity, media= arguments.media});

            // Create a new mail object
            local.Email = getPlugin('MailService').newMail( from= variables.from , to= user.emailaddress , subject= 'Activity notification for #arguments.media.number#');

            // Add plain text email
            local.Email.addMailPart(charset='utf-8',type='text/plain',body=local.tmpl_txt);

            // Add HTML email
            local.Email.addMailPart(charset='utf-8',type='text/html',body=local.tmpl_html);

            // Send the email. MailResult is a boolean.
            results.append(getPlugin('MailService').send(local.Email));
        }

        return results;
    }


}