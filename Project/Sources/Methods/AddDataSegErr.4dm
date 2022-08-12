//%attributes = {}
If (False:C215)
	//Project Method Name:      AddDataSegErr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_ErrorCode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AddDataSegErr")
//this error handler is called when adding a data segment

If (error=-9999)
	<>SYS_l_ErrorCode:=-9999
End if 
ERR_MethodTrackerReturn("AddDataSegErr"; $_t_oldMethodName)
