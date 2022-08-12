If (False:C215)
	//object Name: [USER]CCM_Prefs.oShowLogin2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 21:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CCM_but_ShowLogin)
	C_TEXT:C284($_t_ConfirmCode; $_t_oldMethodName; CCM_t_AuthorizationLogin)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.oShowLogin2")

$_t_ConfirmCode:=Gen_Request("Enter Current Login"; "")

If ($_t_ConfirmCode=CCM_t_AuthorizationLogin)
	OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; True:C214)
	OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.oShowLogin2"; $_t_oldMethodName)
