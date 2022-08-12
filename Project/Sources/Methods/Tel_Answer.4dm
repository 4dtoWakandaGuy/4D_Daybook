//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Answer
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
	C_BOOLEAN:C305(<>TelStartup; vTelActive; vTelOnline)
	C_LONGINT:C283($1; vTelRes; VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Answer")
//tm_answer - Tel TAnswer

If (<>TelStartup)
	//make sure that res is allocated
	If (vTelRes<0)
		BEEP:C151
		//Gen_Alert ("Answer cannot be executed because the resource is not allocated")
	End if 
Else 
	If ((vTelActive) & (vTelRes>=0))
		PLUGCALL_Telephony("Answer"; 1)
		
		vTelOnline:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("Tel_Answer"; $_t_oldMethodName)
