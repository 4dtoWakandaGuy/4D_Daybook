If (False:C215)
	//object Name: Object Name:      SCRIPT_FORM.oEditMacro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2012 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SCPT_at_MacroCode;0)
	C_BOOLEAN:C305(SCPT_bo_Refresh)
	C_LONGINT:C283(<>SCPT_l_RecordEdit; $_l_Column; $_l_event; $_l_Row; SCPT_but_1; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_EditScriptProcess; SCPT_l_ExecutionState)
	C_TEXT:C284($_t_oldMethodName; SCPT_t_LoadScript)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/SCRIPT_FORM/oEditMacro"; Form event code:C388)

//So when we edit there is no connection with the 'parent process' of the  macro palette.
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (SCPT_l_ExecutionState>=0)
				If (SCPT_l_EditScriptProcess=0)
					SCPT_l_ExecutionState:=-1
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
					HIDE PROCESS:C324(Current process:C322)
					SCPT_l_EditScriptProcess:=ZRecord_EditLst(Current process:C322; SCPT_at_MacroCode{$_l_Row})
					
				Else 
					SCPT_l_ExecutionState:=-1
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
					SET PROCESS VARIABLE:C370(SCPT_l_EditScriptProcess; SCPT_bo_Refresh; True:C214)
					SET PROCESS VARIABLE:C370(SCPT_l_EditScriptProcess; SCPT_t_LoadScript; SCPT_at_MacroCode{$_l_Row})
					POST OUTSIDE CALL:C329(SCPT_l_EditScriptProcess)
				End if 
			Else 
				Gen_Alert("You must stop the current script executing first")
			End if 
		Else 
			Gen_Alert("Please first select a script to Edit"; "Cancel")
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oEditMacro"; $_t_oldMethodName)
