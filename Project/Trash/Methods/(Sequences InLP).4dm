//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sequences InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(SD2_at_TimeRequired;0)
	//ARRAY TEXT(SD2_at_WorkflowType;0)
	//ARRAY TEXT(SEQ_at_Timescales;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7)
	C_LONGINT:C283(PAL_BUTTON_8; PAL_BUTTON_9)
	C_TEXT:C284(<>LetAct; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; vButtDisSEQ; WF_t_DocumentTitle; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sequences InLP")
//Sequences InLP
If (Count parameters:C259>=1)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		
		//
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		WS_AutoscreenSize(2; 635; 570)
		OpenHelp(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		
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
		Sequences_InLPB
		INT_SetInput(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisSEQ)
		
		DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control In13")
		
		If (Records in selection:C76([WORKFLOW_CONTROL:51])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control In13")
		OpenHelp(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisSEQ)
		
		SD2_SetDiaryPopup
		If (Records in selection:C76([WORKFLOW_CONTROL:51])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control In13")
		OpenHelp(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisSEQ)
		SD2_SetDiaryPopup
		If (Records in selection:C76([WORKFLOW_CONTROL:51])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("WF_inLPA"; ""; "Minor_DelSinEx"; ->[WORKFLOW_CONTROL:51]; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; "Sequences"; "10"; "Sequences_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisSEQ)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([WORKFLOW_CONTROL:51]Action_Code:1))
				Check_MinorNC(->[WORKFLOW_CONTROL:51]Action_Code:1; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Action_Code:1)
			: (Modified:C32([WORKFLOW_CONTROL:51]Result_Code:2))
				Check_MinorNC(->[WORKFLOW_CONTROL:51]Result_Code:2; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2)
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Result_Code:2)
			: (Modified:C32([WORKFLOW_CONTROL:51]Next_Action:3))
				Check_MinorNC(->[WORKFLOW_CONTROL:51]Next_Action:3; "Type"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2; "Action")
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Next_Action:3)
			: (Modified:C32([WORKFLOW_CONTROL:51]Person:7))
				Check_MinorNC(->[WORKFLOW_CONTROL:51]Person:7; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Person:7)
			: (Modified:C32([WORKFLOW_CONTROL:51]Document_Code:8))
				Check_Letter(->[WORKFLOW_CONTROL:51]Document_Code:8; "")
				If (([WORKFLOW_CONTROL:51]Document_Code:8#"") & ([WORKFLOW_CONTROL:51]Action_Code:1=""))
					[WORKFLOW_CONTROL:51]Action_Code:1:=<>LetAct
				End if 
				WF_t_DocumentTitle:=""
				If ([WORKFLOW_CONTROL:51]Document_Code:8#"")
					If ([DOCUMENTS:7]Document_Code:1#[WORKFLOW_CONTROL:51]Document_Code:8)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[WORKFLOW_CONTROL:51]Document_Code:8)
					End if 
					WF_t_DocumentTitle:=[DOCUMENTS:7]Heading:2
					
				End if 
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Document_Code:8)
			: (Modified:C32([WORKFLOW_CONTROL:51]Script_Code:11))
				Check_MinorNC(->[WORKFLOW_CONTROL:51]Script_Code:11; ""; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Macro")
				Sequences_InLPM
				Macro_AccTypePt(->[WORKFLOW_CONTROL:51]Script_Code:11)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
		
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Sequences InLP"; $_t_oldMethodName)
