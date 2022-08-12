//%attributes = {}

If (False:C215)
	//Project Method Name:      DBI_MenuDisplayRecords
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
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_PINumbers; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $_bo_DataEditing; $_bo_EditInTransaction; $_bo_FIltersAvailable; $_bo_GraphsAvailable; $_bo_GraphsView; $_bo_HideModuleBar; $_bo_NoHideModule; $_bo_OpenDIaryHistory; $_bo_QueryDone; $_bo_ResetCurrent)
	C_BOOLEAN:C305($_bo_ReturnProcesID; $_bo_ReturnSelectRecords; $_bo_SearchesAvailable; $_bo_SelectionsAvailable; $_bo_StatsAvailable; $_bo_StatsView; $_bo_SubSelectionsAvailable; $_bo_TabsAvailable; $_bo_True; DB_bo_DisplayStats)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_blankInvoiceRow; $_l_DisplayRecordsTable; $_l_DisplayRecordtableOLD; $_l_FieldNumber; $_l_Index; $_l_LastTableNumber; $_l_Module; $_l_ModuleRow; $_l_offset; $_l_Offsets)
	C_LONGINT:C283($_l_Process; $_l_ResettoRecord; $_l_TableNumber; $2; $DB_l_ViewType; DB_l_CurrentDisplayedForm; DB_l_SelectionProcess; ModuleNumber)
	C_POINTER:C301($_ptr_ReturnProcessIDto; $_ptr_Table; $10; $4; $6; $8)
	C_TEXT:C284(<>LOGIN_s255_FirstModuleName; $_t_Context; $_t_ImportFunction; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OldTableName; $_t_RecordState; $_t_TableName; $_t_TableName2; $_t_ValuePass; $_t_VariableName)
	C_TEXT:C284($1; $11; $3; $5; $7; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBI_MenuDisplayRecords")



$_bo_OpenDIaryHistory:=False:C215

If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_bo_NoHideModule:=True:C214
	If (<>MENU_l_BarModule>0)
		ModuleNumber:=<>MENU_l_BarModule
	End if 
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 


If (Count parameters:C259>=2)
	//Pass the module number we are to display-affects menus and if displayed the module bar
	$_l_Module:=$2
Else 
	If (ModuleNumber>0)
		$_l_Module:=ModuleNumber
	Else 
		GEN_GetModules
		If (<>LOGIN_s255_FirstModuleName#"")
			$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; <>LOGIN_s255_FirstModuleName)
			If ($_l_ModuleRow>0)
				$_l_Module:=$_l_ModuleRow
			Else 
				$_l_Module:=$_l_ModuleRow
			End if 
		Else 
			$_l_Module:=1
		End if 
		
	End if 
End if 
$_l_DisplayRecordsTable:=Num:C11($_t_MenuItemParameter)
$_l_DisplayRecordtableOLD:=$_l_DisplayRecordsTable

$_bo_EditInTransaction:=False:C215
$_bo_HideModuleBar:=False:C215
$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)

$_bo_ReturnSelectRecords:=False:C215
$_bo_FIltersAvailable:=True:C214
$_bo_SelectionsAvailable:=True:C214
$_bo_SubSelectionsAvailable:=True:C214
$_bo_SearchesAvailable:=True:C214
$_bo_TabsAvailable:=True:C214
$_bo_StatsAvailable:=True:C214
$_bo_GraphsAvailable:=False:C215
$_t_Context:=""
$_bo_ReturnProcesID:=False:C215
//Replaces the following methods
//zCompaniesMod

//THE ABOVE VALUES ARE SET BY THE CONTEXT THIS IS CALLED IN
//This works in exactly the same way as DB_MenuNewRecord.
//you can pass a table number or a table +1000+context number
//The context will be different to the DB_MenuNewRecord
$_t_OldTableName:=""

