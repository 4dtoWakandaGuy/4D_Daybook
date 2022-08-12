//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_LicenceFileImportEFile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	ARRAY TEXT:C222($_at_Selected; 0)
	C_BLOB:C604($_blb_eLicenceFile; $_blb_LicencerPublicKey; $_blb_MyPrivateKey)
	C_BOOLEAN:C305(LIC_bo_FileImported)
	C_DATE:C307($_d_LicenceExpiryDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283(<>LIC_l_Seed; <>PER_l_CurLoggedinDataOwnerID; $_l_FirstCharNUM; $_l_IMUsers; $_l_Length; $_l_LicenceOwnerID; $_l_offset; $_l_OwnerID; $_l_Seed; $_l_Users; $_l_WPUsers)
	C_LONGINT:C283(DB_l_CurrentOwnerRequest)
	C_TEXT:C284(<>LR_t_LicencerPK; <>LR_T_PrivateKEYTEXT; $_t_DocName; $_t_FullDocName; $_t_LastCharString; $_t_Licence; $_t_LicenceNumeric; $_t_LicenceNumericFULL; $_t_LicenceString; $_t_LicenceValidation; $_t_LicenceVersion)
	C_TEXT:C284($_t_ModuleDecodeString; $_t_oldMethodName; $_t_OrganisationNUMSTR; $_t_ReleaseVersion; $_t_SeedSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_LicenceFileImportEFile")

//
LR_Custom
LR_CreatePublicKey(False:C215)
LR_GetLicencePublicKey(False:C215)

//
ARRAY TEXT:C222($_at_Selected; 0)
//
$_t_DocName:=DB_SelectDocument(""; "*"; "Select Licence File"; 0; ->$_at_Selected)
//
If (Size of array:C274($_at_Selected)>0)
	$_t_FullDocName:=$_at_Selected{1}
Else 
	$_t_FullDocName:=$_t_DocName
End if 
//
LIC_bo_FileImported:=False:C215
//
//TRACE
If (OK=1)
	DOCUMENT TO BLOB:C525($_t_FullDocName; $_blb_eLicenceFile)
	
	TEXT TO BLOB:C554(<>LR_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
	TEXT TO BLOB:C554(<>LR_t_LicencerPK; $_blb_LicencerPublicKey)
	
	DECRYPT BLOB:C690($_blb_eLicenceFile; $_blb_LicencerPublicKey; $_blb_MyPrivateKey)
	$_l_offset:=0
	$_l_OwnerID:=0
	$_t_Licence:=""
	If (BLOB size:C605($_blb_eLicenceFile)>$_l_offset)
		BLOB TO VARIABLE:C533($_blb_eLicenceFile; $_l_Seed; $_l_offset)
		If (BLOB size:C605($_blb_eLicenceFile)>$_l_offset)
			BLOB TO VARIABLE:C533($_blb_eLicenceFile; $_l_OwnerID; $_l_offset)
			If (BLOB size:C605($_blb_eLicenceFile)>$_l_offset)
				BLOB TO VARIABLE:C533($_blb_eLicenceFile; $_t_LicenceString; $_l_offset)
				If (BLOB size:C605($_blb_eLicenceFile)>$_l_offset)
					BLOB TO VARIABLE:C533($_blb_eLicenceFile; $_t_LicenceValidation; $_l_offset)
				End if 
			End if 
		End if 
	End if 
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
			
			If ($_l_OwnerID=$_l_LicenceOwnerID) | (True:C214)
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
				$_l_Length:=Length:C16($_t_LicenceString)
				$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
				$_t_LicenceNumericFULL:=$_t_LicenceNumeric
				$_t_OrganisationNUMSTR:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
				$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)
				
				$_l_WPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
				$_l_IMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)
				$_l_FirstCharNUM:=Num:C11($_t_LicenceNumeric[[1]])
				$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_FirstCharNUM-2)+Substring:C12($_t_LicenceNumeric; $_l_FirstCharNUM+4)
				$_l_Users:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
				$_l_FirstCharNUM:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
				$_t_LastCharString:=Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2)
				$_l_Length:=(Length:C16($_t_LicenceNumeric)-5)
				
				
				$_t_ModuleDecodeString:=Str_Divide(Substring:C12((Substring:C12((Substring:C12($_t_LicenceNumeric; 1; $_l_FirstCharNUM-1)+Substring:C12($_t_LicenceNumeric; $_l_FirstCharNUM+2)); 1; $_l_Length)); 2); Substring:C12($_t_LicenceNumeric; (Length:C16($_t_LicenceNumeric)-2)))
				$_t_ModuleDecodeString:=$_t_ModuleDecodeString
				If (Length:C16($_t_ModuleDecodeString)>=23)  //On the basis that all licences will be the ones that include the version number(post v5!)
					$_t_ReleaseVersion:=Substring:C12($_t_ModuleDecodeString; 17; 3)
					$_t_LicenceVersion:=$_t_ModuleDecodeString[[15]]+"."+$_t_ModuleDecodeString[[16]]
					$_t_SeedSTR:=Substring:C12($_t_ModuleDecodeString; 20; 4)
					
				Else 
					$_t_ReleaseVersion:="000"
					$_t_LicenceVersion:="1.0"
				End if 
				ARRAY LONGINT:C221($_al_ModuleAccess; 45)
				DB_LicenceModulesFromCode($_t_ModuleDecodeString; ->$_al_ModuleAccess; 45)
				SET BLOB SIZE:C606([LICENCE_UPDATES:97]Licence_Blob:10; 0)
				VARIABLE TO BLOB:C532($_t_LicenceString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_LicenceNumericFULL; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_OrganisationNUMSTR; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_WPUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_IMUsers; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_l_Users; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_t_ModuleDecodeString; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_al_ModuleAccess; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				VARIABLE TO BLOB:C532($_d_LicenceExpiryDate; [LICENCE_UPDATES:97]Licence_Blob:10; *)
				DB_SaveRecord(->[LICENCE_UPDATES:97])
				Gen_Alert("Licence imported")
				LIC_bo_FileImported:=True:C214
			Else 
				Gen_Alert("Licence import failed invalid owner")
			End if 
		Else 
			Gen_Alert("Licence import failed error S33D")
		End if 
	Else 
		Gen_Alert("Licence import failed! The document does not contain a valid licence number")
	End if 
Else 
	Gen_Alert("Licence file import cancelled.")
End if 
//
ERR_MethodTrackerReturn("LR_LicenceFileImportEFile"; $_t_oldMethodName)
