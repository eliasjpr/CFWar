
component persistent="true" table="users"  extends="coldbox.system.orm.hibernate.ActiveEntity"{

	// Primary Key
    property name="id" type="numeric" ormtype="int" fieldtype="id" generator="native" setter="false";

    // Properties
	property name="firstName" 		type="string" 	ormtype="string";
	property name="lastName" 		type="string" 	ormtype="string";
	property name="emailaddress" 	type="string" 	ormtype="string";
	property name="username" 		type="string" 	ormtype="string";
	property name="hashedPassword"  type="string"   ormtype="string";
	property name="hashedToken"  	type="string"   ormtype="string";

    property name="password"        type="string"   ormtype="string" persistent="false" setter="true" getter="true";
    property name="confirmPassword" type="string"   ormtype="string" persistent="false" setter="true";
	property name="role" 			type="string" 	ormtype="string";
	property name="phone" 			type="string" 	ormtype="string";
	property name="brand" 			type="string" 	ormtype="string";

	property name="createdat" 		type="date" 	ormtype="date";

    /* One to one*/
    //property name="setting" fieldtype="one-to-one" cfc="setting" mappedby="user" cascade="all-delete-orphan";

	// Validation Constraints
	this.constraints= {
		firstName = { required = true, requiredMessage="Account First Name is required." },
		lastName  = { required = true, requiredMessage="Account Last Name is required."},
		username  = { required = true}
	};

	user function init(){


        setCreatedat( now() );
		setRole('developer');
		setfirstname('');
		setlastname('');
		setUsername('');
		setemailAddress('');

		super.init(useQueryCaching=true, eventHandling=true);
		return this;
	}



	// ----- ::::::::: Class Methods ::::::::: ----- //
	function authenticate(required string username, required string password){
		return this.findWhere({ emailaddress: arguments.username, hashedpassword: setHashedPassword(arguments.password) });
	}

	function checkToken(required string token){
		return this.countWhere(hashedToken=arguments.token)
	}

	public string function setHashedPassword(required string password){
    	var key = 'QfQLgVNgZtUn8nzaxRf/SQ==';

        variables.hashedpassword = hash(arguments.password & key , "SHA-512");

        return variables.hashedpassword ;
    }


	// -----  Instance Methods -----  //
	public string function fullName(){
		return getFirstName() & " " & getLastName();
	}

	public string function getUsername(){
		return isNull(variables.username) ? variables.email.listFirst('@') : variables.username;
	}

	public string function gravatar(){
        return 'https://www.gravatar.com/avatar/#lcase(Hash(lcase(this.getEmailAddress())))#.png';
    }

    public function setPassword( required string password){
        variables.password = arguments.password;
        setHashedPassword(arguments.password);
    }


    public string function getHashedEmail(){
    	var key = 'QfQLgVNgZtUn8nzaxRf/SQ==';
        return encrypt(variables.emailaddress, key , "AES",'Hex');
    }


    public string function setHashedToken(){
    	var key = 'QfQLgVNgZtUn8nzaxRf/SQ==';
        variables.hashedtoken = encrypt( createUUID(),  key , "AES",'Base64');;
    }

   
    function validateEmail() {
        return (REFindNoCase("^['_a-z0-9-\+]+(\.['_a-z0-9-\+]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3}))$",
            getEmail()) AND len(listGetAt(getEmail(), 1, "@")) LTE 64 AND
            len(listGetAt(getemailaddress(), 2, "@")) LTE 255) IS 1;
    }

    function generatePassword() {
		var placeCharacter     = "";
		var currentPlace       = 0;
		var group              = 0;
		var subGroup           = 0;
		var numberofCharacters = 8;
		var characterFilter    = 'O,o,0,i,l,1,I,5,S';
		var characterReplace   = repeatString(",", listlen(characterFilter)-1);
		if(arrayLen(arguments) gte 1) numberofCharacters = val(arguments[1]);

		if(arrayLen(arguments) gte 2) {
			characterFilter = listsort(rereplace(arguments[2], "([[:alnum:]])", "\1,", "all"),"textnocase");
			characterReplace = repeatString(",", listlen(characterFilter)-1);
		}
		while (len(placeCharacter) LT numberofCharacters) {
			group = randRange(1,4, 'SHA1PRNG');

			switch(group) {
				case "1":
					subGroup = rand();
				    switch(subGroup) {
				case "0":
					placeCharacter = placeCharacter & chr(randRange(33,46, 'SHA1PRNG'));
				break;
				case "1":
					placeCharacter = placeCharacter & chr(randRange(58,64, 'SHA1PRNG'));
				break;
				}
				case "2":
					placeCharacter = placeCharacter & chr(randRange(97,122, 'SHA1PRNG'));
				break;
				case "3":
					placeCharacter = placeCharacter & chr(randRange(65,90, 'SHA1PRNG'));
				break;
				case "4":
					placeCharacter = placeCharacter & chr(randRange(48,57, 'SHA1PRNG'));
				break;
			}

			if (listLen(characterFilter)) {
				placeCharacter = replacelist(placeCharacter, characterFilter, characterReplace);
			}
		}
		setPassword(placeCharacter);

		return placeCharacter;
	}

	public function asStruct(){
		return {
            id           : variables.id,
            fullname	 : this.fullName(),
            firstname    : variables.firstname,
            lastname     : variables.lastname,
            emailaddress : variables.emailAddress,
            gravatar     : this.gravatar(),
            roles        : variables.role		}
	}

	public array function getRole(){
		return isNull(variables.role) ? [] : variables.role.listToArray() ;
	}


   

}
