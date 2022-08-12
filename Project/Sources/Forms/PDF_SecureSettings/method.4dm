If (False:C215)
	//Project Form Method Name: PDF_SecureSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2011 16:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; PDF_bo_IsLicenced; PDF_bo_PreventCopy; PDF_bo_PreventPrinting; PDF_bo_SecurityActive; PDF_bo_UserPassword)
	C_LONGINT:C283($_l_event; PDF_l_LicenceMaker)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM PDF_SecureSettings"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		PDF_bo_IsLicenced:=False:C215
		PDF_bo_SecurityActive:=False:C215
		PDF_bo_PreventCopy:=False:C215
		PDF_bo_PreventPrinting:=False:C215
		PDF_bo_UserPassword:=False:C215
		PDF_EncyptLoadPrefs
		PDF_bo_IsLicenced:=PDF_EncryptVerfifyLicence
		If (Not:C34(PDF_bo_IsLicenced))
			OBJECT SET VISIBLE:C603(PDF_l_LicenceMaker; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(PDF_l_LicenceMaker; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM PDF_SecureSettings"; $_t_oldMethodName)
