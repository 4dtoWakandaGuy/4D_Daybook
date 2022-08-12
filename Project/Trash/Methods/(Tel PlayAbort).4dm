//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel_PlayAbort
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
	C_LONGINT:C283($_l_Number; $_l_Return; $2; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_PlayAbort")
//tm_PlayAbort - Tel_PlayAbort
//this routine allows abortion by DTMF digits
//Will default to 1 if not specified

If (Count parameters:C259=1)
	$_l_Number:=1
Else 
	$_l_Number:=$2
End if 

If (<>TelStartup)
	//make sure the file exists
Else 
	//play
	//set abort on DTMF
	$_t_Path:=Tel_PictFind($1)
	If ((vTelActive) & (vTelOnline) & ($_t_Path#""))
		PLUGCALL_Telephony("PLAY"; 1)
		
		
		If ($_l_Return#0)
			BEEP:C151
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel_PlayAbort"; $_t_oldMethodName)