If ($_l_DisplayRecordsTable>10000)
	//This section here for handling calls direct from the menu
	//where we want to use a context, the table number is added to by 10000 for each context
	//the context has to be interpreted here
	$_l_offset:=$_l_DisplayRecordsTable
	$_l_Offsets:=0
	Repeat 
		$_l_Offsets:=$_l_Offsets+1
		$_l_DisplayRecordsTable:=$_l_DisplayRecordsTable-10000
	Until ($_l_DisplayRecordsTable<1000)
	Case of 
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
			//no offset means new order
			Case of 
				: ($_l_Offsets=1)  //Enquiries
					
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{1}
					End if 
				: ($_l_Offsets=2)  //quotations
					
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{2}
					End if 
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_INVOICES:37]))
			//no offset means PI
			Case of 
				: ($_l_Offsets=1)  //Credit notes
					
					$_t_Context:="CreditNote"
				: ($_l_Offsets=2)  //prepayments
					
					$_t_Context:="Prepayment"
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					
					$_t_Context:="Credit Notes"
				: ($_l_Offsets=2)  //deposit
					
					$_t_Context:="View Deposits"
				: ($_l_Offsets=3)  //deposit
					
					$_t_Context:="View Receipts"
				: ($_l_Offsets=4)  //Proformas
					
					$_t_Context:="View Proformas"
			End case 
			
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					
					$_t_Context:="Assembly"
				: ($_l_Offsets=2)  //deposit
					
					$_t_Context:="Dissasembly"
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTIONS:29]))
			Case of 
				: ($_l_Offsets=1)  //Bank Reconcilliation
					
					$_t_Context:="Reconcile Transactions"
				: ($_l_Offsets=2)  //deposit
					
					
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
			Case of 
				: ($_l_Offsets=1)  //
					
					$_t_Context:="Outstanding Calls"
				: ($_l_Offsets=2)  //
					
					
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
			Case of 
				: ($_l_Offsets=1)  //
					
					$_t_Context:="Letters"
				: ($_l_Offsets=2)  //
					
					
			End case 
	End case 
	
	
