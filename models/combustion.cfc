component persistent="true" table="combustions"  extends="coldbox.system.orm.hibernate.ActiveEntity"{

	// Primary Key
    property name="id" type="numeric" ormtype="int" fieldtype="id" generator="native" setter="false";
	property name="createdAt" 		type="date" 	ormtype="date";
    
    property name="user" 	    fieldtype="many-to-one" cfc="user"        fkcolumn="fkUserID"     fetch="join" lazy="true" inverse="true";
    property name="compound" 	fieldtype="many-to-one" cfc="compound"    fkcolumn="fkCompoundID" fetch="join" lazy="true" inverse="true";
    
    
    combustion function init(){

        setCreatedat( now() );

		super.init(useQueryCaching=true, eventHandling=true);
		return this;
	}

}