//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Play
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
	C_LONGINT:C283($_l_Return; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Play")
//tm_PlayNoAbort - Tel_Play
//this routine allows abortion by DTMF digits

If (<>TelStartup)
	//make sure the file exists
Else 
	//play
	//set abort on DTMF
	$_t_Path:=Tel_PictFind($1)
	If ((vTelActive) & (vTelOnline) & ($_t_Path#""))
		PLUGCALL_Telephony("PLayFile"; 2)
		
		If ($_l_Return#0)
			BEEP:C151
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel_Play"; $_t_oldMethodName)