End if 
If ($_l_DisplayRecordsTable=0)  //``
	
	$_t_TableName:=$_t_MenuItemParameter
	$_t_OldTableName:=$_t_MenuItemParameter
	Case of 
		: ($_t_TableName="OrdersCopy")
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="Copy Order Items"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="CompaniesRenum")
			$_t_TableName:=Table name:C256(Table:C252(->[COMPANIES:2]))
			$_t_Context:="Renumber"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="CompaniesDedup")
			$_t_TableName:=Table name:C256(Table:C252(->[COMPANIES:2]))
			$_t_Context:="Deduplicate"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="CompaniesMailing")
			$_t_TableName:=Table name:C256(Table:C252(->[COMPANIES:2]))
			$_t_Context:="Mailing Companies"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="ContactsRenum")
			$_t_TableName:=Table name:C256(Table:C252(->[CONTACTS:1]))
			$_t_Context:="Renumber"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="ContactsMailing")
			$_t_TableName:=Table name:C256(Table:C252(->[CONTACTS:1]))
			$_t_Context:="Mailing Contacts"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="ContactsDedup")
			$_t_TableName:=Table name:C256(Table:C252(->[CONTACTS:1]))
			$_t_Context:="Deduplicate"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="ContactsProspects")
			$_t_TableName:=Table name:C256(Table:C252(->[CONTACTS:1]))
			$_t_Context:="Prospects"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
			
		: ($_t_TableName="TransactionsCheck")
			$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTIONS:29]))
			$_t_Context:="Check"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="ACC BALANCESBUDGETS")
			$_t_TableName:=Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34]))
			$_t_Context:="Budgets"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="ContractsSelect")
			$_t_TableName:=Table name:C256(Table:C252(->[CONTRACTS:17]))
			$_t_Context:="Select Contracts"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=True:C214
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="ACC BALANCESBUDGETS")
			$_t_TableName:=Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34]))
			$_t_Context:="Budgets"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="DiaryLetters")
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Documents"
		: ($_t_TableName="DiaryMailing")
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			//$_t_Context:="Mailing"
			
			$_t_Context:="Mailing Diary"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="DiaryLetters")
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Letters"
		: ($_t_TableName="DocumentsLetterTemplates")
			$_t_TableName:=Table name:C256(Table:C252(->[DOCUMENTS:7]))
			$_t_Context:="Letters"
			$_bo_FIltersAvailable:=False:C215
		: ($_t_TableName="DocumentsReportTemplates")
			$_t_TableName:=Table name:C256(Table:C252(->[DOCUMENTS:7]))
			$_t_Context:="Reports"
		: ($_t_TableName="DocumentsEmailTemplates")
			$_t_TableName:=Table name:C256(Table:C252(->[DOCUMENTS:7]))
			$_t_Context:="Emails"
			
		: ($_t_TableName="OrdersTimeCosts")  //Replacing ZJobs_TCIn- not set the code for this yet
			
		: ($_t_TableName="Field Defs")
			$_t_TableName:=Table name:C256(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
			$_bo_EditInTransaction:=True:C214
		: ($_t_TableName="ProFormas")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="View Proformas"
		: ($_t_TableName="Deposits")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="View Deposits"
		: ($_t_TableName="Receipts")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="View Receipts"
		: ($_t_TableName="CreditNotes")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="View Credit Notes"
		: ($_t_TableName="InvoicesInvoices")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="View Invoices"
		: ($_t_TableName="InvoicesDepRefund") | ($_t_TableName="InvoicesDepositRefund")  //To show only Deposits
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Refund Deposit"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="SubscriptionsInvoice") | ($_t_TableName="OrderItemsSubsBilling")
			$_t_TableName:=Table name:C256(Table:C252(->[ORDER_ITEMS:25]))
			$_t_Context:="Subscription Billing"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="SubscriptionsDeliver") | ($_t_TableName="OrderItemsSubsDelivery")
			
			$_t_TableName:=Table name:C256(Table:C252(->[ORDER_ITEMS:25]))
			$_t_Context:="Subscription Delivery"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="SubscriptionsRenewalMailing") | ($_t_TableName="OrderItemsSubsRenewal")
			$_t_TableName:=Table name:C256(Table:C252(->[ORDER_ITEMS:25]))
			$_t_Context:="Subscription Renewals"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
			
			
		: ($_t_TableName="InvoicesReceipt")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Invoice Receipt"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="InvoicesReceiptRefund")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Undo Receipt"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="InvoicesChasing")  //ZMail_InvA
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Send Statements"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="InvoicesItems") | ($_t_TableName="Invoice Items")  //ZMail_InvA
			
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES_ITEMS:161]))
			$_t_Context:=""
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="InvoicesRemittances") | ($_t_TableName="InvoicesPrintRemittances")  //ZMail_InvA
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Print Remittance Receipts"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			//$_t_TableName:="MacrosInternet"  //To show only invoices
			
			//$_t_TableName:="Macros"
			//$_t_Context:="Web Handling"
		: ($_t_TableName="Stock ItemsHistory")  //To show only invoices
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$_t_Context:="Stock_History"
			//This view of stock items displays the stock items by product and the searches should be on products. in the old version this displayed ONE Products_Stock items.
			
		: ($_t_TableName="InvoicesBatchPost")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Post Invoices to Ledgers"
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="OrdersQuotations")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="View Quotations"
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_Context:="VIew "+<>SYS_at_RecStateNames{24}{2}
			End if 
		: ($_t_TableName="OrdersEnquiries")  //To show only invoices
			
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="View Enquiries"
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_Context:="VIew "+<>SYS_at_RecStateNames{24}{1}
			End if 
		: ($_t_TableName="OrdersInvoice")  //To show only orders for invoicing
			
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="Batch Invoice Orders"
			
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="BatchPrintInvoices") | ($_t_TableName="InvoicesPrint")  // Replacing Invoices_Inv
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Batch Print Invoices"
			
			$_bo_HideModuleBar:=False:C215
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="Trans inREVERSE")  // Replacing Invoices_Inv
			
			$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30]))
			
			$_t_Context:="Reverse Transaction Batches"
			
			$_bo_HideModuleBar:=False:C215
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="BatchPostInvoices") | ($_t_TableName="InvoicesPost")  // Replacing Invoices_Inv
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Batch Post Invoices"
			
			$_bo_HideModuleBar:=True:C214
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="Recurring Journals")
			$_t_TableName:=Table name:C256(Table:C252(->[RECURRING_JOURNALS:38]))
		: ($_t_TableName="Transaction types")
			$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTION_TYPES:31]))
		: ($_t_TableName="Trans inPost")
			$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30]))
			$_t_Context:="Post Transaction Batches"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="PurchasesPost")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Post Purchase Invoices"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			
			
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="PurchasesPayment")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Purchase Payment"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=True:C214
			
			
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="PurchasesRefundPayment")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Purchase Undo Payment"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="PurchasesCheques")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Print Cheques"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="ProductsSelect")
			$_t_TableName:=Table name:C256(Table:C252(->[PRODUCTS:9]))
			$_t_Context:="Select Products"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=True:C214
			$_bo_FIltersAvailable:=True:C214
			$_bo_SelectionsAvailable:=True:C214
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="PurchasesAutopay")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Autopay List"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="PurchasesAgedCreditors")
			$_t_TableName:=Table name:C256(Table:C252(->[COMPANIES:2]))
			$_t_Context:="Creditors Report"
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
			
		: ($_t_TableName="TransactionsBankReconcilliation")
			If (DB_GetSalesLedgerBankFrom#"") | (DB_GetSalesLedgerBankTo#"")
				$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTIONS:29]))
				$_t_Context:="Reconcile Transactions"
				$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
				
				$_bo_ReturnSelectRecords:=False:C215
				$_bo_FIltersAvailable:=False:C215
				$_bo_SelectionsAvailable:=False:C215
				$_bo_SubSelectionsAvailable:=True:C214
				$_bo_SearchesAvailable:=True:C214
				$_bo_TabsAvailable:=False:C215
				$_bo_StatsAvailable:=False:C215
				$_bo_GraphsAvailable:=False:C215
				$_bo_ReturnProcesID:=False:C215
			Else 
				Gen_Alert("Bank accounts are not defined in the setup")
			End if 
		: ($_t_TableName="Service CallsOutstanding")
			$_t_TableName:=Table name:C256(Table:C252(->[SERVICE_CALLS:20]))
			$_t_Context:="Outstanding Calls"
			$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
		: ($_t_TableName="Stock Levels")
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_LEVELS:58]))
			$_t_Context:=""
			$_bo_DataEditing:=False:C215  //(add records modify records-option to preven if window is selection only)
			
			$_bo_ReturnSelectRecords:=False:C215
			$_bo_FIltersAvailable:=False:C215
			$_bo_SelectionsAvailable:=False:C215
			$_bo_SubSelectionsAvailable:=True:C214
			$_bo_SearchesAvailable:=True:C214
			$_bo_TabsAvailable:=False:C215
			$_bo_StatsAvailable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			$_bo_ReturnProcesID:=False:C215
	End case 
	$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
	If ($_l_TableNumber<0)
		If (Position:C15(" "; $_t_TableName)>0)
			$_t_TableName2:=Replace string:C233($_t_TableName; " "; "_")
			$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName2)
		End if 
	End if 
	If ($_l_TableNumber<0)
		//this should not happen as only invisible tables are not included
		$_l_LastTableNumber:=Get last table number:C254
		For ($_l_Index; 1; $_l_LastTableNumber; 1)
			If (Is table number valid:C999($_l_Index))
				If (Table name:C256($_l_Index)=$_t_TableName)
					$_l_DisplayRecordsTable:=$_l_Index
					$_l_DisplayRecordtableOLD:=$_l_DisplayRecordsTable
					$_l_Index:=$_l_LastTableNumber
				End if 
			End if 
		End for 
	Else 
		$_l_DisplayRecordsTable:=<>DB_al_TableNums{$_l_TableNumber}
		$_l_DisplayRecordtableOLD:=$_l_DisplayRecordsTable
	End if 
