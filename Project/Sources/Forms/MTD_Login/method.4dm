
If (False:C215)
	//Database Method Name:      MTD_Login
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_TestMode)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/MTD_Login/{formMethod}"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		$_bo_TestMode:=True:C214
End case 
ERR_MethodTrackerReturn("FM [projectForm]/MTD_Login/{formMethod}"; $_t_oldMethodName)
