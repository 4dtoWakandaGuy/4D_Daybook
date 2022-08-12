//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch InPLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 10:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PUR_al_ItemsMode;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Modified; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8)
	C_LONGINT:C283(PAL_BUTTON_9)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vAccount; vBAccount; vButtDisPI; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch InPLP")
//Project Method Purch InPLP 26/3/2(ID 695-4022)
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 
//Purch InPLP

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;420;570)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		ARRAY LONGINT:C221(PUR_al_ItemsMode; 0)
		Purch_InPLPB
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_InP13")
		WS_AutoscreenSize(2; 495; 570)
		INT_SetInput(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisPI)
		
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_InP13")
		
		If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_InP13")
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPI)
		
		SD2_SetDiaryPopup
		If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_InP13")
		In_ButtChkDis(->vButtDisPI)
		SD2_SetDiaryPopup
		If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
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
			Else 
				
				In_ButtCall("R:Purch_InPLPA"; ""; "Purch_Delete"; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Purchases"; "2 3 5 8"; "Purch_InPLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPI)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Purch_InLPD
		Case of 
			: (Modified:C32([PURCHASE_INVOICES:37]Creditors_Account:13))
				Check_MinorNC(->[PURCHASE_INVOICES:37]Creditors_Account:13; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
					$_bo_Continue:=Trans_SubLPLayerCode(->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICES:37]Layer_Code:28; 1)
					$_bo_Modified:=True:C214
				End if 
				If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
					$_bo_Continue:=Check_AnalAcc(->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICES:37]Analysis_Code:15; 1)
				End if 
				If (([PURCHASE_INVOICES:37]Creditors_Account:13#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
					If (([PURCHASE_INVOICES:37]Creditors_Account:13<[TRANSACTION_TYPES:31]D_Range_F:9) | ([PURCHASE_INVOICES:37]Creditors_Account:13>[TRANSACTION_TYPES:31]D_Range_T:10))
						If ([TRANSACTION_TYPES:31]D_Enforce:13)
							Gen_Alert("This Account does not fall within an Pre-Payment's required range of Holding"+" Accounts."; "Try again")
							[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Debit_Account:4
							REJECT:C38([PURCHASE_INVOICES:37]Creditors_Account:13)
						Else 
							Gen_Confirm("This Account does not fall within an Pre-Payment's advised range of Holding"+" Accounts."; "Allow"; "Try again")
							If (OK=0)
								[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Debit_Account:4
								REJECT:C38([PURCHASE_INVOICES:37]Creditors_Account:13)
							End if 
						End if 
					End if 
				End if 
				If ([PURCHASE_INVOICES:37]Creditors_Account:13="")
					[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Debit_Account:4
				End if 
				If ([PURCHASE_INVOICES:37]Creditors_Account:13#[ACCOUNTS:32]Account_Code:2)
					RELATE ONE:C42([PURCHASE_INVOICES:37]Creditors_Account:13)
					vAccount:=[ACCOUNTS:32]Account_Name:3
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PURCHASE_INVOICES:37]Bank_Account:14))
				Check_MinorNC(->[PURCHASE_INVOICES:37]Bank_Account:14; "BAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PURCHASE_INVOICES:37]Bank_Account:14#"")
					$_bo_Continue:=Trans_SubLPLayerCode(->[PURCHASE_INVOICES:37]Bank_Account:14; ->[PURCHASE_INVOICES:37]Layer_Code:28; 1)
				End if 
				If ([PURCHASE_INVOICES:37]Bank_Account:14#"")
					$_bo_Continue:=Check_AnalAcc(->[PURCHASE_INVOICES:37]Bank_Account:14; ->[PURCHASE_INVOICES:37]Analysis_Code:15; 1)
				End if 
				If (([PURCHASE_INVOICES:37]Bank_Account:14#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
					If (([PURCHASE_INVOICES:37]Bank_Account:14<[TRANSACTION_TYPES:31]C_Range_F:11) | ([PURCHASE_INVOICES:37]Bank_Account:14>[TRANSACTION_TYPES:31]C_Range_T:12))
						If ([TRANSACTION_TYPES:31]D_Enforce:13)
							Gen_Alert("This Account does not fall within an Pre-Payment's required range of Bank"+" Accounts."; "Try again")
							[PURCHASE_INVOICES:37]Bank_Account:14:=[TRANSACTION_TYPES:31]Credit_Account:5
							REJECT:C38([PURCHASE_INVOICES:37]Bank_Account:14)
						Else 
							Gen_Confirm("This Account does not fall within an Pre-Payment's advised range of Bank"+" Accounts."; "Allow"; "Try again")
							If (OK=0)
								[PURCHASE_INVOICES:37]Bank_Account:14:=[TRANSACTION_TYPES:31]Credit_Account:5
								REJECT:C38([PURCHASE_INVOICES:37]Bank_Account:14)
							End if 
						End if 
					End if 
				End if 
				If ([PURCHASE_INVOICES:37]Bank_Account:14="")
					[PURCHASE_INVOICES:37]Bank_Account:14:=[TRANSACTION_TYPES:31]Credit_Account:5
				End if 
				If ([PURCHASE_INVOICES:37]Bank_Account:14#[ACCOUNTS:32]Account_Code:2)
					RELATE ONE:C42([PURCHASE_INVOICES:37]Bank_Account:14)
					vBAccount:=[ACCOUNTS:32]Account_Name:3
				End if 
				DB_bo_RecordModified:=True:C214
		End case 
		If (DB_bo_RecordModified)
			[PURCHASE_INVOICES:37]Last_Modified_Stamp:36:=Export_Stamp3([PURCHASE_INVOICES:37]Last_Modified_Stamp:36)
		End if 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_InP13")
					
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
ERR_MethodTrackerReturn("Purch InPLP"; $_t_oldMethodName)