End if 
If ($_bo_StatsAvailable)
	$_bo_StatsAvailable:=False:C215
	Case of 
		: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACTS:17]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[COMPANIES:2]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[CONTACTS:1]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDER_ITEMS:25]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTIONS:29]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_LEVELS:58]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[CURRENT_STOCK:62]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[INFORMATION:55]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PROJECTS:89]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCTS:9]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[DOCUMENTS:7]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOB_STAGES:47]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOBS:26]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOB PERSONNEL:48]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		Else 
			$_bo_StatsAvailable:=False:C215
	End case 
Else 
	DB_bo_DisplayStats:=False:C215
End if 
Case of 
		
	: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_INVOICES:37]))
		$_bo_FIltersAvailable:=True:C214
		
	: ($_l_DisplayRecordsTable=Table:C252(->[JOBS:26]))
		
	: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
		
	: ($_l_DisplayRecordsTable=Table:C252(->[ADDRESS_FORMATS:74]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[ANALYSES:36]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[ANALYSES:36]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[AREAS:3]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCT_BRANDS:8]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[CATALOGUE:108]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACT_TYPES:19]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACT_TYPES:19]))
		$_bo_FIltersAvailable:=False:C215
		
	: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACTS_CONTACTS:151]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[COUNTRIES:73]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[CREDIT_STAGES:54]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[CURRENCIES:71]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[CUSTOM_FIELDS:98]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  //Further analysis
		
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCT_GROUPS:10]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[HEADINGS:84]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[JOB_TYPES:65]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[LAYERS:76]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[LOCATIONS:61]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[SCRIPTS:80]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[MOVEMENT_TYPES:60]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PERIODS:33]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PERSONNEL:11]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PICTURES:85]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[POSTAL_CODES:50]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_GROUPS:18]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PROBLEMS:22]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[PUBLICATIONS:52]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[RECURRING_JOURNALS:38]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[RESULTS:14]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[ROLES:87]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[SOLUTIONS:23]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[SOURCES:6]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[STAGES:45]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[STATUS:4]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_TYPES:59]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[TAX_CODES:35]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[TERMINOLOGY:75]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_TYPES:31]))
		$_bo_FIltersAvailable:=False:C215
	: ($_l_DisplayRecordsTable=Table:C252(->[TYPES:5]))
		$_bo_FIltersAvailable:=False:C215
End case 
If ($_l_DisplayRecordsTable=0)
	Gen_Alert($_t_MenuItemParameter+" was not understood")
