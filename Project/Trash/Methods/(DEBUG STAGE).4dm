//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DEBUG STAGE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DebugStage)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEBUG STAGE")
<>DebugStage:=<>DebugStage+1

//ALERT(String(◊DebugStage))
Gen_Alert(String:C10(<>DebugStage))
ERR_MethodTrackerReturn("DEBUG STAGE"; $_t_oldMethodName)