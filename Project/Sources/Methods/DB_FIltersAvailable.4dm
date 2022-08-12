//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_FIltersAvailable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 13:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FiltersAvailable; $0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_Context; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_FIltersAvailable")
$_bo_FiltersAvailable:=True:C214
Case of 
	: ($1=Table:C252(->[ACTIONS:13]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[ANALYSES:36]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[ANALYSES:36]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[AREAS:3]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CATALOGUE:108]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CONTRACTS_CONTACTS:151]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[COUNTRIES:73]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  //Further analysis
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[HEADINGS:84]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[LAYERS:76]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[SCRIPTS:80]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PERIODS:33]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PERSONNEL:11]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PICTURES:85]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[RESULTS:14]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[ROLES:87]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[SOURCES:6]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[STAGES:45]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[STATUS:4]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[TYPES:5]))
		$_bo_FiltersAvailable:=False:C215
	: ($1=Table:C252(->[INVOICES:39]))
		$_t_Context:=$2
		Case of 
				
			: ($_t_Context="Refund Deposit")  // View invoices only
				$_bo_FiltersAvailable:=False:C215
			: ($_t_Context="Invoice Receipt")
				$_bo_FiltersAvailable:=False:C215
			: ($_t_Context="Undo Receipt")
				$_bo_FiltersAvailable:=False:C215
			: ($_t_Context="Batch Print Created Invoices")
				$_bo_FiltersAvailable:=False:C215
				//dont change the selection.. ..this is used from a view of orders
				
			: ($_t_Context="Batch Print Invoices")
				$_bo_FiltersAvailable:=False:C215
				
			: ($_t_Context="Batch Post Invoices")
				$_bo_FiltersAvailable:=False:C215
			: ($_t_Context="Send Statements")
				$_bo_FiltersAvailable:=False:C215
			: ($_t_Context="Print Remittance Receipts")  // Print remittances and
				$_bo_FiltersAvailable:=False:C215
				
				
				
		End case 
		
End case 
$0:=$_bo_FiltersAvailable
ERR_MethodTrackerReturn("DB_FIltersAvailable"; $_t_oldMethodName)