Else 
	$_ptr_Table:=Table:C252($_l_DisplayRecordsTable)
	$_bo_ResetCurrent:=False:C215
	If (DB_l_CurrentDisplayedForm>0)
		If (Count parameters:C259>=3)
			If ($3#"")
				//$3 IS A NAMED SELECTION-=QUERIES ALREADY DONE
				USE NAMED SELECTION:C332($3)
				COPY NAMED SELECTION:C331($_ptr_Table->; "◊FromSelection")
				$_t_ValuePass:="◊FromSelection"
			Else 
				$_t_ValuePass:=""
			End if 
		Else 
			$_t_ValuePass:=""
		End if 
		If ($_t_OldTableName="")
			$_t_OldTableName:=String:C10($_l_DisplayRecordtableOLD)
		End if 
		//we are in a form (probably data entry and have selected to view the same table recall as a process
		Case of 
			: (Count parameters:C259<=1)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName)
				
			: (Count parameters:C259=2)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module)
				
			: (Count parameters:C259=3)
				
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass)
			: (Count parameters:C259=4)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4)
			: (Count parameters:C259=5)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5)
			: (Count parameters:C259=6)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6)
			: (Count parameters:C259=7)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6; $7)
			: (Count parameters:C259=8)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6; $7; $8)
			: (Count parameters:C259=9)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6; $7; $8; $9)
			: (Count parameters:C259=10)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6; $7; $8; $9; $10)
				
			: (Count parameters:C259=11)
				$_l_Process:=New process:C317("DBI_MenuDisplayRecords"; 512000; "Display Records Menu"; $_t_OldTableName; $_l_Module; $_t_ValuePass; $4; $5; $6; $7; $8; $9; $10; $11)
				
				
		End case 
	Else 
		If (Is new record:C668($_ptr_Table->)) & (Count parameters:C259<3)
			
			//If we are entering a new record the display of new records cant search the table
			$_l_Process:=New process:C317("DBI_MenuDIsplayRecords"; 1024000; "Open New Window"; $_t_MenuItemParameter; $_l_Module)
			
		Else 
			If (Records in selection:C76($_ptr_Table->)>0)
				COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
				If (Read only state:C362($_ptr_Table->)=False:C215)
					$_bo_ResetCurrent:=True:C214
					$_l_ResettoRecord:=0
					If (Read only state:C362($_ptr_Table->)=False:C215)
						If (Record number:C243($_ptr_Table->)>=0)
							PUSH RECORD:C176($_ptr_Table->)
						End if 
					Else 
						$_l_ResettoRecord:=Selected record number:C246($_ptr_Table->)
						
					End if 
					
				Else 
					$_bo_ResetCurrent:=True:C214
					$_l_ResettoRecord:=0
				End if 
			End if 
			If (Records in table:C83($_ptr_Table->)=0)
				
				$_t_ImportFunction:=DB_GetImportFunction($_l_DisplayRecordsTable; $_t_Context)
				If ($_t_ImportFunction="")
					If ($_t_Context="")
						DB_MenuNewRecord(String:C10($_l_DisplayRecordsTable))
						
					End if 
				Else 
					
				End if 
				//Gen_Confirm ("There are no"
			Else 
				While (Semaphore:C143("$LaunchingDisplayWindow"))
					DelayTicks(2)
				End while 
				If (Count parameters:C259>2)
					//HERE ADDITIONAL VALUES CAN BE PASSED TO THIS METHOD AS SEARCH CRITERIA-
					If ($3#"")
						//$3 IS A NAMED SELECTION-=QUERIES ALREADY DONE
						USE NAMED SELECTION:C332($3)
						COPY NAMED SELECTION:C331($_ptr_Table->; "◊Preselection")
					Else 
						//here we do auto searches
						//End if
						
						If ($_t_Context#"")
							//here we filter down from all records based on  the context
							//TRACE
							Case of 
								: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[DIARY:12]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Order_Code:26))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Company_Code:1))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Product_Code:13))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Job_Code:19))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
												End case 
												If ($_t_Context="Letters") | ($_t_Context="Documents")
													QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
												End if 
										End case 
										COPY NAMED SELECTION:C331($_ptr_Table->; "◊Preselection")
									End if 
							End case 
						Else 
							UNLOAD RECORD:C212($_ptr_Table->)
							READ ONLY:C145($_ptr_Table->)
							
							ALL RECORDS:C47($_ptr_Table->)
							Case of 
								: ($_l_DisplayRecordsTable=Table:C252(->[ACCOUNT_BALANCES:34]))
									
								: ($_l_DisplayRecordsTable=Table:C252(->[COMPANIES:2]))
									If (Count parameters:C259>=5)
										
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]Company_Code:1))
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$5)
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
										End case 
									End if 
									
								: ($_l_DisplayRecordsTable=Table:C252(->[CONTACTS:1]))
									//Whether we are pointing at 'Contacts_Companies' or contact company code this will work the same
									If (Count parameters:C259>=4)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[CONTACTS:1]Contact_Code:2))
														
														
														If ($5#"")
															
															QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$5)
														End if 
													: ($_l_FieldNumber=Field:C253(->[CONTACTS:1]Company_Code:1))
														If ($5#"")
															QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$5; *)
															QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
															
															SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
															QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
														End if 
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
														
												End case 
										End case 
										If (Count parameters:C259>=6)
											RESOLVE POINTER:C394($6; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[CONTACTS:1]Company_Code:1))
															If ($7#"")
																QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$7; *)
																QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
																
																SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
																QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
																CREATE SET:C116([CONTACTS:1]; "$Set1")
																QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$7)
																CREATE SET:C116([CONTACTS:1]; "$Set2")
																UNION:C120("$Set1"; "$Set2"; "$Set1")
																USE SET:C118("$set1")
															End if 
													End case 
												: ($_l_TableNumber=Table:C252(->[CONTACTS_COMPANIES:145]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[CONTACTS_COMPANIES:145]Company_Code:1))
															If ($7#"")
																QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$7)
																SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
																QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
																CREATE SET:C116([CONTACTS:1]; "$Set1")
																QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$7)
																CREATE SET:C116([CONTACTS:1]; "$Set2")
																UNION:C120("$Set1"; "$Set2"; "$Set1")
																USE SET:C118("$set1")
															End if 
													End case 
											End case 
										End if 
									End if 
									
								: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACTS:17]))
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[CONTRACTS:17]Company_Code:1))
														If ($5#"")
															QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=$5)
														End if 
													Else 
														
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
														
												End case 
											: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
										End case 
									End if 
									
								: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCTS:9]))
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Product_Code:1))
														If ($5#"")
															QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$5)
														End if 
												End case 
											: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[PRODUCTS_SUPPLIERS:148]Company_Code:1))
														If ($5#"")
															QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$5)
															SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
															QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
															
														End if 
												End case 
											Else 
												$_ptr_Table:=Table:C252($_l_TableNumber)
												$_bo_QueryDone:=False:C215
												Case of 
													: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
														
														QUERY:C277($_ptr_Table->; $4->=$5)
														$_bo_QueryDone:=True:C214
													: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
														
														QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
														$_bo_QueryDone:=True:C214
													: (Type:C295($4->)=Is date:K8:7)
														
														QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
														$_bo_QueryDone:=True:C214
													: (Type:C295($4->)=Is time:K8:8)
														
														QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
														$_bo_QueryDone:=True:C214
													: (Type:C295($4->)=Is boolean:K8:9)
														
														$_bo_True:=($5="TRUE") | ($5="YES")
														QUERY:C277($_ptr_Table->; $4->=$_bo_True)
														$_bo_QueryDone:=True:C214
												End case 
										End case 
									End if 
									
								: ($_l_DisplayRecordsTable=Table:C252(->[CURRENT_STOCK:62]))
									If (Count parameters:C259>=4)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[CURRENT_STOCK:62]Product_Code:1))
														If ($5#"")
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$5)
														End if 
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
										End case 
									End if 
									
									
								: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
									//TRACE
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[DIARY:12]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Order_Code:26))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Company_Code:1))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Product_Code:13))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													: ($_l_FieldNumber=Field:C253(->[DIARY:12]Job_Code:19))
														If ($5#"")
															QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$5)
														End if 
														$_bo_OpenDIaryHistory:=True:C214
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
														If ($_bo_QueryDone)
															$_bo_OpenDIaryHistory:=True:C214
														End if 
												End case 
												If ($_t_Context="Letters") | ($_t_Context="Documents")
													QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
												End if 
										End case 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
									//TRACE
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[INVOICES:39]Invoice_Number:1))
														If ($5#"")
															QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$5)
														End if 
													: ($_l_FieldNumber=Field:C253(->[INVOICES:39]Company_Code:2))
														If ($5#"")
															QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$5)
														End if 
													: ($_l_FieldNumber=Field:C253(->[INVOICES:39]Contact_Code:3))
														If ($5#"")
															QUERY:C277([INVOICES:39]; [INVOICES:39]Contact_Code:3=$5)
														End if 
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
											: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Invoice_Number:17))
														If ($5#"")
															DISTINCT VALUES:C339([ORDER_ITEMS:25]Invoice_Number:17; $_at_InvoiceNumbers)
															$_l_blankInvoiceRow:=Find in array:C230($_at_InvoiceNumbers; "")
															If ($_l_blankInvoiceRow>0)
																DELETE FROM ARRAY:C228($_at_InvoiceNumbers; $_l_blankInvoiceRow)
															End if 
															QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
															
														End if 
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
										End case 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES_ITEMS:161]))
									//TRACE
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
												Case of 
													: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
														
														QUERY:C277([INVOICES_ITEMS:161]; $4->=$5)
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
										End case 
									End if 
									
									
								: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Order_Code:3))
															QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$5)
														: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Company_Code:1))
															QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$5)
														: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Contact_Code:2))
															QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
												: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Product_Code:2))
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$5)
															DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
															QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
													
											End case 
											$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
											If ($_t_Context#"")
												If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
													Case of 
														: ($_t_Context="VIew "+<>SYS_at_RecStateNames{24}{1})
															$_t_RecordState:=<>SYS_at_RecStateCodes{24}{1}
															QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_RecordState)
															
													End case 
												End if 
											End if 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[ORDER_ITEMS:25]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Order_Code:1))
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$5)
														: ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Job_Code:34))
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=$5)
														: ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Purchase_Order_Number:18))
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
															
													End case 
													
											End case 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Company_Code:8))
															QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$5)
														: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Product_Code:1))
															QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
													
											End case 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
															QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$5)
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Company_Code:1))
															QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
															
													End case 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
															QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=$5)
															DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
															QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
															If ($_bo_QueryDone)
																DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
																QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
															End if 
															
															
															
													End case 
											End case 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18))
															QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
													
											End case 
										End if 
									End if 
									
								: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_INVOICES:37]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1))
															QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$5)
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_INVOICES:37]Company_Code:2))
															QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1))
															QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1=$5)
															DISTINCT VALUES:C339([PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17; $_at_PINumbers)
															QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; $_at_PINumbers)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
															If ($_bo_QueryDone)
																DISTINCT VALUES:C339([PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17; $_at_PINumbers)
																QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; $_at_PINumbers)
															End if 
													End case 
											End case 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
									If (Count parameters:C259>=5)
										If ($5#"")
											RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
													Case of 
														: ($_l_FieldNumber=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17))
															QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=$5)
														Else 
															$_ptr_Table:=Table:C252($_l_TableNumber)
															$_bo_QueryDone:=False:C215
															Case of 
																: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																	
																	QUERY:C277($_ptr_Table->; $4->=$5)
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																	
																	QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is date:K8:7)
																	
																	QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is time:K8:8)
																	
																	QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																	$_bo_QueryDone:=True:C214
																: (Type:C295($4->)=Is boolean:K8:9)
																	
																	$_bo_True:=($5="TRUE") | ($5="YES")
																	QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																	$_bo_QueryDone:=True:C214
															End case 
													End case 
											End case 
										End if 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
									If (Count parameters:C259>=5)
										RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Company_Code:1))
														If ($5#"")
															QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Company_Code:1=$5)
														End if 
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
												End case 
												
										End case 
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
									
									RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									Case of 
										: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
											Case of 
												: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$5)
												: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3))
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3=$5)
												Else 
													$_ptr_Table:=Table:C252($_l_TableNumber)
													$_bo_QueryDone:=False:C215
													Case of 
														: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
															
															QUERY:C277($_ptr_Table->; $4->=$5)
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
															
															QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is date:K8:7)
															
															QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is time:K8:8)
															
															QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is boolean:K8:9)
															
															$_bo_True:=($5="TRUE") | ($5="YES")
															QUERY:C277($_ptr_Table->; $4->=$_bo_True)
															$_bo_QueryDone:=True:C214
													End case 
											End case 
									End case 
									If (Count parameters:C259>=7)
										
										RESOLVE POINTER:C394($6; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
												Case of 
													: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=$7)
													Else 
														$_ptr_Table:=Table:C252($_l_TableNumber)
														$_bo_QueryDone:=False:C215
														Case of 
															: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
																
																QUERY:C277($_ptr_Table->; $4->=$5)
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
																
																QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is date:K8:7)
																
																QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is time:K8:8)
																
																QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
																$_bo_QueryDone:=True:C214
															: (Type:C295($4->)=Is boolean:K8:9)
																
																$_bo_True:=($5="TRUE") | ($5="YES")
																QUERY:C277($_ptr_Table->; $4->=$_bo_True)
																$_bo_QueryDone:=True:C214
														End case 
														
												End case 
										End case 
										
									End if 
								: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_LEVELS:58]))
									
									RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									Case of 
										: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
											Case of 
												: ($_l_FieldNumber=Field:C253(->[STOCK_LEVELS:58]Product_Code:1))
													QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$5)
												Else 
													$_ptr_Table:=Table:C252($_l_TableNumber)
													$_bo_QueryDone:=False:C215
													Case of 
														: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
															
															QUERY:C277($_ptr_Table->; $4->=$5)
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
															
															QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is date:K8:7)
															
															QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is time:K8:8)
															
															QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is boolean:K8:9)
															
															$_bo_True:=($5="TRUE") | ($5="YES")
															QUERY:C277($_ptr_Table->; $4->=$_bo_True)
															$_bo_QueryDone:=True:C214
													End case 
											End case 
									End case 
								: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
									
									RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									Case of 
										: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
											Case of 
												: ($_l_FieldNumber=Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10))
													QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=Num:C11($5))
												Else 
													$_ptr_Table:=Table:C252($_l_TableNumber)
													$_bo_QueryDone:=False:C215
													Case of 
														: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
															
															QUERY:C277($_ptr_Table->; $4->=$5)
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
															
															QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is date:K8:7)
															
															QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is time:K8:8)
															
															QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is boolean:K8:9)
															
															$_bo_True:=($5="TRUE") | ($5="YES")
															QUERY:C277($_ptr_Table->; $4->=$_bo_True)
															$_bo_QueryDone:=True:C214
													End case 
											End case 
										: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
											Case of 
												: ($_l_FieldNumber=Field:C253(->[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4))
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=$5)
													SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
													QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
												: ($_l_FieldNumber=Field:C253(->[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22))
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=$5)
													SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
													QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
												Else 
													$_ptr_Table:=Table:C252($_l_TableNumber)
													$_bo_QueryDone:=False:C215
													Case of 
														: (Type:C295($4->)=Is text:K8:3) | (Type:C295($4->)=Is alpha field:K8:1)
															
															QUERY:C277($_ptr_Table->; $4->=$5)
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
															
															QUERY:C277($_ptr_Table->; $4->=Num:C11($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is date:K8:7)
															
															QUERY:C277($_ptr_Table->; $4->=Date:C102($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is time:K8:8)
															
															QUERY:C277($_ptr_Table->; $4->=Time:C179($5))
															$_bo_QueryDone:=True:C214
														: (Type:C295($4->)=Is boolean:K8:9)
															
															$_bo_True:=($5="TRUE") | ($5="YES")
															QUERY:C277($_ptr_Table->; $4->=$_bo_True)
															$_bo_QueryDone:=True:C214
													End case 
													If ($_bo_QueryDone)
														SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
														QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
													End if 
											End case 
									End case 
									
									
									
							End case 
							
							COPY NAMED SELECTION:C331($_ptr_Table->; "◊Preselection")
						End if 
					End if 
				Else 
					If ($_t_Context="")
						
						
						
						UNLOAD RECORD:C212($_ptr_Table->)
						
						READ ONLY:C145($_ptr_Table->)
						
						ALL RECORDS:C47($_ptr_Table->)
						Case of 
							: (Table:C252($_ptr_Table)=Table:C252(->[COMPANIES:2]))
								QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
							: (Table:C252($_ptr_Table)=Table:C252(->[CONTACTS:1]))
								QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
							: (Table:C252($_ptr_Table)=Table:C252(->[PRODUCTS:9]))
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54=0)
							: (Table:C252($_ptr_Table)=Table:C252(->[PERSONNEL:11]))
								QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
								
							: (Table:C252($_ptr_Table)=Table:C252(->[DIARY:12]))
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						End case 
						COPY NAMED SELECTION:C331($_ptr_Table->; "◊Preselection")
					Else 
						REDUCE SELECTION:C351($_ptr_Table->; 0)
						COPY NAMED SELECTION:C331($_ptr_Table->; "◊Preselection")
					End if 
					
				End if 
				If (Not:C34($_bo_StatsAvailable))
					$_bo_StatsView:=False:C215
				Else 
					$_bo_StatsView:=<>SYS_bo_StatsView
				End if 
				If (Not:C34($_bo_GraphsAvailable))
					$_bo_GraphsView:=False:C215
				Else 
					$_bo_GraphsView:=False:C215
				End if 
				Case of 
					: ($_bo_StatsView)
						$DB_l_ViewType:=2
					: ($_bo_GraphsView)
						$DB_l_ViewType:=3
					Else 
						$DB_l_ViewType:=1
				End case 
				If ($_bo_NoHideModule)
					$_bo_HideModuleBar:=False:C215
				End if 
				
				If ($_bo_OpenDIaryHistory)  //open a different window
					
					
				Else 
					$_l_Process:=New process:C317("DBI_DisplayRecords"; 1024000; "VIEW "+Table name:C256($_ptr_Table); $_l_DisplayRecordsTable; "◊Preselection"; $_t_Context; $DB_l_ViewType; $_bo_TabsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; Current process:C322; $_bo_StatsAvailable; $_bo_GraphsAvailable; $_bo_FIltersAvailable; $_bo_SelectionsAvailable; $_l_Module; $_bo_EditInTransaction; $_bo_ReturnSelectRecords)
				End if 
				If ($_bo_ReturnProcesID)
					$_ptr_ReturnProcessIDto->:=$_l_Process
					DB_l_SelectionProcess:=$_l_Process
				End if 
				PROC_SetProcess($_l_Process; 0; Current process:C322)
				CLEAR SEMAPHORE:C144("$LaunchingDisplayWindow")
			End if 
			If ($_bo_ResetCurrent)
				USE NAMED SELECTION:C332("$Temp")
				If (Read only state:C362($_ptr_Table->)=False:C215)
					POP RECORD:C177($_ptr_Table->)
				Else 
					If ($_l_ResettoRecord>0)
						GOTO SELECTED RECORD:C245($_ptr_Table->; $_l_ResettoRecord)
					End if 
				End if 
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DBI_MenuDisplayRecords"; $_t_oldMethodName)
