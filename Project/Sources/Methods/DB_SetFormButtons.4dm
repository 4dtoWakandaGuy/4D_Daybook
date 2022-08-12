//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2010 10:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_PopUpSelector;0)
	C_BOOLEAN:C305(<>BOverRidButtonsSet; <>BOverRideButtons; $_bo_AcceptisVisible; $_bo_AddisVisible; $_bo_CalcisVisible; $_bo_CancelisVisible; $_bo_CBFunctionButtonisVisible; $_bo_DeleteisVisible; $_bo_Function1isVisible; $_bo_Function2isVisible; $_bo_ListsisVisible)
	C_BOOLEAN:C305($_bo_Popup1isVisible; $_bo_ReportisVisible; $_bo_SelectisVisible; $_bo_SortisVisible; DB_bo_PopupSelectorInited; ORD_bo_IsRevision; PRD_bo_ScreenFilterLoaded)
	C_DATE:C307(PER_d_Period3From; PUR_D_Date; vDate)
	C_LONGINT:C283(<>PER_l_AccessLevel; $_l_BestHeight; $_l_BestWidth; $_l_bottom; $_l_ButtonsBottom; $_l_CBFunctionSetting; $_l_ConfigBottom; $_l_ConfigLeft; $_l_ConfigRight; $_l_ConfigTop; $_l_Event)
	C_LONGINT:C283($_l_FirstButtonRight; $_l_Index; $_L_Left; $_l_leftShift; $_l_obj1BestWidth; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_objectTop; $_l_OverLap; $_l_PeriodID)
	C_LONGINT:C283($_l_RIght; $_l_SetButtons; $_l_TOp; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_t_CBFunction1Setting; $1; DB_but_CBFunction1; DB_but_Function1)
	C_LONGINT:C283(DB_but_Function2; DB_l_CompanionWindow; MOD_l_CurrentModuleAccess; PRD_l_FilterNLA; PUR_l_Calcon)
	C_POINTER:C301($_ptr_Button)
	C_REAL:C285(PUR_R_TotalDue; PUR_R_TotalDue30; PUR_R_TotalDue60; PUR_R_TotalDue90; PUR_R_TotalDueg90)
	C_TEXT:C284($_t_CBFunction1; $_t_CBFunction1Text; $_t_Function1; $_t_Function1Text; $_t_Function2; $_t_Function2Text; $_t_Function3; $_t_Function3Text; $_t_oldMethodName; $2; ACC_t_PeriodFrom)
	C_TEXT:C284(ButtDisO; DB_t_CBFunction1; DB_t_CurrentFormUsage; DB_t_DropDownFunction; DB_t_Function1; DB_t_Function2; DB_t_SelectorLabel; INV_t_SReportvalue1; INV_t_SReportvalue2; INV_t_SReportvalue3; INV_t_SReportvalue4)
	C_TEXT:C284(INV_t_SReportvalue5; INV_t_SReportvalue6; PER_t_Period1; PER_t_Period3; vButtDisO)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormButtons")


