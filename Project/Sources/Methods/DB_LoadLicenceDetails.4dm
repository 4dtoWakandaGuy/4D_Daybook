//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadLicenceDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2012 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_BOOLEAN:C305($_bo_NewStyleLicence)
	C_DATE:C307($_d_LicenceDateTo; $_d_LicenceDateTo2)
	C_LONGINT:C283(<>LIC_l_Seed; <>PER_l_CurLoggedinDataOwnerID; $_l_IMUsers; $_l_LicenceID; $_l_LicenceLength; $_l_MaxUsers; $_l_NewLicenceID; $_l_offset; $_l_ThisCharacter; $_l_WPUsers; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_DivideString; $_t_LastCharacters; $_t_LicenceNumeric; $_t_LicenceString; $_t_LicenceStringNumericFULL; $_t_LicenceVersion; $_t_ModuleDecodeString; $_t_oldMethodName; $_t_OrganisationNUM; $_t_ReleaseVersion; $_t_Seed)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadLicenceDetails")

If (Count parameters:C259>=1)
	//$Create:=$1
Else 
	//$Create:=(Vcreate=1)
End if 
$_bo_NewStyleLicence:=False:C215

If (Application type:C494=4D Server:K5:6)
	If (DB_l_CurrentOwnerRequest>0)
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=DB_l_CurrentOwnerRequest)
	Else 
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
	End if 
Else 
	QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
End if 
QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Is_Licence_Active:11=True:C214)
$_t_LicenceString:=""


If (Records in selection:C76([LICENCE_UPDATES:97])=0)
	If (<>PER_l_CurLoggedinDataOwnerID=1) | (Records in table:C83([USER:15])=1)
		ALL RECORDS:C47([USER:15])
		$_t_LicenceString:=[USER:15]Path Name:12
		$_d_LicenceDateTo:=[USER:15]Limit Date:58
	End if 
	
	If ($_t_LicenceString#"")
		CREATE RECORD:C68([LICENCE_UPDATES:97])
		If (Application type:C494=4D Server:K5:6)
			If (DB_l_CurrentOwnerRequest>0)
				[LICENCE_UPDATES:97]Licence_Owner_ID:12:=DB_l_CurrentOwnerRequest
			Else 
				[LICENCE_UPDATES:97]Licence_Owner_ID:12:=<>PER_l_CurLoggedinDataOwnerID
			End if 
		Else 
			[LICENCE_UPDATES:97]Licence_Owner_ID:12:=<>PER_l_CurLoggedinDataOwnerID
		End if 
		[LICENCE_UPDATES:97]Created_Time:8:=Current time:C178(*)
		[LICENCE_UPDATES:97]Is_Licence_Active:11:=True:C214
		[LICENCE_UPDATES:97]Licence_Name:7:=DB_GetOrganisation
		[LICENCE_UPDATES:97]Update_Date:2:=Current date:C33(*)
		[LICENCE_UPDATES:97]X_ID:5:=AA_GetNextID(->[LICENCE_UPDATES:97]X_ID:5)
		//DB_DecodeLicence(DB_t_PathName;->$_t_LicenceStringNumericFULL;->$_t_OrganisationNUM;->$_l_MaxWPUsers;->$_l_MaxIMUsers;->$_l_MaxUsers;->$_t_ModuleDecodeString;->$_d_LicenceExpiryDate)
		
		$_l_LicenceLength:=Length:C16($_t_LicenceString)
		$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
		$_t_LicenceStringNumericFULL:=$_t_LicenceNumeric
		$_t_OrganisationNUM:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
		$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)
		
		$_l_WPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
		$_l_IMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)
		$_l_ThisCharacter:=Num:C11($_t_LicenceNumeric[[1]])
		$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
		$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
		
		$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
		
		$_t_LastCharacters:=Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2)
		$_l_LicenceLength:=(Length:C16($_t_LicenceNumeric)-5)
		
		
		$_t_DivideString:=Str_Divide(Substring:C12((Substring:C12((Substring:C12($_t_LicenceNumeric; 1; $_l_ThisCharacter-1)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+2)); 1; $_l_LicenceLength)); 2); Substring:C12($_t_LicenceNumeric; (Length:C16($_t_LicenceNumeric)-2)))
		$_t_ModuleDecodeString:=$_t_DivideString
		If (Length:C16($_t_DivideString)>=23)  //On the basis that all licences will be the ones that include the version number(post v5!)
			$_t_ReleaseVersion:=Substring:C12($_t_DivideString; 17; 3)
			$_t_LicenceVersion:=$_t_DivideString[[15]]+"."+$_t_DivideString[[16]]
			$_t_Seed:=Substring:C12($_t_DivideString; 20; 4)
			
		Else 
			$_t_ReleaseVersion:="000"
			$_t_LicenceVersion:="1.0"
		End if 
		ARRAY LONGINT:C221($_al_ModuleAccess; 45)
		DB_LicenceModulesFromCode($_t_DivideString; ->$_al_ModuleAccess; 45)
		SET BLOB SIZE:C606([LICENCE_UPDATES:97]Licence_Blob:10; 0)
		VARIABLE TO BLOB:C532($_t_LicenceString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_LicenceStringNumericFULL; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_OrganisationNUM; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_WPUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_IMUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_MaxUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_ModuleDecodeString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_al_ModuleAccess; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_d_LicenceDateTo; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		DB_SaveRecord(->[LICENCE_UPDATES:97])
		
	Else 
		//New Licence
		$_l_NewLicenceID:=DB_GetNewLicence(<>LIC_l_Seed; <>PER_l_CurLoggedinDataOwnerID; "")
	End if 
Else 
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2; <)
	FIRST RECORD:C50([LICENCE_UPDATES:97])
	$_d_LicenceDateTo2:=[LICENCE_UPDATES:97]Update_Date:2
	QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2=$_d_LicenceDateTo2)
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Created_Time:8; <)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceString; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceStringNumericFULL; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_OrganisationNUM; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_WPUsers; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_IMUsers; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_MaxUsers; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_ModuleDecodeString; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_al_ModuleAccess; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_d_LicenceDateTo; $_l_offset)
	$_l_LicenceID:=[LICENCE_UPDATES:97]X_ID:5
	If ($_d_LicenceDateTo<=Current date:C33(*))
		$_l_NewLicenceID:=DB_GetNewLicence(<>LIC_l_Seed; <>PER_l_CurLoggedinDataOwnerID; $_t_ModuleDecodeString)
		If ($_l_NewLicenceID>0)
			// a new licence was obtained...
			UNLOAD RECORD:C212([LICENCE_UPDATES:97])
			READ WRITE:C146([LICENCE_UPDATES:97])
			QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]X_ID:5=$_l_LicenceID)
			[LICENCE_UPDATES:97]Is_Licence_Active:11:=False:C215
			DB_SaveRecord(->[LICENCE_UPDATES:97])
			
		End if 
	End if 
	//now instead of holding the expiry etc in vars we can just get them from the current record
End if 
ERR_MethodTrackerReturn("DB_LoadLicenceDetails"; $_t_oldMethodName)
