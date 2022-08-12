//%attributes = {}
If (False:C215)
	//Project Method Name:      Array_CopyFiles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/08/2012 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283($_l_ArraySize; $_l_Index)
	C_POINTER:C301($_Ptr_Array; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Array_CopyFiles")
$_l_ArraySize:=Size of array:C274(<>DB_at_TableNames)
ARRAY TEXT:C222(GEN_at_Identity; 0)

If (False:C215)  //BSW 17/02/03 Engineering new reported error 61 so I am retyping these arrays
	//Array Text(GEN_at_Identity;$_l_ArraySize)
End if 
If (Count parameters:C259>=1)
	$_Ptr_Array:=$1
	
Else 
	$_Ptr_Array:=->GEN_at_Identity
End if 

For ($_l_Index; 1; $_l_ArraySize)
	$_t_TableName:=""
	Case of 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COMPANIES:2]))
			$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTACTS:1]))
			$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNT_BALANCES:34])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACC_Bank_Statements:198])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_GROUPS:10])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[HEADINGS:84]))
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS:32])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_ANALYSES:157])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_LAYERS:156])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ANALYSES:36])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76]))
			
			//data manager and nominal ledger
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACTIONS:13]))
			If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
			//Stock movements and data manager
			If (DB_GetModuleSettingByNUM(Module_StockControl)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
			//orders manager and data manager
			If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[AREAS:3])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COUNTRIES:73]))
			
			//data manager
			If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
			If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SUBSCRIPTIONS:93]))
			If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTION_BATCHES:30])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTIONS:29]))
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
			
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CREDIT_STAGES:54]))
			//sales ledger and data manager
			If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENCIES:71])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_TYPES:65])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LOCATIONS:61])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SCRIPTS:80])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
			
			//data manager
			If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_BRANDS:8])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CATALOGUE:108])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COMPONENTS:86]))
			//products and data manager
			If (DB_GetModuleSettingByNUM(Module_Products)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DOCUMENTS:7]))
			//DB_GetModuleSettingByNUM (Module_WPManager)
			If (DB_GetModuleSettingByNUM(Module_WPManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TIME_BILLING_CATEGORIES:46])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACT_TYPES:19]))
			//service control and data manger
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACTS:17]))
			//Service control
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENT_STOCK:62]))
			//stock control
			If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DIARY:12]))
			//diary manger
			If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
			
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES:39])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES_ITEMS:161]))
			If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB PERSONNEL:48])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_STAGES:47])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOBS:26]))
			//Job costing
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
			If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
		: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCTS:9]))
			If (DB_GetModuleSettingByNUM(Module_Products)>1)
				$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
			End if 
			
	End case 
	
	//$_t_TableName:=(<>DB_at_TableNames{$_l_Index})
	If ($_t_TableName#"")
		If (Size of array:C274($_Ptr_Array->)<$_l_Index)
			APPEND TO ARRAY:C911($_Ptr_Array->; $_t_TableName)
		Else 
			$_Ptr_Array->{$_l_Index}:=$_t_TableName
		End if 
	End if 
	$_t_TableName:=""
End for 
ERR_MethodTrackerReturn("Array_CopyFiles"; $_t_oldMethodName)
