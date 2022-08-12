If (False:C215)
	//object Name: Object Name:      SCRIPT_FORM.oButtonDelete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2012 16:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SCPT_abo_SameProcess;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(SCPT_at_MacroCode;0)
	//ARRAY TEXT(SCPT_at_MacroName;0)
	//ARRAY TEXT(SCRPT_at_TableNames;0)
	C_BOOLEAN:C305(<>FindMy)
	C_LONGINT:C283($_l_Column; $_l_OK; $_l_Row; $_l_ScriptIndex; $_l_TableNumber; $_l_TableRow; SCPT_but_1; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_ExecutionState)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/SCRIPT_FORM/oButtonDelete"; Form event code:C388)

If (SCPT_l_ExecutionState=0)
	LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
	If ($_l_Row>0)
		READ WRITE:C146([SCRIPTS:80])
		
		
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SCPT_at_MacroCode{$_l_Row})
		MESSAGES ON:C181
		$_l_OK:=DB_DeletionControl(->[SCRIPTS:80])
		If ($_l_OK=1)
			Gen_Confirm("Are you sure you wish to delete this macro? This action cannot be undone."; "No"; "Yes")
			If (OK=0)
				DELETE RECORD:C58([SCRIPTS:80])
			End if 
			OK:=1
		End if 
		READ ONLY:C145([SCRIPTS:80])
		If (SCRPT_at_TableNames>1)
			$_l_TableRow:=DB_GetTableNumFromNameString(SCRPT_at_TableNames{SCRPT_at_TableNames})
			If ($_l_TableRow>0)
				$_l_TableNumber:=<>DB_al_TableNums{$_l_TableRow}
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber; *)
			Else 
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
			End if 
		Else 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
		End if 
		
		QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
		If (<>FindMy)
			QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
		End if 
		SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
		For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
			If (SCPT_at_MacroName{$_l_ScriptIndex}="")
				SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
			End if 
		End for 
		SCPT_l_ExecutionState:=0
		LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
			OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
			OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
			OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
		Else 
			OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
			OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
			OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
			OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oButtonDelete"; $_t_oldMethodName)
