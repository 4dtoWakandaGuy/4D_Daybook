//%attributes = {}
If (False:C215)
	//Project Method Name:      Sequences_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2010 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_Dependencies;0)
	//ARRAY BOOLEAN(SD2_lb_WorkflowManagerListbox;0)
	//ARRAY LONGINT(WFM_al_TriggeringActions;0)
	//ARRAY LONGINT(WFM_al_WorkflowTables;0)
	//ARRAY OBJECT(WFM_obj_DependencyRules;0)
	//ARRAY TEXT(SD2_at_TimeRequired;0)
	//ARRAY TEXT(SD2_at_WorkflowType;0)
	//ARRAY TEXT(SEQ_at_Timescales;0)
	//ARRAY TEXT(SEQ_at_TimesRequired;0)
	//ARRAY TEXT(WFM_at_DependencyActionName;0)
	//ARRAY TEXT(WFM_at_DependencyActions;0)
	//ARRAY TEXT(WFM_at_DependencyUUID;0)
	//ARRAY TEXT(WFM_at_DependentResult;0)
	//ARRAY TEXT(WFM_at_DependentRules;0)
	//ARRAY TEXT(WFM_at_DependentStatus;0)
	//ARRAY TEXT(WFM_at_ScriptCodes;0)
	//ARRAY TEXT(WFM_at_ScriptNames;0)
	//ARRAY TEXT(WFM_at_WorkflowTables;0)
	C_LONGINT:C283($_l_Distance; $_l_FillNames; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottomNew; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_offset; $_l_SizeofArray; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; r0; r1; r2; r3; SD2_l_CBonChangeState; SD2_l_CBoncreateNewrecord; SD2_l_CBonDeleterecord; SD2_l_CBonUpdaterecord)
	C_LONGINT:C283(SD2_l_WFAddMode; WFM_l_BUT1; WFM_l_BUT10; WFM_l_BUT2; WFM_l_BUT3; WFM_l_BUT4; WFM_l_BUT5; WFM_l_BUT6; WFM_l_BUT7; WFM_l_BUT9)
	C_OBJECT:C1216($_obj_Actions; $_obj_Dependencies; $_obj_WorkFlowTables)
	C_TEXT:C284($_t_oldMethodName; DIA_t_actionName; DT_t_ResultName; oWFM_COL1; oWFM_COL2; oWFM_COL3; oWFM_COL4; oWFM_COL5; oWFM_COL6; oWFM_COL7; oWFM_COL8)
	C_TEXT:C284(oWFM_COL9; oWFM_HED1; oWFM_HED2; oWFM_HED3; oWFM_HED4; oWFM_HED5; oWFM_HED6; oWFM_HED7; oWFM_HED8; SEQ_t_TImescale; vButtDisSEQ)
	C_TEXT:C284(vResult; vType; WF_t_DocumentTitle; WF_t_NextActionName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sequences_InLPB")
ARRAY TEXT:C222(SEQ_at_Timescales; 3)
SEQ_at_Timescales{1}:="Days"
SEQ_at_Timescales{2}:="Hours"
SEQ_at_Timescales{3}:="Minutes"
ARRAY TEXT:C222(SD2_at_TimeRequired; 3)
SD2_at_TimeRequired{1}:="Days"
SD2_at_TimeRequired{2}:="Hours"
SD2_at_TimeRequired{3}:="Minutes"
ARRAY TEXT:C222(SD2_at_WorkflowType; 2)
SD2_at_WorkflowType{1}:="From Time Manager"
SD2_at_WorkflowType{2}:="From Other Tables"
SD2_at_WorkflowType:=1
SD2_l_WFAddMode:=0

If ([WORKFLOW_CONTROL:51]WFControl_Code:10="")
	[WORKFLOW_CONTROL:51]WFControl_Code:10:=Gen_CodePref(20; ->[WORKFLOW_CONTROL:51]WFControl_Code:10)
End if 
OBJECT SET VISIBLE:C603(*; "oWFDays"; (SEQ_at_Timescales=1))
OBJECT SET VISIBLE:C603(*; "oWFHours"; (SEQ_at_Timescales=2))
OBJECT SET VISIBLE:C603(*; "oWFMinutes"; (SEQ_at_Timescales=3))

Case of 
		
	: ([WORKFLOW_CONTROL:51]Hours:12>0)
		Form:C1466.timescale:=SEQ_at_Timescales{2}
		SEQ_at_Timescales:=2
		
	: ([WORKFLOW_CONTROL:51]Minutes:13>0)
		Form:C1466.timescale:=SEQ_at_Timescales{3}
		
		//SEQ_t_TImescale:=SEQ_at_Timescales{3}
		SEQ_at_Timescales:=3
		
	Else 
		Form:C1466.timescale:=SEQ_at_Timescales{1}
		//SEQ_t_TImescale:=SEQ_at_Timescales{1}
		SEQ_at_Timescales:=1
		
End case 
OBJECT SET VISIBLE:C603(*; "oWFDays@"; (SEQ_at_Timescales=1))
OBJECT SET VISIBLE:C603(*; "oWFHours@"; (SEQ_at_Timescales=2))
OBJECT SET VISIBLE:C603(*; "oWFMinutes@"; (SEQ_at_Timescales=3))


Case of 
		
	: ([WORKFLOW_CONTROL:51]TimeNeededHours:15>0)
		Form:C1466.timerequired:=SD2_at_TimeRequired{2}
		//SEQ_t_TImescale:=SEQ_at_Timescales{2}
		SEQ_at_TimesRequired:=2
		
	: ([WORKFLOW_CONTROL:51]TimeNeededMinutes:16>0)
		Form:C1466.timerequired:=SD2_at_TimeRequired{2}
		//SEQ_t_TImescale:=SEQ_at_TimesRequired{3}
		SEQ_at_Timescales:=3
		
	Else 
		Form:C1466.timerequired:=SD2_at_TimeRequired{1}
		//SEQ_t_TImescale:=SEQ_at_TimesRequired{1}
		SEQ_at_Timescales:=1
		
End case 
OBJECT SET VISIBLE:C603(*; "oWFReserveDays@"; (SD2_at_TimeRequired=1))
OBJECT SET VISIBLE:C603(*; "oWFReserveHours@"; (SD2_at_TimeRequired=2))
OBJECT SET VISIBLE:C603(*; "oWFReserveMinutes@"; (SD2_at_TimeRequired=3))

ARRAY TEXT:C222(WFM_at_WorkflowTables; 0)
ARRAY LONGINT:C221(WFM_al_WorkflowTables; 0)
ARRAY TEXT:C222(WFM_at_ScriptNames; 0)
ARRAY TEXT:C222(WFM_at_ScriptCodes; 0)
ARRAY LONGINT:C221(WFM_al_TriggeringActions; 0)


$_l_offset:=0
//SET BLOB SIZE([WORKFLOW_CONTROL]WF_Control;0)
$_obj_WorkFlowTables:=ds:C1482.WORKFLOW_TABLES.query("WorkFlowCode =:1"; [WORKFLOW_CONTROL:51]WFControl_Code:10)
If ($_obj_WorkFlowTables.length>0)
	COLLECTION TO ARRAY:C1562($_obj_WorkFlowTables.TableName; WFM_at_WorkflowTables)
	COLLECTION TO ARRAY:C1562($_obj_WorkFlowTables.TableNumber; WFM_al_WorkflowTables)
	COLLECTION TO ARRAY:C1562($_obj_WorkFlowTables.RulesScriptName; WFM_at_ScriptNames)
	COLLECTION TO ARRAY:C1562($_obj_WorkFlowTables.RulesScriptCode; WFM_at_ScriptCodes)
	COLLECTION TO ARRAY:C1562($_obj_WorkFlowTables.TriggeringActions; WFM_al_TriggeringActions)
Else 
	
	If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
		BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_WorkflowTables; $_l_offset)  //Table Names
		If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
			BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_al_WorkflowTables; $_l_offset)  //Table Numbers
			
			If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
				BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_ScriptNames; $_l_offset)  //Script Names
				If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
					BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_ScriptCodes; $_l_offset)  //Script COdes
					If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
						BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBoncreateNewrecord; $_l_offset)  //Create New Record
						If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
							BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonUpdaterecord; $_l_offset)  //Update Record
							If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
								BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonChangeState; $_l_offset)  //Change Record State
								If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
									BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonDeleterecord; $_l_offset)  //Delete Record
								End if 
							End if 
						End if 
					End if 
					
				End if 
				
			End if 
		End if 
	End if 
