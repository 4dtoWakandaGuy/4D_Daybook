//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Release
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
	C_BOOLEAN:C305(<>TelStartup)
	C_LONGINT:C283($_l_Return; vTelRes; VTELTASK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Release")
//tm_Release - Tel TRelease
If (<>TelStartup)
	//dont do anthing
Else 
	PLUGCALL_Telephony("Releaseresource"; 1)
	
	If ($_l_Return#0)
		BEEP:C151
		//  Gen_Alert ("Resource Error")
	Else 
		vTelRes:=-1
	End if 
End if 
ERR_MethodTrackerReturn("Tel_Release"; $_t_oldMethodName)
