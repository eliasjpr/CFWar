component persistent="true" table="compounds"  extends="coldbox.system.orm.hibernate.ActiveEntity"{

	// Primary Key
    property name="id" type="numeric" ormtype="int" fieldtype="id" generator="native" setter="false";
	
	property name="name" 			type="string" 	ormtype="string";
	property name="slug" 			type="string" 	ormtype="string";
	property name="discipline" 		type="string" 	ormtype="string";
	property name="instructions" 	type="string" 	ormtype="text";
	property name="tags"  			type="string"   ormtype="string";

	
	property name="preloaded"  		type="string"   ormtype="text";
	property name="initialSolution" type="string"   ormtype="text";
	property name="finalSolution"  	type="string"   ormtype="text";
	property name="testFixtures" 	type="string"   ormtype="text";
	
	
	property name="private" 		type="boolean"   ormtype="bit";

	property name="createdat" 		type="date" 	ormtype="timestamp";
	property name="publishedAt" 	type="date" 	ormtype="timestamp";
	property name="approvedAt" 		type="date" 	ormtype="timestamp";
	
	property name="approvedBy" fieldtype="many-to-one" cfc="user"        fkcolumn="fkUserID"     fetch="join" lazy="true" inverse="true";
	property name="createdBy"  fieldtype="many-to-one" cfc="user"        fkcolumn="fkCreatedByID"     fetch="join" lazy="true" inverse="true";
	
	
	property name="formulas"    	fieldtype="one-to-many" singularname="formula" 		type="array" fetch="select"  cfc="formula" 		fkcolumn="fkFormulaID" cascade="all" inverse="true";
	property name="combustions"     fieldtype="one-to-many" singularname="combustion" 	type="array" fetch="select"  cfc="combustion" 	fkcolumn="fkFormulaID" cascade="all" inverse="true";
	property name="favorites"     	fieldtype="one-to-many" singularname="favorite" 	type="array" fetch="select"  cfc="favorite" 	fkcolumn="fkFormulaID" cascade="all" inverse="true";
	

	compound function init(){

        setcreatedat( now() );
        setprivate(true);
        setformulas([]);
        setcombustions([]);
        setfavorites([]);
        
		super.init(useQueryCaching=true, eventHandling=true);
		return this;
	}


	public string function isoCreatedAt(){
		return "#dateFormat(variables.createdAt, 'YYYY-MM-DD')#T#timeFormat(variables.createdAt,'HH:MM:SS')#Z"
	}
	
	
	// totalAttempts
	public function attemps(){}
	
	// totalCompleted
    public function completed(){}
    
    // totalStars count
	public function starred(){}
	
}