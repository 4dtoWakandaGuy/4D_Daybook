//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Overdial
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
	C_BOOLEAN:C305(<>TelStartup; $0; vTelActive)
	C_LONGINT:C283($_l_DialResult; $_l_Return; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Overdial")
//tm_overdial - Tel_Overdial
$_l_DialResult:=0

If (<>TelStartup)
	$0:=False:C215
Else 
	If (vTelActive)
		PLUGCALL_Telephony("WriteDTMF"; 1)
		
		
		If ($_l_Return#0)
			BEEP:C151
			//error in dialing
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel_Overdial"; $_t_oldMethodName)
