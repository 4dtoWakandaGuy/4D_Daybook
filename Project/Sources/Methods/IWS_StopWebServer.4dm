//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StopWebServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UserRequested)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StopWebServer")
//IWS_StopWebServer
//Last Modified:  Ron Feavyear 12/28/99
//$1=Called from module (not user)


$_bo_UserRequested:=(Count parameters:C259=0)
If ($_bo_UserRequested)
	CONFIRM:C162("This will shut down web services. Really go ahead?"; "OK"; "Cancel")
Else 
	OK:=1
End if 

If (OK=1)
	IWS_Shutdown
End if 
ERR_MethodTrackerReturn("IWS_StopWebServer"; $_t_oldMethodName)