component{

	
	variables.compound= new compound();


	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	function preHandler(){
		event.paramValue('id',0);
		variables.compound = getCompound(rc.id);
	}

	function index(event, rc, prc){
		rc.compounds = entityNew('compound').list(sortOrder:'createdAt', max:20, asQuery:false);
	}

	function new(event, rc, prc){
		rc.compound = variables.compound;
	}

	function edit(event, rc, prc){
		rc.compound = variables.compound;
	}

	function show(event, rc, prc){
		rc.compound = variables.compound;
	}

	function save(event,rc, prc){
		event.paramValue("private", true);
		event.paramValue("slug","");
		event.paramValue("discipline","");

		var compound = populateModel(variables.compound);
		compound.createdBy = entityLoadByPK("user", 1);
		
		if( compound.isValid() ){
			compound.save();
			setNextEvent( "compounds.show.#compound.id#");
		}
		else{
			// Return error
			getPlugin("messagebox").setMessage(type="error",messageArray=variables.compound.getValidationResults().getAllErrors());
			setNextEvent( "compounds.edit.#compound.id#" );
		}
	}

	function fusion(event, rc, prc){
		event.paramValue("initialSolution","");
		event.paramValue("preloaded","");
		event.paramValue("testFixtures","");


		rc.data["result"] = "";
		
		// TODO: Load compound injext preload code
		var compound_name 	= "compoundTest.cfc";
		var test_file 		= expandPath('/tests/specs/integration/') & compound_name;
		
		// Create formula template
		savecontent variable = "local.formula"{	
			echo(trim('
				component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{
					#rc.preloaded#
					function beforeAll(){ super.beforeAll();  }
					function afterAll(){ super.afterAll();  }
					function run(){ #rc.testFixtures# } 
					#rc.initialSolution#
				}'));
		}
		
		fileWrite(test_file, local.formula );

		try{
			// Create new instance of the formula
			var testbox 	= new testbox.system.TestBox("tests.specs.integration.#listFirst(compound_name, '.')#");
			
			// Run the test to see if it passes
			rc.data.result 	= testbox.run(reporter='simple' );

		}catch(any e){
			rc.data.result = e.detail;
		}
		
		fileDelete(test_file);

		event.renderData(type="json",data=rc.data);
	}

	private function getCompound(any id=0){
		return entityNew('compound').get(arguments.id);
	}

}