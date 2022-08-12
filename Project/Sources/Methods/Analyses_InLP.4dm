//%attributes = {}

If (False:C215)
	//Project Method Name:      Analyses_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; PAL_bo_ButtonSubFunction; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; $_l_ModulePosition; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; $_l_ButtonNumber; $_l_Event)
	C_LONGINT:C283($_l_ModulePosition; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule)
	C_REAL:C285($1)
	C_TEXT:C284($_t_PalleteButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalleteButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Analyses_InLP")




$_t_oldMethodName:=ERR_MethodTracker("Analyses_InLP")
Minor_LP(->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; ->[ANALYSES:36]; "Analyses"; "1"; "Analyses_InLPB"; "Analyses_InLPA")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ANALYSES:36]); "Analysis_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalleteButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalleteButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([ANALYSES:36]Bank_Account_Code:9))
				Check_MinorNC(->[ANALYSES:36]Bank_Account_Code:9; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")  //6
				DB_bo_RecordModified:=True:C214
			: ($_l_Event=On Menu Selected:K2:14)
				DB_SetInputFormMenu(Table:C252(->[ANALYSES:36]); "Analysis_In")
				If (Records in selection:C76([ANALYSES:36])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ANALYSES:36]); "Analysis_in")
		WS_AutoscreenSize(2; 465; 590)
		INT_SetInput(Table:C252(->[ANALYSES:36]); WIN_t_CurrentInputForm)
		Analyses_InLPB
		SD2_SetDiaryPopup
		DB_SetInputFormMenu(Table:C252(->[ANALYSES:36]); "Analysis_In")
		
		If (Records in selection:C76([ANALYSES:36])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ANALYSES:36]); "Analysis_In")
		If (Records in selection:C76([ANALYSES:36])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
				
				
		End case 
		
		
End case 
ERR_MethodTrackerReturn("Analyses_InLP"; $_t_oldMethodName)
