component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "coldfusionwars",
			eventName 				= "event",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "dashboard.index",
			requestStartHandler		= "Main.onRequestStart",
			requestEndHandler		= "",
			applicationStartHandler = "Main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			//Extension Points
			UDFLibraryFile 				= "includes/helpers/ApplicationHelper.cfm",
			coldboxExtensionsLocation 	= "",
			modulesExternalLocation		= [],
			pluginsExternalLocation 	= "",
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false
		};

		// custom settings
		settings = {
			messagebox_template = "/views/_templates/message_box.cfm"
		};
		environments = {
			development = "^dev.,^staging."
		};

		//Mailsettings
		mailSettings = {
			server   = "smtp.mailgun.org",
			username = "postmaster@cfwars.com",
			password = "b73b6a8a32aecb174fe9d6b8fc0dcad9",
			port     = 587
		};

		// Module Directives
		modules = {
			//Turn to false in production
			autoReload = false,
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ConsoleAppender" }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "app.cfm",
			defaultView   = ""
		};

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			customInterceptionPoints = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//SES
			{class="coldbox.system.interceptors.SES", properties={} },
			{class="coldbox.system.interceptors.Security", name="ApplicationSecurity", 
				properties={ rulesSource = "json", rulesFile = "config/rules.json", preEventSecurity=false} }
		];



		// ORM services, injection, etc
		orm = { injection = {enabled = true}};

		//Register Layouts
		layouts = [
			{ name = "app", 	file = "app.cfm"},
			{ name = "blank", 	file = "blank.cfm"},
			{ name = "mailer", 	file = "mailer.cfm"}
		];

		//Conventions
		conventions = {
			handlersLocation = "controllers",
			pluginsLocation  = "plugins",
			viewsLocation 	 = "views",
			layoutsLocation  = "views",
			modelsLocation 	 = "models",
			modulesLocation  = "modules",
			eventAction 	 = "index"
		};

	}

	/**
	* Executed whenever the development environment is detected
	*/
	function development(){
		// Override coldbox directives
		coldbox.handlerCaching  = false;
		coldbox.eventCaching    = false;
		handlersIndexAutoReload = true;
		coldbox.debugPassword   = "";
		coldbox.reinitPassword  = "";
	}


}