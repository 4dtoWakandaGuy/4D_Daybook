//%attributes = {"invisible":true}
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
	//ARRAY BOOLEAN(SD2_lb_WorkflowManagerListbox;0)
	//ARRAY LONGINT(WFM_al_WorkflowTables;0)
	//ARRAY TEXT(SD2_at_WorkflowType;0)
	//ARRAY TEXT(SEQ_at_Timescales;0)
	//ARRAY TEXT(WFM_at_macroCode;0)
	//ARRAY TEXT(WFM_at_macroName;0)
	//ARRAY TEXT(WFM_at_WorkflowTables;0)
	C_LONGINT:C283($_l_Distance; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottomNew; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_offset; $_l_SizeofArray; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; r0; r1; r2; r3; SD2_l_CBonChangeState; SD2_l_CBoncreateNewrecord; SD2_l_CBonDeleterecord; SD2_l_CBonUpdaterecord; SD2_l_WFAddMode)
	C_LONGINT:C283(WFM_l_BUT1; WFM_l_BUT10; WFM_l_BUT2; WFM_l_BUT3; WFM_l_BUT4; WFM_l_BUT5; WFM_l_BUT6; WFM_l_BUT7; WFM_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; DIA_t_actionName; DT_t_ResultName; oWFM_COL1; oWFM_COL2; oWFM_COL3; oWFM_COL4; oWFM_COL5; oWFM_COL6; oWFM_COL7; oWFM_COL8)
	C_TEXT:C284(oWFM_COL9; oWFM_HED1; oWFM_HED2; oWFM_HED3; oWFM_HED4; oWFM_HED5; oWFM_HED6; oWFM_HED7; oWFM_HED8; SEQ_t_TImescale; vButtDisSEQ)
	C_TEXT:C284(vResult; vType; WF_t_DocumentTitle; WF_t_NextActionName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sequences_InLPB")
SD2_l_WFAddMode:=0

If ([WORKFLOW_CONTROL:51]WFControl_Code:10="")
	[WORKFLOW_CONTROL:51]WFControl_Code:10:=Gen_CodePref(20; ->[WORKFLOW_CONTROL:51]WFControl_Code:10)
End if 
Case of 
		
	: ([WORKFLOW_CONTROL:51]Hours:12>0)
		SEQ_t_TImescale:=SEQ_at_Timescales{2}
		SEQ_at_Timescales:=2
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Days:4; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Hours:12; True:C214)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Minutes:13; False:C215)
	: ([WORKFLOW_CONTROL:51]Minutes:13>0)
		SEQ_t_TImescale:=SEQ_at_Timescales{3}
		SEQ_at_Timescales:=3
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Days:4; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Hours:12; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Minutes:13; True:C214)
	Else 
		
		SEQ_t_TImescale:=SEQ_at_Timescales{1}
		SEQ_at_Timescales:=1
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Days:4; True:C214)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Hours:12; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]Minutes:13; False:C215)
End case 
Case of 
		
	: ([WORKFLOW_CONTROL:51]TimeNeededHours:15>0)
		SEQ_t_TImescale:=SEQ_at_Timescales{2}
		SEQ_at_Timescales:=2
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededDAYS:14; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededHours:15; True:C214)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededMinutes:16; False:C215)
	: ([WORKFLOW_CONTROL:51]TimeNeededMinutes:16>0)
		SEQ_t_TImescale:=SEQ_at_Timescales{3}
		SEQ_at_Timescales:=3
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededDAYS:14; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededHours:15; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededMinutes:16; True:C214)
	Else 
		
		SEQ_t_TImescale:=SEQ_at_Timescales{1}
		SEQ_at_Timescales:=1
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededDAYS:14; True:C214)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededHours:15; False:C215)
		OBJECT SET VISIBLE:C603([WORKFLOW_CONTROL:51]TimeNeededMinutes:16; False:C215)
End case 
ARRAY TEXT:C222(WFM_at_WorkflowTables; 0)
ARRAY LONGINT:C221(WFM_al_WorkflowTables; 0)
ARRAY TEXT:C222(WFM_at_macroName; 0)
ARRAY TEXT:C222(WFM_at_macroCode; 0)


$_l_offset:=0
//SET BLOB SIZE([WORKFLOW_CONTROL]WF_Control;0)

If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
	BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_WorkflowTables; $_l_offset)
	If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
		BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_al_WorkflowTables; $_l_offset)
		
		If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
			BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_macroName; $_l_offset)
			If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
				BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; WFM_at_macroCode; $_l_offset)
				If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
					BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBoncreateNewrecord; $_l_offset)
					If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
						BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonUpdaterecord; $_l_offset)
						If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
							BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonChangeState; $_l_offset)
							If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
								BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; SD2_l_CBonDeleterecord; $_l_offset)
							End if 
						End if 
					End if 
				End if 
				
			End if 
			
		End if 
	End if 
End if 
$_l_SizeofArray:=Size of array:C274(WFM_at_macroName)
ARRAY TEXT:C222(WFM_at_WorkflowTables; $_l_SizeofArray)
ARRAY LONGINT:C221(WFM_al_WorkflowTables; $_l_SizeofArray)
ARRAY TEXT:C222(WFM_at_macroName; $_l_SizeofArray)

LB_SetupListbox(->SD2_lb_WorkflowManagerListbox; "oWFM"; "WFM_L"; 1; ->WFM_at_WorkflowTables; ->WFM_at_macroName; ->WFM_al_WorkflowTables; ->WFM_at_macroCode)

LB_SetColumnHeaders(->SD2_lb_WorkflowManagerListbox; "WFM_L"; 1; "Table"; "Macro"; "Table Number"; "Macro Code")
LB_SetColumnWidths(->SD2_lb_WorkflowManagerListbox; "oWFM"; 1; 198; 104; 0; 0)  // dont need to worry about the invisible ones
LB_StyleSettings(->SD2_lb_WorkflowManagerListbox; "Black"; 9; "oWFM"; ->[PREFERENCES:116])
LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 0; "")
LB_SetScroll(->SD2_lb_WorkflowManagerListbox; -1; 0)
//`````
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
		OBJECT GET COORDINATES:C663(*; "oWorflowType"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
		
		$_l_ObjectBottomNew:=Gen_SetobjectPositionByname("oWorflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
	: (SD2_at_WorkflowType=2)
		$_l_Distance:=747-701
		OBJECT GET COORDINATES:C663(*; "oSettingsGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; ($_l_ObjectBottom+$_l_Distance)+10; $_l_WindowRight-$_l_WindowLeft)
		OBJECT GET COORDINATES:C663(*; "oWorflowType"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
		
		$_l_ObjectBottomNew:=Gen_SetobjectPositionByname("oWorflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
		
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
End case 



Input_Buttons(->[WORKFLOW_CONTROL:51]; ->vButtDisSEQ)
ERR_MethodTrackerReturn("Sequences_InLPB"; $_t_oldMethodName)
