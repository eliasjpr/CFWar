component persistent="true" table="formulas"  extends="coldbox.system.orm.hibernate.ActiveEntity"{

	// Primary Key
    property name="id" type="numeric" ormtype="int" fieldtype="id" generator="native" setter="false";
    property name="createdAt" 		type="date" 	ormtype="date";
    
    property name="user" 	    fieldtype="many-to-one" cfc="user"        fkcolumn="fkUserID"     	fetch="join" lazy="true" inverse="true";
    property name="combustion" 	fieldtype="many-to-one" cfc="combustion"  fkcolumn="fkCombustionID" fetch="join" lazy="true" inverse="true";

    formula function init(){

        setCreatedat( now() );

		super.init(useQueryCaching=true, eventHandling=true);
		return this;
	}
}