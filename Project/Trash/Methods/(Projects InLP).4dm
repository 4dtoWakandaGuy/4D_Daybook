//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROJ_lb_Jobs;0)
	//ARRAY LONGINT(AL_al_ModeJob;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(PRJ_at_ModeJob;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; Gen_bo_StateModified; PAL_bo_ButtonSubFunction; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7)
	C_LONGINT:C283(PAL_BUTTON_8; PAL_BUTTON_9)
	C_PICTURE:C286(JOB_pic_LBMode)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisSC; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_InLP")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388  //Projects_InLP
End if 

Case of 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[PROJECTS:89]); "Projects_In13")
		//DEFAULT TABLE([PROJECTS])
		If (vTot=1)
			vTot:=0
			Projects_InLPTo
		End if 
		States_CUArr(->[PROJECTS:89]State:9)
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisSC; "Project"; "Job")
		
		If (Records in selection:C76([PROJECTS:89])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				inButtSubHandle(FORM Get current page:C276; ->[PROJECTS:89])
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("P:Projects_InLPA:D:Projects_InCan"; ""; "Projects_Del"; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; "Projects"; "1"; "Projects_InLPB"; "AMaster"; "Projects_Sel"; ""; ->[JOBS:26]; ->vButtDisSC)
				
				
		End case 
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		Case of 
				
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PROJECTS:89]); "Projects_In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				If ($_l_Event=On Menu Selected:K2:14)
					DB_SetInputFormMenu(Table:C252(->[PROJECTS:89]); "Projects_In13")
					If (vTot=1)
						vTot:=0
						Projects_InLPTo
					End if 
					States_CUArr(->[PROJECTS:89]State:9)
					In_ButtChkDis(->vButtDisSC; "Project"; "Job")
					If (Records in selection:C76([PROJECTS:89])<=1)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				Else 
					Projects_InLPD
				End if 
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Gen_bo_StateModified:=False:C215
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PROJECTS:89]); WIN_t_CurrentInputForm)
		WS_AutoscreenSize(1; 606; 590)
		INT_SetInput(Table:C252(->[PROJECTS:89]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(PRJ_at_ModeJob; 0)
		ARRAY LONGINT:C221(AL_al_ModeJob; 0)
		LBi_SetListBoxOptions(->PRJ_at_ModeJob; ->AL_al_ModeJob; ->JOB_pic_LBMode)
		
		//PRJ_at_ModeJob{2}:="Edit"
		//PRJ_at_ModeJob{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//ARRAY STRING(55;PRJ_at_ModeJob;3)
		//PRJ_at_ModeJob{3}:="Definitions"
		//End if
		SD2_SetDiaryPopup
		Projects_InLPB
		In_ButtChkDis(->vButtDisSC; "Project"; "Job")
		
		DB_SetInputFormMenu(Table:C252(->[PROJECTS:89]); "Projects_In13")
		If (Records in selection:C76([PROJECTS:89])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->PROJ_lb_Jobs)
		
End case 
ERR_MethodTrackerReturn("Projects_InLP"; $_t_oldMethodName)
