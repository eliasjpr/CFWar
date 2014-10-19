component persistent="true" table="compounds"  extends="coldbox.system.orm.hibernate.ActiveEntity"{

	// Primary Key
    property name="id" type="numeric" ormtype="int" fieldtype="id" generator="native" setter="false";
	
	property name="name" 			type="string" 	ormtype="string";
	property name="slug" 			type="string" 	ormtype="string";
	property name="discipline" 		type="string" 	ormtype="string";
	property name="instructions" 	type="string" 	ormtype="string";
	property name="description"  	type="string"   ormtype="string";
	property name="tags"  			type="string"   ormtype="string";

	
	property name="preloaded"  		type="string"   ormtype="string";
	property name="initialSolution" type="string"   ormtype="string";
	property name="finalSolution"  	type="string"   ormtype="string";
	property name="testFixtures" 	type="string"   ormtype="string";

	property name="createdat" 		type="date" 	ormtype="date";
	property name="publishedAt" 	type="date" 	ormtype="date";
	property name="approvedAt" 		type="date" 	ormtype="date";
	
	property name="approvedBy" fieldtype="one-to-one" cfc="user" cascade="all-delete-orphan";
	property name="createdBy"  fieldtype="one-to-one" cfc="user" cascade="all-delete-orphan";
	
	
	property name="formulas"    	fieldtype="one-to-many" singularname="formula" 		type="array" fetch="select"  cfc="formula" 		fkcolumn="fkFormulaID" cascade="all" inverse="true";
	property name="combustions"     fieldtype="one-to-many" singularname="combustion" 	type="array" fetch="select"  cfc="combustion" 	fkcolumn="fkFormulaID" cascade="all" inverse="true";
	property name="favorites"     	fieldtype="one-to-many" singularname="favorite" 	type="array" fetch="select"  cfc="favorite" 	fkcolumn="fkFormulaID" cascade="all" inverse="true";
	

	compound function init(){

        setCreatedat( now() );

		super.init(useQueryCaching=true, eventHandling=true);
		return this;
	}

	
	// totalAttempts
	public function attemps(){}
	
	// totalCompleted
    public function completed(){}
    
    // totalStars count
	public function starred(){}
	
}