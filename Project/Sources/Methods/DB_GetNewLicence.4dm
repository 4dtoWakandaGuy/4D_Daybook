//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetNewLicence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_DATE:C307($_d_LicenceExpiryDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_LicenceLength; $_l_MaxIMUsers; $_l_MaxUsers; $_l_MaxWPUsers; $_l_ThisCharacter; $0; DB_l_CurrentOwnerRequest; LR_l_MainWinRef)
	C_TEXT:C284($_t_DecodedString; $_t_LastCharString; $_t_LicenceNumeric; $_t_LicenceSeed; $_t_LicenceString; $_t_LicenceStringNumericFULL; $_t_LicenceVersion; $_t_ModuleDecodeString; $_t_oldMethodName; $_t_OrganisationNUM; $_t_ReleaseVersion)
	C_TEXT:C284(DB_t_PathName; LR_t_LicenceHost)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetNewLicence")
//$_t_LicenceSeed:=$1
//$OwnerID:=$2
//$ModuleAccessString:=$3  //this is the module access string
//$0:=0
//TRACE
//If (Count parameters>=3)
LR_t_LicenceHost:=""
LR_Custom

If (LR_t_LicenceHost#"") & (False:C215)
	
	
	//Request Licence via soap
	$0:=LC_GetLicenceViaSoap(<>PER_l_CurLoggedinDataOwnerID; DB_GetOrganisation)
	
	
Else 
	$0:=0
End if 
If ($0=0)
	
	//No SOAP host
	//TRACE
	LR_l_MainWinRef:=Open form window:C675("LR_LicenceRequest"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DB_d_ExpiryDateNEW:=!00-00-00!
	
	DIALOG:C40("LR_LicenceRequest")
	If (DB_d_ExpiryDateNEW#!00-00-00!)
		// a new licence and expiry have been entered
		$_d_LicenceExpiryDate:=DB_d_ExpiryDateNEW
		$_t_LicenceString:=DB_t_PathName
		//DB_DecodeLicence(DB_t_PathName;->$_t_LicenceStringNumericFULL;->$_t_OrganisationNUM;->$_l_MaxWPUsers;->$_l_MaxIMUsers;->$_l_MaxUsers;->$_t_ModuleDecodeString;->$_al_ModuleAccess->$_d_LicenceExpiryDate)
		
		$_l_LicenceLength:=Length:C16($_t_LicenceString)
		$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
		
		$_t_LicenceStringNumericFULL:=$_t_LicenceNumeric
		$_t_OrganisationNUM:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
		$_t_LicenceNumeric:=Substring:C12($_t_LicenceStringNumericFULL; 1; 3)+Substring:C12($_t_LicenceStringNumericFULL; 8)
		
		$_l_MaxWPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
		$_l_MaxIMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)
		$_l_ThisCharacter:=Num:C11($_t_LicenceNumeric[[1]])
		$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
		$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
		$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
		$_t_LastCharString:=Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2)
		$_l_LicenceLength:=(Length:C16($_t_LicenceNumeric)-5)
		
		
		$_t_DecodedString:=Str_Divide(Substring:C12((Substring:C12((Substring:C12($_t_LicenceNumeric; 1; $_l_ThisCharacter-1)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+2)); 1; $_l_LicenceLength)); 2); Substring:C12($_t_LicenceNumeric; (Length:C16($_t_LicenceNumeric)-2)))
		$_t_ModuleDecodeString:=$_t_DecodedString
		If (Length:C16($_t_DecodedString)>=23)  //On the basis that all licences will be the ones that include the version number(post v5!)
			$_t_ReleaseVersion:=Substring:C12($_t_DecodedString; 17; 3)
			$_t_LicenceVersion:=$_t_DecodedString[[15]]+"."+$_t_DecodedString[[16]]
			$_t_LicenceSeed:=Substring:C12($_t_DecodedString; 20; 4)
			
		Else 
			$_t_ReleaseVersion:="000"
			$_t_LicenceVersion:="1.0"
		End if 
		ARRAY LONGINT:C221($_al_ModuleAccess; 45)
		DB_LicenceModulesFromCode($_t_DecodedString; ->$_al_ModuleAccess; 45)
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
		SET BLOB SIZE:C606([LICENCE_UPDATES:97]Licence_Blob:10; 0)
		VARIABLE TO BLOB:C532($_t_LicenceString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_LicenceStringNumericFULL; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_OrganisationNUM; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_MaxWPUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_MaxIMUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_l_MaxUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_t_ModuleDecodeString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_al_ModuleAccess; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		VARIABLE TO BLOB:C532($_d_LicenceExpiryDate; [LICENCE_UPDATES:97]Licence_Blob:10; *)
		DB_SaveRecord(->[LICENCE_UPDATES:97])
		$0:=[LICENCE_UPDATES:97]X_ID:5
		
	End if 
	//
	
	
	
End if 

//End if
ERR_MethodTrackerReturn("DB_GetNewLicence"; $_t_oldMethodName)
