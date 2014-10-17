/**
* I am a new handler
*/
component{

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	function index(event,rc,prc){
		rc.cpuUsage = round(getcpuusage());
	}

	function submit(event, rc, prc){
		rc.data["result"] = "";

		fileWrite("ram:///solution.cfm", rc.solution );

		try{
			savecontent variable = "rc.data.result"{
				include "/ram/solution.cfm"
			}
		}catch(any e){
			rc.data["result"] = e.message;
		}

		fileDelete("ram:///solution.cfm");

		event.renderData(type="json",data=rc.data);

	}


	function runTests(event, rc, prc){
		event.paramValue("tests","");
		event.paramValue("solution","");
		rc.data["result"] = "";

		savecontent variable = "rc.data.functions"{
			writeOutput('
			component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{

				/*********************************** LIFE CYCLE Methods ***********************************/

				function beforeAll(){
					super.beforeAll();
					// do your own stuff here
				}

				function afterAll(){
					// do your own stuff here
					super.afterAll();
				}

				/*********************************** BDD SUITES ***********************************/
				function run(){

					describe( "Your Test Cases", function(){

						beforeEach(function( currentSpec ){
							// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
							setup();
						});

						#rc.tests#
					});

				}

				#rc.solution#
			}')

		}

		fileWrite(expandPath('/tests/specs/integration/')&"dynamicTest.cfc", rc.data.functions );

		try{
			var testbox 	= new testbox.system.TestBox("tests.specs.integration.dynamicTest");
			rc.data.result 	= testbox.run(reporter='simple' );

		}catch(any e){
			rc.data["result"] = e.message;
		}

		fileDelete(expandPath('/tests/specs/integration/')&"dynamicTest.cfc");

		event.renderData(type="json",data=rc.data);
	}


	function serverstatus(event,rc,prc){

		rc.data["cpuusage"]	  = round(getcpuusage());
		rc.data["usedmemory"] = getSystemMemoryUsage();
		rc.data["freememory"] = getSystemMemoryFree();

		event.renderData(type="json",data=rc.data);
	}
}
