//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_FixProdCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrentStockRecordsToFix; 0)
	ARRAY LONGINT:C221($_al_LevelDoesNotExist; 0)
	ARRAY LONGINT:C221($_al_StockLevelRecordsToFix; 0)
	ARRAY TEXT:C222($_at_StockTypes; 0)
	C_LONGINT:C283($_l_CurrentStockItemNumber; $_l_Index; $_l_StockLevelID; $_l_StockTypeRow)
	C_REAL:C285($_r_AllocatedCost; $_r_AllocatedLevel; $_r_CurrentStockCostPrice; $_r_CurrentStockQuantity; $_r_FreeCost; $_r_FreeLevel)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_CurrentStockLocation; $_t_LayerCode; $_t_oldMethodName; $_t_ProductCode; $_t_ProductStripped; $_t_SLProductStripped; $_t_StockType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_FixProdCodes")
//this method checks the product codes on data
//because the product code is
//Used in all the relations to  products(sales/stock/purchases)
//changing a product code has far reaching effects in terms of
//causing problems
//I will change the relationships in the future so this does not happen
//but for the moment we need to clean up

ALL RECORDS:C47([PRODUCTS:9])
FIRST RECORD:C50([PRODUCTS:9])
READ WRITE:C146([PRODUCTS:9])
QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11="")
SELECTION TO ARRAY:C260([STOCK_LEVELS:58]; $_al_StockLevelRecordsToFix)
QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14="")
SELECTION TO ARRAY:C260([CURRENT_STOCK:62]; $_al_CurrentStockRecordsToFix)
Open window:C153(40; 60; 450; 150; -1984)
CREATE SET:C116([PRODUCTS:9]; "ALL")

For ($_l_Index; 1; Records in selection:C76([PRODUCTS:9]))
	USE SET:C118("ALL")
	GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_Index)
	
	ERASE WINDOW:C160
	MESSAGE:C88([PRODUCTS:9]Product_Code:1)
	$_t_ProductCode:=[PRODUCTS:9]Product_Code:1
	$_t_ProductStripped:=STOCK_CLEANCODE([PRODUCTS:9]Product_Code:1)
	If ($_t_ProductCode#$_t_ProductStripped)
		//this has changed the product code
		//```
		MESSAGE:C88("FIXING")
		
		READ WRITE:C146([SOURCES:6])
		QUERY:C277([SOURCES:6]; [SOURCES:6]Product_Code:6=$_t_ProductCode)
		DB_lockFile(->[SOURCES:6])
		APPLY TO SELECTION:C70([SOURCES:6]; [SOURCES:6]Product_Code:6:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[SOURCES:6]))
		UNLOAD RECORD:C212([SOURCES:6])
		READ ONLY:C145([SOURCES:6])
		//```````
		READ WRITE:C146([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_t_ProductCode)
		DB_lockFile(->[DIARY:12])
		APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Product_Code:13:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		UNLOAD RECORD:C212([DIARY:12])
		READ ONLY:C145([DIARY:12])
		//```````
		If (False:C215)
			
		End if 
		
		//```
		READ WRITE:C146([ORDER_ITEMS:25])
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode)
		DB_lockFile(->[ORDER_ITEMS:25])
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
		READ ONLY:C145([ORDER_ITEMS:25])
		
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode)
		DB_lockFile(->[STOCK_MOVEMENT_ITEMS:27])
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		
		READ WRITE:C146([PRICE_TABLE:28])
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_ProductCode)
		DB_lockFile(->[PRICE_TABLE:28])
		APPLY TO SELECTION:C70([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PRICE_TABLE:28]))
		UNLOAD RECORD:C212([PRICE_TABLE:28])
		READ ONLY:C145([PRICE_TABLE:28])
		
		READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
		//QUERY([PURCHASES_ITEMS];[PURCHASES_ITEMS]Parent_Record_Code=[PURCHASES]Purchase Code)
		
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1=$_t_ProductCode)
		
		APPLY TO SELECTION:C70([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1:=$_t_ProductStripped)
		UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
		READ ONLY:C145([PURCHASE_INVOICES:37])
		//````
		
		READ WRITE:C146([INVOICES_ITEMS:161])
		
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Product_Code:1=$_t_ProductCode)
		APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Product_Code:1:=$_t_ProductStripped)
		UNLOAD RECORD:C212([INVOICES:39])
		READ ONLY:C145([INVOICES:39])
		
		//``````
		READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
		//QUERY([PURCHASE ORDERS_ITEMS];[PURCHASE ORDERS_ITEMS]Parent_record_code=[PURCHASES]Purchase Code)
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=$_t_ProductCode)
		APPLY TO SELECTION:C70([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1:=$_t_ProductStripped)
		UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
		READ ONLY:C145([PURCHASE_ORDERS:57])
		
		//```
		READ WRITE:C146([STOCK_LEVELS:58])
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode)
		DB_lockFile(->[STOCK_LEVELS:58])
		APPLY TO SELECTION:C70([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_LEVELS:58]))
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		READ ONLY:C145([STOCK_LEVELS:58])
		
		READ WRITE:C146([CURRENT_STOCK:62])
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode)
		DB_lockFile(->[CURRENT_STOCK:62])
		APPLY TO SELECTION:C70([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		READ ONLY:C145([CURRENT_STOCK:62])
		
		READ WRITE:C146([COMPONENTS:86])
		QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$_t_ProductCode)
		DB_lockFile(->[COMPONENTS:86])
		APPLY TO SELECTION:C70([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1:=$_t_ProductStripped)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPONENTS:86]))
		UNLOAD RECORD:C212([COMPONENTS:86])
		READ ONLY:C145([COMPONENTS:86])
		USE SET:C118("ALL")
		GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_Index)
		[PRODUCTS:9]Product_Code:1:=$_t_ProductStripped
		DB_SaveRecord(->[PRODUCTS:9])
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
		
	End if 
	
	NEXT RECORD:C51([PRODUCTS:9])