End if 
$_l_SizeofArray:=Size of array:C274(WFM_at_ScriptNames)
ARRAY TEXT:C222(WFM_at_WorkflowTables; $_l_SizeofArray)
ARRAY LONGINT:C221(WFM_al_WorkflowTables; $_l_SizeofArray)
ARRAY TEXT:C222(WFM_at_ScriptNames; $_l_SizeofArray)
ARRAY TEXT:C222(WFM_at_ScriptCodes; $_l_SizeofArray)
ARRAY LONGINT:C221(WFM_al_TriggeringActions; $_l_SizeofArray)

LB_SetupListbox(->SD2_lb_WorkflowManagerListbox; "oWFM"; "WFM_L"; 1; ->WFM_at_WorkflowTables; ->WFM_at_ScriptNames; ->WFM_al_WorkflowTables; ->WFM_at_ScriptCodes)

LB_SetColumnHeaders(->SD2_lb_WorkflowManagerListbox; "WFM_L"; 1; "Table"; "Script"; "Table Number"; "Script Code")
LB_SetColumnWidths(->SD2_lb_WorkflowManagerListbox; "oWFM"; 1; 198; 104; 0; 0)  // dont need to worry about the invisible ones
LB_StyleSettings(->SD2_lb_WorkflowManagerListbox; "Black"; 9; "oWFM"; ->[PREFERENCES:116])
LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 0; "")
LB_SetScroll(->SD2_lb_WorkflowManagerListbox; -1; 0)
//`````
ARRAY TEXT:C222(WFM_at_DependencyActions; 0)
ARRAY TEXT:C222(WFM_at_DependencyActionName; 0)
ARRAY TEXT:C222(WFM_at_DependencyUUID; 0)
ARRAY OBJECT:C1221(WFM_obj_DependencyRules; 0)
ARRAY TEXT:C222(WFM_at_DependentRules; 0)
ARRAY TEXT:C222(WFM_at_DependentResult; 0)
ARRAY TEXT:C222(WFM_at_DependentStatus; 0)

