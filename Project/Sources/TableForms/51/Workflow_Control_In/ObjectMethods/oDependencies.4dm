If (False:C215)
	//object Method Name: Object Name:      [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2010 10:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_boj_InputData)
	//ARRAY BOOLEAN(SD2_lb_WorkflowManagerListbox;0)
	//ARRAY LONGINT(SD2_al_SelectableTables;0)
	//ARRAY LONGINT(WFM_al_WorkflowTables;0)
	//ARRAY TEXT(SD2_at_MacroCodes;0)
	//ARRAY TEXT(SD2_at_MacroName;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	//ARRAY TEXT(WFM_at_ScriptCodes;0)
	//ARRAY TEXT(WFM_at_ScriptNames;0)
	//ARRAY TEXT(WFM_at_WorkflowTables;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ClickedColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_ScriptRow; $_l_TableNumber; MAC_l_EnterMacroClass; SD2_but_AddWF; SD2_but_ButWFClear; SD2_l_SelectedRow; SD2_l_WFAddMode)
	C_OBJECT:C1216($_obj_FormData)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowTables"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		
		$_l_Row:=Self:C308->
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD2_lb_WorkflowManagerListbox; $_t_VariableName)
		Case of 
			: (SD2_l_WFAddMode=0) | (SD2_l_WFAddMode=2)  //not editing anything
				
				If ($_l_Row>0)
					SD2_l_SelectedRow:=$_l_Row
					SD2_l_WFAddMode:=2
					OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Clear Table")
					OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; True:C214)
					OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Edit")
				Else 
					SD2_l_WFAddMode:=0
					OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Clear Table")
					OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
					OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
				End if 
			: (SD2_l_WFAddMode=1)  //we are editing a row-its always row one
				
				If ($_l_Row>1)
					//we are clicking on a row other than the one being edited-cant do that
					LISTBOX SELECT ROW:C912(SD2_lb_WorkflowManagerListbox; 1)
					
				End if 
			: (SD2_l_WFAddMode=2)  //we are clicking on a row and we have one selected
				
				
				If ($_l_Row>0)
					SD2_l_SelectedRow:=$_l_Row
					SD2_l_WFAddMode:=2
					OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Clear Table")
					OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; True:C214)
					OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Edit")
				Else 
					SD2_l_WFAddMode:=0
					OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Clear Table")
					OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
					OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
				End if 
			: (SD2_l_WFAddMode=3)
				// we are editing so extra to clear
				
				
				
		End case 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Mouse Enter:K2:33)
	: ($_l_event=On Data Change:K2:15)
		
		
		
		
		$_l_Row:=Self:C308->
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD2_lb_WorkflowManagerListbox; $_t_VariableName)
		Case of 
			: ($_l_ClickedColumn=1)  //Table names
				
				$_l_ScriptRow:=Find in array:C230(SD2_at_SelectableTables; WFM_at_WorkflowTables{$_l_Row})
				If ($_l_ScriptRow>0)
					WFM_al_WorkflowTables{$_l_Row}:=SD2_al_SelectableTables{$_l_ScriptRow}
					
				Else 
					WFM_al_WorkflowTables{$_l_Row}:=0
					WFM_at_WorkflowTables{$_l_Row}:=""
					
				End if 
			: ($_l_ClickedColumn=2)  // `Macro names
				
				
				$_l_ScriptRow:=Find in array:C230(SD2_at_MacroName; WFM_at_ScriptNames{$_l_Row})
				If ($_l_ScriptRow>0)
					Case of 
						: (SD2_at_MacroCodes{$_l_ScriptRow}="-3")  //select a macro"
							
							WFM_at_ScriptCodes{$_l_Row}:=""
							WFM_at_ScriptNames{$_l_Row}:=""
							
						: (SD2_at_MacroCodes{$_l_ScriptRow}="-4")  //write a macro"
							
							WFM_at_ScriptCodes{$_l_Row}:=""
							WFM_at_ScriptNames{$_l_Row}:=""
							Gen_Alert("When creating this macro you should not move the current record pointer or change the selection of records in the primary table. The macro should be used to work out if the sequence applys rather than used to create a record in the time manager. The m"+"a"+"cro must set the variable 'WFM_bo_CreateWorklowRecord' to true or false")
							
							MAC_l_EnterMacroClass:=WF Macros
							$_obj_FormData:=New object:C1471("MacroClass"; WF Macros)
							
							$_boj_InputData:=New object:C1471("TableNumber"; Table:C252(->[SCRIPTS:80]); "Format"; "Scripts"; "RecordTitle"; "Script"; "FormData"; $_obj_FormData)
							TRACE:C157
							
							Minor_In($_boj_InputData)  //->[SCRIPTS]; "Macros"; "Macros")
						: (SD2_at_MacroCodes{$_l_ScriptRow}="-2")
							
							WFM_at_ScriptCodes{$_l_Row}:="UseStd"
						Else 
							WFM_at_ScriptCodes{$_l_Row}:=SD2_at_MacroCodes{$_l_ScriptRow}
					End case 
				Else 
					WFM_at_ScriptCodes{$_l_Row}:=""
					WFM_at_ScriptNames{$_l_Row}:=""
				End if 
				
				
		End case 
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowTables"; $_t_oldMethodName)
