//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 19:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_LB_PurchaseInvoiceItems;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PUR_al_ItemsMode;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY TEXT(PI_at_TabNames;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PUR_at_ItemMode;0)
	//ARRAY TEXT(PUR_at_PurchasesTab;0)
	C_BOOLEAN:C305($_bo_Allowed; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; PI_bo_Addingitem; PI_bo_NoListbox)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CalledFromProcess; $_l_CharacterPosition; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber)
	C_LONGINT:C283(PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; SD2_l_CallingProcess; SD2_l_TableNum)
	C_PICTURE:C286(PI_pic_EditMode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; PI_t_FalseTab; PI_t_TabFunction; SD2_t_TabFunction)
	C_TEXT:C284(vButtDisPI; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch InLP")
//Project Method Purch InLP 26/3/2(ID-21459-7386)
//Purch InLP
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		PI_bo_Addingitem:=False:C215
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_In13")
		WS_AutoscreenSize(1; 640; 800; Table name:C256(->[PURCHASE_INVOICES:37])+"_"+"Purchases_In13")
		ARRAY TEXT:C222(PUR_at_ItemMode; 0)
		ARRAY LONGINT:C221(PUR_al_ItemsMode; 0)
		PI_bo_NoListbox:=False:C215
		PI_bo_NoListbox:=False:C215
		LBi_SetListBoxOptions(->PUR_at_ItemMode; ->PUR_al_ItemsMode; ->PI_pic_EditMode; True:C214)
		If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
			Purch_Code
		End if 
		Purch_InLPB
		
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
		If ([PURCHASE_INVOICES:37]Creditors_Account:13="")
			[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
		End if 
		vTot:=0
		//   vBefore2I:=True
		//  Gen_PostKey (1;92;256)
		// : (vBefore2I)
		//   vBefore2I:=False
		Purch_InLPß("B")
		ARRAY TEXT:C222(PUR_at_PurchasesTab; 2)
		OBJECT SET FONT:C164(PUR_at_PurchasesTab; "arial")
		OBJECT SET FONT STYLE:C166(PUR_at_PurchasesTab; 1)
		OBJECT SET FONT SIZE:C165(PUR_at_PurchasesTab; 12)
		
		PUR_at_PurchasesTab{1}:="   1  "
		PUR_at_PurchasesTab{2}:="   2  "
		// PUR_at_PurchasesTab{3}:="   3  "
		PUR_at_PurchasesTab:=1
		INT_SetInput(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_In13")
		If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup(->PI_al_ViewTableToTable; ->PI_at_ViewTabsLabels; ->PI_at_TabNames)
		If (Size of array:C274(PUR_aPtr_LBItemsSetup)>=9)
			
			$_ptr_ArrayReferences:=PUR_aPtr_LBItemsSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (PUR_at_PurchasesTab=2)
						In_ButtChkDis(->vButtDisPI; "Purchase")
					: (PUR_at_PurchasesTab=1)
						
						If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
							In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisPI; "Purchase")
						End if 
				End case 
			End if 
		Else 
			In_ButtChkDis(->vButtDisPI; "Purchase Invoice")
			
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_In13")
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		If (Size of array:C274(PUR_aPtr_LBItemsSetup)>=9)
			
			$_ptr_ArrayReferences:=PUR_aPtr_LBItemsSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (PUR_at_PurchasesTab=2)
						In_ButtChkDis(->vButtDisPI; "Purchase")
					: (PUR_at_PurchasesTab=1)
						
						If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
							In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisPI; "Purchase")
						End if 
				End case 
			Else 
				In_ButtChkDis(->vButtDisPI; "Purchase Invoice")
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisPI; "Purchase Invoice")
			
		End if 
		SD2_SetDiaryPopup(->PI_al_ViewTableToTable; ->PI_at_ViewTabsLabels; ->PI_at_TabNames)
		If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
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
				inButtSubHandle(FORM Get current page:C276; ->[PURCHASE_INVOICES:37])
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				PI_t_FalseTab:=PI_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[PURCHASE_INVOICES:37])
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
				//Here we must select the records and put them in a longint array then pass them back to the calling process
				If (SD2_l_CallingProcess>0)
					$_l_CalledFromProcess:=SD2_l_CallingProcess
					SD2_l_CallingProcess:=0
					$_t_DummyTab:=SD2_t_TabFunction
					$_l_CharacterPosition:=Position:C15("View "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("View "); Length:C16($_t_DummyTab))
					End if 
					SD2_t_TabFunction:=""
					CREATE SET:C116([DIARY:12]; "PIcurrentDiary")  //Just to make sure we keep the selection
					PI_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					USE SET:C118("PIcurrentDiary")
					CLEAR SET:C117("PIcurrentDiary")
				End if 
				
				DB_l_ButtonClickedFunction:=0
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				In_ButtCall("R:Purch_InLPA"; ""; "Purch_Delete"; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Purchases"; "2 3 4 5"+(" 7"*(Num:C11(([PURCHASE_INVOICES:37]State:24>-2) & (DB_GetLedgerAllowZeroPinvoices=False:C215)))); "Purch_InLPß"; ""; ""; "Gen_ShowTelCo"; ->[IDENTIFIERS:16]; ->vButtDisPI; ->PUR_aPtr_LBItemsSetup; True:C214)
				
				
				
				
				
				
				
				DB_l_ButtonClickedFunction:=0
				
		End case 
		
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		Purch_InLPD
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([PURCHASE_INVOICES:37]Credit_Stage:34))
				Check_MinorNC(->[PURCHASE_INVOICES:37]Credit_Stage:34; "Stage"; ->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PURCHASE_INVOICES:37]Credit_Stage:34)
			: (Modified:C32([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4))
				Check_SecPInv(->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
				If (OK=1)
					RemoveLeadTr(Uppercase:C13([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4); ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
					If (Purch_InLPChkIn=False:C215)
						REJECT:C38([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
					End if 
					DB_bo_RecordModified:=True:C214
				End if 
			: (Modified:C32([PURCHASE_INVOICES:37]Creditors_Account:13))
				Check_SecPInv(->[PURCHASE_INVOICES:37]Creditors_Account:13)
				If (OK=1)
					Check_MinorNC(->[PURCHASE_INVOICES:37]Creditors_Account:13; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
					If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
						$_bo_Allowed:=Trans_SubLPLayerCode(->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICES:37]Layer_Code:28; 1)
					End if 
					If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
						$_bo_Allowed:=Check_AnalAcc(->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICES:37]Analysis_Code:15; 1)
					End if 
					If (([PURCHASE_INVOICES:37]Creditors_Account:13#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
						If (([PURCHASE_INVOICES:37]Creditors_Account:13<[TRANSACTION_TYPES:31]C_Range_F:11) | ([PURCHASE_INVOICES:37]Creditors_Account:13>[TRANSACTION_TYPES:31]C_Range_T:12))
							If ([TRANSACTION_TYPES:31]C_Enforce:14)
								Gen_Alert("This Account does not fall within a Purchase's required range of Creditor"+" Accounts."; "Try again")
								[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
								REJECT:C38([PURCHASE_INVOICES:37]Creditors_Account:13)
							Else 
								Gen_Confirm("This Account does not fall within a Purchase's advised range of Creditor"+" Accounts."; "Allow"; "Try again")
								If (OK=0)
									[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
									REJECT:C38([PURCHASE_INVOICES:37]Creditors_Account:13)
								End if 
							End if 
						End if 
					End if 
					If ([PURCHASE_INVOICES:37]Creditors_Account:13="")
						[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
					End if 
					DB_bo_RecordModified:=True:C214
				End if 
				//  : (Modified([PURCHASES]Total Tax))
				//   Check_SecPInv (»[PURCHASES]Total Tax)
				//   If (OK=1)
				//     Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//   If (OK=0)
				//   [PURCHASES]Total Tax:=Old([PURCHASES]Total Tax)
				//   End if
				//  DB_bo_RecordModified:=True
				//  End if
				//  : (Modified([PURCHASES]Tot InvExTax))
				//  Check_SecPInv (»[PURCHASES]Tot InvExTax)
				//   If (OK=1)
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//    If (OK=0)
				//     [PURCHASES]Tot InvExTax:=Old([PURCHASES]Tot InvExTax)
				//     End if
				//    DB_bo_RecordModified:=True
				//  End if
				//  : (Modified([PURCHASES]Total Invoiced))
				//   Check_SecPInv (»[PURCHASES]Total Invoiced)
				//  If (OK=1)
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//    If (OK=0)
				//      [PURCHASES]Total Invoiced:=Old([PURCHASES]Total Invoiced)
				//    End if
				//   DB_bo_RecordModified:=True
				//  End if
				//: (Modified([PURCHASES]Total Paid))
				//  Check_SecPInv (»[PURCHASES]Total Paid)
				//   If (OK=1)
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//    If (OK=0)
				//  [PURCHASES]Total Paid:=Old([PURCHASES]Total Paid)
				//  End if
				//  DB_bo_RecordModified:=True
				//  End if
				//  : (Modified([PURCHASES]Total Due))
				//   Check_SecPInv (»[PURCHASES]Total Due)
				//  If (OK=1)
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//   If (OK=0)
				//    [PURCHASES]Total Due:=Old([PURCHASES]Total Due)
				//     End if
				//   DB_bo_RecordModified:=True
				//  End if
			: (vTot=1)
				//see also Purch_ItemsTax
				If (PI_bo_Addingitem)
					[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
					DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
				End if 
				PI_bo_Addingitem:=False:C215
				vTot:=0
				QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
				[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2)
				[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
				[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
				Purchases_LPSt
				DB_bo_RecordModified:=True:C214
			Else 
				If ($_l_Event=On Menu Selected:K2:14)
					DB_SetInputFormMenu(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_In13")
					
					If (Size of array:C274(PUR_aPtr_LBItemsSetup)>=9)
						
						$_ptr_ArrayReferences:=PUR_aPtr_LBItemsSetup{9}
						If (Size of array:C274($_ptr_ArrayReferences->)>=10)
							$_t_SubItemName:=$_ptr_ArrayReferences->{10}
							Case of 
								: (PUR_at_PurchasesTab=2)
									In_ButtChkDis(->vButtDisPI; "Purchase")
								: (PUR_at_PurchasesTab=1)
									
									If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
										In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
									Else 
										In_ButtChkDis(->vButtDisPI; "Purchase")
									End if 
							End case 
						Else 
							In_ButtChkDis(->vButtDisPI; "Purchase Invoice")
						End if 
					Else 
						
						In_ButtChkDis(->vButtDisPI; "Purchase Invoice")
						
					End if 
					SD2_SetDiaryPopup(->PI_al_ViewTableToTable; ->PI_at_ViewTabsLabels; ->PI_at_TabNames)
					If (Records in selection:C76([PURCHASE_INVOICES:37])<=1)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				Else 
					If (PAL_BUTTON#"")
						$_t_PalletButtonName:=PAL_BUTTON
						PAL_BUTTON:=""
						DB_HandleInputFormButtons($_t_PalletButtonName)
						PAL_bo_ButtonSubFunction:=False:C215
					End if 
				End if 
		End case 
		If (DB_bo_RecordModified)
			[PURCHASE_INVOICES:37]Last_Modified_Stamp:36:=Export_Stamp3([PURCHASE_INVOICES:37]Last_Modified_Stamp:36)
		End if 
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->PI_LB_PurchaseInvoiceItems)
End case 
ERR_MethodTrackerReturn("Purch InLP"; $_t_oldMethodName)