End for 



READ WRITE:C146([STOCK_LEVELS:58])  //````````
For ($_l_Index; 1; Size of array:C274($_al_StockLevelRecordsToFix))
	GOTO RECORD:C242([STOCK_LEVELS:58]; $_al_StockLevelRecordsToFix{$_l_Index})
	
	While (Semaphore:C143("StockLevel"+[STOCK_LEVELS:58]Product_Code:1))  //Prevent any other process from creating the same stock level
		DelayTicks(2)
	End while 
	
	$_t_ProductCode:=[STOCK_LEVELS:58]Product_Code:1
	$_t_StockType:=[STOCK_LEVELS:58]Stock_Type:2
	$_r_FreeLevel:=[STOCK_LEVELS:58]Free_Level:3
	$_r_AllocatedLevel:=[STOCK_LEVELS:58]Allocated_Level:4
	$_r_FreeCost:=[STOCK_LEVELS:58]Free_Cost:5
	$_r_AllocatedCost:=[STOCK_LEVELS:58]Allocated_Cost:6
	$_t_AnalysisCode:=[STOCK_LEVELS:58]Analysis_Code:7
	$_t_CurrencyCode:=[STOCK_LEVELS:58]Currency_Code:8
	$_t_LayerCode:=[STOCK_LEVELS:58]Layer_Code:9
	$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
	$_t_SLProductStripped:=STOCK_CLEANCODE([STOCK_LEVELS:58]Product_Code:1)
	If ([STOCK_LEVELS:58]Product_Code:1#$_t_SLProductStripped)
		[STOCK_LEVELS:58]Product_Code:1:=$_t_SLProductStripped
		DB_SaveRecord(->[STOCK_LEVELS:58])
		AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
	End if 
	If ($_t_StockType#"")
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_SLProductStripped; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]X_ID:10#$_l_StockLevelID)
		If (Records in selection:C76([STOCK_LEVELS:58])>=1)
			[STOCK_LEVELS:58]Free_Level:3:=[STOCK_LEVELS:58]Free_Level:3+$_r_FreeLevel
			[STOCK_LEVELS:58]Allocated_Level:4:=[STOCK_LEVELS:58]Allocated_Level:4+$_r_AllocatedLevel
			[STOCK_LEVELS:58]Free_Cost:5:=[STOCK_LEVELS:58]Free_Cost:5+$_r_FreeCost
			[STOCK_LEVELS:58]Allocated_Cost:6:=[STOCK_LEVELS:58]Allocated_Cost:6+$_r_AllocatedCost
			DB_SaveRecord(->[STOCK_LEVELS:58])
			AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
			GOTO RECORD:C242([STOCK_LEVELS:58]; $_al_StockLevelRecordsToFix{$_l_Index})
			DELETE RECORD:C58([STOCK_LEVELS:58])
		End if 
	Else 
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_SLProductStripped; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode)
		
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			ARRAY LONGINT:C221($_al_LevelDoesNotExist; 0)
			ARRAY TEXT:C222($_at_StockTypes; 0)
			DISTINCT VALUES:C339([CURRENT_STOCK:62]Stock_Type:3; $_at_StockTypes)
			ARRAY LONGINT:C221($_al_LevelDoesNotExist; Size of array:C274($_at_StockTypes))
			
			FIRST RECORD:C50([CURRENT_STOCK:62])
			For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_SLProductStripped; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					$_l_StockTypeRow:=Find in array:C230($_at_StockTypes; [CURRENT_STOCK:62]Stock_Type:3)
					$_al_LevelDoesNotExist{$_l_StockTypeRow}:=1
				End if 
				NEXT RECORD:C51([CURRENT_STOCK:62])
			End for 
			$_l_StockTypeRow:=Find in array:C230($_al_LevelDoesNotExist; 1)
			If ($_l_StockTypeRow>0)
				GOTO RECORD:C242([STOCK_LEVELS:58]; $_al_StockLevelRecordsToFix{$_l_Index})
				[STOCK_LEVELS:58]Stock_Type:2:=$_at_StockTypes{$_l_StockTypeRow}
				DB_SaveRecord(->[STOCK_LEVELS:58])
				AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
			Else 
				GOTO RECORD:C242([STOCK_LEVELS:58]; $_al_StockLevelRecordsToFix{$_l_Index})
				DELETE RECORD:C58([STOCK_LEVELS:58])
				
			End if 
		End if 
	End if 
	CLEAR SEMAPHORE:C144("StockLevel"+[STOCK_LEVELS:58]Product_Code:1)  //Prevent any other process from creating the same stock level
	
