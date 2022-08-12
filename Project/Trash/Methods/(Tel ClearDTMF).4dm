//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel ClearDTMF
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
	C_BOOLEAN:C305(<>TelStartup; vTelActive)
	C_LONGINT:C283($_l_Result; VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel ClearDTMF")
//tm_ClearDTMF - Tel TClearDTMF

If (<>TelStartup)
	
Else 
	If (vTelActive)
		PLUGCALL_Telephony("ClearDTMF"; 1)
		
		If ($_l_Result#0)
			BEEP:C151
			//error couldn't clear dtmf
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel ClearDTMF"; $_t_oldMethodName)
