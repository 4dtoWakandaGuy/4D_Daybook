If (False:C215)
	//object Name: [COMPANIES]dRecord.oStopButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_Cancel; SCPT_l_ExecutionState; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRecord.oStopButton"; Form event code:C388)

If (SCPT_l_ExecutionState>0)
	If (SCPT_l_ParentProcess>0)
		SET PROCESS VARIABLE:C370(SCPT_l_ParentProcess; SCPT_l_Cancel; SCPT_l_ParentProcess)
		RESUME PROCESS:C320(SCPT_l_ParentProcess)
		OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
		OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
		SCPT_l_ExecutionState:=2
		CANCEL:C270
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRecord.oStopButton"; $_t_oldMethodName)
