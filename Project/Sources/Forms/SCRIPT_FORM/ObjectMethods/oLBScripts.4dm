If (False:C215)
	//object Name: Object Name:      SCRIPT_FORM.oLBScripts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/08/2012 14:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SCPT_at_MacroName;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; $_l_RunningRow; SCPT_but_1; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_ExecutionState)
	C_TEXT:C284($_t_oldMethodName; SCPT_t_CurrentlyExecuting)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/SCRIPT_FORM/oLBScripts"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (SCPT_at_MacroName{$_l_Row}#SCPT_t_CurrentlyExecuting)
				If (SCPT_t_CurrentlyExecuting#"")
					Gen_Alert("You must stop the currently executing script ("+SCPT_t_CurrentlyExecuting+") first!")
					$_l_RunningRow:=Find in array:C230(SCPT_at_MacroName; SCPT_t_CurrentlyExecuting)
					If ($_l_RunningRow>0)
						LISTBOX SELECT ROW:C912(*; "oLBScripts"; $_l_RunningRow)
					End if 
				Else 
					SCPT_l_ExecutionState:=0
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oLBScripts"; $_t_oldMethodName)
