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
		
		// TODO: Load compound injext preload code
		var compound_name 	= "compound_#createUUID()#.cfc";
		var test_file 		= expandPath('/tests/specs/integration/') & compound_name;
		
		// Create formula template
		savecontent variable = "local.formula"{	
			writeOutput(trim('component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{
				function beforeAll(){ super.beforeAll(); }
				function afterAll(){ super.afterAll(); }
				function run(){ #rc.tests# }
				#rc.solution# }'));
		}
		
		fileWrite(test_file, local.formula );

		try{
			// Create new instance of the formula
			var testbox 	= new testbox.system.TestBox("tests.specs.integration.#listFirst(compound_name, '.')#");
			
			// Run the test to see if it passes
			rc.data.result 	= testbox.run(reporter='simple' );

		}catch(any e){
			rc.data["result"] = e.detail;
		}
		
		fileDelete(test_file);

		event.renderData(type="json",data=rc.data);
	}


	function serverstatus(event,rc,prc){

		rc.data["cpuusage"]	  = round(getcpuusage());
		rc.data["usedmemory"] = getSystemMemoryUsage();
		rc.data["freememory"] = getSystemMemoryFree();

		event.renderData(type="json",data=rc.data);
	}
}
