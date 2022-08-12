//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InPLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/01/2010 20:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305($_bo_Enabled; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; CC_t_AuthCode; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vAccount; vBAccount; vButtDisInv; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InPLP")
//Project Method Invoices_InPLP 2/3/2(ID 3507-4018)
$_l_Event:=Form event code:C388
//Invoices_InPLP

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		Invoices_InPLPB
		In_ButtChkDis(->vButtDisInv)
		
		
		DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
		If (Records in selection:C76([INVOICES:39])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
		OpenHelp(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisInv)
		
		If (Records in selection:C76([INVOICES:39])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
		In_ButtChkDis(->vButtDisInv)
		If (Records in selection:C76([INVOICES:39])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
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
			: (CC_t_AuthCode#"") & ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				Gen_Alert("Sorry you may not cancel a Deposit in which you have taken funds via credit card")
				DB_l_ButtonClickedFunction:=0
				iCancel:=0
			Else 
				
				In_ButtCall("R:Invoices_InPLPA"; ""; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; "Invoices"; "1 2 4 6 13"; "Invoices_InPLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisInv)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Invoices_InLPD
		Case of 
			: (Modified:C32([INVOICES:39]Total_Paid:6))
				If ([INVOICES:39]Total_Paid:6<0)
					Gen_Alert("Sorry you may not enter a negative deposit. To refund a deposit select refund fro"+"m the menu, or to refund a receipted payment enter a credit note!")
					[INVOICES:39]Total_Paid:6:=0
				End if 
				
			: (Modified:C32([INVOICES:39]Bank_Account:16))
				Check_MinorNC(->[INVOICES:39]Bank_Account:16; "BAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([INVOICES:39]Bank_Account:16#"")
					$_bo_Enabled:=Trans_SubLPLayerCode(->[INVOICES:39]Bank_Account:16; ->[INVOICES:39]Layer_Code:38; 1)
				End if 
				If ([INVOICES:39]Bank_Account:16#"")
					$_bo_Enabled:=Check_AnalAcc(->[INVOICES:39]Bank_Account:16; ->[INVOICES:39]Analysis_Code:17; 1)
				End if 
				If (([INVOICES:39]Bank_Account:16#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
					If (([INVOICES:39]Bank_Account:16<[TRANSACTION_TYPES:31]D_Range_F:9) | ([INVOICES:39]Bank_Account:16>[TRANSACTION_TYPES:31]D_Range_T:10))
						If ([TRANSACTION_TYPES:31]D_Enforce:13)
							Gen_Alert("This Account does not fall within an Deposit's required range of Bank"+" Accounts."; "Try again")
							[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
							REJECT:C38([INVOICES:39]Bank_Account:16)
						Else 
							Gen_Confirm("This Account does not fall within an Deposit's advised range of Bank"+" Accounts."; "Allow"; "Try again")
							If (OK=0)
								[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
								REJECT:C38([INVOICES:39]Bank_Account:16)
							End if 
						End if 
					End if 
				End if 
				If ([INVOICES:39]Bank_Account:16="")
					[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
				End if 
				If ([INVOICES:39]Bank_Account:16#[ACCOUNTS:32]Account_Code:2)
					RELATE ONE:C42([INVOICES:39]Bank_Account:16)
					vBAccount:=[ACCOUNTS:32]Account_Name:3
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([INVOICES:39]Debtors_Account:15))
				Check_MinorNC(->[INVOICES:39]Debtors_Account:15; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([INVOICES:39]Debtors_Account:15#"")
					$_bo_Enabled:=Trans_SubLPLayerCode(->[INVOICES:39]Debtors_Account:15; ->[INVOICES:39]Layer_Code:38; 1)
				End if 
				If ([INVOICES:39]Debtors_Account:15#"")
					$_bo_Enabled:=Check_AnalAcc(->[INVOICES:39]Debtors_Account:15; ->[INVOICES:39]Analysis_Code:17; 1)
				End if 
				If (([INVOICES:39]Debtors_Account:15#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
					If (([INVOICES:39]Debtors_Account:15<[TRANSACTION_TYPES:31]C_Range_F:11) | ([INVOICES:39]Debtors_Account:15>[TRANSACTION_TYPES:31]C_Range_T:12))
						If ([TRANSACTION_TYPES:31]D_Enforce:13)
							Gen_Alert("This Account does not fall within an Deposit's required range of Holding"+" Accounts."; "Try again")
							[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
							REJECT:C38([INVOICES:39]Debtors_Account:15)
						Else 
							Gen_Confirm("This Account does not fall within an Deposit's advised range of Holding"+" Accounts."; "Allow"; "Try again")
							If (OK=0)
								[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
								REJECT:C38([INVOICES:39]Debtors_Account:15)
							End if 
						End if 
					End if 
				End if 
				If ([INVOICES:39]Debtors_Account:15="")
					[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
				End if 
				If ([INVOICES:39]Debtors_Account:15#[ACCOUNTS:32]Account_Code:2)
					RELATE ONE:C42([INVOICES:39]Debtors_Account:15)
					vAccount:=[ACCOUNTS:32]Account_Name:3
				End if 
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
					
					
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
ERR_MethodTrackerReturn("Invoices_InPLP"; $_t_oldMethodName)