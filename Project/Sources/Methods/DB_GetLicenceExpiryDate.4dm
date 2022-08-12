//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLicenceExpiryDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 17:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_DATE:C307($_d_LicenceDateTo; $0)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_IMUsers; $_l_offset; $_l_Users; $_l_WPUsers; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_LicenceNumericFULL; $_t_LicenceString; $_t_ModuleDecodeString; $_t_oldMethodName; $_t_OrganisationNUMSTR)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLicenceExpiryDate")

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

//This should always be just one record...
If (Records in selection:C76([LICENCE_UPDATES:97])=0)  //at any point this is called this should have already been run-remember the server now does not have the licence it has many licences so this is always going to be on a client.
	DB_LoadLicenceDetails  //Makes sure there is a record including handling renewal
Else 
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2; <)
	FIRST RECORD:C50([LICENCE_UPDATES:97])
	$_d_LicenceDateTo:=[LICENCE_UPDATES:97]Update_Date:2
	USE SET:C118("$ThisClient")
	
	QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2=$_d_LicenceDateTo)
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Created_Time:8; <)
End if 
$_l_offset:=0
ARRAY LONGINT:C221($_al_ModuleAccess; 0)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceString; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceNumericFULL; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_OrganisationNUMSTR; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_WPUsers; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_IMUsers; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_Users; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_ModuleDecodeString; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_al_ModuleAccess; $_l_offset)
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_d_LicenceDateTo; $_l_offset)
$0:=$_d_LicenceDateTo
ERR_MethodTrackerReturn("DB_GetLicenceExpiryDate"; $_t_oldMethodName)