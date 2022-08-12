//%attributes = {}
If (False:C215)
	//Project Method Name:      TransT_InLP
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
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $REQ; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisTRT; vCAccName; vDAccName; vLayer)
	C_TEXT:C284(vProblem; vSolution; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransT_InLP")
//lp transt in
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 


Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;420;580)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		TransT_InLPB
		OpenHelp(Table:C252(->[TRANSACTION_TYPES:31]); "TransT_in")
		WS_AutoscreenSize(2; 465; 580)
		INT_SetInput(Table:C252(->[TRANSACTION_TYPES:31]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisTRT)
		
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_TYPES:31]); "TransT_in")
		If (Records in selection:C76([TRANSACTION_TYPES:31])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_TYPES:31]); "TransT_in")
		OpenHelp(Table:C252(->[TRANSACTION_TYPES:31]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisTRT)
		
		If (Records in selection:C76([TRANSACTION_TYPES:31])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		If (([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTransDepositRec) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) | ([TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay))
			$Req:="1 4 5 6"
		Else 
			$Req:="1 6"
		End if 
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("TransT_InLPA"; ""; "Minor_Del"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; "Trans_Types"; $Req; "TransT_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisTRT)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([TRANSACTION_TYPES:31]Transaction_Type_Code:1))
				If (TransT_ChPrefs(Old:C35([TRANSACTION_TYPES:31]Transaction_Type_Code:1); True:C214))
					RemoveLeadTr(Uppercase:C13([TRANSACTION_TYPES:31]Transaction_Type_Code:1); ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1)
					DB_bo_RecordModified:=True:C214
				Else 
					[TRANSACTION_TYPES:31]Transaction_Type_Code:1:=Old:C35([TRANSACTION_TYPES:31]Transaction_Type_Code:1)
				End if 
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1)
			: (Modified:C32([TRANSACTION_TYPES:31]Transaction_Type_Name:2))
				[TRANSACTION_TYPES:31]Transaction_Type_Name:2:=Uppers2([TRANSACTION_TYPES:31]Transaction_Type_Name:2)
				DB_bo_RecordModified:=True:C214
				//: (Modified([Trans_Types]DC))
				// [Trans_Types]DC:=Uppercase([Trans_Types]DC)
				// If (([Trans_Types]DC#"D") & ([Trans_Types]DC#"C"))
				//   Gen_Alert ("Must be D or C";"Try again")
				//  REJECT([Trans_Types]DC)
				//  End if
				//  DB_bo_RecordModified:=True
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
			: (Modified:C32([TRANSACTION_TYPES:31]Debit_Account:4))
				Check_MinorNC(->[TRANSACTION_TYPES:31]Debit_Account:4; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
				If ([TRANSACTION_TYPES:31]Debit_Account:4#"")
					$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_TYPES:31]Debit_Account:4; ->[TRANSACTION_TYPES:31]Layer_Code:16; 1)
				End if 
				If ([TRANSACTION_TYPES:31]Debit_Account:4#"")
					$_bo_Continue:=Check_AnalAcc(->[TRANSACTION_TYPES:31]Debit_Account:4; ->[TRANSACTION_TYPES:31]Analysis_Code:7; 1)
				End if 
				vDAccName:=[ACCOUNTS:32]Account_Name:3
				vProblem:=Trans_IOText([ACCOUNTS:32]IO:5)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Debit_Account:4)
			: (Modified:C32([TRANSACTION_TYPES:31]Credit_Account:5))
				Check_MinorNC(->[TRANSACTION_TYPES:31]Credit_Account:5; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
				If ([TRANSACTION_TYPES:31]Credit_Account:5#"")
					$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_TYPES:31]Credit_Account:5; ->[TRANSACTION_TYPES:31]Layer_Code:16; 1)
				End if 
				If ([TRANSACTION_TYPES:31]Debit_Account:4#"")
					$_bo_Continue:=Check_AnalAcc(->[TRANSACTION_TYPES:31]Credit_Account:5; ->[TRANSACTION_TYPES:31]Analysis_Code:7; 1)
				End if 
				vCAccName:=[ACCOUNTS:32]Account_Name:3
				vSolution:=Trans_IOText([ACCOUNTS:32]IO:5)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Credit_Account:5)
			: (Modified:C32([TRANSACTION_TYPES:31]Tax_Code:6))
				Check_MinorNC(->[TRANSACTION_TYPES:31]Tax_Code:6; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Tax_Code:6)
			: (Modified:C32([TRANSACTION_TYPES:31]Analysis_Code:7))
				Check_Analysis(->[TRANSACTION_TYPES:31]Analysis_Code:7; "Analysis"; ->[TRANSACTION_TYPES:31]Debit_Account:4; ->[TRANSACTION_TYPES:31]Credit_Account:5)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Analysis_Code:7)
			: (Modified:C32([TRANSACTION_TYPES:31]Layer_Code:16))
				Check_MinorNC(->[TRANSACTION_TYPES:31]Layer_Code:16; "Layer"; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2)
				If ([TRANSACTION_TYPES:31]Layer_Code:16#"")
					$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_TYPES:31]Debit_Account:4; ->[TRANSACTION_TYPES:31]Layer_Code:16; 2)
					If ($_bo_Continue)
						$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_TYPES:31]Credit_Account:5; ->[TRANSACTION_TYPES:31]Layer_Code:16; 2)
					End if 
				End if 
				If ([TRANSACTION_TYPES:31]Layer_Code:16="")
					[TRANSACTION_TYPES:31]Layer_Code:16:=DB_GetLedgerActualLayer
					RELATE ONE:C42([TRANSACTION_TYPES:31]Layer_Code:16)
				End if 
				vLayer:=[LAYERS:76]Layer_Name:2
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Layer_Code:16)
			: (Modified:C32([TRANSACTION_TYPES:31]Currency_Code:17))
				Check_MinorNC(->[TRANSACTION_TYPES:31]Currency_Code:17; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Currency_Code:17)
			: (Modified:C32([TRANSACTION_TYPES:31]D_Range_F:9))
				If (([TRANSACTION_TYPES:31]D_Range_F:9#"") & ([TRANSACTION_TYPES:31]Debit_Account:4#"") & ([TRANSACTION_TYPES:31]Debit_Account:4<[TRANSACTION_TYPES:31]D_Range_F:9))
					Gen_Alert("The Debit Account you have specified is outside this Range."; "Try Again")
					REJECT:C38([TRANSACTION_TYPES:31]D_Range_F:9)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]D_Range_F:9)
			: (Modified:C32([TRANSACTION_TYPES:31]D_Range_T:10))
				If (([TRANSACTION_TYPES:31]D_Range_T:10#"") & ([TRANSACTION_TYPES:31]Debit_Account:4#"") & ([TRANSACTION_TYPES:31]Debit_Account:4>[TRANSACTION_TYPES:31]D_Range_T:10))
					Gen_Alert("The Debit Account you have specified is outside this Range."; "Try Again")
					REJECT:C38([TRANSACTION_TYPES:31]D_Range_T:10)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]D_Range_T:10)
			: (Modified:C32([TRANSACTION_TYPES:31]C_Range_F:11))
				If (([TRANSACTION_TYPES:31]C_Range_F:11#"") & ([TRANSACTION_TYPES:31]Credit_Account:5#"") & ([TRANSACTION_TYPES:31]Credit_Account:5<[TRANSACTION_TYPES:31]C_Range_F:11))
					Gen_Alert("The Credit Account you have specified is outside this Range."; "Try Again")
					REJECT:C38([TRANSACTION_TYPES:31]C_Range_F:11)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]C_Range_F:11)
			: (Modified:C32([TRANSACTION_TYPES:31]C_Range_T:12))
				If (([TRANSACTION_TYPES:31]C_Range_T:12#"") & ([TRANSACTION_TYPES:31]Credit_Account:5#"") & ([TRANSACTION_TYPES:31]Credit_Account:5>[TRANSACTION_TYPES:31]C_Range_T:12))
					Gen_Alert("The Credit Account you have specified is outside this Range."; "Try Again")
					REJECT:C38([TRANSACTION_TYPES:31]C_Range_T:12)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]C_Range_T:12)
			: (Modified:C32([TRANSACTION_TYPES:31]D_Enforce:13))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]D_Enforce:13)
			: (Modified:C32([TRANSACTION_TYPES:31]C_Enforce:14))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]C_Enforce:14)
			: (Modified:C32([TRANSACTION_TYPES:31]Phantom_Transaction:18))
				If ([TRANSACTION_TYPES:31]Phantom_Transaction:18=[TRANSACTION_TYPES:31]Transaction_Type_Code:1)
					Gen_Alert("You cannot allocate this Transaction Type to be it's own 'Phantom'"; "Try again")
					REJECT:C38([TRANSACTION_TYPES:31]Phantom_Transaction:18)
				Else 
					[TRANSACTION_TYPES:31]Phantom_Transaction:18:=Uppercase:C13([TRANSACTION_TYPES:31]Phantom_Transaction:18)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Phantom_Transaction:18)
			: (Modified:C32([TRANSACTION_TYPES:31]Full_Access:15))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Full_Access:15)
			: (Modified:C32([TRANSACTION_TYPES:31]Phantom_Same_Layer:19))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Phantom_Same_Layer:19)
			: (Modified:C32([TRANSACTION_TYPES:31]Phantom_View:20))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Phantom_View:20)
			: (Modified:C32([TRANSACTION_TYPES:31]Phantom_Tied:21))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Phantom_Tied:21)
			: (Modified:C32([TRANSACTION_TYPES:31]Phantom_Standard:22))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]Phantom_Standard:22)
			: (Modified:C32([TRANSACTION_TYPES:31]No_NL_Postings:23))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[TRANSACTION_TYPES:31]No_NL_Postings:23)
		End case 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_TYPES:31]); "TransT_in")
		In_ButtChkDis(->vButtDisTRT)
		If (Records in selection:C76([TRANSACTION_TYPES:31])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[TRANSACTION_TYPES:31]); "TransT_in")
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
ERR_MethodTrackerReturn("TransT_InLP"; $_t_oldMethodName)