$_obj_Dependencies:=ds:C1482.WORKFLOW_DEPENDENCIES.query("WorkFlowCode =:1"; [WORKFLOW_CONTROL:51]WFControl_Code:10)
If ($_obj_Dependencies.length>0)
	COLLECTION TO ARRAY:C1562($_obj_Dependencies.AsynchonousActionCode; WFM_at_DependencyActions)
	COLLECTION TO ARRAY:C1562($_obj_Dependencies.WorkflowDependancy_UUID; WFM_at_DependencyUUID)
	For ($_l_FillNames; 1; Size of array:C274(WFM_at_DependencyActions))
		$_obj_Actions:=ds:C1482.ACTIONS.query("Action_Code =:1"; WFM_at_DependencyActions{$_l_FillNames})
		If ($_obj_Actions.length>0)
			APPEND TO ARRAY:C911(WFM_at_DependencyActionName; $_obj_Actions[0].Action_Name)
		Else 
			APPEND TO ARRAY:C911(WFM_at_DependencyActionName; "Unknown")
		End if 
		If (Not:C34(WFM_obj_DependencyRules{$_l_FillNames}.status=Null:C1517))
			APPEND TO ARRAY:C911(WFM_at_DependentStatus; WFM_obj_DependencyRules{$_l_FillNames}.status)
		Else 
			APPEND TO ARRAY:C911(WFM_at_DependentStatus; "")
		End if 
		If (Not:C34(WFM_obj_DependencyRules{$_l_FillNames}.result=Null:C1517))
			APPEND TO ARRAY:C911(WFM_at_DependentResult; WFM_obj_DependencyRules{$_l_FillNames}.result)
		Else 
			APPEND TO ARRAY:C911(WFM_at_DependentResult; "")
		End if 
		If (Not:C34(WFM_obj_DependencyRules{$_l_FillNames}.rules=Null:C1517))
			APPEND TO ARRAY:C911(WFM_at_DependentRules; WFM_obj_DependencyRules{$_l_FillNames}.rules)
		Else 
			APPEND TO ARRAY:C911(WFM_at_DependentRules; "")
		End if 
		
	End for 
	
