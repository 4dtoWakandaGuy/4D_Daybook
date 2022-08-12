If (False:C215)
	//object Name: [USER]CCM_Prefs.oShowPassword1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 21:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CCM_but_ShowPassword)
	C_TEXT:C284($_t_ConfirmCode; $_t_oldMethodName; CCM_t_AuthorizationPass)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.oShowPassword1")

$_t_ConfirmCode:=Gen_Request("Enter Password"; "")

If ($_t_ConfirmCode=CCM_t_AuthorizationPass)
	OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; True:C214)
	OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.oShowPassword1"; $_t_oldMethodName)
