If (False:C215)
	//object Name: [COMPANIES]dRecord.oExecuteMacro
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
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_ExecutionState; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRecord.oExecuteMacro"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (SCPT_l_ExecutionState=0)  // if the execution state is anything but zero ignore this
				
			: (SCPT_l_ExecutionState=2)
				RESUME PROCESS:C320(SCPT_l_ParentProcess)
				SCPT_l_ExecutionState:=1
				OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_3; True:C214)
				OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRecord.oExecuteMacro"; $_t_oldMethodName)
