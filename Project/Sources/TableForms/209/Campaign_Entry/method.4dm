
If (False:C215)
	//Object Name:      [WORKFLOW_Campaign].Campaign_Entry
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(WF_lb_Persons;0)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY LONGINT:C221($_al_Users; 0)
	ARRAY LONGINT:C221($_al_WorkGroups; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(WF_abo_Include;0)
	//ARRAY LONGINT(WF_al_GroupIDS;0)
	//ARRAY LONGINT(WF_al_PersonIDS;0)
	ARRAY TEXT:C222($_at_Attributes; 0)
	//ARRAY TEXT(WF_at_Personnel;0)
	//ARRAY TEXT(WF_at_WFGroups;0)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; WF_bo_ActiveFriday; WF_bo_ActiveMonday; WF_bo_ActiveSaturday; WF_bo_ActiveSunday; WF_bo_ActiveThursday; WF_bo_ActiveTuesday; WF_bo_ActiveWednesday; WF_BO_MODIFIED)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Index; $_l_ModuleRow; $_l_POsition; $_l_Ref; ACCan_l_BUT1; ACCan_l_But2; ACCan_l_BUT3; ACCan_l_BUT4; ACCan_l_BUT5; ACCan_l_BUT6)
	C_LONGINT:C283(ACCan_l_BUT7; ACCan_l_BUT8; ACCan_l_BUT9; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber)
	C_OBJECT:C1216($_obj_Participants)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; ACCan_t_COL1; ACCan_t_COL2; ACCan_t_COL3; ACCan_t_COL4; ACCan_t_COL5; ACCan_t_COL6; ACCan_t_COL7; ACCan_t_COL8; ACCan_t_COL9)
	C_TEXT:C284(ACCan_t_HED1; ACCan_t_HED2; ACCan_t_HED3; ACCan_t_HED4; ACCan_t_HED5; ACCan_t_HED6; ACCan_t_HED7; ACCan_t_HED8; ACCan_t_HED9; BAR_t_Button; PAL_BUTTON)
	C_TEXT:C284(vButtDisSEQ; WIN_t_CurrentInputForm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [WORKFLOW_Campaign]Campaign_Entry"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1)
		DB_SetnewToolBar
		WS_AutoscreenSize(2; 635; 570)
		OpenHelp(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		
		WF_BO_MODIFIED:=False:C215
		ARRAY LONGINT:C221($_al_WorkGroups; 0)
		ARRAY LONGINT:C221($_al_Users; 0)
		
		$_obj_Participants:=[WORKFLOW_Campaign:209]Participents:7
		OB GET PROPERTY NAMES:C1232($_obj_Participants; $_at_Attributes; $_al_AttributeTypes)
		$_l_Ref:=Find in array:C230($_at_Attributes; "Groups")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Participants; "Groups"; $_al_WorkGroups)
		End if 
		
		$_l_Ref:=Find in array:C230($_at_Attributes; "People")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Participants; "People"; $_al_Users)
		End if 
		ARRAY TEXT:C222(WF_at_WFGroups; 0)
		ARRAY TEXT:C222(WF_at_Personnel; 0)
		ARRAY BOOLEAN:C223(WF_abo_Include; 0)
		ARRAY LONGINT:C221(WF_al_GroupIDS; 0)
		ARRAY LONGINT:C221(WF_al_PersonIDS; 0)
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; WF_at_Personnel; [PERSONNEL:11]Personnel_ID:48; WF_al_PersonIDS)
		ARRAY BOOLEAN:C223(WF_abo_Include; Size of array:C274(WF_al_PersonIDS))
		For ($_l_Index; 1; Size of array:C274($_al_Users))
			$_l_POsition:=Find in array:C230(WF_al_PersonIDS; $_al_Users{$_l_Index})
			If ($_l_POsition>0)
				WF_abo_Include{$_l_POsition}:=True:C214
			End if 
		End for 
		
		LB_SetupListbox(->WF_lb_Persons; "ACCan_t"; "ACCan_L"; 1; ->WF_abo_Include; ->WF_al_PersonIDS; ->WF_at_Personnel)
		
		LB_SetColumnHeaders(->WF_lb_Persons; "ACCan_L"; 1; "Include"; ""; "Name")
		
		LB_SetColumnWidths(->WF_lb_Persons; "ACCan_t"; 1; 40; 0; 128)
		LB_SetScroll(->WF_lb_Persons; -3; -2)
		LB_StyleSettings(->WF_lb_Persons; "Black"; 9; "ACCan_t"; ->[DIARY:12])
		LB_SetEnterable(->WF_lb_Persons; False:C215; 0)
		LB_SetEnterable(->WF_lb_Persons; True:C214; 1)
		
		If ([WORKFLOW_Campaign:209]DaysActive:8#"")
			If (Length:C16([WORKFLOW_Campaign:209]DaysActive:8)<7)
				[WORKFLOW_Campaign:209]DaysActive:8:=[WORKFLOW_Campaign:209]DaysActive:8+(" "*(7-Length:C16([WORKFLOW_Campaign:209]DaysActive:8)))
				
			End if 
			WF_bo_ActiveMonday:=([WORKFLOW_Campaign:209]DaysActive:8[[1]]="1")
			WF_bo_ActiveTuesday:=([WORKFLOW_Campaign:209]DaysActive:8[[2]]="1")
			WF_bo_ActiveWednesday:=([WORKFLOW_Campaign:209]DaysActive:8[[3]]="1")
			WF_bo_ActiveThursday:=([WORKFLOW_Campaign:209]DaysActive:8[[4]]="1")
			WF_bo_ActiveFriday:=([WORKFLOW_Campaign:209]DaysActive:8[[5]]="1")
			WF_bo_ActiveSaturday:=([WORKFLOW_Campaign:209]DaysActive:8[[6]]="1")
			WF_bo_ActiveSunday:=([WORKFLOW_Campaign:209]DaysActive:8[[7]]="1")
			
		End if 
		DB_SetInputFormMenu(Table:C252(->[WORKFLOW_Campaign:209]); "Campaign_Entry")
		
	: (Form event code:C388=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control_In")
		OpenHelp(Table:C252(->[WORKFLOW_CONTROL:51]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisSEQ)
		
		
	: (((Form event code:C388=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		Case of 
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("WFC_inLPA"; ""; "Minor_DelSinEx"; ->[WORKFLOW_Campaign:209]; ->[WORKFLOW_Campaign:209]UUID:1; "Campaigns"; "10"; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisSEQ)
		End case 
	: (Form event code:C388=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[WORKFLOW_CONTROL:51]); "Workflow_Control_In")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
End case 
ERR_MethodTrackerReturn("FM [WORKFLOW_Campaign]Campaign_Entry"; $_t_oldMethodName)
