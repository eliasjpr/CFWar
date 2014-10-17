<cfoutput>
<div class="alert alert-info">
    <h1 style="margin:0; padding:5px 0; font-weight:600; color: white">
    Thank you for joining Media Manager
    </h1>
</div>
<div class="content">
    <table>
        <tr>
            <td>
                <h2>Hi, #args.user.fullname()#.</h2>

                <h4>Thank you for joining Media Manager!</h4>
                <p>
                    Your account creation has been a success!.
                    Now you can enjoy the entire site and amazing features to manage your media lists online.
                </p>
                <p >
                    <a href="http://#cgi.server_name#/dashboard/index/" class="btn-primary">Login</a>
                    <b>URL:</b> <a href="http://#cgi.server_name#/dashboard/">http://#cgi.server_name#/dashboard/</a> <br>
                    <b>Username:</b> #args.user.getUsername()#
                    <b>Password:</b> #args.user.getPassword()#
                </p>

                <p>
                    Feel free to contact us at any time: <a href="mailto:support@imtechgraphics.com">support@imtechgraphics.com</a>
                </p>

                <p>
                    Cheers,
                    Imtech Graphics Team
                </p>
            </td>
        </tr>
    </table>
</div>
</cfoutput>