End for 
For ($_l_Index; 1; Size of array:C274($_al_CurrentStockRecordsToFix))
	GOTO RECORD:C242([CURRENT_STOCK:62]; $_al_CurrentStockRecordsToFix{$_l_Index})
	While (Semaphore:C143("CurrentStock"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same current stock
		DelayTicks(5)
		ALERT:C41("in Stock FixProdCOdes")
	End while 
	READ WRITE:C146([CURRENT_STOCK:62])
	//`because some of these have no stock type that needs to fix itself
	
	
	$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
	$_t_StockType:=[CURRENT_STOCK:62]Stock_Type:3
	$_r_CurrentStockCostPrice:=[CURRENT_STOCK:62]Cost_Price:6
	$_t_CurrentStockLocation:=[CURRENT_STOCK:62]Location:8
	$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
	$_l_CurrentStockItemNumber:=[CURRENT_STOCK:62]Item_Number:5
	$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
	$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
	$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
	$_l_StockLevelID:=[CURRENT_STOCK:62]X_ID:13
	$_t_SLProductStripped:=STOCK_CLEANCODE([CURRENT_STOCK:62]Product_Code:1)
	If ([CURRENT_STOCK:62]Product_Code:1#$_t_SLProductStripped)
		[CURRENT_STOCK:62]Product_Code:1:=$_t_SLProductStripped
		DB_SaveRecord(->[CURRENT_STOCK:62])
		AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
	End if 
	If ($_t_StockType#"")
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_SLProductStripped; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_t_CurrentStockLocation; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_CurrentStockItemNumber; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]X_ID:13#$_l_StockLevelID)
		If (Records in selection:C76([CURRENT_STOCK:62])>=1)
			[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_CurrentStockQuantity
			[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
			DB_SaveRecord(->[CURRENT_STOCK:62])
			AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
			GOTO RECORD:C242([CURRENT_STOCK:62]; $_al_CurrentStockRecordsToFix{$_l_Index})
			DELETE RECORD:C58([CURRENT_STOCK:62])
		End if 
	Else 
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_SLProductStripped)
		
	End if 
	CLEAR SEMAPHORE:C144("CurrentStock"+[CURRENT_STOCK:62]Product_Code:1)
	
End for 

ALL RECORDS:C47([CURRENT_STOCK:62])
CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "AllChecked")
CREATE SET:C116([CURRENT_STOCK:62]; "AllRecords")

For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
	USE SET:C118("AllRecords")
	
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_Index)
	While (Semaphore:C143("CurrentStock"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same current stock
		ALERT:C41("in Stock FixProdCOdes")
		DelayTicks(5)
	End while 
	If (Not:C34(Is in set:C273("AllChecked")))
		$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
		$_t_StockType:=[CURRENT_STOCK:62]Stock_Type:3
		$_r_CurrentStockCostPrice:=[CURRENT_STOCK:62]Cost_Price:6
		$_t_CurrentStockLocation:=[CURRENT_STOCK:62]Location:8
		$_l_CurrentStockItemNumber:=[CURRENT_STOCK:62]Item_Number:5
		$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
		$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
		$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode)
		CREATE SET:C116([CURRENT_STOCK:62]; "Checked")
		While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
			DelayTicks(5)
		End while 
		UNION:C120("Checked"; "AllChecked"; "AllChecked")
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
		If (Records in selection:C76([STOCK_LEVELS:58])=0)
			CREATE RECORD:C68([STOCK_LEVELS:58])
			[STOCK_LEVELS:58]Product_Code:1:=$_t_ProductCode
			[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
			[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
			[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
			[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
			DB_SaveRecord(->[STOCK_LEVELS:58])
			AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
			
			
		End if 
		CLEAR SEMAPHORE:C144("StockLevel"+[CURRENT_STOCK:62]Product_Code:1)  //Prevent any other process from creating the same stock level
	End if 
	
	CLEAR SEMAPHORE:C144("CurrentStock"+[CURRENT_STOCK:62]Product_Code:1)
End for 
ERR_MethodTrackerReturn("STOCK_FixProdCodes"; $_t_oldMethodName)