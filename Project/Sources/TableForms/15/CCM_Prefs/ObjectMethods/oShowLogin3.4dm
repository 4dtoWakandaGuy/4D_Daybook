If (False:C215)
	//object Name: [USER]CCM_Prefs.oShowLogin3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/07/2012 15:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CCM_but_ShowCredentials)
	C_TEXT:C284($_t_ConfirmCode; $_t_oldMethodName; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.oShowLogin3")

$_t_ConfirmCode:=Gen_Request("Enter Password"; "")

If ($_t_ConfirmCode=CCM_t_AuthorizationPass)
	OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPassID; True:C214)
	OBJECT SET VISIBLE:C603(CCM_but_ShowCredentials; False:C215)
End if 
ERR_MethodTrackerReturn("[USER].CCM_Prefs.oShowLogin"; $_t_oldMethodName)
