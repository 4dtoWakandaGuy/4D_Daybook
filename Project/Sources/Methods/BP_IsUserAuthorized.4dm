//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_IsUserAuthorized
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/5/10 6:46 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_CurrentUser; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_IsUserAuthorized")
$0:=False:C215
$_t_CurrentUser:=Current user:C182
If (User in group:C338($_t_CurrentUser; "Administrator")) | (User in group:C338($_t_CurrentUser; "Manager")) | (User in group:C338($_t_CurrentUser; "AdministratorWP")) | (User in group:C338($_t_CurrentUser; "Designer"))
	$0:=True:C214
Else 
	$0:=False:C215
End if 

//$0:=(($_t_CurrentUser="Administrator") | ($_t_CurrentUser="Manager") | ($_t_CurrentUser="AdministratorWP") | ($_t_CurrentUser="Designer"))
ERR_MethodTrackerReturn("BP_IsUserAuthorized"; $_t_oldMethodName)
