//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel Dial
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
	C_LONGINT:C283($_l_Result; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel Dial")
//Tel Dial - to Dial a no & transfer it back to the user's extension
// (or someone else's)
If ((vTelActive) & (Not:C34(vTelOnline)) & ($1#""))
	PLUGCALL_Telephony("Dial"; 2)
	
	$0:=Tel_DialRes($_l_Result)
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel Dial"; $_t_oldMethodName)
