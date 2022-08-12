//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalInLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/01/2011 17:39 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACB_al_ModeAccounts;0)
	//ARRAY LONGINT(ACB_al_SubAreaTables;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(ACB_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACB_at_ModeAccounts;0)
	//ARRAY TEXT(ACB_at_SubAreaContext;0)
	//ARRAY TEXT(ACB_at_SubAreaContextUsage;0)
	C_BOOLEAN:C305(ACB_bo_InitPointers; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_PreviousRecord)
	C_PICTURE:C286(ACBModePict)
	C_REAL:C285($1; ACB_R_Transactions)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisAccBal; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalInLP")
//ACC_BalInLP
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (Not:C34(ACB_bo_InitPointers))
			ARRAY POINTER:C280(ACB_aptr_SubAreaPointers; 0)
			ARRAY LONGINT:C221(ACB_al_SubAreaTables; 0)
			ARRAY TEXT:C222(ACB_at_SubAreaContext; 0)
			ARRAY TEXT:C222(ACB_at_SubAreaContextUsage; 0)
			ACB_bo_InitPointers:=True:C214
		End if 
		ARRAY TEXT:C222(ACB_at_ModeAccounts; 0)
		ARRAY LONGINT:C221(ACB_al_ModeAccounts; 0)
		
		
		LBi_SetListBoxOptions(->ACB_at_ModeAccounts; ->ACB_al_ModeAccounts; ->ACBModePict; True:C214)
		
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
		DB_SetnewToolBar
		WS_AutoscreenSize(2; 600; 590)
		INT_SetInput(Table:C252(->[ACCOUNT_BALANCES:34]); WIN_t_CurrentInputForm)
		ACC_BalInLPB
		
		SD2_SetDiaryPopup
		
		DB_SetInputFormMenu(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
		If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisAccBal)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
		
		In_ButtChkDis(->vButtDisAccBal)
		
		If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
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
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall(""; ""; ""; ->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Account_Code:2; "Account Balances"; ""; "ACC_BalInLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisAccBal)
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([ACCOUNT_BALANCES:34]Analysis_Code:1))
				Check_MinorNC(->[ACCOUNT_BALANCES:34]Analysis_Code:1; "Analysis"; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2)  //5
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNT_BALANCES:34]Analysis_Code:1)
			: (Modified:C32([ACCOUNT_BALANCES:34]Account_Code:2))
				Check_MinorNC(->[ACCOUNT_BALANCES:34]Account_Code:2; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)  //5
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNT_BALANCES:34]Account_Code:2)
			: (Modified:C32([ACCOUNT_BALANCES:34]Period_Code:4))
				Check_MinorNC(->[ACCOUNT_BALANCES:34]Period_Code:4; "Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)  //5
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNT_BALANCES:34]Period_Code:4)
			: (Modified:C32([ACCOUNT_BALANCES:34]Currency_Code:6))
				Check_MinorNC(->[ACCOUNT_BALANCES:34]Currency_Code:6; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)  //5
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNT_BALANCES:34]Currency_Code:6)
			: (Modified:C32([ACCOUNT_BALANCES:34]Layer_Code:5))
				Check_MinorNC(->[ACCOUNT_BALANCES:34]Layer_Code:5; "Layer"; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2)
				If ([ACCOUNT_BALANCES:34]Layer_Code:5=DB_GetLedgerActualLayer)
					Gen_Alert(DB_GetLedgerActualLayer+" is reserved for Actuals"; "Try again")
					[ACCOUNT_BALANCES:34]Layer_Code:5:=""
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNT_BALANCES:34]Layer_Code:5)
			: ($_l_Event=On Menu Selected:K2:14)
			: ($_l_Event=On Activate:K2:9)
				DB_SetInputFormMenu(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_in")
				In_ButtChkDis(->vButtDisAccBal)
				If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
				SD2_SetDiaryPopup
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("ACC_BalInLP"; $_t_oldMethodName)