//How the buttons string works..
//there are
//Character 1 is either I or o meaning input or output or C for Copy mode)(output or D for  Copy mode Input  G=? A=? M=More choices U=? or X=?
//Character 2 is ?
//`The other characters then build a string of 2 digit chars 03
//Char 3=Button 1 =D for Disabled(
//Char 4=Button2= P for available
//Char 5 Button 3=M for available
//Char 6
vButtDisO:="O              DT"  // =`Default
If (Count parameters:C259>=1)
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			
			If ($2="")
				vButtDisO:="O                "
				
			Else 
				Case of 
						
					: ($2="Renumber")
						vButtDisO:="O                "
						$_t_Function1:="COM_CompanyRenumber"
						$_t_Function1Text:=Get localized string:C991("MenuItem_RenumberSelection")
					: ($2="Deduplicate")
						vButtDisO:="O                "
						$_t_Function1:="COM_CompanyFindDuplicates"
						$_t_Function1Text:=Get localized string:C991("MenuItem_FindDuplicates")
						
					: ($2="Mailing Companies")
						vButtDisO:="O                "
						$_t_Function1:="COM_CompanyMailing"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
						
					: ($2="Creditors Report")
						
						vButtDisO:="O                "
						vDate:=Current date:C33-90
						$_l_PeriodID:=Check_Period
						ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
						PUR_D_Date:=Current date:C33
						$_t_Function1:="PUR_PrintCreditorsReport"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
						DB_l_CompanionWindow:=New process:C317("PUR_ShowAgedDebtorsStats"; 128000; "Aged Creditors"; Current process:C322; PUR_D_Date; ACC_t_PeriodFrom; (Records in selection:C76([COMPANIES:2])); PUR_R_TotalDue; PUR_R_TotalDue30; PUR_R_TotalDue60; PUR_R_TotalDue90; PUR_R_TotalDueg90; *)
						If (DB_l_CompanionWindow>0)
							RELATE MANY SELECTION:C340([PURCHASE_INVOICES:37]Company_Code:2)
							CREATE SET:C116([PURCHASE_INVOICES:37]; "$SELECTION")
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0)
							PUR_R_TotalDue:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
							USE SET:C118("$SELECTION")
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0; *)
							If (PUR_l_Calcon=1)
								QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5>=PUR_D_Date-DB_GetLedgerADStageOne)
							Else 
								//period based
								If (PER_t_Period1="")
									QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_Date-DB_GetLedgerADStageOne); *)
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_Date-DB_GetLedgerADStageOne))
									PER_t_Period1:=[PERIODS:33]Period_Code:1
								End if 
								QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Period_Code:3=PER_t_Period1)
							End if 
							PUR_R_TotalDue30:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
							USE SET:C118("$SELECTION")
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0; *)
							If (PUR_l_Calcon=1)
								QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5<(PUR_D_Date-DB_GetLedgerADStageThree))
							Else 
								//period based
								If (PER_t_Period3="")
									QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_Date-DB_GetLedgerADStageTwo); *)
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_Date-DB_GetLedgerADStageTwo))
									PER_t_Period3:=[PERIODS:33]Period_Code:1
									PER_d_Period3From:=[PERIODS:33]From_Date:3
								End if 
								QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5<PER_d_Period3From)
								
							End if 
							PUR_R_TotalDueg90:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
							
							
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue1; String:C10((Records in selection:C76([COMPANIES:2]))))
							
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue2; String:C10(PUR_R_TotalDue; "|Accounts"))
							
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue3; String:C10(PUR_R_TotalDue30; "|Accounts"))
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue4; String:C10(PUR_R_TotalDue60; "|Accounts"))
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue5; String:C10(PUR_R_TotalDue90; "|Accounts"))
							SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; INV_t_SReportvalue6; String:C10(PUR_R_TotalDueG90; "|Accounts"))
							POST OUTSIDE CALL:C329(DB_l_CompanionWindow)
							BRING TO FRONT:C326(DB_l_CompanionWindow)
							
						End if 
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CONTACTS:1]))
			
			If ($2="")
				vButtDisO:="O                "
				
			Else 
				Case of 
					: ($2="Renumber")
						vButtDisO:="O                "
						$_t_Function1:="CON_ContactsRenumber"
						$_t_Function1Text:=Get localized string:C991("MenuItem_RenumberSelection")
					: ($2="Deduplicate")
						vButtDisO:="O                "
						$_t_Function1:="CON_ContactFindDuplicates"
						$_t_Function1Text:=Get localized string:C991("MenuItem_FindDuplicates")
						
					: ($2="Mailing Contacts")
						vButtDisO:="O                "
						$_t_Function1:="CON_ContactsMailing"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			
			If ($2="")
				vButtDisO:="O DP          ADT"
				
			Else 
				Case of 
					: ($2="BUDGETS")
						vButtDisO:="O DP          ADT"
						$_t_Function1:="ACC_AutoBudgets"
						$_t_Function1Text:=Get localized string:C991("AutocreateBudgets")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ACCOUNTS:32]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ACTIONS:13]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ANALYSES:36]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[AREAS:3]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CATALOGUE:108]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CONTRACT_TYPES:19]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CONTRACTS:17]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[COUNTRIES:73]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			
			If ($2="")
				
				vButtDisO:="O  P           DT"
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O  P           DT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[DIARY:12]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
					: ($2="Mailing Diary")
						vButtDisO:="O                "
						$_t_Function1:="DIA_DiaryMailing"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
				End case 
				
			End if 
		: ($1=Table:C252(->[DOCUMENTS:7]))
			//TRACE
			
			If ($2="Print Report") | ($2="Select Records")
				$_t_Function1:="DOC_SelectAndPrint"
				$_t_Function1Text:="Print Report"
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[HEADINGS:84]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[INVOICES:39]))
			
			If ($2="")
				vButtDisO:="O              D "
				
			Else 
				
				Case of 
					: ($2="Payments")
						vButtDisO:="O DP        R AD "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
					: ($2="DepositsRefunds") | ($2="Refund Deposit")
						
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_RefundDeposit2010"
						$_t_Function1Text:=Get localized string:C991("InvoiceString_Refund")
						
					: ($2="Invoice Receipt")
						
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_InvoiceReceipt2010"
						$_t_Function1Text:=Get localized string:C991("InvoiceString_Receipt")
					: ($2="ReceiptRefunds") | ($2="Undo Receipt")
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_RefundReceipt2010"
						$_t_Function1Text:="Undo Receipt"
					: ($2="Batch Print Created Invoices") | ($2="Batch Print Invoices")
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_BatchPrint2010"
						$_t_Function1Text:=Get localized string:C991("InvoiceString_BatchPrint")
						
					: ($2="Send Statements")
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_StatementPrint2010"
						$_t_Function1Text:=Get localized string:C991("MenuItem_PrintStatements")
						
					: ($2="Print Remittance Receipts")
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_RemittancePrint2010"
						$_t_Function1Text:=Get localized string:C991("MenuItem_PrintRemittance")
						
					: ($2="Batch Post Invoices")
						vButtDisO:="O DP        R AD "
						$_t_Function1:="INV_PostSelection"
						$_t_Function1Text:=Get localized string:C991("MenuItem_InvoicesPost")
						
						
					Else 
						vButtDisO:="O              D "
				End case 
				
			End if 
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			
			If ($2="")
				vButtDisO:="OI P           DT"
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="OI P           DT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[JOB PERSONNEL:48]))
			
			If ($2="")
				vButtDisO:="O  P           XT"
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O  P           XT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[JOB_STAGES:47]))
			
			If ($2="")
				vButtDisO:="O  P           XT"
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O  P           XT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[JOB_TYPES:65]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[JOBS:26]))
			
			If ($2="")
				vButtDisO:="O              D "
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[LAYERS:76]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[LOCATIONS:61]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[SCRIPTS:80]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			
			If ($2="")
				
				vButtDisO:="OI P           DT"
			Else 
				Case of 
					: ($2="Subscription Billing")
						vButtDisO:="OI P           DT"
						$_t_Function1:="ORD_SubscriptionBilling"
						$_t_Function1Text:="Invoice Selected Subscriptions"
						
					: ($2="Subscription Delivery")
						vButtDisO:="OI P           DT"
						$_t_Function1:="ORD_SubscriptionDelivery"
						$_t_Function1Text:="Deliver Selected Subscriptions"
						
					: ($2="Subscription Renewals")
						vButtDisO:="OI P           DT"
						$_t_Function1:="ORD_SubscriptionRenewals"
						$_t_Function1Text:="Print Renewals Letters"
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ORDERS:24]))
			
			If ($2="")
				
				If (vButtDisO#"OO             D ")
					vButtDisO:="OO             D "
				End if 
				If (ORD_bo_IsRevision)
					vButtDisO:="CO             D "
				End if 
			Else 
				Case of 
					: ($2="Batch Invoice Orders")
						vButtDisO:="CO             D "
						$_t_Function1:="ORD_BatchInvoiceSelection"
						$_t_Function1Text:=Get localized string:C991("MenuItem_BatchInvoiceOrders")
					: ($2="Mailing Orders")
						vButtDisO:="O                "
						$_t_Function1:="ORD_OrdersMailing"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PERSONNEL:11]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PICTURES:85]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PRICE_GROUPS:18]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PRICE_TABLE:28]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PROBLEMS:22]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PRODUCTS:9]))
			
			If ($2="")
				If (Not:C34(PRD_bo_ScreenFilterLoaded))
					PRD_l_FilterNLA:=ProductDeletionPreferences
					PRD_bo_ScreenFilterLoaded:=True:C214
				End if 
				$_t_CBFunction1:="PROD_ChangeNLA"
				$_t_CBFunction1Text:="Exclude products marked as no longer available"
				If (PRD_l_FilterNLA=1)
					$_l_CBFunctionSetting:=1
				Else 
					$_l_CBFunctionSetting:=0
				End if 
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PROJECTS:89]))
			
			If ($2="")
				vButtDisO:="O              D "
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PUBLICATIONS:52]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="Post Purchase Invoices")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_PostSelection"
						$_t_Function1Text:=Get localized string:C991("MenuItem_PurchasesPost")
						
					: ($2="Purchase Payment")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_PaySelected"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Payment")
					: ($2="Purchase Undo Payment")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_unPaySelected"
						$_t_Function1Text:=Get localized string:C991("MenuItem_UnPayment")
					: ($2="Print Cheques")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_PrintSelected"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
					: ($2="Print Cheques")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_PrintSelected"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
					: ($2="Autopay List")
						vButtDisO:="O              D "
						$_t_Function1:="PUR_PrintAutopaySelected"
						$_t_Function1Text:=Get localized string:C991("MenuItem_Print")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			
			If ($2="")
				
				vButtDisO:="O              D "
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[RESULTS:14]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[ROLES:87]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			
			If ($2="")
				vButtDisO:="O              D "
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O              D "
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[SOLUTIONS:23]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[SOURCES:6]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STAGES:45]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STATUS:4]))
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			If ($2="")
				vButtDisO:="O  P           DT"
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O  P           DT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STOCK_LEVELS:58]))
			
			
			If ($2="")
				vButtDisO:="O  P           DT"
				
			Else 
				Case of 
					: ($2="xxx")
						vButtDisO:="O  P           DT"
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TAX_CODES:35]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TERMINOLOGY:75]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
			
			
			If ($2="")
				If (DB_t_CurrentFormUsage="View2")
					vButtDisO:="O DP        R ADT"
				Else 
					vButtDisO:="O  P          ADT"
				End if 
				
			Else 
				Case of 
					: ($2="Post Transaction Batches")
						If (DB_t_CurrentFormUsage="View2")
							vButtDisO:="O DP        R ADT"
						Else 
							vButtDisO:="O  P          ADT"
						End if 
						
						$_t_Function1:="ACC_PostSelectedBatches"
						$_t_Function1Text:="Post selected"  //Get localized string("MenuItem_RenumberSelection")"
					: ($2="Reverse Transaction Batches")
						If (DB_t_CurrentFormUsage="View2")
							vButtDisO:="O DP        R ADT"
						Else 
							vButtDisO:="O  P          ADT"
						End if 
						
						$_t_Function1:="ACC_ReverseSelectedBatches"
						$_t_Function1Text:="Reverse selected"  //Get localized string("MenuItem_RenumberSelection")"
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[TRANSACTIONS:29]))
			
			
			If ($2="")
				vButtDisO:="O  P          ADT"
				
			Else 
				Case of 
					: ($2="Check")
						vButtDisO:="O  P          ADT"
						$_t_Function1:="ACC_TransactionsCheck"
						$_t_Function1Text:=Get localized string:C991("MenuItem_CheckTransactions")
					: ($2="Reconcile Transactions")
						ButtDisO:="O  P          ADT"
						$_t_Function1:="ACC_TransactionsReconcile"
						$_t_Function1Text:="Reconcile"  //Get localized string("MenuItem_CheckTransactions")
						$_t_Function2:="ACC_TransactionsPrint"
						$_t_Function2Text:="Print"  //Get localized string("MenuItem_CheckTransactions")
				End case 
				
			End if 
		: ($1=Table:C252(->[TYPES:5]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
		: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
			
			
			If ($2="")
				
				
			Else 
				Case of 
					: ($2="xxx")
						
						//$_t_Function1:="CON_ContactsRenumber"
						//$_t_Function1Text:=Get localized string("MenuItem_RenumberSelection")
						
				End case 
				
			End if 
	End case 
	
	
	//Now with this new form we dont set the toolbar buttons because the buttons are in the windw
	//Here we hide the toolbar buttons
	Case of 
		: ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
			vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"DPMONP"+Substring:C12(vButtDisO; 9; 4)+"R"+Substring:C12(vButtDisO; 14; 1)+"ADT"
		: (MOD_l_CurrentModuleAccess>2)
			If (MOD_l_CurrentModuleAccess=3)
				vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"DPMONP"+Substring:C12(vButtDisO; 9; 4)+"R"+Substring:C12(vButtDisO; 14; 1)+"A"+Substring:C12(vButtDisO; 16; 99)
			Else 
				vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"D"+Substring:C12(vButtDisO; 4; 1)+"MONP"+Substring:C12(vButtDisO; 9; 6)+"A"+Substring:C12(vButtDisO; 16; 99)
			End if 
			If (Substring:C12(vButtDisO; 16; 1)="D")
				If (vButtDisO="O@")
					vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
				End if 
			End if 
		: (<>PER_l_AccessLevel>1)
			
			
			vButtDisO:=Substring:C12(vButtDisO; 1; 4)+"MONP"+Substring:C12(vButtDisO; 9; 6)+"A"+Substring:C12(vButtDisO; 16; 99)
			If (Substring:C12(vButtDisO; 16; 1)="D")
				If (vButtDisO="O@")
					vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
				End if 
			End if 
		Else 
			If (Not:C34(Is compiled mode:C492))
				If (Not:C34(<>BOverRidButtonsSet))
					Gen_Confirm("Use designer settings for buttons?"; "Yes"; "No")
					If (OK=1)
						<>BOverRideButtons:=True:C214
					End if 
					<>BOverRidButtonsSet:=True:C214
				End if 
			Else 
				<>BOverRideButtons:=False:C215
			End if 
			If (Is compiled mode:C492) | (<>BOverRideButtons=True:C214)
				
				vButtDisO:=Substring:C12(vButtDisO; 1; 4)+"MONP"+Substring:C12(vButtDisO; 9; 99)
				If (Substring:C12(vButtDisO; 16; 1)="D")
					If (vButtDisO="O@")
						vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
					End if 
				End if 
			End if 
	End case 
	
End if 
If ($_t_Function1#"")
	OBJECT SET VISIBLE:C603(DB_but_Function1; True:C214)
	DB_t_Function1:=$_t_Function1
	OBJECT SET TITLE:C194(DB_but_Function1; $_t_Function1Text)
	OBJECT GET BEST SIZE:C717(DB_but_Function1; $_l_BestWidth; $_l_BestHeight)
	$_l_obj1BestWidth:=$_l_BestWidth
	OBJECT GET COORDINATES:C663(DB_but_Function1; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT MOVE:C664(DB_but_Function1; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectLeft+$_l_BestWidth; $_l_objectTop+$_l_BestHeight; *)
	
Else 
	OBJECT SET VISIBLE:C603(DB_but_Function1; False:C215)
	DB_t_Function1:=""
	OBJECT SET TITLE:C194(DB_but_Function1; "Function One")
	
End if 
If ($_t_Function2#"")
	OBJECT SET VISIBLE:C603(DB_but_Function2; True:C214)
	DB_t_Function2:=$_t_Function2
	OBJECT SET TITLE:C194(DB_but_Function2; $_t_Function2Text)
	OBJECT GET BEST SIZE:C717(DB_but_Function2; $_l_BestWidth; $_l_BestHeight)
	If ($_l_obj1BestWidth<$_l_BestWidth)
		OBJECT MOVE:C664(DB_but_Function1; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectLeft+$_l_BestWidth; $_l_objectTop+$_l_BestHeight; *)
	Else 
		$_l_BestWidth:=$_l_obj1BestWidth
	End if 
	OBJECT GET COORDINATES:C663(DB_but_Function1; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_leftShift:=$_l_ObjectRight+5
	OBJECT GET COORDINATES:C663(DB_but_Function2; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT MOVE:C664(DB_but_Function2; $_l_leftShift; $_l_objectTop; $_l_leftShift+$_l_BestWidth; $_l_objectTop+$_l_BestHeight; *)
	
Else 
	OBJECT SET VISIBLE:C603(DB_but_Function2; False:C215)
	DB_t_Function2:=""
	OBJECT SET TITLE:C194(DB_but_Function2; "Function Two")
End if 
If ($_t_CBFunction1#"")
	DB_but_CBFunction1:=$_l_CBFunctionSetting
	OBJECT SET VISIBLE:C603(DB_but_CBFunction1; True:C214)
	DB_t_CBFunction1:=$_t_CBFunction1
	OBJECT SET TITLE:C194(DB_but_CBFunction1; $_t_CBFunction1Text)
Else 
	OBJECT SET VISIBLE:C603(DB_but_CBFunction1; False:C215)
	DB_t_CBFunction1:=""
	OBJECT SET TITLE:C194(DB_but_CBFunction1; "Check Box 2")
End if 

//TRACE
If (Not:C34(DB_bo_PopupSelectorInited))
	ARRAY TEXT:C222(DB_at_PopUpSelector; 0)  // a pop-up selector-used on account balances
	DB_t_SelectorLabel:=""
	DB_bo_PopupSelectorInited:=True:C214
End if 
If (Size of array:C274(DB_at_PopUpSelector)>0)
	OBJECT SET VISIBLE:C603(*; "oDropDownQuery@"; True:C214)
	//and postion the objects!!
	DB_t_DropDownFunction:=DB_t_SelectorLabel
Else 
	OBJECT SET VISIBLE:C603(*; "oDropDownQuery@"; False:C215)
End if 





//set the object size here
WS_GETPALLETEBUTTONS
DB_SetFormButtonOptions(vButtDisO)
If ($2="Select Records")
	For ($_l_Index; 3; 18)
		If ($_l_Index#11)
			$_ptr_Button:=Get pointer:C304("PAL_BUTTON_"+String:C10($_l_Index))
			OBJECT SET VISIBLE:C603($_ptr_Button->; False:C215)
		End if 
	End for 
	
End if 


GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_Event:=Form event code:C388

If ($_l_Event#On Resize:K2:27)  //& ($_l_Event#On Load)
	//TRACE
	$_bo_AcceptisVisible:=OBJECT Get visible:C1075(*; "oButtonAccept")
	$_bo_CancelisVisible:=OBJECT Get visible:C1075(*; "oButtonCancel")
	$_bo_AddisVisible:=OBJECT Get visible:C1075(*; "oButtonAdd")
	$_bo_DeleteisVisible:=OBJECT Get visible:C1075(*; "oButtonDelete")
	$_bo_SortisVisible:=OBJECT Get visible:C1075(*; "oButtonSort")
	$_bo_SelectisVisible:=OBJECT Get visible:C1075(*; "oButtonSelect")
	$_bo_ReportisVisible:=OBJECT Get visible:C1075(*; "obuttonReport")
	$_bo_ListsisVisible:=OBJECT Get visible:C1075(*; "obuttonDatalists")
	$_bo_CalcisVisible:=OBJECT Get visible:C1075(*; "obuttonCalc")
	$_bo_Function2isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton2")
	$_bo_Function1isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton")
	$_bo_Popup1isVisible:=OBJECT Get visible:C1075(*; "oDropDownQuery")
	$_bo_CBFunctionButtonisVisible:=OBJECT Get visible:C1075(*; "oCBFunctionButton")
	$_l_FirstButtonRight:=($_l_WindowRight-$_l_WindowLeft)-10
	$_l_ButtonsBottom:=($_l_WindowBottom-$_l_windowTop)-5
	OBJECT GET COORDINATES:C663(*; "obuttonConfig"; $_l_ConfigLeft; $_l_ConfigTop; $_l_ConfigRight; $_l_ConfigBottom)
	For ($_l_SetButtons; 1; 9)  //do not move this buttons during on load form
		Case of 
			: (($_bo_AcceptisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT GET COORDINATES:C663(*; "oButtonAccept"; $_L_Left; $_l_TOp; $_l_RIght; $_l_bottom)
					OBJECT SET COORDINATES:C1248(*; "oButtonAccept"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom)
					
					//OBJECT MOVE(*;"oButtonAccept";$_l_FirstButtonRight-35;$_l_ButtonsBottom-35;$_l_FirstButtonRight;$_l_ButtonsBottom;*)
				End if 
				$_bo_AcceptisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
				
			: (($_bo_CancelisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "oButtonCancel"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_CancelisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_AddisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "oButtonAdd"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_AddisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_DeleteisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "oButtonDelete"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_DeleteisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_SortisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "oButtonSort"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_SortisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_SelectisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "oButtonSelect"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_SelectisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_ReportisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "obuttonReport"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_ReportisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_ListsisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "obuttonDatalists"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_ListsisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_CalcisVisible))
				If ($_l_Event#On Load:K2:1)
					OBJECT MOVE:C664(*; "obuttonCalc"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				End if 
				$_bo_CalcisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
		End case 
		If ($_l_ConfigRight>$_l_FirstButtonRight)
			$_l_OverLap:=$_l_ConfigRight-$_l_FirstButtonRight
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_OverLap; $_l_WindowBottom)
			$_l_SetButtons:=1
			$_l_FirstButtonRight:=(($_l_WindowRight+$_l_OverLap)-$_l_WindowLeft)-10
		End if 
	End for 
	
	If ($_bo_Function2isVisible)
		If ($_l_Event#On Load:K2:1)
			OBJECT GET BEST SIZE:C717(*; "oFunctionButton2"; $_l_BestWidth; $_l_BestHeight)
			OBJECT MOVE:C664(*; "oFunctionButton2"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		End if 
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		$_bo_Function1isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton")
	End if 
	If ($_l_ConfigRight>$_l_FirstButtonRight)
		
		$_l_OverLap:=$_l_ConfigRight-$_l_FirstButtonRight
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_OverLap; $_l_WindowBottom)
		$_l_SetButtons:=1
		$_l_FirstButtonRight:=(($_l_WindowRight+$_l_OverLap)-$_l_WindowLeft)-10
	End if 
	If ($_bo_Function1isVisible)
		If ($_l_Event#On Load:K2:1)
			OBJECT GET BEST SIZE:C717(*; "oFunctionButton"; $_l_BestWidth; $_l_BestHeight)
			OBJECT MOVE:C664(*; "oFunctionButton"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		End if 
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		
	End if 
	If ($_l_ConfigRight>$_l_FirstButtonRight)
		$_l_OverLap:=$_l_ConfigRight-$_l_FirstButtonRight
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_OverLap; $_l_WindowBottom)
		$_l_SetButtons:=1
		$_l_FirstButtonRight:=(($_l_WindowRight+$_l_OverLap)-$_l_WindowLeft)-10
	End if 
	If ($_bo_Popup1isVisible)
		
		OBJECT GET BEST SIZE:C717(*; "oDropDownQuery"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oDropDownQuery"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-30; $_l_FirstButtonRight; $_l_ButtonsBottom-2; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		OBJECT GET BEST SIZE:C717(*; "oDropDownQueryLabel"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oDropDownQueryLabel"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
	End if 
	If ($_l_ConfigRight>$_l_FirstButtonRight)
		$_l_OverLap:=$_l_ConfigRight-$_l_FirstButtonRight
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_OverLap; $_l_WindowBottom)
		$_l_SetButtons:=1
		$_l_FirstButtonRight:=(($_l_WindowRight+$_l_OverLap)-$_l_WindowLeft)-10
	End if 
	If ($_bo_CBFunctionButtonisVisible)
		OBJECT GET BEST SIZE:C717(*; "oCBFunctionButton"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oCBFunctionButton"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-30; $_l_FirstButtonRight; $_l_ButtonsBottom-2; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		
	End if 
	If ($_l_ConfigRight>$_l_FirstButtonRight)
		$_l_OverLap:=$_l_ConfigRight-$_l_FirstButtonRight
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_OverLap; $_l_WindowBottom)
		$_l_SetButtons:=1
		$_l_FirstButtonRight:=(($_l_WindowRight+$_l_OverLap)-$_l_WindowLeft)-10
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetFormButtons"; $_t_oldMethodName)
