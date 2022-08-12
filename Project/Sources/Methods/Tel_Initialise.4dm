//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Initialise
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
	C_BOOLEAN:C305(<>Tel_bo_Quitting; <>TelMassErr; <>TelServer; <>TelStartup)
	C_LONGINT:C283($_l_LinkOpen; $r; vTelMaxTask)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Initialise")
//aaInitialise - Tel_Initialise
vTelMaxTask:=2
PLUGCALL_Telephony("Configure")


If ($r=0)
	$_l_LinkOpen:=PLUGCALL_Telephony("OpenLink"; 1)
	
	If ($_l_LinkOpen=0)
		<>TelServer:=Tel_ServerPres
		<>TelStartup:=False:C215  //This is my line - what is it supposed to be?
		<>TelMassErr:=False:C215
		<>Tel_bo_Quitting:=False:C215
	Else 
		<>TelServer:=False:C215
	End if 
Else 
	<>TelServer:=False:C215
End if 
ERR_MethodTrackerReturn("Tel_Initialise"; $_t_oldMethodName)
