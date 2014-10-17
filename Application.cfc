/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
*/
component{
	// Application properties
	this.name              = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout    = createTimeSpan(0,0,30,0);
	this.setClientCookies  = true;

	import coldbox.system.*;

	COLDBOX_APP_ROOT_PATH  = getDirectoryFromPath( getCurrentTemplatePath() );
	COLDBOX_APP_MAPPING    = "";
	COLDBOX_CONFIG_FILE    = "";
	COLDBOX_APP_KEY        = "";
	
	this.javaSettings              = { loadPaths = [ "lib" ], reloadOnChange = false };
	this.mappings[ "/ram" ]        = "ram://";
	this.mappings[ "/testbox" ]    = "/testbox";

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