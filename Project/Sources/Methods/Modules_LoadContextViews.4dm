//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_LoadContextViews
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    24/11/2010 16:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_LoadContextViews")
ARRAY LONGINT:C221($2->; 0)
ARRAY TEXT:C222($3->; 0)

Case of 
	: ($1=Module_JobCosting)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Jobs"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[JOBS:26]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Projects"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[PROJECTS:89]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_JobStages"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[JOB_STAGES:47]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_JobPersonnel"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[JOB PERSONNEL:48]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Invoices"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[INVOICES:39]))
		
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
	: ($1=Module_SalesLedger)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Invoices"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[INVOICES:39]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
		
	: ($1=Module_PurchaseLedger)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Purchases"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[PURCHASE_INVOICES:37]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
	: ($1=Module_PurchaseOrders)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PurchaseOrders"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[PURCHASE_INVOICES:37]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
	: ($1=Module_Companies)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
	: ($1=Module_DataManager)
		
		//Areas
		//postcodes
		//countries
		//address formats
		//PostCodes""
		//`;"Countries";
		//"Address Formats"
		//;"Status"
		//;"Types"
		//;"Sources"
		//;"Publications";
		//"Further Analyses"
		//;"Roles";
		//"`Personnel Groups";
		//"Personnel & Resources"
		//;"Groups";
		//"Brands"
		//;"Price Groups";
		//"Macros";
		//"Pictures";
		//"Terminology";""
		//;"Further Fields"
		//"Stock Types";
		//"Stock Locations";
		//"Movement Types";
		//"Credit Stages";
		//;"Accounts";"Account Headings"
		//;"Transaction Types";
		//"Analyses";""`
		//Layers";"
		//"Tax Codes";
		//"`Currencies")
		//WF Actions""
		//;"Results"
		//;"Workflow Manager"
		//;"Personnel Catagories";
		//"Job Stages"
		//;"Job Types"
		//;"Problems"
		//;"Solutions"
		//;"Contract Types")
	: ($1=Module_DiaryManager)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
	: ($1=Module_Enquiries)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Enquiries"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[ORDERS:24])+10000)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
		
	: ($1=Module_NominalLedger)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_TransBatches"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[TRANSACTION_BATCHES:30]))
		
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_AccBalances"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[ACCOUNT_BALANCES:34]))
		
		
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_BankRecon"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[TRANSACTIONS:29])+10000)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_CurrencyRates"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CURRENCY_RATES:72]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Transactions"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[TRANSACTIONS:29]))
		
		
		
	: ($1=Module_StockControl)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_StockMovements"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[STOCK_MOVEMENTS:40]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_StockItems"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_CurrentStockList"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CURRENT_STOCK:62]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_StockLevelsValues"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[STOCK_LEVELS:58]))
		
		
		
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
		
	: ($1=Module_ServiceCentre)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_ServiceCalls"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[SERVICE_CALLS:20]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_OutstandingCalls"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[SERVICE_CALLS:20])+10000)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contracts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTRACTS:17]))
		
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
	: ($1=Module_WPManager)
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_LettersQuotes"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[DIARY:12]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		
		
		
		
		
	: ($1=Module_SalesOrders)
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Orders"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[ORDERS:24]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_OrderItems"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[ORDER_ITEMS:25]))
		
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Companies"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Contacts"))
		APPEND TO ARRAY:C911($2->; Table:C252(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable)<2))  //Price Table"
			//"Products"
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			
		Else 
			//Products";" `"View Price Table")
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_Products"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_PriceTable"))
			APPEND TO ARRAY:C911($2->; Table:C252(->[PRICE_TABLE:28]))
		End if 
		
		
End case 
ERR_MethodTrackerReturn("Modules_LoadContextViews"; $_t_oldMethodName)