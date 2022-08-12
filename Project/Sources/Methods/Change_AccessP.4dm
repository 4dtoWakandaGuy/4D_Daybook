//%attributes = {}
If (False:C215)
	//Project Method Name:      Change_AccessP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
TRACE:C157

$_t_oldMethodName:=ERR_MethodTracker("Change_AccessP")
Menu_Record("Change Access"; "Change Access")
<>SYS_bo_CurrentWindowModal:=True:C214
//CHANGE CURRENT USER
<>SYS_bo_CurrentWindowModal:=False:C215
If (OK=1)
	Change_AccessP2
Else 
	QUIT 4D:C291
End if 
ERR_MethodTrackerReturn("Change_AccessP"; $_t_oldMethodName)