End if 
LB_SetupListbox(->SD2_lb_Dependencies; "oDEP"; "DEP_L"; 1; ->WFM_at_DependencyUUID; ->WFM_at_DependencyActions; ->WFM_obj_DependencyRules; ->WFM_at_DependencyActionName; ->WFM_at_DependentStatus; ->WFM_at_DependentResult; ->WFM_at_DependentRules)

LB_SetColumnHeaders(->SD2_lb_Dependencies; "DEP_L"; 1; "UUID"; "Action Code"; "RulesObject"; "Action Name"; "Status"; "Result"; "Script")
LB_SetColumnWidths(->SD2_lb_Dependencies; "oDEP"; 1; 0; 60; 0; 100; 100; 100; 100)  // dont need to worry about the invisible ones
LB_StyleSettings(->SD2_lb_Dependencies; "Black"; 9; "oDEP"; ->[PREFERENCES:116])
LB_SetEnterable(->SD2_lb_Dependencies; False:C215; 0; "")
LB_SetScroll(->SD2_lb_Dependencies; -1; 0)


RELATE ONE:C42([WORKFLOW_CONTROL:51]Action_Code:1)
DIA_t_actionName:=[ACTIONS:13]Action_Name:2
RELATE ONE:C42([WORKFLOW_CONTROL:51]Result_Code:2)
DT_t_ResultName:=[RESULTS:14]Result_Name:2
RELATE ONE:C42([WORKFLOW_CONTROL:51]Next_Action:3)
WF_t_NextActionName:=[ACTIONS:13]Action_Name:2
RELATE ONE:C42([WORKFLOW_CONTROL:51]Document_Code:8)
WF_t_DocumentTitle:=[DOCUMENTS:7]Heading:2

r0:=0
r1:=0
r2:=0
r3:=0
Case of 
	: ([WORKFLOW_CONTROL:51]Display:6=0)
		r0:=1
	: ([WORKFLOW_CONTROL:51]Display:6=1)
		r1:=1
	: ([WORKFLOW_CONTROL:51]Display:6=2)
		r2:=1
	: ([WORKFLOW_CONTROL:51]Display:6=3)
		r3:=1
End case 
If ((DB_GetModuleSettingByNUM(Module_Macros))<2)
	OBJECT SET ENTERABLE:C238([WORKFLOW_CONTROL:51]Script_Code:11; False:C215)
End if 

vButtDisSEQ:="I  PMO  FSSSRCADT"
Gen_InDisCode(->[WORKFLOW_CONTROL:51]WFControl_Code:10; ->vButtDisSEQ)
Macro_AccType("Load "+String:C10(Table:C252(->[WORKFLOW_CONTROL:51])))
FORM GOTO PAGE:C247(SD2_at_WorkflowType)
$_l_Distance:=623-577


Case of 
	: (SD2_at_WorkflowType=1)
		$_l_Distance:=623-577
		OBJECT GET COORDINATES:C663(*; "oFIeld1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; ($_l_ObjectBottom+$_l_Distance)+10; $_l_WindowRight-$_l_WindowLeft)
		OBJECT GET COORDINATES:C663(*; "oWorkflowType"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
		
		$_l_ObjectBottomNew:=Gen_SetobjectPositionByname("oWorkflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
	: (SD2_at_WorkflowType=2)
		$_l_Distance:=747-701
		OBJECT GET COORDINATES:C663(*; "oSettingsGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; ($_l_ObjectBottom+$_l_Distance)+10; $_l_WindowRight-$_l_WindowLeft)
		OBJECT GET COORDINATES:C663(*; "oWorkflowType"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
		
		$_l_ObjectBottomNew:=Gen_SetobjectPositionByname("oWorkflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
		
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
End case 



Input_Buttons(->[WORKFLOW_CONTROL:51]; ->vButtDisSEQ)
ERR_MethodTrackerReturn("Sequences_InLPB"; $_t_oldMethodName)
//
