//%attributes = {}
If (False:C215)
	//Project Method Name:      LC_GetLicenceViaSoap
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/10/2012 23:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_BLOB:C604($_blb_LicenceFileEBLOB; $_blb_LicencerPublicKey; $_blb_MyPrivateKey; DB_bl_RequestData)
	C_BOOLEAN:C305($_bo_WithAlert; $3; LIC_bo_FileImported)
	C_DATE:C307($_d_LicenceExipryDate; $_d_LicenceExpiryDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283(<>LIC_l_Seed; <>PER_l_CurLoggedinDataOwnerID; $_l_ID; $_l_IMUsers; $_l_LicenceLength; $_l_LicenceOwnerID; $_l_offset; $_l_OwnerID; $_l_Seed; $_l_ThisCharacter; $_l_Users)
	C_LONGINT:C283($_l_WPUsers; $0; $1; DB_l_CurrentOwnerRequest; LR_l_LicencePortNumber)
	C_TEXT:C284(<>LR_t_LicencerPK; <>LR_T_PrivateKEYTEXT; <>SYS_t_VersionNumber; $_t_DivideString; $_t_LastCharString; $_t_Licence; $_t_LicenceNumeric; $_t_LicenceNumericFULL; $_t_LicenceString; $_t_LicenceText; $_t_LicenceValidation)
	C_TEXT:C284($_t_LicenceVersion; $_t_ModuleDecodeString; $_t_Name; $_t_oldMethodName; $_t_OrganisationNUM; $_t_ReleaseVersion; $2; LR_t_LicenceHost; LR_T_WebserviceName)
End if 
//Code Starts Here

//TRACE
$0:=0

$_t_oldMethodName:=ERR_MethodTracker("LC_GetLicenceViaSoap")
$_l_Seed:=7350
LR_Custom
//ok some notes about licencing here. The server WILL always return a licence. However that licence may be restrictive(or even 'expired'
//the following restrictions will apply.
//if there is no existing licence on the licencer this will be created from a template 'standard licence' (other variations on that to apply)
//that licence will be set to a time limit and the licencer will not issue licences after that unless the billing has been setup
//(daybook will need to set the billing end on the licence numbere`r)
//if the billing end has passed the licence numberer must mail me.
If (Count parameters:C259>=3)
	$_bo_WithAlert:=$3
Else 
	$_bo_WithAlert:=True:C214
End if 
If (Count parameters:C259>=2)
	$_l_ID:=$1
	$_t_Name:=$2
	//Here add into this the release version...
	<>SYS_t_VersionNumber:=VER_GetLicenceVersion
	LR_CreatePublicKey(False:C215)
	LR_GetLicencePublicKey(False:C215)
	TEXT TO BLOB:C554(<>LR_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
	TEXT TO BLOB:C554(<>LR_t_LicencerPK; $_blb_LicencerPublicKey)
	SET BLOB SIZE:C606(DB_bl_RequestData; 0)
	VARIABLE TO BLOB:C532($_l_Seed; DB_bl_RequestData; *)
	VARIABLE TO BLOB:C532($_l_ID; DB_bl_RequestData; *)
	VARIABLE TO BLOB:C532($_t_Name; DB_bl_RequestData; *)
	VARIABLE TO BLOB:C532(<>SYS_t_VersionNumber; DB_bl_RequestData; *)
	ENCRYPT BLOB:C689(DB_bl_RequestData; $_blb_MyPrivateKey; $_blb_LicencerPublicKey)
	WEB SERVICE SET PARAMETER:C777("REQUserID"; DB_bl_RequestData)
	WEB SERVICE CALL:C778("http://"+LR_t_LicenceHost+":"+String:C10(LR_l_LicencePortNumber)+"/4DSOAP/"; LR_T_WebserviceName+"#LC_CreateLicence"; "LC_CreateLicence"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)
	//TRACE
	
	
	
	If (OK=1)
		
		WEB SERVICE GET RESULT:C779($_t_LicenceText; "UserID"; *)  // Memory clean-up on the final return value.
		TEXT TO BLOB:C554($_t_LicenceText; $_blb_LicenceFileEBLOB; Mac text without length:K22:10)
		
		
	End if 
	//DECRYPT BLOB($_blb_LicenceFileEBLOB;$_blb_LicencerPublicKey;$_blb_MyPrivateKey)
	$_l_offset:=0
	$_l_OwnerID:=0
	$_t_Licence:=""
	If (BLOB size:C605($_blb_LicenceFileEBLOB)>$_l_offset)
		BLOB TO VARIABLE:C533($_blb_LicenceFileEBLOB; $_l_Seed; $_l_offset)
		If (BLOB size:C605($_blb_LicenceFileEBLOB)>$_l_offset)
			BLOB TO VARIABLE:C533($_blb_LicenceFileEBLOB; $_l_OwnerID; $_l_offset)
			If (BLOB size:C605($_blb_LicenceFileEBLOB)>$_l_offset)
				BLOB TO VARIABLE:C533($_blb_LicenceFileEBLOB; $_t_LicenceString; $_l_offset)
				If (BLOB size:C605($_blb_LicenceFileEBLOB)>$_l_offset)
					BLOB TO VARIABLE:C533($_blb_LicenceFileEBLOB; $_t_LicenceValidation; $_l_offset)
				End if 
			End if 
		End if 
	End if 
	$0:=0
	If ($_t_LicenceString#"") & ($_l_OwnerID#0) & ($_l_Seed#0) & ($_t_LicenceValidation#"")
		If ($_l_Seed=<>LIC_l_Seed)
			If (Application type:C494=4D Server:K5:6)
				
				If (DB_l_CurrentOwnerRequest>0)
					$_l_LicenceOwnerID:=DB_l_CurrentOwnerRequest
				Else 
					$_l_LicenceOwnerID:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				$_l_LicenceOwnerID:=<>PER_l_CurLoggedinDataOwnerID
			End if 
			If ($_l_OwnerID#$_l_LicenceOwnerID)
				//if the current owner is the ONLY licence on this system and its client server then the numbers DO NOT NEED to match up.
				
			End if 
			If ($_l_OwnerID=$_l_LicenceOwnerID) | (True:C214)  //Note that cur
				
				DB_d_ExpiryDateNEW:=!00-00-00!
				
				DB_ValidateDateCode($_t_LicenceValidation; $_t_LicenceString)
				$_d_LicenceExpiryDate:=DB_d_ExpiryDateNEW
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
				//DB_DecodeLicence($_t_LicenceString;->$_t_LicenceStringNumericFULL;->$_t_OrganisationNUM;->$_l_MaxWPUsers;->$_l_MaxIMUsers;->$_l_MaxUsers;->$_t_ModuleDecodeString;->$_d_LicenceExpiryDate)
				
				$_l_LicenceLength:=Length:C16($_t_LicenceString)
				$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
				$_t_LicenceNumericFULL:=$_t_LicenceNumeric
				$_t_OrganisationNUM:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
				$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)
				
				$_l_WPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
				$_l_IMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)
				$_l_ThisCharacter:=Num:C11($_t_LicenceNumeric[[1]])
				$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
				$_l_Users:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
				$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
				$_t_LastCharString:=Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2)
				$_l_LicenceLength:=(Length:C16($_t_LicenceNumeric)-5)
				
				
				$_t_DivideString:=Str_Divide(Substring:C12((Substring:C12((Substring:C12($_t_LicenceNumeric; 1; $_l_ThisCharacter-1)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+2)); 1; $_l_LicenceLength)); 2); Substring:C12($_t_LicenceNumeric; (Length:C16($_t_LicenceNumeric)-2)))
				$_t_ModuleDecodeString:=$_t_DivideString
				If (Length:C16($_t_DivideString)>=23)  //On the basis that all licences will be the ones that include the version number(post v5!)
					
					$_t_ReleaseVersion:=Substring:C12($_t_DivideString; 17; 3)
					$_t_LicenceVersion:=$_t_DivideString[[15]]+"."+$_t_DivideString[[16]]
					$_t_DivideString:=Substring:C12($_t_DivideString; 20; 4)
					
				Else 
					$_t_ReleaseVersion:="000"
					$_t_LicenceVersion:="1.0"
				End if 
				ARRAY LONGINT:C221($_al_ModuleAccess; 45)
				DB_LicenceModulesFromCode($_t_DivideString; ->$_al_ModuleAccess; 45)
				SET BLOB SIZE:C606([LICENCE_UPDATES:97]Licence_Blob:10; 0)
				VARIABLE TO BLOB:C532($_t_LicenceString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_LicenceNumericFULL; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_OrganisationNUM; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_WPUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_IMUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_Users; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_ModuleDecodeString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_al_ModuleAccess; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_d_LicenceExipryDate; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				DB_SaveRecord(->[LICENCE_UPDATES:97])
				//Gen_Alert ("Licence imported")
				$0:=[LICENCE_UPDATES:97]X_ID:5
				
				//Gen_Alert ("Licence imported")
				$0:=[LICENCE_UPDATES:97]X_ID:5
				
				LIC_bo_FileImported:=True:C214
				If ($_d_LicenceExipryDate<Current date:C33(*))
					//here tell the user their licence has expired.
					If ($_bo_WithAlert)
						Gen_Alert("Sorry it has not been possible to obtain an updated licence. Please contact Clearday Software as soon as possible to resolve this."; "OK")
					End if 
					QUIT 4D:C291
				Else 
					If ($_bo_WithAlert)
						Gen_Alert("Thank you. Your licence has now been updated and will require updating again "+String:C10($_t_LicenceString))
					End if 
				End if 
				
			Else 
				If ($_bo_WithAlert)
					Gen_Alert("Licence import failed invalid owner")
				End if 
			End if 
		Else 
			If ($_bo_WithAlert)
				Gen_Alert("Licence import failed error S33D")
			End if 
		End if 
	Else 
		If ($_bo_WithAlert)
			Gen_Alert("Licence import failed! The document does not contain a valid licence number")
		End if 
	End if 
Else 
	//$0:=-909
	
End if 
ERR_MethodTrackerReturn("LC_GetLicenceViaSoap"; $_t_oldMethodName)
