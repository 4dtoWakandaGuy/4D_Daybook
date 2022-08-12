If (False:C215)
	//object Name: Object Name:      PDF_SecureSettings.oLicenceSecurity1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2011 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK)
	C_TEXT:C284($_t_oldMethodName; PDF_T_OwnerPassword; PW_Return)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PDF_SecureSettings.oLicenceSecurity1"; Form event code:C388)
$_bo_Continue:=False:C215
HIDE WINDOW:C436
If (PDF_T_OwnerPassword#"")
	$_bo_OK:=Gen_ConfirmPassword("Please enter the existing password"; False:C215; False:C215; True:C214; PDF_T_OwnerPassword)
	If ($_bo_OK)
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	$_bo_OK:=Gen_ConfirmPassword("Enter the owner password to set for documents"; False:C215; False:C215; True:C214)
	If ($_bo_OK)
		PDF_T_OwnerPassword:=PW_Return
	End if 
End if 
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ PDF_SecureSettings.oLicenceSecurity1"; $_t_oldMethodName)
