If (False:C215)
	//object Name: [COMPANIES]dRecord.oPauseButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 11:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_ExecutionState; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRecord.oPauseButton"; Form event code:C388)
RESUME PROCESS:C320(SCPT_l_ParentProcess)
If (SCPT_l_ExecutionState>0)
	If (SCPT_l_ParentProcess>0)
		PAUSE PROCESS:C319(SCPT_l_ParentProcess)
		
		OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
		OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
		SCPT_l_ExecutionState:=2
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRecord.oPauseButton"; $_t_oldMethodName)
