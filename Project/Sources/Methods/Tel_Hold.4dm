//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Hold
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
	C_LONGINT:C283(VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Hold")
If ((vTelActive) & (vTelOnline))
	PLUGCALL_Telephony("WriteDTMF"; 2)
	
	
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel_Hold"; $_t_oldMethodName)
