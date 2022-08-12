//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/03/2010 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_Mode;0)
	//ARRAY LONGINT(ACC_al_ModeAccounts;0)
	//ARRAY LONGINT(ACC_al_SubAreaTables;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(ACC_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACC_at_AccountSetting;0)
	//ARRAY TEXT(ACC_at_ModeAccounts;0)
	//ARRAY TEXT(ACC_at_SubAreaContext;0)
	//ARRAY TEXT(ACC_at_SubAreaContextUsage;0)
	//ARRAY TEXT(PO_at_ModePO;0)
	C_BOOLEAN:C305(<>TermST; ACC_bo_InitPointers; DB_bo_NoLoad; DB_bo_RecordModified; Lay_bo_HideFilters; Lay_bo_UpdateFilters; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; AC_l_Mode; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord)
	C_PICTURE:C286(AC_Pi_EditMode; ACC_Pi_EditMode; ACcModePict)
	C_REAL:C285($1; ACC_R_Balances)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisACCBAL; vSAccount; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_InLP")
//lp accounts in
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 




Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222(ACC_at_AccountSetting; 0)
		ARRAY LONGINT:C221(ACC_al_Mode; 0)
		LBi_SetListBoxOptions(->ACC_at_AccountSetting; ->ACC_al_Mode; ->ACC_Pi_EditMode; False:C215)
		
		If (Not:C34(ACC_bo_InitPointers))
			ARRAY POINTER:C280(ACC_aptr_SubAreaPointers; 0)
			ARRAY LONGINT:C221(ACC_al_SubAreaTables; 0)
			ARRAY TEXT:C222(ACC_at_SubAreaContext; 0)
			ARRAY TEXT:C222(ACC_at_SubAreaContextUsage; 0)
			ACC_bo_InitPointers:=True:C214
		End if 
		DB_SetnewToolBar
		WS_AutoscreenSize(2; 574; 700)
		INT_SetInput(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentInputForm)
		OpenHelp(Table:C252(->[ACCOUNTS:32]); "Accounts_in")
		If ([ACCOUNTS:32]Account_Code:2#"")
			OBJECT SET ENTERABLE:C238([ACCOUNTS:32]Account_Code:2; False:C215)
		End if 
		ARRAY TEXT:C222(ACC_at_ModeAccounts; 0)
		ARRAY LONGINT:C221(ACC_al_ModeAccounts; 0)
		//ORD_at_ModeOrders{2}:="Editable"
		LBi_SetListBoxOptions(->ACC_at_ModeAccounts; ->ACC_al_ModeAccounts; ->ACCModePict; True:C214)
		
		
		Accounts_InLPB
		
		FORM GOTO PAGE:C247(2)
		If (Current user:C182="designer")
			//GOTO PAGE(3)
		End if 
		
		SD2_SetDiaryPopup
		WIN_t_CurrentInputForm:="Accounts_in"
		In_ButtChkDis(->vButtDisACCBAL)
		
		DB_SetInputFormMenu(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentInputForm)
		If (Records in selection:C76([ACCOUNTS:32])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		
		WIN_t_CurrentInputForm:="Accounts_in"
		DB_SetInputFormMenu(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentInputForm)
		OpenHelp(Table:C252(->[ACCOUNTS:32]); "Accounts_in")
		
		In_ButtChkDis(->vButtDisACCBAL)
		
		SD2_SetDiaryPopup
		If (Records in selection:C76([ACCOUNTS:32])<=1)
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
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				inButtSubHandle(FORM Get current page:C276; ->[ACCOUNTS:32])
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("Accounts_InLPA"; ""; "Accounts_InDel"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; "Accounts"; "2 3 4 5"; "Accounts_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisACCBAL)
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		Case of 
			: (Lay_bo_HideFilters)
				Lay_bo_HideFilters:=False:C215
				//Lay_bo_UpdateFilters:=False
				OBJECT SET VISIBLE:C603(*; "oSubFormContainer"; False:C215)
				
				
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentInputForm)
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
			: (Modified:C32([ACCOUNTS:32]Account_Code:2))
				If (Old:C35([ACCOUNTS:32]Account_Code:2)#"")
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=Old:C35([ACCOUNTS:32]Account_Code:2))
					If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
						Gen_Alert("That Account Code has been used and cannot be changed"; "Cancel")
						[ACCOUNTS:32]Account_Code:2:=Old:C35([ACCOUNTS:32]Account_Code:2)
					Else 
						If (Accounts_CheckPref(Old:C35([ACCOUNTS:32]Account_Code:2); True:C214))
							RemoveLeadTr(Uppercase:C13([ACCOUNTS:32]Account_Code:2); ->[ACCOUNTS:32]Account_Code:2)
							[ACCOUNTS:32]Account_Code:2:=Str_StripDel([ACCOUNTS:32]Account_Code:2)
						Else 
							[ACCOUNTS:32]Account_Code:2:=Old:C35([ACCOUNTS:32]Account_Code:2)
						End if 
					End if 
				Else 
					RemoveLeadTr(Uppercase:C13([ACCOUNTS:32]Account_Code:2); ->[ACCOUNTS:32]Account_Code:2)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]Account_Code:2)
			: (Modified:C32([ACCOUNTS:32]Account_Name:3))
				[ACCOUNTS:32]Account_Name:3:=Uppers2([ACCOUNTS:32]Account_Name:3)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]Account_Name:3)
			: (Modified:C32([ACCOUNTS:32]PB:4))
				[ACCOUNTS:32]PB:4:=Uppercase:C13([ACCOUNTS:32]PB:4)
				If (([ACCOUNTS:32]PB:4#"P") & ([ACCOUNTS:32]PB:4#"B"))
					Gen_Alert("Must be P or B"; "Try again")
					REJECT:C38([ACCOUNTS:32]PB:4)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]PB:4)
			: (Modified:C32([ACCOUNTS:32]IO:5))
				RemoveLeadTr(Uppercase:C13([ACCOUNTS:32]IO:5); ->[ACCOUNTS:32]IO:5)
				If (<>TermST)
					If (([ACCOUNTS:32]IO:5#"S") & ([ACCOUNTS:32]IO:5#"P") & ([ACCOUNTS:32]IO:5#"N"))
						Gen_Alert("Must be S, P or N"; "Try again")
						[ACCOUNTS:32]IO:5:=Old:C35([ACCOUNTS:32]IO:5)
						If ([ACCOUNTS:32]IO:5="")
							[ACCOUNTS:32]IO:5:="N"
						End if 
					End if 
				Else 
					If (([ACCOUNTS:32]IO:5#"I") & ([ACCOUNTS:32]IO:5#"O") & ([ACCOUNTS:32]IO:5#"N"))
						Gen_Alert("Must be I, O or N"; "Try again")
						[ACCOUNTS:32]IO:5:=Old:C35([ACCOUNTS:32]IO:5)
						If ([ACCOUNTS:32]IO:5="")
							[ACCOUNTS:32]IO:5:="N"
						End if 
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]IO:5)
			: (Modified:C32([ACCOUNTS:32]Group_Heading:6))
				Check_Minor(->[ACCOUNTS:32]Group_Heading:6; "SAccount"; ->[HEADINGS:84]; ->[HEADINGS:84]Heading_Code:1; ->[HEADINGS:84]Heading_Name:2; "Heading In"; "Heading")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]Group_Heading:6)
			: (Modified:C32([ACCOUNTS:32]Report_Heading:1))
				Check_Minor(->[ACCOUNTS:32]Report_Heading:1; "PAccount"; ->[HEADINGS:84]; ->[HEADINGS:84]Heading_Code:1; ->[HEADINGS:84]Heading_Name:2; "Heading In"; "Heading")
				DB_bo_RecordModified:=True:C214
				If ([ACCOUNTS:32]Group_Heading:6="")
					[ACCOUNTS:32]Group_Heading:6:=[HEADINGS:84]Group_Code:5
					RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
					vSAccount:=[HEADINGS:84]Heading_Name:2
				End if 
				Macro_AccTypePt(->[ACCOUNTS:32]Report_Heading:1)
			: (Modified:C32([ACCOUNTS:32]No_NL_Postings:9))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[ACCOUNTS:32]No_NL_Postings:9)
			Else 
				If ($_l_Event=On Menu Selected:K2:14)
					
					WIN_t_CurrentInputForm:="Accounts_in"
					DB_SetInputFormMenu(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentInputForm)
					OpenHelp(Table:C252(->[ACCOUNTS:32]); "Accounts_in")
					In_ButtChkDis(->vButtDisACCBAL)
					SD2_SetDiaryPopup
					If (Records in selection:C76([ACCOUNTS:32])<=1)
						OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				End if 
				If (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				End if 
				
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Accounts_InLP"; $_t_oldMethodName)
