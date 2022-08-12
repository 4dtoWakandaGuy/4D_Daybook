//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CountrecordsFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 13:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CountrecordsFromSelection")
$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
CREATE SET:C116($_ptr_Table->; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
vText:=""

QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="CountRecords")
If (Records in selection:C76([SCRIPTS:80])>0)
	Macro("CountRecords")
End if 
If (vText="")
	Gen_Count($_ptr_Table; "ListboxSet0")
	//only some tables have specific count handlers
	
	Case of 
		: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
			
			Companies_OutCo
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
			Sources_OutCoun
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
			Products_OutCou
		: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
			Diary_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
			Contracts_OutCo
		: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
			Calls_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
			
			Orders_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
			
			OrderI_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
			
			Jobs_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			StockI_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
			PriceT_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
			Trans_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
			TransB_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
			Accounts_OutCount
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
			Purchases_OutCo
		: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
			Invoices_OutCou
		: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_STAGES:47]))
			JobStages_OutCo
		: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB PERSONNEL:48]))
			JobPers_OutCoun
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57]))
			PurchOrd_OutCou
		: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
			StockLev_OutCou
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
			StockCurr_OutCo
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
			
			
			Projects_OutCou
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ACTIONS:13]))
			
	End case 
	
	Gen_Alert(vText; "")
Else 
	Gen_Alert(vText; "")
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("DB_CountrecordsFromSelection"; $_t_oldMethodName)