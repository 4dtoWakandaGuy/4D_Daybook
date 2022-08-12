//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_WaitSpeech
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
	C_LONGINT:C283($_l_Return; $1; $2; TEL_l_DetectDuration; TEL_l_MaxDuration; TEL_Return; VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_WaitSpeech")


//eg 2 secs of speech within 5 secs

If ((vTelActive) & (vTelOnline))
	TEL_l_MaxDuration:=$1
	TEL_l_DetectDuration:=$2
	TEL_Return:=0
	PLUGCALL_Telephony("WaitSpeach"; 0)
	//;->◊TelSession;->vTelTask;->vTelRes;->TEL_l_MaxDuration;->TEL_l_DetectDuration;->TEL_Return)
	
	$_l_Return:=TEL_Return
	
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel_WaitSpeech"; $_t_oldMethodName)
