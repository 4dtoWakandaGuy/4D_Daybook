//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_SetTimeOut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:56`Method: NTK_SetTimeOut
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; HTTP_TimeOut)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_SetTimeOut")
// (PM) HTTP_SetTimeOut
// Sets the timeout for a HTTP request
// $1 = Timeout in seconds


HTTP_TimeOut:=$1
ERR_MethodTrackerReturn("NTK_SetTimeOut"; $_t_oldMethodName)