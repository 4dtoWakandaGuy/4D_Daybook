If (False:C215)
	//object Name: [USER]CCM_Prefs.oRecover
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2012 19:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CCM_but_ShowLogin; CCM_but_ShowPassword)
	C_TEXT:C284($_t_oldMethodName; $_t_password; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.oRecover"; Form event code:C388)

$_t_password:=Gen_Request("Enter Daybook Administrator Password")
If ($_t_password="Timur")
	OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; True:C214)
	OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
	
	OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; True:C214)
	OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.oRecover"; $_t_oldMethodName)
