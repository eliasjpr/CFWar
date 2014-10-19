/**
* My Event Handler Hint
*/
component{


	property name="messagebox" 		inject="coldbox:plugin:messagebox";
	property name="sessionStorage"  inject="coldbox:plugin:sessionStorage";
	property name="mailer"  		inject="coldbox:myPlugin:mailer";

	function prehandler( event, rc, prc, action, eventArguments ){
		event.setLayout('blank');
	}

	// GET
	function login(event, rc, prc){}
	function forgot(event, rc, prc){}
	function new(event, rc, prc){}

	function logout(event, rc, prc){
		logout;
		sessionStorage.deleteVar('user');
		setNextEvent('security.login')
	}


	// POST /login
	function auth(event,rc,prc){
		var user = entityNew('user').authenticate(username = rc.email, password = rc.password);

		if( !isNull(user) ){
			sessionStorage.setVar('user', user.asStruct());

			// Use cf loign framework
			login{
				loginuser name="#user.fullName()#" password="#user.getHashedPassword()#" roles="#user.getRole()#";
			}
			setNextEvent('reactor.index');

		}else{

			messagebox.setMessage(type="error",messageArray=['User does not exists!']);

			setNextEvent('security.login');
		}
	}

	// POST /register
	function register(event,rc,prc){

		variables.user = populateModel(  entityNew('user').new() );

		if( variables.user.isValid() ){
			//Generate API Token
			variables.user.setHashedToken();

			//Save the user
			variables.user.save()

			// Return back the new user to the client
			rc.user = variables.user;

			// Send Welcome email
			mailer.welcome(user);

			setNextEvent('security.login');
		}
		else{
			// Return error
			messagebox.setMessage(type="error",messageArray=variables.user.getValidationResults().getAllErrors());

			setNextEvent('security.new');
		}

	}

	// POST /recover
	function dorecover(event,rc,prc){
		var user = entityNew('user').findWhere({emailaddress = rc.email});

		if(!isNull(user)){
			// Send Recover Email
			var sent= mailer.recover(user);

			if(!sent.error){
				// Return error
				messagebox.setMessage(type="info",message="An email was sent with instructions to recover your password.");

				setNextEvent('security.login');
			}else{
				messagebox.setMessage(type="info",message="Recover email instructions could not me sent at this time, please try again later.");
				setNextEvent('security.forgot');
			}

		}else{
			// Return error
			messagebox.setMessage(type="error",message="User with email address #rc.email# does not exists!");

			setNextEvent('security.forgot');
		}
	}

}