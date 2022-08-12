//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Transfer
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
	C_LONGINT:C283($_l_Return; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Transfer")

If ((vTelActive) & (vTelOnline))
	PLUGCALL_Telephony("Dial"; 1)
	
	$0:=Tel_DialRes($_l_Return)
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel_Transfer"; $_t_oldMethodName)
