//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_FieldHasFilter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_ObjectExists;0)
	ARRAY LONGINT:C221($_al_LBSizes; 0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ObjectsToDisplay; 0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(ANAL_at_AnalName;0)
	//ARRAY TEXT(Lay_at_ObjectName;0)
	//ARRAY TEXT(LAY_at_ObjectNamed;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_DisplayAnalysis; $_bo_DisplayAreas; $_bo_DisplayCollections; $_bo_DisplayContractTypes; $_bo_DisplayCreditStages; $_bo_DisplayCurrencies; $_bo_DisplayFIlters; $_bo_DisplayLayers; $_bo_DisplayLocations; $_bo_DisplayMovementTypes)
	C_BOOLEAN:C305($_bo_DisplayOrderAreas; $_bo_DisplayOrderTypes; $_bo_DisplayPeriods; $_bo_DisplaySalesPersons; $_bo_DisplaySalesSources; $_bo_DisplayStates; $_bo_DisplayStockTypes; $_bo_ObjectExists; $_bo_ShowContractStates; $_bo_ShowCreditStage; $_bo_ShowInvoiceStates)
	C_BOOLEAN:C305($_bo_ShowStates; $0; CUR_bo_FilterZeros; LAY_bo_AnalSetup; LAY_bo_BCAnalSetup; LAY_bo_ContStatesSetup; LAY_bo_CSAnalSetup; LAY_bo_INVAnalSetup; LAY_bo_InvoiceStateSetup; LAY_bo_JBAnalSetup; LAY_bo_PIAnalSetup)
	C_BOOLEAN:C305(LAY_bo_POAnalSetup; LAY_bo_SLAnalSetup; LAY_bo_SMAnalSetup; LAY_bo_TRAnalSetup; SI_bo_FilterAllocated; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_analysesWidth; $_l_areasWidth; $_l_CollectionsWidth; $_l_ContractTypesWidth; $_l_CoTypeWidth; $_l_CRStagesWidth; $_l_CurrenciesTotalWidth; $_l_CurrenciesWidth; $_l_DropDownsToDisplay; $_l_LayersWidth; $_l_LisboxSize)
	C_LONGINT:C283($_l_ListboxesToDisplay; $_l_LocationsWidth; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_MovementTypeWidths; $_l_MoveTypesWidth; $_l_ObjectExists; $_l_RadioButtonstoDisplay; $_l_RecordStatesWidth; $_l_SelectedField; $_l_SelectedTable)
	C_LONGINT:C283($_l_SourcesWidth; $_l_SPWidth; $_l_StockTypeWidth; $_l_ViewedStateRow; $1; $2; CONT_l_Both; CONT_l_Closed; CONT_l_Open; INV_l_Both; INV_l_Closed)
	C_LONGINT:C283(INV_l_Open)
	C_TEXT:C284($_t_Context; $_t_oldMethodName; $_t_ViewedStateType; DB_t_CurrentContext)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_FieldHasFilter")
$0:=False:C215
If (Count parameters:C259>=2)
	$_l_SelectedTable:=$1
	$_l_SelectedField:=$2
	Case of 
		: ($_l_SelectedTable=Table:C252(->[COMPANIES:2]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Sales_Person:29))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Country:8))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]County_or_State:6))
					$0:=True:C214
					
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Area:11))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Company_Type:13))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Status:12))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[COMPANIES:2]Source:14))
					$0:=True:C214
			End case 
			
			
			//size
		: ($_l_SelectedTable=Table:C252(->[ACCOUNT_BALANCES:34]))
			//TRACE
			Case of 
				: ($_l_SelectedField=Field:C253(->[ACCOUNT_BALANCES:34]Period_Code:4))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ACCOUNT_BALANCES:34]Analysis_Code:1))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ACCOUNT_BALANCES:34]Currency_Code:6))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ACCOUNT_BALANCES:34]Layer_Code:5))
					$0:=True:C214
			End case 
			
			
		: ($_l_SelectedTable=Table:C252(->[CONTACTS:1]))
			// SALES PERSON(SAME AS CO)
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[CONTACTS:1]Sales_Person:25))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CONTACTS:1]Role:11))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CONTACTS:1]Status:14))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CONTACTS:1]Source:16))
					$0:=True:C214
			End case 
			
			
		: ($_l_SelectedTable=Table:C252(->[ACCOUNTS:32]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[ACCOUNTS:32]Group_Heading:6))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ACCOUNTS:32]PB:4))
					$0:=True:C214
			End case 
			
		: ($_l_SelectedTable=Table:C252(->[PRODUCTS:9]))
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[PRODUCTS:9]Group_Code:3))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PRODUCTS:9]Brand_Code:4))
					$0:=True:C214
			End case 
			//catalogue
			//$_l_CollectionsWidth:=DB_setOutFilterCollections (->LAY_at_ObjectNamed;->LAY_abo_ObjectExists;->Lay_at_ObjectName;->$_at_ObjectsToDisplay;->$_bo_DisplayCollections;->$_l_MaxLBWidth;->$_l_ListboxesToDisplay;->$_l_LisboxSize;->$_al_LBSizes;->$_l_MaxLabelWidth)
			
			
			
		: ($_l_SelectedTable=Table:C252(->[ORDERS:24])) | ($_l_SelectedTable=Table:C252(->[ORDER_ITEMS:25]))
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]Order_Period:42)) | ($_l_SelectedField=Field:C253(->[ORDERS:24]Order_Date:4))
					
					
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]Person:5))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]Order_Type:43))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]Area_Code:35))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]Source:18))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[ORDERS:24]State:15))
					$0:=True:C214
					//source
					
			End case 
			
		: ($_l_SelectedTable=Table:C252(->[CONTRACTS:17]))
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[CONTRACTS:17]Contract_Type_Code:4))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CONTRACTS:17]End_Date:6))
					//filter by open closed
					$0:=True:C214
			End case 
			
			
		: ($_l_SelectedTable=Table:C252(->[CURRENT_STOCK:62]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Stock_Type:3))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Location:8))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Analysis_Code:10))
					If (<>StockAnal)
						$0:=True:C214
					End if 
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Layer_Code:12))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Layer_Code:12))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Currency_Code:11))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[CURRENT_STOCK:62]Quantity:4))  //Filter zeros
					$0:=True:C214
					
			End case 
			
			
			
			
			
			
		: ($_l_SelectedTable=Table:C252(->[DIARY:12]))  //<<  << <
			
		: ($_l_SelectedTable=Table:C252(->[DOCUMENTS:7]))  //<< <,
			
			
		: ($_l_SelectedTable=Table:C252(->[INVOICES:39])) | ($_l_SelectedTable=Table:C252(->[INVOICES_ITEMS:161]))
			
			$_t_Context:=DB_t_CurrentContext
			$_bo_ShowCreditStage:=True:C214
			Case of 
				: ($_t_Context="ViewCreditnotes") | ($_t_Context="View Credit notes")
					$_bo_ShowCreditStage:=False:C215
					
				: ($_t_Context="ViewReceipts") | ($_t_Context="View Receipts")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="ViewDeposits") | ($_t_Context="View Deposits")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Proformas") | ($_t_Context="View Proformas")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Invoices") | ($_t_Context="View Invoices")  // View invoices only
					
					$_bo_ShowCreditStage:=True:C214
				: ($_t_Context="Refund Deposit")  // View invoices only
					
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Invoice Receipt")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Undo Receipt")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Batch Print Created Invoices")
					$_bo_ShowCreditStage:=False:C215
					//dont change the selection.. ..this is used from a view of orders
					
				: ($_t_Context="Batch Print Invoices")
					$_bo_ShowCreditStage:=False:C215
					
				: ($_t_Context="Batch Post Invoices")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Send Statements")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Print Remittance Receipts")  // Print remittances and
					$_bo_ShowCreditStage:=False:C215
				Else   //all sales ledger items
					$_bo_ShowCreditStage:=True:C214
			End case 
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Credit_Stage:22)) & ($_bo_ShowCreditStage)
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Period_Code:13))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Analysis_Code:17))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Layer_Code:38))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Currency_Code:27))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Area_Code:29))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[INVOICES:39]Total_Due:7))  //filter paid unpaid
					$0:=True:C214
			End case 
			
			
		: ($_l_SelectedTable=Table:C252(->[JOB PERSONNEL:48]))
			
			//Job type
			
		: ($_l_SelectedTable=Table:C252(->[JOB_STAGES:47]))
			
			//type
			//sales person
			//analysis
			
			//layers
			//currency
		: ($_l_SelectedTable=Table:C252(->[JOBS:26]))
			
			//type
			//stage
			//sales person
			//analysis
			Case of 
				: ($_l_SelectedField=Field:C253(->[JOBS:26]Analysis_Code:24))
					$0:=True:C214
			End case 
			
			//layers
			//currency
			
		: ($_l_SelectedTable=Table:C252(->[PROJECTS:89]))
			
			//state
			//type
			//manager
		: ($_l_SelectedTable=Table:C252(->[PURCHASE_ORDERS:57])) | ($_l_SelectedTable=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			//state
			Case of 
				: ($_l_SelectedField=Field:C253(->[PURCHASE_ORDERS:57]Record_State:19))
					
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_ORDERS:57]Analysis_Code:15))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_ORDERS:57]Layer_Code:17))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_ORDERS:57]Currency_Code:16))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_ORDERS:57]Posted_Date:13))
					$0:=True:C214
			End case 
		: ($_l_SelectedTable=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_SelectedTable=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[PURCHASE_INVOICES:37]Period_Code:3))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_INVOICES:37]Analysis_Code:15))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_INVOICES:37]Layer_Code:28))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[PURCHASE_INVOICES:37]Currency_Code:23))
					$0:=True:C214
			End case 
			//deliverred, not delivered- not applicable to payments
			//credit stage
			//not posted, batched, posted
			
		: ($_l_SelectedTable=Table:C252(->[SERVICE_CALLS:20]))  //
			//open closed both
			//contract type
			//problem type
			//solution type
			//call handler
		: ($_l_SelectedTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //note that most of the filter fields relating to this are on stock movements-so only iff they are displayed will this be asked-but we wont be here
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12))
					$0:=True:C214
			End case 
		: ($_l_SelectedTable=Table:C252(->[STOCK_LEVELS:58]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[STOCK_LEVELS:58]Layer_Code:9))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_LEVELS:58]Analysis_Code:7))
					If (<>StockAnal)
						$0:=True:C214
					End if 
				: ($_l_SelectedField=Field:C253(->[STOCK_LEVELS:58]Currency_Code:8))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_LEVELS:58]Stock_Type:2))
					$0:=True:C214
					
			End case 
			
			
		: ($_l_SelectedTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENTS:40]Movement_Type:6))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENTS:40]Analysis_Code:9))
					If (<>StockAnal)
						$0:=True:C214
					End if 
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENTS:40]Layer_Code:11))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENTS:40]Currency_Code:10))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[STOCK_MOVEMENTS:40]Posted_Date:7))  //period code
					$0:=True:C214
			End case 
			
			
			
		: ($_l_SelectedTable=Table:C252(->[TRANSACTION_BATCHES:30]))
			Case of 
				: ($_l_SelectedField=Field:C253(->[TRANSACTION_BATCHES:30]Posted_Date:16))
					$0:=True:C214
			End case 
			//invoice/purchase/nominal/job
		: ($_l_SelectedTable=Table:C252(->[TRANSACTIONS:29]))
			
			Case of 
				: ($_l_SelectedField=Field:C253(->[TRANSACTIONS:29]Analysis_Code:2))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[TRANSACTIONS:29]Period_Code:12))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[TRANSACTIONS:29]Layer_Code:23))
					$0:=True:C214
				: ($_l_SelectedField=Field:C253(->[TRANSACTIONS:29]Currency_Code:22))
					$0:=True:C214
			End case 
			
			
			
			
		: ($_l_SelectedTable=Table:C252(->[WORKFLOW_CONTROL:51]))
			
	End case 
End if 
ERR_MethodTrackerReturn("DB_FieldHasFilter"; $_t_oldMethodName)