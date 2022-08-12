//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 14:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_lb_ALLOCATIONS;0)
	//ARRAY BOOLEAN(INV_lb_InvoiceItems;0)
	//ARRAY BOOLEAN(INV_lb_LBAuths;0)
	//ARRAY LONGINT(aInvoicesTABPAGE;0)
	//ARRAY LONGINT(INV_al_EditMode;0)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(INV_at_EditMode;0)
	//ARRAY TEXT(INV_at_InvoicesTab;0)
	//ARRAY TEXT(INV_at_TabNames;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_NoLoad; DB_bo_RecordModified; INV_bo_Addingitem; INV_bo_AutoPrint; INV_bo_inTransaction; INV_bo_newInvoice; LB_bo_RefreshLineItems; PAL_bo_ButtonSubFunction; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CalledFromProcess; $_l_CharacterPosition; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; INV_SubProcCO; iOK)
	C_LONGINT:C283(ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; SD2_l_CallingProcess; SD2_l_TableNum; vContr)
	C_PICTURE:C286(INV_Pi_Mode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285(INV_R_CCDeposit; INV_R_totalDeposit; vTot)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; INV_S20_LoadRecord; INV_t_FalseTab; PAL_BUTTON; SD2_t_TabFunction)
	C_TEXT:C284(vButtDisInv; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLP")

//Project Method Invoices_InLP 26/3/2(ID 27292-7188)
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388  //Invoices_InLP
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		//TRACE
		INV_SubProcCO:=0
		INV_bo_Addingitem:=False:C215
		WS_AutoscreenSize(1; 800; 800; Table name:C256(->[INVOICES:39])+"_"+"Invoice_In")
		ARRAY TEXT:C222(INV_at_InvoicesTab; 2)
		ARRAY LONGINT:C221(aInvoicesTABPAGE; 2)
		
		OBJECT SET FONT:C164(INV_at_InvoicesTab; "arial")
		OBJECT SET FONT STYLE:C166(INV_at_InvoicesTab; 1)
		OBJECT SET FONT SIZE:C165(INV_at_InvoicesTab; 12)
		
		INV_at_InvoicesTab{1}:="   1  "
		aInvoicesTABPAGE{1}:=1
		INV_at_InvoicesTab{2}:="   2  "
		aInvoicesTABPAGE{2}:=2
		
		INV_at_InvoicesTab:=1
		INT_SetInput(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		
		OpenHelp(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		INV_bo_inTransaction:=False:C215  //this only gets set to true if we have to end the transaction when taking a payment
		//LB_S11_invMode
		//ARRAY STRING(11;LB_S11_invMode;2)
		//LB_S11_invMode{1}:="Selectable"
		//LB_S11_invMode{2}:="Editable"
		//If ((◊DMAdd) & (◊DefListLay))
		//ARRAY STRING(11;LB_S11_invMode;3)
		//LB_S11_invMode{3}:="Definitions"
		
		//End if
		ARRAY TEXT:C222(INV_at_EditMode; 0)
		ARRAY LONGINT:C221(INV_al_EditMode; 0)
		LBi_SetListBoxOptions(->INV_at_EditMode; ->INV_al_EditMode; ->INV_Pi_Mode; True:C214)
		Invoices_InLPBB
		Invoices_InLPß("B")
		
		
		SD2_SetDiaryPopup(->INV_al_ViewTableToTable; ->INV_at_ViewTabsLabels; ->INV_at_TabNames)
		If ([INVOICES:39]Company_Code:2#"")  //regardless of posted or not
			//SET ENTERABLE([INVOICES]Company Code;False)
		End if 
		If (Size of array:C274(INV_aptr_ListboxSetup)>=9)
			
			$_ptr_ArrayReferences:=INV_aptr_ListboxSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (INV_at_InvoicesTab=1)
						If (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161])) | (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //if and when we make other  items removable then we can enable other items
							In_ButtChkDis(->vButtDisInv; "Invoice"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisInv; "Invoice")
						End if 
					: (INV_at_InvoicesTab=2)
						In_ButtChkDis(->vButtDisInv; "Invoice")
				End case 
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisInv)
			
		End if 
		
		If ([INVOICES:39]State:10=-3)
			DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
		Else 
			
			DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_In")
		End if 
		If (Records in selection:C76([INVOICES:39])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		If ([INVOICES:39]State:10=-3)
			//DB_SetInputFormMenu (Table(->[INVOICES]);"Invoice_inP")
		Else 
			
			//DB_SetInputFormMenu (Table(->[INVOICES]);"Invoice_In")
		End if 
		OpenHelp(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		If (Records in selection:C76([INVOICES:39])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (vTot=1)
			vTot:=0
			Invoices_Tot(->INV_aptr_ListboxSetup; ->INV_al_ViewTableToTable; INV_at_ViewTabsLabels)
			
			
			If ([INVOICES:39]Total_Due:7<=0)
				vContr:=0
			End if 
			
		End if 
		vFromIn:=After:C31
		If (Size of array:C274(INV_aptr_ListboxSetup)>=9)
			
			$_ptr_ArrayReferences:=INV_aptr_ListboxSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (INV_at_InvoicesTab=1)
						If (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161])) | (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //if and when we make other  items removable then we can enable other items
							In_ButtChkDis(->vButtDisInv; "Invoice"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisInv; "Invoice")
						End if 
					: (INV_at_InvoicesTab=2)
						In_ButtChkDis(->vButtDisInv; "Invoice")
				End case 
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisInv)
			
		End if 
		If (Not:C34(Undefined:C82(INV_al_ViewTableToTable))) & (Not:C34(Undefined:C82(INV_at_ViewTabsLabels))) & (Not:C34(Undefined:C82(INV_at_TabNames)))
			
			
			SD2_SetDiaryPopup(->INV_al_ViewTableToTable; ->INV_at_ViewTabsLabels; ->INV_at_TabNames)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		
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
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; ->[INVOICES:39]; "Invoice_In")
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReloadAuths"))
				If (INV_bo_inTransaction)
					StartTransaction
				End if 
				INV_bo_inTransaction:=False:C215
				SHOW PROCESS:C325(Current process:C322)
				SHOW WINDOW:C435
				If (INV_S20_LoadRecord#"")
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=INV_S20_LoadRecord)
					Invoices_InLPBB
					Invoices_InLPß("B")
					If ([ORDERS:24]x_ID:58>0)
						ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
					End if 
					If (INV_bo_AutoPrint)
						Invoices_PPrint(False:C215; True:C214)
					End if 
				End if 
				INV_bo_AutoPrint:=False:C215
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				INV_t_FalseTab:=SD2_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[INVOICES:39])
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
					CREATE SET:C116([DIARY:12]; "INVcurrentDiary")  //Just to make sure we keep the selection
					INV_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					USE SET:C118("INVcurrentDiary")  //Just to make sure we keep the selection
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				In_ButtCall("R:Inv_Accept:D:Inv_Cancel"; ""; "Inv_Delete"; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; "Invoices"; "2 4 13"+(" 5"*(Num:C11(([INVOICES:39]State:10>-2) & (DB_LedgerAllowZeroInvoices=False:C215)))); "Invoices_InLPß"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisInv; ->INV_aptr_ListboxSetup; True:C214)
				
				
		End case 
		
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16) | ($_l_Event=On Data Change:K2:15)
		
		
		
		//If (Menu selected#0)
		//  $m:=Menu selected
		//  If (($m\65536)=2050)
		//   Invoices_MenV ($m)
		//  End if
		//  End if
		Invoices_InLPD
		Case of 
			: (Modified:C32([INVOICES:39]State:10))
			: (Modified:C32([INVOICES:39]Credit_Stage:22))
				Check_MinorNC(->[INVOICES:39]Credit_Stage:22; "Stage"; ->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[INVOICES:39]Credit_Stage:22)
			: (Modified:C32([INVOICES:39]Debtors_Account:15))
				Check_SecInv(->[INVOICES:39]Debtors_Account:15)
				If (OK=1)
					Check_MinorNC(->[INVOICES:39]Debtors_Account:15; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
					If ([INVOICES:39]Debtors_Account:15#"")
						$_bo_Continue:=Trans_SubLPLayerCode(->[INVOICES:39]Debtors_Account:15; ->[INVOICES:39]Layer_Code:38; 1)
					End if 
					If ([INVOICES:39]Debtors_Account:15#"")
						$_bo_Continue:=Check_AnalAcc(->[INVOICES:39]Debtors_Account:15; ->[INVOICES:39]Analysis_Code:17; 1)
					End if 
					If (([INVOICES:39]Debtors_Account:15#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
						If (([INVOICES:39]Debtors_Account:15<[TRANSACTION_TYPES:31]D_Range_F:9) | ([INVOICES:39]Debtors_Account:15>[TRANSACTION_TYPES:31]D_Range_T:10))
							If ([TRANSACTION_TYPES:31]D_Enforce:13)
								Gen_Alert("This Account does not fall within an Invoice's required range of Debtors"+" Accounts."; "Try again")
								[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
								REJECT:C38([INVOICES:39]Debtors_Account:15)
							Else 
								Gen_Confirm("This Account does not fall within an Invoice's advised range of Debtors"+" Accounts."; "Allow"; "Try again")
								If (OK=0)
									[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
									REJECT:C38([INVOICES:39]Debtors_Account:15)
								End if 
							End if 
						End if 
					End if 
					If ([INVOICES:39]Debtors_Account:15="")
						[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
					End if 
					DB_bo_RecordModified:=True:C214
				End if 
				Macro_AccTypePt(->[INVOICES:39]Debtors_Account:15)
			: (Modified:C32([INVOICES:39]Total_Invoiced_Excluding_Tax:26))
				//   Check_SecInv (»[INVOICES]Total InvExTax)
				//  If (OK=1)
				//   If ([INVOICES]Total InvExTax#Old([INVOICES]Total InvExTax))
				//   Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//   If (OK=0)
				//    [INVOICES]Total InvExTax:=Old([INVOICES]Total InvExTax)
				//   End if
				//   End if
				//   DB_bo_RecordModified:=True
				//    End if
			: (Modified:C32([INVOICES:39]Total_Tax:35))
				//     Check_SecInv (»[INVOICES]Total Tax)
				//   If (OK=1)
				//   If ([INVOICES]Total Tax#Old([INVOICES]Total Tax))
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//   If (OK=0)
				// [INVOICES]Total Tax:=Old([INVOICES]Total Tax)
				//  End if
				//   End if
				//     DB_bo_RecordModified:=True
				//    End if
			: (Modified:C32([INVOICES:39]Total_Invoiced:5))
				// Check_SecInv (»[INVOICES]Total Invoiced)
				//If (OK=1)
				//  If ([INVOICES]Total Invoiced#Old([INVOICES]Total Invoiced))
				//  Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//   If (OK=0)
				//   [INVOICES]Total Invoiced:=Old([INVOICES]Total Invoiced)
				//   End if
				//  End if
				//   DB_bo_RecordModified:=True
				//   End if
			: (Modified:C32([INVOICES:39]Total_Paid:6))
				//   Check_SecInv (»[INVOICES]Total Paid)
				//   If (OK=1)
				//   If ([INVOICES]Total Paid#Old([INVOICES]Total Paid))
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//  If (OK=0)
				//   [INVOICES]Total Paid:=Old([INVOICES]Total Paid)
				//  End if
				//  End if
				//   DB_bo_RecordModified:=True
				//    End if
			: (Modified:C32([INVOICES:39]Total_Due:7))
				//    Check_SecInv (»[INVOICES]Total Due)
				//   If (OK=1)
				//    If ([INVOICES]Total Due#Old([INVOICES]Total Due))
				//    Gen_Confirm ("Are you sure you want to change this?";"Yes";"No")
				//    If (OK=0)
				//   [INVOICES]Total Due:=Old([INVOICES]Total Due)
				//    End if
				//   End if
				//    DB_bo_RecordModified:=True
				//   End if
				
			: (vTot=1)
				vTot:=0
				Invoices_Tot(->INV_aptr_ListboxSetup; ->INV_al_ViewTableToTable; INV_at_ViewTabsLabels)
				
				DB_bo_RecordModified:=True:C214
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					If ([INVOICES:39]State:10=-3)
						DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
						
					Else 
						
						DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_In")
					End if 
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: ($_l_Event=On Menu Selected:K2:14)
				If ([INVOICES:39]State:10=-3)
					DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_inP")
				Else 
					
					DB_SetInputFormMenu(Table:C252(->[INVOICES:39]); "Invoice_In")
				End if 
				If (Records in selection:C76([INVOICES:39])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
				If (vTot=1)
					vTot:=0
					Invoices_Tot(->INV_aptr_ListboxSetup; ->INV_al_ViewTableToTable; INV_at_ViewTabsLabels)
					
					
					If ([INVOICES:39]Total_Due:7<=0)
						vContr:=0
					End if 
					
				End if 
				
				If (Size of array:C274(INV_aptr_ListboxSetup)>=9)
					
					$_ptr_ArrayReferences:=INV_aptr_ListboxSetup{9}
					If (Size of array:C274($_ptr_ArrayReferences->)>=10)
						$_t_SubItemName:=$_ptr_ArrayReferences->{10}
						Case of 
							: (INV_at_InvoicesTab=1)
								If (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161])) | (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //if and when we make other  items removable then we can enable other items
									In_ButtChkDis(->vButtDisInv; "Invoice"; $_t_SubItemName)
								Else 
									In_ButtChkDis(->vButtDisInv; "Invoice")
								End if 
							: (INV_at_InvoicesTab=2)
								In_ButtChkDis(->vButtDisInv; "Invoice")
						End case 
					End if 
				Else 
					
					In_ButtChkDis(->vButtDisInv)
					
				End if 
				If (Not:C34(Undefined:C82(INV_al_ViewTableToTable))) & (Not:C34(Undefined:C82(INV_at_ViewTabsLabels))) & (Not:C34(Undefined:C82(INV_at_TabNames)))
					SD2_SetDiaryPopup(->INV_al_ViewTableToTable; ->INV_at_ViewTabsLabels; ->INV_at_TabNames)
				End if 
		End case 
		If ([INVOICES:39]X_invoiceClearedDate:43=!00-00-00!)
			//dont update anyhting if the invoice is cleared
			Invoices_Tot(->INV_aptr_ListboxSetup; ->INV_al_ViewTableToTable; INV_at_ViewTabsLabels)
			
			
			
			vtot:=0
			If ([INVOICES:39]Total_Due:7<=0)
				vContr:=0
			End if 
		End if 
		
		
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->INV_lb_InvoiceItems)
		LBI_Scrollonresize(->INV_lb_ALLOCATIONS)
		LBI_Scrollonresize(->INV_lb_LBAuths)
		
End case 
ERR_MethodTrackerReturn("Invoices_InLP"; $_t_oldMethodName)