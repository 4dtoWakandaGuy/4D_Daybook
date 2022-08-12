//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ValidateLevel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/05/2010 19:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CSItemNumbers; 0)
	ARRAY REAL:C219($_ar_AllocatedCost; 0)
	ARRAY REAL:C219($_ar_CSCostPrices; 0)
	ARRAY REAL:C219($_ar_CSQuantities; 0)
	ARRAY REAL:C219($_ar_LevelAllocated; 0)
	ARRAY REAL:C219($_ar_LevelFree; 0)
	ARRAY REAL:C219($_ar_LevelFreeCost; 0)
	ARRAY TEXT:C222($_at_CSAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CSCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CSLayerCodes; 0)
	ARRAY TEXT:C222($_at_CSStockTypes; 0)
	ARRAY TEXT:C222($_at_LevelstoPost; 0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_IsValidated)
	C_LONGINT:C283($_l_CountCurrentStockRecords; $_l_Index; $_l_StockRow)
	C_REAL:C285($_r_Cost; $_r_CSProperAllocCost; $_r_CSProperAllocLevel; $_r_CSProperFreeCost; $_r_CSProperFreeLevel; $_r_TotalCost; $_r_Units)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_productCode; $_t_StockLevelUnique; $_t_StockType; $1; $2; $3)
	C_TEXT:C284($4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ValidateLevel")
If (Count parameters:C259>=1)
	$_t_productCode:=$1
Else 
	$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
End if 
$_bo_IsValidated:=STK_IsProductAnalysed($_t_productCode)
If ($_bo_IsValidated)
	If (Count parameters:C259>=2)
		$_t_CurrencyCode:=$2
	Else 
		$_t_CurrencyCode:=[STOCK_LEVELS:58]Currency_Code:8
	End if 
	If ($_t_CurrencyCode="")
		$_t_CurrencyCode:=<>SYS_t_BaseCurrency
	End if 
	If (Count parameters:C259>=3)
		$_t_AnalysisCode:=$3
	Else 
		$_t_AnalysisCode:=[STOCK_LEVELS:58]Analysis_Code:7
	End if 
	
	If (Not:C34(<>StockAnal))
		$_t_AnalysisCode:=""
	End if 
	If (Count parameters:C259>=4)
		$_t_LayerCode:=$4
	Else 
		$_t_LayerCode:=[STOCK_LEVELS:58]Layer_Code:9
	End if 
	If (Count parameters:C259>=5)
		$_t_StockType:=$5
	Else 
		$_t_StockType:=[STOCK_LEVELS:58]Stock_Type:2
	End if 
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
	If ($_t_AnalysisCode#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
	End if 
	If ($_t_LayerCode#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
	End if 
	If ($_t_CurrencyCode#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
	End if 
	If ($_t_StockType#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
	End if 
	QUERY:C277([CURRENT_STOCK:62])
	
	ARRAY TEXT:C222($_at_LevelstoPost; 0)
	ARRAY REAL:C219($_ar_LevelFree; 0)
	ARRAY REAL:C219($_ar_LevelFreeCost; 0)
	ARRAY REAL:C219($_ar_LevelAllocated; 0)
	ARRAY REAL:C219($_ar_AllocatedCost; 0)
	ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3; >; [CURRENT_STOCK:62]Currency_Code:11; >; [CURRENT_STOCK:62]Layer_Code:12; >; [CURRENT_STOCK:62]Analysis_Code:10; >)
	ARRAY TEXT:C222($_at_CSStockTypes; 0)
	ARRAY REAL:C219($_ar_CSQuantities; 0)
	ARRAY LONGINT:C221($_al_CSItemNumbers; 0)
	ARRAY REAL:C219($_ar_CSCostPrices; 0)
	ARRAY TEXT:C222($_at_CSAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CSCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CSLayerCodes; 0)
	CREATE SET:C116([CURRENT_STOCK:62]; "$MATCH")
	If (False:C215)
		SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; $_at_CSStockTypes; [CURRENT_STOCK:62]Quantity:4; $_ar_CSQuantities; [CURRENT_STOCK:62]Item_Number:5; $_al_CSItemNumbers; [CURRENT_STOCK:62]Cost_Price:6; $_ar_CSCostPrices; [CURRENT_STOCK:62]Analysis_Code:10; $_at_CSAnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CSCurrencyCodes; [CURRENT_STOCK:62]Layer_Code:12; $_at_CSLayerCodes)
		$_l_CountCurrentStockRecords:=Size of array:C274($_at_CSStockTypes)
		$_l_Index:=1
		While ((OK=1) & ($_l_Index<=$_l_CountCurrentStockRecords))  //note this SHOULD only create one row in the array if it creates more there is something odd
			//$_t_productCode:=$_t_productCode
			$_t_StockLevelUnique:=STOCK_BuildUnique($_t_productCode; $_t_CurrencyCode; $_t_LayerCode; $_t_StockType; $_t_AnalysisCode)
			
			$_l_StockRow:=Find in array:C230($_at_LevelstoPost; $_t_StockLevelUnique)
			If ($_l_StockRow<0)
				APPEND TO ARRAY:C911($_at_LevelstoPost; $_t_StockLevelUnique)
				APPEND TO ARRAY:C911($_ar_LevelFree; 0)
				APPEND TO ARRAY:C911($_ar_LevelFreeCost; 0)
				APPEND TO ARRAY:C911($_ar_LevelAllocated; 0)
				APPEND TO ARRAY:C911($_ar_AllocatedCost; 0)
				$_l_StockRow:=Size of array:C274($_at_LevelstoPost)
				
			End if 
			
			If ($_al_CSItemNumbers{$_l_Index}=0)
				$_ar_LevelFree{$_l_StockRow}:=$_ar_LevelFree{$_l_StockRow}+$_ar_CSQuantities{$_l_Index}
				$_ar_LevelFreeCost{$_l_StockRow}:=$_ar_LevelFreeCost{$_l_StockRow}+Round:C94(($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
			Else 
				$_ar_LevelAllocated{$_l_StockRow}:=$_ar_CSQuantities{$_l_Index}
				$_ar_AllocatedCost{$_l_StockRow}:=$_ar_AllocatedCost{$_l_StockRow}+Round:C94(($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
			End if 
			
			$_l_Index:=$_l_Index+1
			If ($_l_Index<=$_l_CountCurrentStockRecords)
				While (($_l_Index<$_l_CountCurrentStockRecords) & ($_t_StockType=$_at_CSStockTypes{$_l_Index}) & (($_t_AnalysisCode=$_at_CSAnalysisCodes{$_l_Index}) | (<>StockAnal=False:C215)) & (($_t_CurrencyCode=$_at_CSCurrencyCodes{$_l_Index}) | (($_t_CurrencyCode="") & ($_at_CSCurrencyCodes{$_l_Index}=<>SYS_t_BaseCurrency)) | (($_t_CurrencyCode=<>SYS_t_BaseCurrency) & ($_at_CSCurrencyCodes{$_l_Index}=""))) & (($_t_LayerCode=$_at_CSLayerCodes{$_l_Index}) | (($_t_LayerCode="") & ($_at_CSLayerCodes{$_l_Index}=DB_GetLedgerActualLayer)) | (($_t_LayerCode=DB_GetLedgerActualLayer) & ($_at_CSLayerCodes{$_l_Index}=""))))
					If ($_al_CSItemNumbers{$_l_Index}=0)
						$_ar_LevelFree{$_l_StockRow}:=Round:C94(($_ar_LevelFree{$_l_StockRow}+$_ar_CSQuantities{$_l_Index}); 2)
						$_ar_LevelFreeCost{$_l_StockRow}:=Round:C94($_ar_LevelFreeCost{$_l_StockRow}+($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
					Else 
						$_ar_LevelAllocated{$_l_StockRow}:=Round:C94(($_ar_LevelAllocated{$_l_StockRow}+$_ar_CSQuantities{$_l_Index}); 2)
						$_ar_AllocatedCost{$_l_StockRow}:=Round:C94($_ar_AllocatedCost{$_l_StockRow}+($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
					End if 
					$_l_Index:=$_l_Index+1
				End while 
				If ($_l_Index=$_l_CountCurrentStockRecords)
					If (($_t_StockType=$_at_CSStockTypes{$_l_Index}) & (($_t_AnalysisCode=$_at_CSAnalysisCodes{$_l_Index}) | (<>StockAnal=False:C215)) & (($_t_CurrencyCode=$_at_CSCurrencyCodes{$_l_Index}) | (($_t_CurrencyCode="") & ($_at_CSCurrencyCodes{$_l_Index}=<>SYS_t_BaseCurrency)) | (($_t_CurrencyCode=<>SYS_t_BaseCurrency) & ($_at_CSCurrencyCodes{$_l_Index}=""))) & (($_t_LayerCode=$_at_CSLayerCodes{$_l_Index}) | (($_t_LayerCode="") & ($_at_CSLayerCodes{$_l_Index}=DB_GetLedgerActualLayer)) | (($_t_LayerCode=DB_GetLedgerActualLayer) & ($_at_CSLayerCodes{$_l_Index}=""))))
						If ($_al_CSItemNumbers{$_l_Index}=0)
							$_ar_LevelFree{$_l_StockRow}:=Round:C94(($_ar_LevelFree{$_l_StockRow}+$_ar_CSQuantities{$_l_Index}); 2)
							$_ar_LevelFreeCost{$_l_StockRow}:=Round:C94($_ar_LevelFreeCost{$_l_StockRow}+($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
						Else 
							$_ar_LevelAllocated{$_l_StockRow}:=Round:C94(($_ar_LevelAllocated{$_l_StockRow}+$_ar_CSQuantities{$_l_Index}); 2)
							$_ar_AllocatedCost{$_l_StockRow}:=Round:C94($_ar_AllocatedCost{$_l_StockRow}+($_ar_CSCostPrices{$_l_Index}*$_ar_CSQuantities{$_l_Index}); 2)
						End if 
						$_l_Index:=$_l_Index+1
					End if 
				End if 
			End if 
			
			//DB_SaveRecord (->[STOCK LEVELS])
			//``AA_CheckFileUnlocked (->[STOCK LEVELS]XREC_ID)
			//CLEAR SEMAPHORE("StockLevel"+$_t_productCode)
		End while 
	End if 
	USE SET:C118("$MATCH")
	$_t_StockLevelUnique:=STOCK_BuildUnique($_t_productCode; $_t_CurrencyCode; $_t_LayerCode; $_t_StockType; $_t_AnalysisCode)
	QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
	
	CREATE SET:C116([CURRENT_STOCK:62]; "$FREE")
	$_r_CSProperFreeLevel:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
	If (Records in selection:C76([CURRENT_STOCK:62])>1)
		//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
		ARRAY REAL:C219($_ar_CSCostPrices; 0)
		DISTINCT VALUES:C339([CURRENT_STOCK:62]Cost_Price:6; $_ar_CSCostPrices)
		$_r_TotalCost:=0
		For ($_l_Index; 1; Size of array:C274($_ar_CSCostPrices))
			USE SET:C118("$FREE")
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CSCostPrices{$_l_Index})
			$_r_Units:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
			$_r_Cost:=Round:C94($_r_Units*$_ar_CSCostPrices{$_l_Index}; 2)
			$_r_TotalCost:=$_r_TotalCost+$_r_Cost
		End for 
	Else 
		FIRST RECORD:C50([CURRENT_STOCK:62])
		$_r_TotalCost:=$_r_CSProperFreeLevel*[CURRENT_STOCK:62]Cost_Price:6
	End if 
	$_r_CSProperFreeCost:=$_r_TotalCost
	
	DIFFERENCE:C122("$MATCH"; "$FREE"; "$ALLOCATED")
	
	USE SET:C118("$ALLOCATED")
	
	$_r_CSProperAllocLevel:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
	If (Records in selection:C76([CURRENT_STOCK:62])>1)
		//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
		ARRAY REAL:C219($_ar_CSCostPrices; 0)
		DISTINCT VALUES:C339([CURRENT_STOCK:62]Cost_Price:6; $_ar_CSCostPrices)
		$_r_TotalCost:=0
		For ($_l_Index; 1; Size of array:C274($_ar_CSCostPrices))
			USE SET:C118("$ALLOCATED")
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CSCostPrices{$_l_Index})
			$_r_Units:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
			$_r_Cost:=Round:C94($_r_Units*$_ar_CSCostPrices{$_l_Index}; 2)
			$_r_TotalCost:=$_r_TotalCost+$_r_Cost
		End for 
	Else 
		FIRST RECORD:C50([CURRENT_STOCK:62])
		$_r_TotalCost:=$_r_CSProperAllocLevel*[CURRENT_STOCK:62]Cost_Price:6
	End if 
	
	$_r_CSProperAllocCost:=$_r_TotalCost
	
	
	If (False:C215)
		Case of 
			: (Size of array:C274($_ar_LevelFree)>1)
				//TRACE
				//This should never ever ever happen if it does there is something wrong
				
			: (Size of array:C274($_ar_LevelFree)=1)
				$_l_StockRow:=1
				If ($_ar_LevelFree{$_l_StockRow}#[STOCK_LEVELS:58]Free_Level:3) | ($_ar_LevelFreeCost{$_l_StockRow}#[STOCK_LEVELS:58]Free_Cost:5) | ([STOCK_LEVELS:58]Allocated_Level:4#$_ar_LevelAllocated{$_l_StockRow}) | ($_ar_AllocatedCost{$_l_StockRow}#[STOCK_LEVELS:58]Allocated_Cost:6)
					If ($_r_CSProperFreeLevel#$_ar_LevelFree{$_l_StockRow})
						//TRACE
					End if 
					If ($_r_CSProperAllocLevel#$_ar_LevelAllocated{$_l_StockRow})
						//TRACE
					End if 
					[STOCK_LEVELS:58]Free_Level:3:=$_ar_LevelFree{$_l_StockRow}
					[STOCK_LEVELS:58]Free_Cost:5:=$_ar_LevelFreeCost{$_l_StockRow}
					[STOCK_LEVELS:58]Allocated_Level:4:=$_ar_LevelAllocated{$_l_StockRow}
					[STOCK_LEVELS:58]Allocated_Cost:6:=$_ar_AllocatedCost{$_l_StockRow}
					DB_SaveRecord(->[STOCK_LEVELS:58])
					
				End if 
			Else 
		End case 
	Else 
		
		
		If ($_r_CSProperFreeLevel#[STOCK_LEVELS:58]Free_Level:3) | ($_r_CSProperFreeCost#[STOCK_LEVELS:58]Free_Cost:5) | ([STOCK_LEVELS:58]Allocated_Level:4#$_r_CSProperAllocLevel) | ($_r_CSProperAllocCost#[STOCK_LEVELS:58]Allocated_Cost:6)
			
			[STOCK_LEVELS:58]Free_Level:3:=$_r_CSProperFreeLevel
			[STOCK_LEVELS:58]Free_Cost:5:=$_r_CSProperFreeCost
			[STOCK_LEVELS:58]Allocated_Level:4:=$_r_CSProperAllocLevel
			[STOCK_LEVELS:58]Allocated_Cost:6:=$_r_CSProperAllocCost
			DB_SaveRecord(->[STOCK_LEVELS:58]; False:C215)
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_ValidateLevel"; $_t_oldMethodName)