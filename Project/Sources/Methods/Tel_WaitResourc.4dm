//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_WaitResourc
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
	C_LONGINT:C283($_l_Return; $0; $2; $3; vTelRes; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_WaitResourc")
//tm_WaitResource - TelTWaitResour
$_l_Return:=0
If (<>TelStartup)
	//check to see if the resource exists
Else 
	PLUGCALL_Telephony("WaitResource"; 1)
	
	If ($_l_Return#0)
		$0:=-1
		BEEP:C151
		// Gen_Alert ("Resource Error")
	Else 
		$0:=$_l_Return
		vTelRes:=$_l_Return
	End if 
End if 
ERR_MethodTrackerReturn("Tel_WaitResourc"; $_t_oldMethodName)
