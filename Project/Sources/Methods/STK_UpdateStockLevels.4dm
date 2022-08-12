//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UpdateStockLevels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/12/2010 20:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrentStockIDS; 0)
	ARRAY LONGINT:C221($_al_CurrentStockIDSAllocated; 0)
	ARRAY LONGINT:C221($_al_CurrentStockItemNumber; 0)
	ARRAY LONGINT:C221($_al_CurrentStockLevelID; 0)
	ARRAY REAL:C219($_ar_AllocatedCost; 0)
	ARRAY REAL:C219($_ar_CostPrices; 0)
	ARRAY REAL:C219($_ar_CurrentStockCostPrices; 0)
	ARRAY REAL:C219($_ar_CurrentStockQuantity; 0)
	ARRAY REAL:C219($_ar_LevelAllocated; 0)
	ARRAY REAL:C219($_ar_LevelFree; 0)
	ARRAY REAL:C219($_ar_LevelFreeCost; 0)
	ARRAY TEXT:C222($_at_CurrentStockAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CurrentStockCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CurrentStockLayerCodes; 0)
	ARRAY TEXT:C222($_at_CurrentStockStockType; 0)
	ARRAY TEXT:C222($_at_LevelstoPost; 0)
	C_BOOLEAN:C305(<>STOCKANAL; $_bo_IsAnalysed; $_bo_NoUpdate; $_bo_processvisible; Notirations; STK_bo_CalledFromCSTrigger)
	C_LONGINT:C283($_l_CostPriceIndex; $_l_CurrentStockArraySize; $_l_CUrrentStockIndex; $_l_CurrnentStockID; $_l_LevelRow; $_l_MovementItemsIndex; $_l_NumberofTasks; $_l_Process; $_l_ProcessIndex; $_l_ProcessOrigin; $_l_ProcessTime)
	C_LONGINT:C283($_l_procstate; $_l_Retries; $_l_RunningProcessesCheck; $_l_UndoIndex; $_l_UniqueProcessID; $1; $7)
	C_REAL:C285($_r_AllocatedStockItemsQ; $_r_Cost; $_r_FreeStockItemsQ; $_r_oTotalCost; $_r_ProperAllocCost; $_r_ProperAllocLevel; $_r_ProperFreeCost; $_r_ProperFreeLevel; $_r_Sum; $_r_Sum2; $_r_TotaFreelInputCost)
	C_REAL:C285($_r_TotalAllocatedCost; $_r_TotalCost; $_r_TotalFreeCost; $_r_TotalInputCost; $_r_Units)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_ProcessName; $_t_productCode; $_t_StockLevelUnique; $_t_StockType; $2; $3)
	C_TEXT:C284($4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdateStockLevels")
//TRACE
If (Count parameters:C259>=7)
	DELAY PROCESS:C323(Current process:C322; 60*$7)
End if 
If (Count parameters:C259>=1)
	$_l_Retries:=0
	While (Semaphore:C143("STOCKLEVEL"+String:C10($1)))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(9*$_l_Retries)
	End while 
	READ WRITE:C146([STOCK_LEVELS:58])
	If ($1#[STOCK_LEVELS:58]X_ID:10)
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=$1)
	End if 
	
	If (Count parameters:C259>=2)
		$_t_productCode:=$2
	Else 
		$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
	End if 
	$_bo_IsAnalysed:=STK_IsProductAnalysed($_t_productCode)
	If ($_bo_IsAnalysed)
		If (Count parameters:C259>=5)
			$_t_CurrencyCode:=$5
		Else 
			$_t_CurrencyCode:=[STOCK_LEVELS:58]Currency_Code:8
		End if 
		If ($_t_CurrencyCode="")
			$_t_CurrencyCode:=<>SYS_t_BaseCurrency
		End if 
		If (Count parameters:C259>=4)
			$_t_AnalysisCode:=$4
		Else 
			$_t_AnalysisCode:=[STOCK_LEVELS:58]Analysis_Code:7
		End if 
		
		If (Not:C34(<>StockAnal))
			$_t_AnalysisCode:=""
		End if 
		If (Count parameters:C259>=6)
			$_t_LayerCode:=$6
		Else 
			$_t_LayerCode:=[STOCK_LEVELS:58]Layer_Code:9
		End if 
		If (Count parameters:C259>=3)
			$_t_StockType:=$3
		Else 
			$_t_StockType:=[STOCK_LEVELS:58]Stock_Type:2
		End if 
		MESSAGES OFF:C175
		If (Not:C34(STK_bo_CalledFromCSTrigger))
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
			If ($_t_AnalysisCode#"") & (<>StockAnal)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
			Else 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
			End if 
			If ($_t_LayerCode#"")
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
			Else 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=""; *)
			End if 
			If ($_t_CurrencyCode#"")
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
			Else 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=""; *)
			End if 
			If ($_t_StockType#"")
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
			End if 
			QUERY:C277([CURRENT_STOCK:62])
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
			CREATE SET:C116([CURRENT_STOCK:62]; "$s1")
			If ($1>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]x_Stock_Level_ID:15=$1)
				CREATE SET:C116([CURRENT_STOCK:62]; "$s2")
				UNION:C120("$s2"; "$s1"; "$s1")
				USE SET:C118("$s1")
				
			End if 
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode)
			If (Records in selection:C76([CURRENT_STOCK:62])<Records in set:C195("$s1"))
				USE SET:C118("$s1")
				READ WRITE:C146([CURRENT_STOCK:62])
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1#$_t_productCode)
				For ($_l_UndoIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
					[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
					DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)
					$_l_CurrnentStockID:=[CURRENT_STOCK:62]X_ID:13
					Repeat 
						$_l_RunningProcessesCheck:=0
						$_l_NumberofTasks:=Count tasks:C335
						For ($_l_ProcessIndex; 1; $_l_NumberofTasks)
							PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_ProcessName; $_l_procstate; $_l_ProcessTime; $_bo_processvisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
							If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
								If ($_l_procstate>=0)
									$_l_RunningProcessesCheck:=$_l_RunningProcessesCheck+1
								End if 
							End if 
						End for 
					Until ($_l_RunningProcessesCheck<10)
					
					$_l_Process:=New process:C317("STK_UpdateCurrentStock2011"; 128000; "ValidateCurrentStock-"+String:C10($_l_CurrnentStockID); -$_l_CurrnentStockID; 0; 0; 0; *)
					
					
					NEXT RECORD:C51([CURRENT_STOCK:62])
					USE SET:C118("$s1")
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode)
				End for 
			End if 
			
			ARRAY TEXT:C222($_at_LevelstoPost; 0)
			ARRAY REAL:C219($_ar_LevelFree; 0)
			ARRAY REAL:C219($_ar_LevelFreeCost; 0)
			ARRAY REAL:C219($_ar_LevelAllocated; 0)
			ARRAY REAL:C219($_ar_AllocatedCost; 0)
			ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3; >; [CURRENT_STOCK:62]Currency_Code:11; >; [CURRENT_STOCK:62]Layer_Code:12; >; [CURRENT_STOCK:62]Analysis_Code:10; >)
			ARRAY TEXT:C222($_at_CurrentStockStockType; 0)
			ARRAY REAL:C219($_ar_CurrentStockQuantity; 0)
			ARRAY LONGINT:C221($_al_CurrentStockItemNumber; 0)
			ARRAY REAL:C219($_ar_CurrentStockCostPrices; 0)
			ARRAY TEXT:C222($_at_CurrentStockAnalysisCodes; 0)
			ARRAY TEXT:C222($_at_CurrentStockCurrencyCodes; 0)
			ARRAY TEXT:C222($_at_CurrentStockLayerCodes; 0)
			CREATE SET:C116([CURRENT_STOCK:62]; "$MATCH")
			
			If (False:C215)
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; $_at_CurrentStockStockType; [CURRENT_STOCK:62]Quantity:4; $_ar_CurrentStockQuantity; [CURRENT_STOCK:62]Item_Number:5; $_al_CurrentStockItemNumber; [CURRENT_STOCK:62]Cost_Price:6; $_ar_CurrentStockCostPrices; [CURRENT_STOCK:62]Analysis_Code:10; $_at_CurrentStockAnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CurrentStockCurrencyCodes; [CURRENT_STOCK:62]Layer_Code:12; $_at_CurrentStockLayerCodes)
				$_l_CurrentStockArraySize:=Size of array:C274($_at_CurrentStockStockType)
				$_l_CostPriceIndex:=1
				While ((OK=1) & ($_l_CostPriceIndex<=$_l_CurrentStockArraySize))  //note this SHOULD only create one row in the array if it creates more there is something odd
					//$_t_productCode:=$_t_productCode
					$_t_StockLevelUnique:=STOCK_BuildUnique($_t_productCode; $_t_CurrencyCode; $_t_LayerCode; $_t_StockType; $_t_AnalysisCode)
					
					$_l_LevelRow:=Find in array:C230($_at_LevelstoPost; $_t_StockLevelUnique)
					If ($_l_LevelRow<0)
						APPEND TO ARRAY:C911($_at_LevelstoPost; $_t_StockLevelUnique)
						APPEND TO ARRAY:C911($_ar_LevelFree; 0)
						APPEND TO ARRAY:C911($_ar_LevelFreeCost; 0)
						APPEND TO ARRAY:C911($_ar_LevelAllocated; 0)
						APPEND TO ARRAY:C911($_ar_AllocatedCost; 0)
						$_l_LevelRow:=Size of array:C274($_at_LevelstoPost)
						
					End if 
					
					If ($_al_CurrentStockItemNumber{$_l_CostPriceIndex}=0)
						$_ar_LevelFree{$_l_LevelRow}:=$_ar_LevelFree{$_l_LevelRow}+$_ar_CurrentStockQuantity{$_l_CostPriceIndex}
						$_ar_LevelFreeCost{$_l_LevelRow}:=$_ar_LevelFreeCost{$_l_LevelRow}+Round:C94(($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
					Else 
						$_ar_LevelAllocated{$_l_LevelRow}:=$_ar_CurrentStockQuantity{$_l_CostPriceIndex}
						$_ar_AllocatedCost{$_l_LevelRow}:=$_ar_AllocatedCost{$_l_LevelRow}+Round:C94(($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
					End if 
					
					$_l_CostPriceIndex:=$_l_CostPriceIndex+1
					If ($_l_CostPriceIndex<=$_l_CurrentStockArraySize)
						While (($_l_CostPriceIndex<$_l_CurrentStockArraySize) & ($_t_StockType=$_at_CurrentStockStockType{$_l_CostPriceIndex}) & (($_t_AnalysisCode=$_at_CurrentStockAnalysisCodes{$_l_CostPriceIndex}) | (<>StockAnal=False:C215)) & (($_t_CurrencyCode=$_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}) | (($_t_CurrencyCode="") & ($_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}=<>SYS_t_BaseCurrency)) | (($_t_CurrencyCode=<>SYS_t_BaseCurrency) & ($_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}=""))) & (($_t_LayerCode=$_at_CurrentStockLayerCodes{$_l_CostPriceIndex}) | (($_t_LayerCode="") & ($_at_CurrentStockLayerCodes{$_l_CostPriceIndex}=DB_GetLedgerActualLayer)) | (($_t_LayerCode=DB_GetLedgerActualLayer) & ($_at_CurrentStockLayerCodes{$_l_CostPriceIndex}=""))))
							If ($_al_CurrentStockItemNumber{$_l_CostPriceIndex}=0)
								$_ar_LevelFree{$_l_LevelRow}:=Round:C94(($_ar_LevelFree{$_l_LevelRow}+$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
								$_ar_LevelFreeCost{$_l_LevelRow}:=Round:C94($_ar_LevelFreeCost{$_l_LevelRow}+($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
							Else 
								$_ar_LevelAllocated{$_l_LevelRow}:=Round:C94(($_ar_LevelAllocated{$_l_LevelRow}+$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
								$_ar_AllocatedCost{$_l_LevelRow}:=Round:C94($_ar_AllocatedCost{$_l_LevelRow}+($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
							End if 
							$_l_CostPriceIndex:=$_l_CostPriceIndex+1
						End while 
						If ($_l_CostPriceIndex=$_l_CurrentStockArraySize)
							If (($_t_StockType=$_at_CurrentStockStockType{$_l_CostPriceIndex}) & (($_t_AnalysisCode=$_at_CurrentStockAnalysisCodes{$_l_CostPriceIndex}) | (<>StockAnal=False:C215)) & (($_t_CurrencyCode=$_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}) | (($_t_CurrencyCode="") & ($_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}=<>SYS_t_BaseCurrency)) | (($_t_CurrencyCode=<>SYS_t_BaseCurrency) & ($_at_CurrentStockCurrencyCodes{$_l_CostPriceIndex}=""))) & (($_t_LayerCode=$_at_CurrentStockLayerCodes{$_l_CostPriceIndex}) | (($_t_LayerCode="") & ($_at_CurrentStockLayerCodes{$_l_CostPriceIndex}=DB_GetLedgerActualLayer)) | (($_t_LayerCode=DB_GetLedgerActualLayer) & ($_at_CurrentStockLayerCodes{$_l_CostPriceIndex}=""))))
								If ($_al_CurrentStockItemNumber{$_l_CostPriceIndex}=0)
									$_ar_LevelFree{$_l_LevelRow}:=Round:C94(($_ar_LevelFree{$_l_LevelRow}+$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
									$_ar_LevelFreeCost{$_l_LevelRow}:=Round:C94($_ar_LevelFreeCost{$_l_LevelRow}+($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
								Else 
									$_ar_LevelAllocated{$_l_LevelRow}:=Round:C94(($_ar_LevelAllocated{$_l_LevelRow}+$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
									$_ar_AllocatedCost{$_l_LevelRow}:=Round:C94($_ar_AllocatedCost{$_l_LevelRow}+($_ar_CurrentStockCostPrices{$_l_CostPriceIndex}*$_ar_CurrentStockQuantity{$_l_CostPriceIndex}); 2)
								End if 
								$_l_CostPriceIndex:=$_l_CostPriceIndex+1
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
			SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockIDS; [CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_CurrentStockLevelID)
			
			CREATE SET:C116([CURRENT_STOCK:62]; "$FREE")
			$_r_ProperFreeLevel:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
			If (Records in selection:C76([CURRENT_STOCK:62])>1)
				//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
				ARRAY REAL:C219($_ar_CostPrices; 0)
				DISTINCT VALUES:C339([CURRENT_STOCK:62]Cost_Price:6; $_ar_CostPrices)
				$_r_TotalCost:=0
				For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
					USE SET:C118("$FREE")
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CostPrices{$_l_CostPriceIndex})
					
					$_r_Units:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
					$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
					$_r_TotalCost:=$_r_TotalCost+$_r_Cost
				End for 
			Else 
				FIRST RECORD:C50([CURRENT_STOCK:62])
				$_r_TotalCost:=$_r_ProperFreeLevel*[CURRENT_STOCK:62]Cost_Price:6
			End if 
			$_r_ProperFreeCost:=$_r_TotalCost
			
			DIFFERENCE:C122("$MATCH"; "$FREE"; "$ALLOCATED")
			
			
			USE SET:C118("$ALLOCATED")
			SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockIDSAllocated)
			
			$_r_ProperAllocLevel:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
			If (Records in selection:C76([CURRENT_STOCK:62])>1)
				//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
				ARRAY REAL:C219($_ar_CostPrices; 0)
				DISTINCT VALUES:C339([CURRENT_STOCK:62]Cost_Price:6; $_ar_CostPrices)
				$_r_TotalCost:=0
				For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
					USE SET:C118("$ALLOCATED")
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CostPrices{$_l_CostPriceIndex})
					$_r_Units:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
					$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
					$_r_TotalCost:=$_r_TotalCost+$_r_Cost
				End for 
			Else 
				FIRST RECORD:C50([CURRENT_STOCK:62])
				$_r_TotalCost:=$_r_ProperAllocLevel*[CURRENT_STOCK:62]Cost_Price:6
			End if 
			$_r_ProperAllocCost:=$_r_TotalCost
			//if the stock type has nothing added to it..
			//Count allocated
			//`added to allocated
			If (False:C215)
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockIDSAllocated)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$iAllocated")
				$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				$_r_TotalCost:=0
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$iAllocated")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					$_r_TotalCost:=0
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$iAllocated")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						$_r_Units:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					$_r_TotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockIDSAllocated)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$iAllocated")
				$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$iAllocated")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$iAllocated")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					$_r_TotalCost:=$_r_TotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
				End if 
				$_r_AllocatedStockItemsQ:=$_r_Sum+$_r_Sum2
				$_r_TotalInputCost:=$_r_TotalCost
				//``````
				//taken from allocated
				$_r_oTotalCost:=0
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CurrentStockIDSAllocated)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$iAllocated")
				$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$iAllocated")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					$_r_oTotalCost:=0
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$iAllocated")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$atPrice")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#$_ar_CostPrices{$_l_CostPriceIndex}; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$OTHERPRICES")
						DIFFERENCE:C122("$atPrice"; "$OTHERPRICES"; "$atPrice")
						USE SET:C118("$atPrice")
						$_r_Units:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_oTotalCost:=$_r_oTotalCost+$_r_Cost
						If (Records in set:C195("$OTHERPRICES")>0)
							
							USE SET:C118("$OTHERPRICES")
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_Cost:=Round:C94($_r_Units*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; 2)
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								$_r_oTotalCost:=$_r_oTotalCost+$_r_Cost
							End for 
						End if 
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10) | ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=0)
						$_r_oTotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					Else 
						$_r_oTotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
					End if 
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CurrentStockIDSAllocated)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$iAllocated")
				$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$iAllocated")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$iAllocated")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						//``
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$atPrice")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#$_ar_CostPrices{$_l_CostPriceIndex}; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$OTHERPRICES")
						DIFFERENCE:C122("$atPrice"; "$OTHERPRICES"; "$atPrice")
						USE SET:C118("$atPrice")
						$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_oTotalCost:=$_r_oTotalCost+$_r_Cost
						If (Records in set:C195("$OTHERPRICES")>0)
							USE SET:C118("$OTHERPRICES")
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_Cost:=Round:C94($_r_Units*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; 2)
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								$_r_oTotalCost:=$_r_oTotalCost+$_r_Cost
							End for 
						End if 
						//```
						
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10) | ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=0)
						$_r_oTotalCost:=$_r_oTotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
					Else 
						$_r_oTotalCost:=$_r_oTotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35)
					End if 
				End if 
				$_r_AllocatedStockItemsQ:=$_r_AllocatedStockItemsQ-($_r_Sum+$_r_Sum2)
				$_r_TotalAllocatedCost:=$_r_TotalInputCost-$_r_oTotalCost
				
				//``
				//count the freee```
				
				//added to free
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockIDS)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Free")
				$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				$_r_TotalCost:=0
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$Free")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					$_r_TotalCost:=0
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$Free")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						$_r_Units:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					$_r_TotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockIDS)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Free")
				$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$Free")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$Free")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					$_r_TotalCost:=$_r_TotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
				End if 
				$_r_FreeStockItemsQ:=$_r_Sum+$_r_Sum2
				$_r_TotaFreelInputCost:=$_r_TotalCost
				$_r_TotalCost:=0
				//take from free
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CurrentStockIDS)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Free")
				$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$Free")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					$_r_TotalCost:=0
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$Free")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						//```
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$atPrice")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#$_ar_CostPrices{$_l_CostPriceIndex}; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$OTHERPRICES")
						DIFFERENCE:C122("$atPrice"; "$OTHERPRICES"; "$atPrice")
						USE SET:C118("$atPrice")
						$_r_Units:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
						If (Records in set:C195("$OTHERPRICES")>0)
							USE SET:C118("$OTHERPRICES")
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								$_r_Units:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_Cost:=Round:C94($_r_Units*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; 2)
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								$_r_TotalCost:=$_r_TotalCost+$_r_Cost
							End for 
						End if 
						//```
						
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10) | ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=0)
						
						$_r_TotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					Else 
						$_r_TotalCost:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
					End if 
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CurrentStockIDS)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Free")
				$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
					USE SET:C118("$Free")
					//The problem here is that that the total cost is frequently NOT on the current stock and of course here we cant do an update or we could spin out of control
					ARRAY REAL:C219($_ar_CostPrices; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices)
					
					For ($_l_CostPriceIndex; 1; Size of array:C274($_ar_CostPrices))
						USE SET:C118("$Free")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_ar_CostPrices{$_l_CostPriceIndex})
						//````
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$atPrice")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#$_ar_CostPrices{$_l_CostPriceIndex}; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$OTHERPRICES")
						DIFFERENCE:C122("$atPrice"; "$OTHERPRICES"; "$atPrice")
						USE SET:C118("$atPrice")
						$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_Cost:=Round:C94($_r_Units*$_ar_CostPrices{$_l_CostPriceIndex}; 2)
						$_r_TotalCost:=$_r_TotalCost+$_r_Cost
						If (Records in set:C195("$OTHERPRICES")>0)
							USE SET:C118("$OTHERPRICES")
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								$_r_Units:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_Cost:=Round:C94($_r_Units*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; 2)
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								$_r_TotalCost:=$_r_TotalCost+$_r_Cost
							End for 
						End if 
						
						//```
						
					End for 
				Else 
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10) | ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35=0)
						
						$_r_TotalCost:=$_r_TotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
					Else 
						$_r_TotalCost:=$_r_TotalCost+([STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35)
					End if 
				End if 
				$_r_FreeStockItemsQ:=$_r_FreeStockItemsQ-($_r_Sum+$_r_Sum2)
				$_r_TotalFreeCost:=$_r_TotaFreelInputCost-$_r_TotalCost
				
				
				
				
				
				
				
				
				
				
				
				If ($_r_TotalFreeCost#$_r_ProperFreeCost)
					If ($_r_ProperFreeCost=0) & ($_r_ProperFreeLevel=$_r_FreeStockItemsQ)
						$_r_ProperFreeCost:=$_r_TotalFreeCost
					End if 
				End if 
				If ($_r_ProperAllocCost#$_r_TotalAllocatedCost)
					If ($_r_ProperAllocCost=0) & ($_r_ProperAllocLevel=$_r_AllocatedStockItemsQ)
						$_r_ProperAllocCost:=$_r_TotalAllocatedCost
					End if 
				End if 
			Else 
				$_r_TotalFreeCost:=$_r_ProperFreeCost
				$_r_TotalAllocatedCost:=$_r_ProperAllocCost
				$_r_FreeStockItemsQ:=$_r_ProperFreeLevel
				$_r_AllocatedStockItemsQ:=$_r_ProperAllocLevel
			End if 
			
			$_bo_NoUpdate:=False:C215
			If ($_r_TotalFreeCost#$_r_ProperFreeCost) | ($_r_ProperAllocCost#$_r_TotalAllocatedCost) | ($_r_ProperFreeLevel#$_r_FreeStockItemsQ) | ($_r_ProperAllocLevel#$_r_AllocatedStockItemsQ)
				USE SET:C118("$MATCH")
				If ($_r_ProperFreeLevel#$_r_FreeStockItemsQ) | ($_r_ProperAllocLevel#$_r_AllocatedStockItemsQ)
					If (Not:C34(Notirations))
						For ($_l_CUrrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
							If ([CURRENT_STOCK:62]x_Stock_Level_ID:15#[STOCK_LEVELS:58]X_ID:10)
								[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
							End if 
							STK_UpdateCurrentStock2011
							DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)
							NEXT RECORD:C51([CURRENT_STOCK:62])
						End for 
						Notirations:=True:C214
						STK_UpdateStockLevels
						Notirations:=False:C215
						$_bo_NoUpdate:=True:C214
					End if 
					
				End if 
				
			End if 
			If (Not:C34($_bo_NoUpdate))
				If (False:C215)
					Case of 
						: (Size of array:C274($_ar_LevelFree)>1)
							//TRACE
							//This should never ever ever happen if it does there is something wrong
							
						: (Size of array:C274($_ar_LevelFree)=1)
							$_l_LevelRow:=1
							If ($_ar_LevelFree{$_l_LevelRow}#[STOCK_LEVELS:58]Free_Level:3) | ($_ar_LevelFreeCost{$_l_LevelRow}#[STOCK_LEVELS:58]Free_Cost:5) | ([STOCK_LEVELS:58]Allocated_Level:4#$_ar_LevelAllocated{$_l_LevelRow}) | ($_ar_AllocatedCost{$_l_LevelRow}#[STOCK_LEVELS:58]Allocated_Cost:6)
								If ($_r_ProperFreeLevel#$_ar_LevelFree{$_l_LevelRow})
									//TRACE
								End if 
								If ($_r_ProperAllocLevel#$_ar_LevelAllocated{$_l_LevelRow})
									//TRACE
								End if 
								[STOCK_LEVELS:58]Free_Level:3:=$_ar_LevelFree{$_l_LevelRow}
								[STOCK_LEVELS:58]Free_Cost:5:=$_ar_LevelFreeCost{$_l_LevelRow}
								[STOCK_LEVELS:58]Allocated_Level:4:=$_ar_LevelAllocated{$_l_LevelRow}
								[STOCK_LEVELS:58]Allocated_Cost:6:=$_ar_AllocatedCost{$_l_LevelRow}
								DB_SaveRecord(->[STOCK_LEVELS:58]; False:C215)
								
							End if 
						Else 
					End case 
				Else 
					
					If ($_r_ProperFreeLevel#[STOCK_LEVELS:58]Free_Level:3) | ($_r_ProperFreeCost#[STOCK_LEVELS:58]Free_Cost:5) | ([STOCK_LEVELS:58]Allocated_Level:4#$_r_ProperAllocLevel) | ($_r_ProperAllocCost#[STOCK_LEVELS:58]Allocated_Cost:6)
						
						[STOCK_LEVELS:58]Free_Level:3:=$_r_ProperFreeLevel
						[STOCK_LEVELS:58]Free_Cost:5:=$_r_ProperFreeCost
						[STOCK_LEVELS:58]Allocated_Level:4:=$_r_ProperAllocLevel
						[STOCK_LEVELS:58]Allocated_Cost:6:=$_r_ProperAllocCost
						DB_SaveRecord(->[STOCK_LEVELS:58]; False:C215)
						
					End if 
				End if 
			End if 
			
		Else 
			//do it in a new process and delay it 60 seconds
			$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "Update Stock Level"; $1; $_t_productCode; $_t_StockType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; 60)
			
		End if 
		STK_bo_CalledFromCSTrigger:=False:C215
		
	End if 
	CLEAR SEMAPHORE:C144("STOCKLEVEL"+String:C10($1))
	
	
	
End if 
UNLOAD RECORD:C212([CURRENT_STOCK:62])
ERR_MethodTrackerReturn("STK_UpdateStockLevels"; $_t_oldMethodName)