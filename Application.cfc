/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
*/
component{
	// Application properties
	this.name              = hash( getCurrentTemplatePath() );
	
	import coldbox.system.*;

	COLDBOX_APP_ROOT_PATH  = getDirectoryFromPath( getCurrentTemplatePath() );
	COLDBOX_APP_MAPPING    = "";
	COLDBOX_CONFIG_FILE    = "";
	COLDBOX_APP_KEY        = "";
	
	this.javaSettings              = { loadPaths = [ "lib" ], reloadOnChange = false };
	this.mappings[ "/ram" ]        = "ram://";
	this.mappings[ "/testbox" ]    = "/testbox";
	this.mappings[ "/models" ]     = "/models";
	
	//Enable/Disable cookie/session/client variables
	this.sessionManagement              = true;
	this.setClientCookies               = true;
	this.clientManagement               = true;
	this.setDomainCookies               = true;
	this.typeChecking                   = true;
	this.bufferOutput                   = true;
	this.compression                    = true;
	this.suppressRemoteComponentContent = true;
	this.ormEnabled                     = true;
	this.invokeImplicitAccessor         = true;

	// Client / Login / Session storage locations
	this.loginStorage      = "Session";
	this.clientStorage     = "coldfusionwarsdb";
	this.sessionstorage    = "coldfusionwarsdb";
	this.locale            = "en_US";
	this.timezone          = "America/New_York";
	this.sessionType       = "cfml";
	this.localMode         = "classic";
	this.charset.web       = "UTF-8";
	this.charset.resource  = "UTF-8";
	this.scopeCascading    = "standard";

	// Timeouts
	this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 );
	this.clientTimeout      = createTimeSpan(180,0,0,0);
	this.sessionTimeout     = createTimeSpan(0,0,90,0);
	this.requestTimeout     = createTimeSpan(0,0,0,50);
	
	// Enable ORM
	this.ormEnabled 	  	= true;

	// ORM Datasource
	this.datasource		  	= "coldfusionwarsdb";
	
	// ORM configuration settings
	this.ormSettings	  	= {
		// Specifies database engine to use
		dialect				= "MySQL",
		// Choose if you want ORM to create the database for you or not?
		dbcreate			= "update",
		// Location of your entities, default is your convention model folder
		cfclocation 		= ["models"],
		// Log SQL
		logSQL 				= true,
		// Don't flush at end of requests, let Active Entity manage it for you
		flushAtRequestEnd 	= false,
		// Don't manage session, let Active Entity manage it for you
		autoManageSession 	= false,
		// Active ORM events
		eventHandling 	 	= true,
		//Naming Strategy
		namingstrategy		= "smart",
		//SQL Init Script
		sqlscript			= "config/init.sql",
		cacheprovider 		= "ehcache",
		secondarycacheenabled = false,
		// Use the ColdBox WireBox Handler for events
		eventHandler 		= "coldbox.system.orm.hibernate.WBEventHandler"
	};

	
	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Coldbox( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// request start
	public boolean function onRequestStart(String targetPage){

		// Bootstrap Reinit
		if( not structKeyExists(application,"cbBootstrap") or application.cbBootStrap.isfwReinit() ){
			lock name="coldbox.bootstrap_#this.name#" type="exclusive" timeout="5" throwonTimeout=true{
				structDelete( application, "cbBootStrap" );
				componentCacheClear();
				ctCacheClear();
				pagePoolClear();
				onApplicationStart();
			}
		}

		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

}