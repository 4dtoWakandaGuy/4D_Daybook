//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_SetSearchParameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SRCH_SetSearchParameters
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_NoAdvanced; $_bo_ScreenSettings)
	C_LONGINT:C283($2)
	C_REAL:C285($1; SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_oldMethodName; $3; SD2_T_SearchValue; SRCH_t_Prompt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_SetSearchParameters")
//C_LONGINT($1)
ARRAY TEXT:C222(SRCH_at_SearchOptions; 0)
SRCH_t_Prompt:=""
SD2_T_SearchValue:=""
SRCH_r_Timer:=0
SRCH_r_TimerOLD:=0
SET TIMER:C645(0)

$_bo_NoAdvanced:=False:C215
If (Count parameters:C259>=1)
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			SRCH_t_Prompt:=Term_FSWT("Company, Postcode, Tel or Surname to find...")
			
			
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company Code: ")
			
			
		: ($1=Table:C252(->[CONTACTS:1]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contacts: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			//typo fixed (reversed space and colon at the end) 04/07/08 -kmw
			SRCH_t_Prompt:=Term_FSWT("Name, Code or Company to find")
			
		: ($1=Table:C252(->[DIARY:12]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Diary Code: ")  //typo fixed (removed extra space and added to end) 04/07/08 -kmw
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")  //typo fixed 04/07/08 (added space to end) -kmw
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")  //typo fixed 04/07/08 (added space to end) -kmw
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
				APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Order: ")  //typo fixed 04/07/08 (added space to end) -kmw
			End if 
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
				//APPEND TO ARRAY(SRCH_at_SearchOptions;"Job:")
				APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job: ")  //typo fixed 04/07/08 (added space to end) -kmw
			End if 
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>=2)
				APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Call: ")  //typo fixed 04/07/08 (added space to end) -kmw
			End if 
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Rec No: ")  //typo fixed 04/07/08 (added space to end) -kmw
		: ($1=Table:C252(->[DOCUMENTS:7]))
			$_bo_NoAdvanced:=True:C214
			If (Count parameters:C259>=2)  //Coerce to something specific
				If (Count parameters:C259>=3) & ($2=0)
					Case of 
						: ($3="Letters")
					End case 
				Else 
					Case of 
						: ($2=2)  //Creating an email
							//APPEND TO ARRAY(SRCH_at_SearchOptions;"Company:")
							APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")  //typo fixed 04/07/08 (added space to end) -kmw
							//APPEND TO ARRAY(SRCH_at_SearchOptions;"Contact:")
							APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")  //typo fixed 04/07/08 (added space to end) -kmw
							If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Order:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Order: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
							If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Purchase Order:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Order: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
							
							
							If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Job:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
							If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Call:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Call: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
							If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Invoice:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Invoice: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
							If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)
								//APPEND TO ARRAY(SRCH_at_SearchOptions;"Purchase Invoice:")
								APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Invoice: ")  //typo fixed 04/07/08 (added space to end) -kmw
							End if 
					End case 
				End if 
			Else 
				
			End if 
		: ($1=Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Product: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company(Supplier): ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Components of: ")
			SRCH_t_Prompt:="Product Code(s) or Name to find..."
		: ($1=Table:C252(->[ACTIONS:13]))
		: ($1=Table:C252(->[ANALYSES:36]))
		: ($1=Table:C252(->[AREAS:3]))
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		: ($1=Table:C252(->[CONTRACTS:17]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contract: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company Name: ")
			SRCH_t_Prompt:="Contract or Company Code to find..."
		: ($1=Table:C252(->[COUNTRIES:73]))
		: ($1=Table:C252(->[CREDIT_STAGES:54]))
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				SRCH_t_Prompt:="Type/Product, Serial or Location to find..."
			Else 
				SRCH_t_Prompt:="Type/Product or Location to find..."
			End if 
			
		: ($1=Table:C252(->[DIARY:12]))
		: ($1=Table:C252(->[DOCUMENTS:7]))
		: ($1=Table:C252(->[DIARY:12]))
		: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
			$_bo_NoAdvanced:=True:C214
		: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
			$_bo_NoAdvanced:=True:C214
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		: ($1=Table:C252(->[INVOICES:39]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Invoice: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Order: ")
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)
				APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job: ")
			End if 
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			SRCH_t_Prompt:="Number, Company or Date..."
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Invoice: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			SRCH_t_Prompt:="Invoice, Company or Product Code to find..."
		: ($1=Table:C252(->[JOB PERSONNEL:48]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job Person: ")
			
			SRCH_t_Prompt:="Job, Stage or Person to find..."
		: ($1=Table:C252(->[JOB_STAGES:47]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job Stage Code: ")
			SRCH_t_Prompt:="Job or Stage to find..."
		: ($1=Table:C252(->[JOB_TYPES:65]))
		: ($1=Table:C252(->[JOBS:26]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Job: ")
			SRCH_t_Prompt:="Job, Company or Contact to find..."
			
		: ($1=Table:C252(->[LAYERS:76]))
		: ($1=Table:C252(->[LOCATIONS:61]))
		: ($1=Table:C252(->[SCRIPTS:80]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Macro: ")
			SRCH_t_Prompt:="Code, Group, Name, F Key or Person to find..."
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		: ($1=Table:C252(->[ORDERS:24]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Order: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "PO: ")
			SRCH_t_Prompt:="Company, Contact or Order Code to find..."
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Order: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			SRCH_t_Prompt:="Order, Company or Product Code to find..."
			
		: ($1=Table:C252(->[PERIODS:33]))
		: ($1=Table:C252(->[PERSONNEL:11]))
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		: ($1=Table:C252(->[PICTURES:85]))
		: ($1=Table:C252(->[PRICE_GROUPS:18]))
		: ($1=Table:C252(->[PRICE_TABLE:28]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Price Code: ")
			SRCH_t_Prompt:="Price Code, Group, Brand, Product or Company to find..."
			$_bo_NoAdvanced:=True:C214
		: ($1=Table:C252(->[PROBLEMS:22]))
		: ($1=Table:C252(->[PROJECTS:89]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Project: ")
			SRCH_t_Prompt:="Project, Company or Contact to find..."
		: ($1=Table:C252(->[PUBLICATIONS:52]))
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Order No: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Sales Order No: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			SRCH_t_Prompt:="Supplier or Purch Ord No to find..."
			
		: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			//```need to create a search for this one
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Invoice: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			SRCH_t_Prompt:="Purchase Code, Inv_No or Company to find..."
		: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			//```need to create a search for this one
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			//²
		: ($1=Table:C252(->[RESULTS:14]))
			//²
		: ($1=Table:C252(->[ROLES:87]))
			//²
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Contact: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Call: ")
			SRCH_t_Prompt:="Call Code, Company or Person to find..."
			
		: ($1=Table:C252(->[SOLUTIONS:23]))
			//²
		: ($1=Table:C252(->[STOCK_LEVELS:58]))
			SRCH_t_Prompt:=Term_StoWT("Stock Type/Product to find...")
		: ($1=Table:C252(->[STAGES:45]))
			//²
		: ($1=Table:C252(->[STATUS:4]))
			//²
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Movement: ")
			SRCH_t_Prompt:="Movement, Our Order or Product to find..."
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
			SRCH_t_Prompt:="Movt Code, Type, Company or Date to find..."
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			//²
		: ($1=Table:C252(->[TAX_CODES:35]))
			//²
		: ($1=Table:C252(->[TERMINOLOGY:75]))
			//²
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
			SRCH_t_Prompt:="Batch No or Date to find.."
		: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			//```need to create a search for this one
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			//²
		: ($1=Table:C252(->[TRANSACTIONS:29]))
			//²
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Transaction Batch: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Account Code: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Period Code: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Currency Code: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Company: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Invoice: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Invoice: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Purchase Code: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Analysis Code: ")
			APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Layer Code: ")
		: ($1=Table:C252(->[TYPES:5]))  //Company Types/Contact Types
			//²
		: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
			//²
			
			
			
	End case 
	If ($_bo_NoAdvanced=False:C215)
		APPEND TO ARRAY:C911(SRCH_at_SearchOptions; "Advanced Query...")
		//Here calculate if the total number of records in the table will fit on screen and if they will hide the
		//THis will be done in another method
	End if 
	
	
	If (False:C215)
		$_bo_ScreenSettings:=False:C215
		
		If (Count parameters:C259>=2)
			//$_bo_ScreenSettings:=$2
		Else 
			//$_bo_ScreenSettings:=True
		End if 
	Else 
		$_bo_ScreenSettings:=True:C214
	End if 
	
	If ($_bo_ScreenSettings)
		DB_HideShowSearch($1)
	End if 
End if 
ERR_MethodTrackerReturn("SRCH_SetSearchParameters"; $_t_oldMethodName)
