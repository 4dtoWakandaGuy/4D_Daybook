If (False:C215)
	//object Name: [WORKFLOW_CONTROL]Workflow_Control_In.oButtonClearWF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 16:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_WorkflowManagerListbox;0)
	//ARRAY TEXT(SD2_at_pop;0)
	//ARRAY TEXT(SD2_at_pop2;0)
	//ARRAY TEXT(WFM_at_ScriptNames;0)
	//ARRAY TEXT(WFM_at_WorkflowTables;0)
	C_LONGINT:C283($_l_event; SD2_but_AddWF; SD2_but_ButWFClear; SD2_l_SelectedRow; SD2_l_WFAddMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oButtonClearWF"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD2_l_WFAddMode=1)
				LISTBOX DELETE ROWS:C914(SD2_lb_WorkflowManagerListbox; 1)
				
				OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
				OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
				SD2_l_WFAddMode:=0
				OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
				LB_SetChoiceList(""; ->SD2_at_pop; ->WFM_at_WorkflowTables)
				LB_SetChoiceList(""; ->SD2_at_pop2; ->WFM_at_ScriptNames)
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 1; "")
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 2; "")
			: (SD2_l_WFAddMode=3) | (SD2_l_WFAddMode=2)
				OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
				OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
				SD2_l_WFAddMode:=0
				OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
				LB_SetChoiceList(""; ->SD2_at_pop; ->WFM_at_WorkflowTables)
				LB_SetChoiceList(""; ->SD2_at_pop2; ->WFM_at_ScriptNames)
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 1; "")
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 2; "")
				SD2_l_SelectedRow:=0
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oButtonClearWF"; $_t_oldMethodName)
