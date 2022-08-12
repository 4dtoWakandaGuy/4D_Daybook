//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_WaitSilence
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
	C_BOOLEAN:C305(vTelActive; vTelOnline)
	C_LONGINT:C283($1; $2; VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_WaitSilence")

//eg 2 secs of silence within 5 secs

If ((vTelActive) & (vTelOnline))
	PLUGCALL_Telephony("WaitSilence"; 1)
	
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel_WaitSilence"; $_t_oldMethodName)
