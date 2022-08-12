If (False:C215)
	//object Name: Object Name:      PDF_SecureSettings.oexit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2011 14:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PDF_bo_SecurityActive)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PDF_T_OwnerPassword)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PDF_SecureSettings.oexit"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PDF_bo_SecurityActive)
			If (PDF_T_OwnerPassword#"")
				CANCEL:C270
			Else 
				Gen_Alert("You must set an owner password to activate pdf security")
			End if 
		Else 
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("OBJ PDF_SecureSettings.oexit"; $_t_oldMethodName)
