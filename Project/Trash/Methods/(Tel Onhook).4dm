//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel Onhook
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
	C_BOOLEAN:C305(<>TelStartup; vTelOnline)
	C_LONGINT:C283(VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel Onhook")
//tm_Onhook - Tel TOnhook

If (<>TelStartup)
	//make sure a res has been allocated
Else 
	PLUGCALL_Telephony("ONHOOK"; 1)
	
	
	vTelOnline:=False:C215
End if 
ERR_MethodTrackerReturn("Tel Onhook"; $_t_oldMethodName)
