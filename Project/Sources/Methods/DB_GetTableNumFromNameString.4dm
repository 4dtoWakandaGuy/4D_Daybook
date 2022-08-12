//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetTableNumFromNameString
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2013 07:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_LONGINT:C283($_l_TableRow; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetTableNumFromNameString")

$0:=0
If (Count parameters:C259>=1)
	$_t_TableName:=$1
	Case of 
		: ($_t_TableName="BRANDS")
			$_t_TableName:="Product_BRANDS"
		: ($_t_TableName="GROUPS")
			$_t_TableName:="PRODUCT_GROUPS"
		: ($_t_TableName="FILES")
			$_t_TableName:="IDENTIFIERS"
		: ($_t_TableName="FILES")
			$_t_TableName:="IDENTIFIERS"
		: ($_t_TableName="PRICE GROUPS")
			$_t_TableName:="PRICE_GROUPS"
			
		: ($_t_TableName="CONTRACT TYPES")
			$_t_TableName:="CONTRACT_TYPES"
		: ($_t_TableName="SERVICE CALLS")
			$_t_TableName:="SERVICE_CALLS"
		: ($_t_TableName="ORDER ITEMS")
			$_t_TableName:="ORDER_ITEMS"
		: ($_t_TableName="STOCK ITEMS")
			$_t_TableName:="STOCK_MOVEMENT_ITEMS"
		: ($_t_TableName="PRICE TABLE")
			$_t_TableName:="PRICE_TABLE"
		: ($_t_TableName="TRANS IN")
			$_t_TableName:="TRANSACTION_BATCHES"
		: ($_t_TableName="Trans_Types")
			$_t_TableName:="TRANSACTION_TYPES"
		: ($_t_TableName="Trans_Types")
			$_t_TableName:="TRANSACTION_TYPES"
		: ($_t_TableName="STOCK ITEMS")
			$_t_TableName:="STOCK_MOVEMENT_ITEMS"
		: ($_t_TableName="PRICE TABLE")
			$_t_TableName:="PRICE_TABLE"
		: ($_t_TableName="TRANS IN")
			$_t_TableName:="TRANSACTION_BATCHES"
		: ($_t_TableName="Trans_Types")
			$_t_TableName:="TRANSACTION_TYPES"
		: ($_t_TableName="TAX CODES")
			$_t_TableName:="TAX_CODES"
		: ($_t_TableName="PURCHASES")
			$_t_TableName:="PURCHASE_INVOICES"
		: ($_t_TableName="REC JOURNALS")
			$_t_TableName:="RECURRING_JOURNALS"
		: ($_t_TableName="STOCK MOVEMENTS")
			$_t_TableName:="STOCK_MOVEMENTS"
		: ($_t_TableName="CATEGORIES")
			$_t_TableName:="TIME_BILLING_CATEGORIES"
		: ($_t_TableName="JOB STAGES")
			$_t_TableName:="JOB_STAGES"
		: ($_t_TableName="TIME BUDGETS")
			$_t_TableName:="TIME_BUDGETS"
		: ($_t_TableName="POSTAL CODES")
			$_t_TableName:="POSTAL_CODES"
		: ($_t_TableName="CREDIT STAGES")
			$_t_TableName:="CREDIT_STAGES"
		: ($_t_TableName="QUALITY GROUPS")
			$_t_TableName:="QUALITY_GROUPS"
		: ($_t_TableName="PURCHASE ORDERS")
			$_t_TableName:="PURCHASE_ORDERS"
		: ($_t_TableName="STOCK TYPES")
			$_t_TableName:="STOCK_TYPES"
		: ($_t_TableName="MOVEMENT TYPES")
			$_t_TableName:="MOVEMENT_TYPES"
		: ($_t_TableName="CURRENT STOCK")
			$_t_TableName:="CURRENT_STOCK"
		: ($_t_TableName="JOB TYPES")
			$_t_TableName:="JOB_TYPES"
		: ($_t_TableName="CURRENCY RATES")
			$_t_TableName:="CURRENCY_RATES"
		: ($_t_TableName="MAILSORT A")
			$_t_TableName:="MAILSORT_A"
		: ($_t_TableName="MAILSORT B")
			$_t_TableName:="MAILSORT_B"
		: ($_t_TableName="MAILSORT C")
			$_t_TableName:="MAILSORT_S"
		: ($_t_TableName="MACROS")
			$_t_TableName:="SCRIPTS"
		: ($_t_TableName="MAILSORT D5")
			$_t_TableName:="MAILSORT_D5"
		: ($_t_TableName="MAILSORT D6")
			$_t_TableName:="MAILSORT_D6"
		: ($_t_TableName="MAILSORT MAIL")
			$_t_TableName:="MAILSORT_MAIL"
		: ($_t_TableName="CONTRACT_RECORD_ANALYSIS")
			$_t_TableName:="CONTRACT_RECORD_ANALYSIS"
		: ($_t_TableName="TABLE_RECORD_STATES")
			$_t_TableName:="TABLE_RECORD_STATES"
		: ($_t_TableName="CODE USES")
			$_t_TableName:="CODE_USES"
		: ($_t_TableName="PERSON GROUPS")
			$_t_TableName:="PERSONNEL_GROUPS"
		: ($_t_TableName="FILES NOS")
			$_t_TableName:="IDENTIFIERS_MULTI_NUMBERS"
		: ($_t_TableName="LICENCE UPDATES")
			$_t_TableName:="LICENCE_UPDATES"
		: ($_t_TableName="CUSTOM_FIELDS")
			$_t_TableName:="CUSTOM_FIELDS"
		: ($_t_TableName="FIELD DEFS")
			$_t_TableName:="CUSTOM_FIELD_DEFINITiONS"
		: ($_t_TableName="FIELD DEF PERS")
			$_t_TableName:="CUSTOM_FIELDS_PERSONNEL"
		: ($_t_TableName="WEB ACCESS")
			$_t_TableName:="WEB_ACCESS"
		: ($_t_TableName="CONTACT_RECORD_ANALYSIS")
			$_t_TableName:="CONTACTS_RECORD_ANALYSIS"
		: ($_t_TableName="PERSONNEL_DIARY ACCESS")
			$_t_TableName:="PERSONNEL_DIARY_ACCESS"
		: ($_t_TableName="SERVICE CALLS_PRODUCTS")
			$_t_TableName:="SERVICE_CALLS_PRODUCTS"
		: ($_t_TableName="TRANS IN_TRANS SUB")
			$_t_TableName:="TRANSACTION_BATCH_ITEMS"
		: ($_t_TableName="PURCHASES_ITEMS")
			$_t_TableName:="PURCHASE_INVOICE_ITEMS"
		: ($_t_TableName="PURCHASES_ALLOCATIONS")
			$_t_TableName:="PURCHASE_INVOICE_ALLOCATIONS"
		: ($_t_TableName="REC JOURNALS_DATES")
			$_t_TableName:="REC_JOURNALS_DATES"
		: ($_t_TableName="PURCHASE ORDERS_ITEMS")
			$_t_TableName:="PURCHASE_ORDERS_ITEMS"
	End case 
	$_l_TableRow:=Find in array:C230(<>DB_at_TableNames; $_t_TableName)
	
	$0:=$_l_TableRow
	
End if 
ERR_MethodTrackerReturn("DB_GetTableNumFromNameString"; $_t_oldMethodName)