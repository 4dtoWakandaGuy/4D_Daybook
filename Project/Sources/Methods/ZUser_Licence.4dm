//%attributes = {}
If (False:C215)
	//Project Method Name:      ZUser_Licence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 17:12`Method: ZUser_Licence
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_LoggedIn)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZUser_Licence")
<>SYS_bo_LoggedIn:=True:C214
//I have set the above because if you accidently go here and cancel
//it takes you out AND clear the licence number
ZProc("User_Licence"; DB_ProcessMemoryinit(2); "Update Licence")
ERR_MethodTrackerReturn("ZUser_Licence"; $_t_oldMethodName)