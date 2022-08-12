//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetPreviousStockMovement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/12/2010 12:05
	//Created BY: Nigel Greenlee$_l_FromPOItemNumber
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>STK_al_PreviousMoveItemIDS;0)
	ARRAY LONGINT:C221($_al_PreviousID; 0)
	ARRAY LONGINT:C221($_al_TakeFromCSID; 0)
	//ARRAY LONGINT(STK_al_CalledoffByID;0)
	//ARRAY LONGINT(STK_al_CalledoffFromID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementCSID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	ARRAY POINTER:C280($_aptr_Fields; 0)
	//ARRAY REAL(<>STK_ar_PreviousMovementQTY;0)
	ARRAY REAL:C219($_ar_PreviousCalloff; 0)
	//ARRAY REAL(STK_ar_CalledOffQuantity;0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	ARRAY TEXT:C222($_at_StockPlus; 0)
	ARRAY TEXT:C222($_at_TakeFromAnalysis; 0)
	ARRAY TEXT:C222($_at_TakeFromCurrency; 0)
	ARRAY TEXT:C222($_at_TakeFromLayer; 0)
	ARRAY TEXT:C222($_at_TakeFromLocation; 0)
	ARRAY TEXT:C222($_at_UnAllocationMovementTypes; 0)
	//ARRAY TEXT(STK_at_PreviousMovementAnalysis;0)
	//ARRAY TEXT(STK_at_PreviousMovementCurrency;0)
	//ARRAY TEXT(STK_at_PreviousMovementLayer;0)
	//ARRAY TEXT(STK_at_PreviousMovementLocation;0)
	C_BOOLEAN:C305(<>FilterInAllocated; <>STK_bo_NotFirstPass; <>STOCK_bo_NoSplit; <>STOCK_bo_NoSuperSplit; <>StockAnal; <>TellMe; $_bo_CouldBeNegative; $_bo_IsAllocation; $_bo_IsStockReceipt; $_bo_isUnAllocation; $_bo_TryPO)
	C_BOOLEAN:C305($_bo_UseOnlyAllocated; $_bo_useOnlyUnAllocated; $13; $14; $16; $19; DB_bo_NoMoreItems; STK_bo_CalledBACK; STK_bo_CallisPreTry; STK_bo_CheckStItemNoCostIndex; STK_bo_CheckStockItemID2Index)
	C_BOOLEAN:C305(STK_bo_CheckStockItemID3Index; STK_bo_CheckStockItemID4Index; STK_bo_CheckStockItemID5Index; STK_bo_CheckStockItemSOIDIndex; STK_bo_CheckStockItemTypeIndex; STK_bo_LocknoWait; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; STK_bo_PreviousSet)
	C_DATE:C307($_d_MaxDate; $9)
	C_LONGINT:C283(<>STK_l_ValidateCalledOff; $_l_addID; $_l_ApplicationType; $_l_CallingProcess; $_l_CopiedFromID; $_l_CopiedFromStockItemID; $_l_CurrentStockID; $_l_FromCurrentStockID; $_l_FromItemNumber; $_l_FromPOItemNumber; $_l_FromUNANumber)
	C_LONGINT:C283($_l_GetItemNumber; $_l_ItemRow; $_l_LastStamp; $_l_Max; $_l_MovementItemIndex; $_l_NotID; $_l_POAttempts; $_l_ResetIndex; $_l_Retries; $_l_SelFromPrevIndex; $_l_SMIIndex)
	C_LONGINT:C283($_l_StockMovementItemID; $_l_SubtractFromCurrentStockID; $_l_UpdateCalledoff; $1; $12; $15; $18; $2; $3; STK_l_addCallingProcess; STK_l_addID)
	C_LONGINT:C283(STK_l_LastStamp; STK_l_PreviousItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber; STK_l_Resume; STK_l_TransactionID)
	C_REAL:C285($_r_AlreadyCalledOffQTY; $_r_Available; $_r_CostPrice; $_r_FromCostPrice; $_r_Quantity; $_r_SelectedSoFar; $_r_TotalAvailable; $_r_TotalRemaining; $_r_TotalSelected; $10; $11)
	C_REAL:C285(STK_R_CALLEDOFF; STK_R_PreviousCostPrice)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_FromAnalysis; $_t_FromCurrency; $_t_FromLayer; $_t_FromLocation; $_t_FromPONumber; $_t_FromSerialNumber; $_t_LastProduct; $_t_LayerCode; $_t_MovementType)
	C_TEXT:C284($_t_MovementTypeStockAdd; $_t_oldMethodName; $_t_productCode; $_t_StockType; $17; $4; $5; $6; $7; $8; STK_bo_LastProduct)
	C_TEXT:C284(STK_T_PreviousStockItemAnal; STK_T_PreviousStockItemCurrency; STK_T_PreviousStockItemLayer; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetPreviousStockMovement")

If (Count parameters:C259>=12)
	
	DB_bo_NoMoreItems:=False:C215
	
	ARRAY LONGINT:C221(<>STK_al_PreviousMoveItemIDS; 0)
	ARRAY REAL:C219(<>STK_ar_PreviousMovementQTY; 0)
	ARRAY LONGINT:C221($_al_PreviousID; 0)
	ARRAY REAL:C219($_ar_PreviousCalloff; 0)
	ARRAY LONGINT:C221($_al_TakeFromCSID; 0)
	ARRAY TEXT:C222($_at_TakeFromLocation; 0)
	ARRAY TEXT:C222($_at_TakeFromCurrency; 0)
	ARRAY TEXT:C222($_at_TakeFromAnalysis; 0)
	ARRAY TEXT:C222($_at_TakeFromLayer; 0)
	
	$_l_CallingProcess:=$1
	$_l_CopiedFromStockItemID:=$2
	$_l_SubtractFromCurrentStockID:=$3
	$_t_productCode:=$4
	$_t_StockType:=$5
	If ($_t_StockType="o")
		// TRACE
	End if 
	$_r_CostPrice:=$10
	$_t_CurrencyCode:=$6
	$_t_AnalysisCode:=$7
	$_d_MaxDate:=$9
	$_t_LayerCode:=$8
	$_r_Quantity:=$11
	$_l_NotID:=$12
	$_bo_IsAllocation:=False:C215
	$_l_FromItemNumber:=0
	$_bo_isUnAllocation:=False:C215
	$_bo_useOnlyUnAllocated:=False:C215
	$_bo_UseOnlyAllocated:=False:C215  // This means that we can only select previous stock moveement tiems iwth the item
	If (Count parameters:C259>=16)
		$_bo_UseOnlyAllocated:=$16
	End if 
	If (Count parameters:C259>=13)
		$_bo_IsAllocation:=$13
		If ($_bo_IsAllocation)
			$_bo_useOnlyUnAllocated:=True:C214
			$_bo_UseOnlyAllocated:=False:C215
		End if 
	Else 
		$_bo_IsAllocation:=False:C215
	End if 
	If (Count parameters:C259>=14)
		$_bo_isUnAllocation:=$14
		If ($_bo_isUnAllocation)
			$_bo_useOnlyUnAllocated:=False:C215
			$_bo_UseOnlyAllocated:=True:C214
		End if 
	Else 
		$_bo_isUnAllocation:=False:C215
	End if 
	If (Count parameters:C259>=15)
		$_l_FromItemNumber:=$15
	End if 
	//`TRACE
	$_t_FromPONumber:=""
	If (Count parameters:C259>=17)
		$_t_FromPONumber:=$17
	End if 
	$_l_FromPOItemNumber:=0
	If (Count parameters:C259>=18)
		$_l_FromPOItemNumber:=$18
	End if 
	$_bo_IsStockReceipt:=False:C215
	If (Count parameters:C259>=19)
		$_bo_IsStockReceipt:=$19
	End if 
	$_bo_TryPO:=False:C215
	If ($_l_FromItemNumber=0)
		If (Not:C34($_bo_isUnAllocation)) & (Not:C34($_bo_IsAllocation)) & (Not:C34($_bo_IsStockReceipt))
			$_bo_useOnlyUnAllocated:=True:C214
		End if 
	End if 
	
	
	If ($_l_FromPOItemNumber#0) | ($_t_FromPONumber#"")
		$_bo_TryPO:=True:C214
	End if 
	If ($_bo_TryPO)
		$_l_Max:=2
	Else 
		$_l_Max:=1
	End if 
	
	$_bo_CouldBeNegative:=False:C215
	If ($_r_Quantity<0)
		$_bo_CouldBeNegative:=False:C215
		$_r_Quantity:=Abs:C99($_r_Quantity)
	End if 
	For ($_l_POAttempts; 1; $_l_Max)  // $_l_Max is 1 unless there is a PO o
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		If ($2#0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$2)
			// and test it is valid
			If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_productCode)
				REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
				
			End if 
		End if 
		$_l_ApplicationType:=Application type:C494
		
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
			$_l_CurrentStockID:=$_l_SubtractFromCurrentStockID
			If ($_l_CurrentStockID>0)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
				
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					$_l_CurrentStockID:=0
				End if 
			End if 
			
			If ($_l_CurrentStockID=0)
				If (Not:C34(STK_bo_CheckStockItemTypeIndex))
					ARRAY POINTER:C280($_aptr_Fields; 7)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					$_aptr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					$_aptr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					$_aptr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					$_aptr_Fields{7}:=->[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38
					
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemTypeRedo")
					STK_bo_CheckStockItemTypeIndex:=True:C214
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
				If ($_r_CostPrice#0)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice; *)
				Else 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>=0; *)
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode; *)
				If ((<>StockAnal))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
				Else 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
				End if 
				//TRACE
				$_t_LastProduct:=$_t_productCode  //+":"+String($_r_CostPrice)+":"+$_t_StockType+":"+$_t_CurrencyCode+":"+$_t_LayerCode+":"+$_t_AnalysisCode
				If (STK_bo_LastProduct#$_t_LastProduct)
					$_l_LastStamp:=GEN_TimeDateStamp(Current date:C33; ?00:00:00?)
					STK_bo_LastProduct:=$_t_LastProduct
					STK_l_LastStamp:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
				Else 
					$_l_LastStamp:=STK_l_LastStamp
				End if 
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
				MESSAGES OFF:C175
				
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46>$_l_LastStamp)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
				
				STK_bo_LocknoWait:=True:C214
				
				STK_bo_LocknoWait:=False:C215
				STK_l_LastStamp:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
				USE NAMED SELECTION:C332("$temp")
				MESSAGES ON:C181
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
				
				If ($_bo_TryPO)
					If ($_t_FromPONumber#"")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
					End if 
					If ($_l_FromPOItemNumber#0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
					End if 
				End if 
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					// TRACE
					If ($_l_FromItemNumber#0)
						// try the query again without the currency/layer/anay
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
						If ($_r_CostPrice#0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice; *)
						Else 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>=0; *)
						End if 
						// QUERY SELECTION([STOCK ITEMS];[STOCK ITEMS]Item Number=$_l_FromItemNumber;*)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
						If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
						Else 
							
						End if 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
						If ($_bo_TryPO)
							If ($_t_FromPONumber#"")
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
							End if 
							If ($_l_FromPOItemNumber#0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
							End if 
						End if 
						If ($_bo_IsStockReceipt) & ($_l_FromItemNumber>0)
							// Try the item number
							COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
								USE NAMED SELECTION:C332("$tempsel")
							End if 
						End if 
					End if 
					
				End if 
				
				
				
				If ($_l_ApplicationType=4D Server:K5:6)
					// GOTO XY(0;0)
					// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 2")
				End if 
				Case of 
					: ($_bo_IsAllocation)
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 2A")
						End if 
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
						If (Not:C34(STK_bo_CheckStockItemTypeIndex))
							ARRAY POINTER:C280($_aptr_Fields; 3)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
							$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemSOID")
							STK_bo_CheckStockItemTypeIndex:=True:C214
						End if 
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						// Need to check these are not un-allocations or we create a circle
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							USE SET:C118("$Temp")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
							End if 
							ARRAY POINTER:C280($_aptr_Fields; 2)
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 3A")
						End if 
						// have to NOT select an unallocation here
						// NG why i have made that dictate..its wrong.. can select an un-allocation PROVIDING
						// 1)it has been unallocated from something ie its not sitting there waiting to be up(else it might be an unallocation of the item we are trying to allocate)
						
						
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Far")
							CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
							For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
									QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
									$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
								Else 
									$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
								End if 
								If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)<0)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
										
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									End if 
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							
							If (Records in set:C195("$usable")>0)
								USE SET:C118("$usable")
							Else 
								USE SET:C118("$Far")
								// TRACE
								// there are only unallocations available to be re-allocated. just need to make sure they were not the unallocaiton of this item
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
								For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
										QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
									Else 
										$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
									End if 
									If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)>0)
										If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
											$_l_FromUNANumber:=0
											If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
												$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											Else 
												STK_l_PreviousItemNumber:=0
												STK_bo_PreviousItemNumberTested:=False:C215
												$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												
												// Open window(20;Screen height-200;120;Screen height-100;-Palette window )
												$_l_Retries:=0
												While (Not:C34(STK_bo_PreviousItemNumberTested))
													// GOTO XY(0;0)
													// MESSAGE("Waiting for flag  "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
													$_l_Retries:=$_l_Retries+1
													DelayTicks((3+$_l_Retries)*60)
												End while 
												// CLOSE WINDOW
												
												SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
												$_l_FromUNANumber:=STK_l_PreviousItemNumber
											End if 
										Else 
											$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
										End if 
										If ($_l_FromUNANumber#$_l_FromItemNumber) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
											
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								USE SET:C118("$usable")
							End if 
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 5")
						End if 
						
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
						End if 
					: ($_bo_isUnAllocation)
						// TRACE
						// we can only UNALLOCATE an allocation
						If (Not:C34(STK_bo_CheckStockItemID2Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID2")
							STK_bo_CheckStockItemID2Index:=True:C214
						End if 
						If ($_l_FromItemNumber#0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						Else 
							REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
						End if 
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						
						CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
						
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
								QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
								$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
							Else 
								$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
							End if 
							If (Find in array:C230($_at_AllocationTypes; $_t_MovementType)>0)
								ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						USE SET:C118("$usable")
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 7")
						End if 
						
					Else 
						// we can have 0 stock that has an item number on..when we create P stock from it i
						// if it is allocated thought and the movement type is NOT an allocation type for e
						
						// TRACE
						If ($_l_FromItemNumber>0)
							Case of 
								: ($_bo_UseOnlyAllocated)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 8")
									End if 
									
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber)
									
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 8a")
									End if 
								: ($_bo_useOnlyUnAllocated)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
									
								Else 
									// TRACE
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
									// if the items are the same as the type plus.. then this movement type not being a
									If (Not:C34(STK_bo_CheckStockItemID3Index))
										ARRAY POINTER:C280($_aptr_Fields; 2)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID3")
										STK_bo_CheckStockItemID3Index:=True:C214
									End if 
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
									
									If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
											If (<>FilterInAllocated)
												USE NAMED SELECTION:C332("$tempsel")
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>=$_l_FromItemNumber; *)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											End if 
										End if 
										
									Else 
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
											If (<>FilterInAllocated)
												USE NAMED SELECTION:C332("$tempsel")
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>=$_l_FromItemNumber; *)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											End if 
										End if 
										
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										USE SET:C118("$Temp")
									End if 
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
											If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
												QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
												$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
												$_t_MovementTypeStockAdd:=""
											Else 
												$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
												$_t_MovementTypeStockAdd:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
											End if 
											If ($_t_MovementTypeStockAdd="")
												If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
													QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
													$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
												End if 
											End if 
											If (Find in array:C230($_at_StockPlus; $_t_MovementTypeStockAdd)<0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											End if 
											
										Else 
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE SET:C118("$usable")
									
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 10a")
									End if 
							End case 
						Else 
							If ($_bo_useOnlyUnAllocated)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
							End if 
						End if 
				End case 
				$_l_CopiedFromID:=0
				If ($_l_ApplicationType=4D Server:K5:6)
					// GOTO XY(0;0)
					// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 11")
				End if 
				If ($_d_MaxDate>!00-00-00!)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_MaxDate)
				End if 
				If (Not:C34(STK_bo_CheckStockItemID4Index))
					ARRAY POINTER:C280($_aptr_Fields; 2)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
					STK_bo_CheckStockItemID4Index:=True:C214
				End if 
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				
				
			Else 
				If (Not:C34(<>STK_bo_NotFirstPass))
					MESSAGES OFF:C175
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode)
					<>TellMe:=True:C214
					
					<>TellMe:=False:C215
					<>STK_bo_NotFirstPass:=True:C214
					MESSAGES ON:C181
				Else 
					
				End if 
				If (Not:C34(STK_bo_CheckStockItemID5Index))
					ARRAY POINTER:C280($_aptr_Fields; 3)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID5")
					STK_bo_CheckStockItemID5Index:=True:C214
				End if 
				If ($_l_ApplicationType=4D Server:K5:6)
					// GOTO XY(0;0)
					// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 13")
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				If ($_bo_TryPO)
					If ($_t_FromPONumber#"")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
					End if 
					If ($_l_FromPOItemNumber#0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
					End if 
				End if 
				Case of 
					: ($_bo_IsAllocation)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
						If (Not:C34(STK_bo_CheckStockItemSOIDIndex))
							ARRAY POINTER:C280($_aptr_Fields; 3)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
							$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemSOID")
							STK_bo_CheckStockItemSOIDIndex:=True:C214
						End if 
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 3")
						End if 
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						// Need to check these are not un-allocations or we create a circle
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							USE SET:C118("$Temp")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
							End if 
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								ARRAY POINTER:C280($_aptr_Fields; 2)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 3A")
						End if 
						// have to NOT select an unallocation here
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Far")
							CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
							For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
									QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
									$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
								Else 
									$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
								End if 
								If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)<0)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									End if 
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							
							If (Records in set:C195("$usable")>0)
								USE SET:C118("$usable")
							Else 
								USE SET:C118("$Far")
								// TRACE
								// there are only unallocations available to be re-allocated. just need to make sure they were not the unallocaiton of this item
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
								For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
										QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
									Else 
										$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
									End if 
									If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)>0)
										If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
											$_l_FromUNANumber:=0
											If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
												$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											Else 
												STK_l_PreviousItemNumber:=0
												STK_bo_PreviousItemNumberTested:=False:C215
												$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												
												// Open window(20;Screen height-200;120;Screen height-100;-Palette window )
												$_l_Retries:=0
												While (Not:C34(STK_bo_PreviousItemNumberTested))
													// GOTO XY(0;0)
													// MESSAGE("Waiting for flag  "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
													$_l_Retries:=$_l_Retries+1
													DelayTicks((3+$_l_Retries)*60)
												End while 
												// CLOSE WINDOW
												SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
												$_l_FromUNANumber:=STK_l_PreviousItemNumber
											End if 
										Else 
											$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
										End if 
										If ($_l_FromUNANumber#$_l_FromItemNumber) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								USE SET:C118("$usable")
							End if 
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 5")
						End if 
						
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
						End if 
					: ($_bo_isUnAllocation)
						// TRACE
						// we can only UNALLOCATE an allocation
						If (Not:C34(STK_bo_CheckStockItemID2Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID2")
							STK_bo_CheckStockItemID2Index:=True:C214
						End if 
						If ($_l_FromItemNumber#0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						Else 
							REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
						End if 
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						
						CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
								QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
								$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
							Else 
								$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
							End if 
							If (Find in array:C230($_at_AllocationTypes; $_t_MovementType)>0)
								ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						USE SET:C118("$usable")
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 7")
						End if 
						
					Else 
						// we can have 0 stock that has an item number on..when we create P stock from it i
						// if it is allocated thought and the movement type is NOT an allocation type for e
						If ($_l_FromItemNumber#0)
							// TRACE
							Case of 
								: ($_bo_UseOnlyAllocated)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 8")
									End if 
									COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
									
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										If (<>FilterInAllocated) & ($_l_FromItemNumber=0)
											USE NAMED SELECTION:C332("$tempsel")
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>=0; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
											
										End if 
									End if 
								: ($_bo_useOnlyUnAllocated)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 9")
									End if 
									COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										If (<>FilterInAllocated) & ($_l_FromItemNumber=0)
											USE NAMED SELECTION:C332("$tempsel")
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>=0; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
											
										End if 
									End if 
								Else 
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
									// if the items are the same as the type plus.. then this movement type not being a
									ARRAY POINTER:C280($_aptr_Fields; 2)
									If (Not:C34(STK_bo_CheckStockItemID3Index))
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID3")
										STK_bo_CheckStockItemID3Index:=True:C214
									End if 
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
									
									If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$tempsel")
										
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
											If (<>FilterInAllocated) & ($_l_FromItemNumber=0)
												USE NAMED SELECTION:C332("$tempsel")
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>=0; *)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
												
											End if 
										End if 
									Else 
										
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										USE SET:C118("$Temp")
									End if 
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
											If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
												QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
												$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
												$_t_MovementTypeStockAdd:=""
											Else 
												$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
												$_t_MovementTypeStockAdd:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
											End if 
											If ($_t_MovementTypeStockAdd="")
												If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
													QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
													$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
												End if 
											End if 
											If (Find in array:C230($_at_StockPlus; $_t_MovementTypeStockAdd)<0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											End if 
											
										Else 
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE SET:C118("$usable")
									
							End case 
						Else 
							If ($_bo_UseOnlyAllocated)
								// TRACE
							End if 
							If ($_bo_useOnlyUnAllocated)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
								
							End if 
						End if 
				End case 
				If ($_d_MaxDate>!00-00-00!)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_MaxDate)
				End if 
				If (Not:C34(STK_bo_CheckStockItemID4Index))
					ARRAY POINTER:C280($_aptr_Fields; 2)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
					STK_bo_CheckStockItemID4Index:=True:C214
				End if 
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					If (Not:C34(STK_bo_CheckStockItemTypeIndex))
						ARRAY POINTER:C280($_aptr_Fields; 7)
						$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
						$_aptr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
						$_aptr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
						$_aptr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
						$_aptr_Fields{7}:=->[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38
						CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemTypeRedo")
						STK_bo_CheckStockItemTypeIndex:=True:C214
					End if 
					If ($_l_ApplicationType=4D Server:K5:6)
						// GOTO XY(0;0)
						// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 14")
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
					If ($_r_CostPrice#0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice; *)
					Else 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>=-1; *)
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode; *)
					If ((<>StockAnal))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
					Else 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=""; *)
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
					If ($_bo_TryPO)
						If ($_t_FromPONumber#"")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
						End if 
						If ($_l_FromPOItemNumber#0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
						End if 
					End if 
					Case of 
						: ($_bo_IsAllocation)
							If (Not:C34(STK_bo_CheckStockItemSOIDIndex))
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
								ARRAY POINTER:C280($_aptr_Fields; 3)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
								$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemSOID")
								STK_bo_CheckStockItemSOIDIndex:=True:C214
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								ARRAY POINTER:C280($_aptr_Fields; 2)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							// Need to check these are not un-allocations or we create a circle
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
								USE SET:C118("$Temp")
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
								If (Not:C34(STK_bo_CheckStockItemID4Index))
									ARRAY POINTER:C280($_aptr_Fields; 2)
									$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
									CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
									STK_bo_CheckStockItemID4Index:=True:C214
								End if 
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							End if 
							// have to NOT select an unallocation here
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Far")
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
								For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
										QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
									Else 
										$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
									End if 
									If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)<0)
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									Else 
										If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								
								If (Records in set:C195("$usable")>0)
									USE SET:C118("$usable")
								Else 
									USE SET:C118("$Far")
									// TRACE
									// there are only unallocations available to be re-allocated. just need to make sure they were not the unallocaiton of this item
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
											QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
											$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
										Else 
											$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
										End if 
										If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)>0)
											If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
												$_l_FromUNANumber:=0
												If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
													$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
												Else 
													STK_l_PreviousItemNumber:=0
													STK_bo_PreviousItemNumberTested:=False:C215
													$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
													// Open window(20;Screen height-200;120;Screen height-100;-Palette window )
													$_l_Retries:=0
													While (Not:C34(STK_bo_PreviousItemNumberTested))
														// GOTO XY(0;0)
														// MESSAGE("Waiting for flag  "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
														$_l_Retries:=$_l_Retries+1
														DelayTicks((3+$_l_Retries)*60)
													End while 
													// CLOSE WINDOW
													SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
													
													$_l_FromUNANumber:=STK_l_PreviousItemNumber
												End if 
											Else 
												$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
											End if 
											If ($_l_FromUNANumber#$_l_FromItemNumber) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											End if 
											
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE SET:C118("$usable")
								End if 
								
								
								If ($_l_ApplicationType=4D Server:K5:6)
									// GOTO XY(0;0)
									// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 17A")
								End if 
							End if 
						: ($_bo_isUnAllocation)
							// TRACE
							// we can only UNALLOCATE an allocation
							If (Not:C34(STK_bo_CheckStockItemID2Index))
								ARRAY POINTER:C280($_aptr_Fields; 2)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID2")
								STK_bo_CheckStockItemID2Index:=True:C214
							End if 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 18")
							End if 
							If ($_l_FromItemNumber#0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
							Else 
								REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
							End if 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 19")
							End if 
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								ARRAY POINTER:C280($_aptr_Fields; 2)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							
							
							CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 20")
							End if 
							For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
									QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
									$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
								Else 
									$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
								End if 
								If (Find in array:C230($_at_AllocationTypes; $_t_MovementType)>0)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 20A")
							End if 
							USE SET:C118("$usable")
							
						Else 
							// we can have 0 stock that has an item number on..when we create P stock from it i
							// if it is allocated thought and the movement type is NOT an allocation type for e
							If ($_l_FromItemNumber#0)
								// TRACE
								Case of 
									: ($_bo_UseOnlyAllocated)
										If ($_l_ApplicationType=4D Server:K5:6)
											// GOTO XY(0;0)
											// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 21")
										End if 
										
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
										If ($_l_ApplicationType=4D Server:K5:6)
											// GOTO XY(0;0)
											// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 21A")
										End if 
									: ($_bo_useOnlyUnAllocated)
										If ($_l_ApplicationType=4D Server:K5:6)
											// GOTO XY(0;0)
											// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 22")
										End if 
										
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
										If ($_l_ApplicationType=4D Server:K5:6)
											// GOTO XY(0;0)
											// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 22A")
										End if 
									Else 
										CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
										// if the items are the same as the type plus.. then this movement type not being a
										If (Not:C34(STK_bo_CheckStockItemID3Index))
											ARRAY POINTER:C280($_aptr_Fields; 2)
											$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
											CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID3")
											STK_bo_CheckStockItemID3Index:=True:C214
										End if 
										CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
										
										If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											
										Else 
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
											
										End if 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
											USE SET:C118("$Temp")
										End if 
										CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										
										For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
											If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
												If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
													QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
													$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
													$_t_MovementTypeStockAdd:=""
												Else 
													$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
													$_t_MovementTypeStockAdd:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
												End if 
												If ($_t_MovementTypeStockAdd="")
													If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
														QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
														$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
													End if 
												End if 
												If (Find in array:C230($_at_StockPlus; $_t_MovementTypeStockAdd)<0)
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
												End if 
												
											Else 
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											End if 
											NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										End for 
										USE SET:C118("$usable")
								End case 
							Else 
								If ($_bo_UseOnlyAllocated)
									// TRACE
								End if 
								If ($_bo_useOnlyUnAllocated)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
								End if 
							End if 
					End case 
					$_l_CopiedFromID:=0
					
					If ($_d_MaxDate>!00-00-00!)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_MaxDate)
					End if 
					
					
					If (Not:C34(STK_bo_CheckStockItemID4Index))
						ARRAY POINTER:C280($_aptr_Fields; 2)
						$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
						CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
						STK_bo_CheckStockItemID4Index:=True:C214
					End if 
					
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				End if 
			End if 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0) & ($_r_CostPrice=0)  // if cost price>0 price is important
				If (Not:C34(STK_bo_CheckStItemNoCostIndex))
					ARRAY POINTER:C280($_aptr_Fields; 6)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					// $aFields{2}:=->[STOCK ITEMS]Cost Price
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					$_aptr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					$_aptr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					$_aptr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38
					
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemTypenocost")
					STK_bo_CheckStItemNoCostIndex:=True:C214
				End if 
				If ($_l_ApplicationType=4D Server:K5:6)
					// GOTO XY(0;0)
					// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 26")
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode; *)
				If ((<>StockAnal))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
				Else 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
				If ($_bo_TryPO)
					If ($_t_FromPONumber#"")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
					End if 
					If ($_l_FromPOItemNumber#0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
					End if 
				End if 
				Case of 
					: ($_bo_IsAllocation)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
						If (Not:C34(STK_bo_CheckStockItemSOIDIndex))
							ARRAY POINTER:C280($_aptr_Fields; 3)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
							$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemSOID")
							STK_bo_CheckStockItemSOIDIndex:=True:C214
						End if 
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						// Need to check these are not un-allocations or we create a circle
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							USE SET:C118("$Temp")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
							ARRAY POINTER:C280($_aptr_Fields; 2)
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 3A")
						End if 
						// have to NOT select an unallocation here
						// NG why i have made that dictate..its wrong.. can select an un-allocation PROVIDING
						// 1)it has been unallocated from something ie its not sitting there waiting to be up(else it might be an unallocation of the item we are trying to allocate)
						
						
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Far")
							CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
							For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
									QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
									$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
								Else 
									$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
								End if 
								If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)<0)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									End if 
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							
							If (Records in set:C195("$usable")>0)
								USE SET:C118("$usable")
							Else 
								USE SET:C118("$Far")
								// TRACE
								// there are only unallocations available to be re-allocated. just need to make sure they were not the unallocaiton of this item
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
								For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
										QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
									Else 
										$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
									End if 
									If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)>0)
										If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
											$_l_FromUNANumber:=0
											If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
												$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											Else 
												STK_l_PreviousItemNumber:=0
												STK_bo_PreviousItemNumberTested:=False:C215
												$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												// Open window(20;Screen height-200;120;Screen height-100;-Palette window )
												$_l_Retries:=0
												While (Not:C34(STK_bo_PreviousItemNumberTested))
													// GOTO XY(0;0)
													// MESSAGE("Waiting for flag  "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
													$_l_Retries:=$_l_Retries+1
													DelayTicks((3+$_l_Retries)*60)
												End while 
												// CLOSE WINDOW
												SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
												$_l_FromUNANumber:=STK_l_PreviousItemNumber
											End if 
										Else 
											$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
										End if 
										If ($_l_FromUNANumber#$_l_FromItemNumber) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								USE SET:C118("$usable")
							End if 
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 5")
						End if 
						
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
						End if 
					: ($_bo_isUnAllocation)
						// TRACE
						// we can only UNALLOCATE an allocation
						If (Not:C34(STK_bo_CheckStockItemID2Index))
							ARRAY POINTER:C280($_aptr_Fields; 2)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID2")
							STK_bo_CheckStockItemID2Index:=True:C214
						End if 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 30")
						End if 
						If ($_l_FromItemNumber#0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
						Else 
							REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
						End if 
						ARRAY POINTER:C280($_aptr_Fields; 2)
						If (Not:C34(STK_bo_CheckStockItemID4Index))
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
							STK_bo_CheckStockItemID4Index:=True:C214
						End if 
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						
						CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
								QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
								$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
							Else 
								$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
							End if 
							If (Find in array:C230($_at_AllocationTypes; $_t_MovementType)>0)
								ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						USE SET:C118("$usable")
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 30A")
						End if 
						
					Else 
						// we can have 0 stock that has an item number on..when we create P stock from it i
						// if it is allocated thought and the movement type is NOT an allocation type for e
						If ($_l_FromItemNumber#0)
							// TRACE
							Case of 
								: ($_bo_UseOnlyAllocated)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 31")
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 31A")
									End if 
								: ($_bo_useOnlyUnAllocated)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 32")
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 32A")
									End if 
								Else 
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
									// if the items are the same as the type plus.. then this movement type not being a
									If (Not:C34(STK_bo_CheckStockItemID3Index))
										ARRAY POINTER:C280($_aptr_Fields; 2)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID3")
										STK_bo_CheckStockItemID3Index:=True:C214
									End if 
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
									
									If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									Else 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										USE SET:C118("$Temp")
									End if 
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
											If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
												QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
												$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
												$_t_MovementTypeStockAdd:=""
											Else 
												$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
												$_t_MovementTypeStockAdd:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
											End if 
											If ($_t_MovementTypeStockAdd="")
												If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
													QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
													$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
												End if 
											End if 
											If (Find in array:C230($_at_StockPlus; $_t_MovementTypeStockAdd)<0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											End if 
											
										Else 
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE SET:C118("$usable")
							End case 
						Else 
							If ($_bo_UseOnlyAllocated)
								// TRACE
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
								
							End if 
							If ($_bo_useOnlyUnAllocated)
								// TRACE
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
								
							End if 
						End if 
				End case 
				$_l_CopiedFromID:=0
				If ($_d_MaxDate>!00-00-00!)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_MaxDate)
				End if 
				If (Not:C34(STK_bo_CheckStockItemID4Index))
					ARRAY POINTER:C280($_aptr_Fields; 2)
					$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
					STK_bo_CheckStockItemID4Index:=True:C214
				End if 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				
			End if 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				// First we will try to find by exact quantity available for call off available
				If ($_l_ApplicationType=4D Server:K5:6)
					// GOTO XY(0;0)
					// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 36")
				End if 
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
				For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37=$_r_Quantity)
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
							$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						End if 
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
				
				If ($_l_CopiedFromID=0)  //
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					
					For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_Quantity)
							If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
								$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								
							End if 
							
						End if 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					
					
					If ($_l_CopiedFromID=0) & ((Not:C34(<>STOCK_bo_NoSplit)) | (STK_bo_CallisPreTry))
						
						$_r_TotalAvailable:=0
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 39")
						End if 
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
								$_r_TotalAvailable:=$_r_TotalAvailable+[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						If ($_l_ApplicationType=4D Server:K5:6)
							// GOTO XY(0;0)
							// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 39A")
						End if 
						If ($_r_TotalAvailable>=$_r_Quantity)
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 40")
							End if 
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							$_r_TotalSelected:=0
							For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
										$_r_Available:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										While (Semaphore:C143("HoldsInUse"))
											DelayTicks(2)
										End while 
										QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3=[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										$_r_Available:=$_r_Available-Sum:C1([STK_TransactionHolds:192]xCalledOffQty:4)
										CLEAR SEMAPHORE:C144("HoldsInUse")
										
										If (($_r_TotalSelected+$_r_Available)>$_r_Quantity)
											$_r_Available:=$_r_Quantity-$_r_TotalSelected
										End if 
										If ($_r_Available>0)
											APPEND TO ARRAY:C911($_al_PreviousID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											APPEND TO ARRAY:C911($_ar_PreviousCalloff; $_r_Available)
											APPEND TO ARRAY:C911($_al_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
											APPEND TO ARRAY:C911($_at_TakeFromLocation; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911($_at_TakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											APPEND TO ARRAY:C911($_at_TakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
											APPEND TO ARRAY:C911($_at_TakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
											$_r_TotalSelected:=$_r_TotalSelected+$_r_Available
										End if 
									End if 
								End if 
								
								If ($_r_TotalSelected=$_r_Quantity)
									$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 40A")
							End if 
							If (Size of array:C274($_al_PreviousID)>0)
								$_l_CopiedFromID:=-1
								// the stock item we are trying to create cannot be copied from a single stock item
							End if 
							
						Else 
							// TRACE
							//   //////
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 41")
							End if 
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							$_r_TotalSelected:=0
							For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
										$_r_Available:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										While (Semaphore:C143("HoldsInUse"))
											DelayTicks(2)
										End while 
										QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3=[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										$_r_Available:=$_r_Available-Sum:C1([STK_TransactionHolds:192]xCalledOffQty:4)
										CLEAR SEMAPHORE:C144("HoldsInUse")
										
										If (($_r_TotalSelected+$_r_Available)>$_r_Quantity)
											$_r_Available:=$_r_Quantity-$_r_TotalSelected
										End if 
										If ($_r_Available>0)
											APPEND TO ARRAY:C911($_al_PreviousID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											APPEND TO ARRAY:C911($_ar_PreviousCalloff; $_r_Available)
											APPEND TO ARRAY:C911($_al_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
											APPEND TO ARRAY:C911($_at_TakeFromLocation; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911($_at_TakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											APPEND TO ARRAY:C911($_at_TakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
											APPEND TO ARRAY:C911($_at_TakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
											$_r_TotalSelected:=$_r_TotalSelected+$_r_Available
										End if 
									End if 
								End if 
								If ($_r_TotalSelected=$_r_Quantity)
									$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 41A")
							End if 
							
							//   //////// if we had an id this would still be the same becaue there are not enough on that id
							If (Not:C34(STK_bo_CheckStItemNoCostIndex))
								ARRAY POINTER:C280($_aptr_Fields; 6)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
								$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
								$_aptr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
								$_aptr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
								$_aptr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38
								
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemTypenocost")
								STK_bo_CheckStItemNoCostIndex:=True:C214
							End if 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 42")
							End if 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode; *)
							If ((<>StockAnal))
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
							Else 
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=""; *)
							End if 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
							// TRACE
							If ($_bo_TryPO)
								If ($_t_FromPONumber#"")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_FromPONumber)
								End if 
								If ($_l_FromPOItemNumber#0)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_FromPOItemNumber)
								End if 
							End if 
							Case of 
								: ($_bo_IsAllocation)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
									If (Not:C34(STK_bo_CheckStockItemSOIDIndex))
										ARRAY POINTER:C280($_aptr_Fields; 3)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
										$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemSOID")
										STK_bo_CheckStockItemSOIDIndex:=True:C214
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
									If (Not:C34(STK_bo_CheckStockItemID4Index))
										ARRAY POINTER:C280($_aptr_Fields; 2)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
										STK_bo_CheckStockItemID4Index:=True:C214
										
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									// Need to check these are not un-allocations or we create a circle
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										USE SET:C118("$Temp")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
										If (Not:C34(STK_bo_CheckStockItemID4Index))
											ARRAY POINTER:C280($_aptr_Fields; 2)
											$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
											$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
											CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
											STK_bo_CheckStockItemID4Index:=True:C214
										End if 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									End if 
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 3A")
									End if 
									// have to NOT select an unallocation here
									// NG why i have made that dictate..its wrong.. can select an un-allocation PROVIDING
									// 1)it has been unallocated from something ie its not sitting there waiting to be up(else it might be an unallocation of the item we are trying to allocate)
									
									
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Far")
										CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
										For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
											If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
												QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
												$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
											Else 
												$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
											End if 
											If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)<0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											Else 
												If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
												End if 
											End if 
											NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										End for 
										
										If (Records in set:C195("$usable")>0)
											USE SET:C118("$usable")
										Else 
											USE SET:C118("$Far")
											// TRACE
											// there are only unallocations available to be re-allocated. just need to make sure they were not the unallocaiton of this item
											CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
											SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
											For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
												If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
													QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
													$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
												Else 
													$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
												End if 
												If (Find in array:C230($_at_UnAllocationMovementTypes; $_t_MovementType)>0)
													If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
														$_l_FromUNANumber:=0
														If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
															$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
														Else 
															STK_l_PreviousItemNumber:=0
															STK_bo_PreviousItemNumberTested:=False:C215
															$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
															// Open window(20;Screen height-200;120;Screen height-100;-Palette window )
															$_l_Retries:=0
															While (Not:C34(STK_bo_PreviousItemNumberTested))
																// GOTO XY(0;0)
																// MESSAGE("Waiting for flag  "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
																$_l_Retries:=$_l_Retries+1
																DelayTicks((3+$_l_Retries)*60)
															End while 
															// CLOSE WINDOW
															SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
															$_l_FromUNANumber:=STK_l_PreviousItemNumber
														End if 
													Else 
														$_l_FromUNANumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
													End if 
													If ($_l_FromUNANumber#$_l_FromItemNumber) & (([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0) & (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)))
														ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
													End if 
													
												End if 
												NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											End for 
											USE SET:C118("$usable")
										End if 
									End if 
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 5")
									End if 
									
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 4")
									End if 
								: ($_bo_isUnAllocation)
									// TRACE
									// we can only UNALLOCATE an allocation
									If (Not:C34(STK_bo_CheckStockItemID2Index))
										ARRAY POINTER:C280($_aptr_Fields; 2)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID2")
										STK_bo_CheckStockItemID2Index:=True:C214
									End if 
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 30")
									End if 
									If ($_l_FromItemNumber#0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID)
									Else 
										REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
									End if 
									If (Not:C34(STK_bo_CheckStockItemID4Index))
										ARRAY POINTER:C280($_aptr_Fields; 2)
										$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
										$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
										STK_bo_CheckStockItemID4Index:=True:C214
									End if 
									
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
									
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
											QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
											$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
										Else 
											$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
										End if 
										If (Find in array:C230($_at_AllocationTypes; $_t_MovementType)>0)
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE SET:C118("$usable")
									If ($_l_ApplicationType=4D Server:K5:6)
										// GOTO XY(0;0)
										// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 30A")
									End if 
									
								Else 
									// we can have 0 stock that has an item number on..when we create P stock from it i
									// if it is allocated thought and the movement type is NOT an allocation type for e
									If ($_l_FromItemNumber#0)
										// TRACE
										Case of 
											: ($_bo_UseOnlyAllocated)
												If ($_l_ApplicationType=4D Server:K5:6)
													// GOTO XY(0;0)
													// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 31")
												End if 
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber)
												If ($_l_ApplicationType=4D Server:K5:6)
													// GOTO XY(0;0)
													// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 31A")
												End if 
											: ($_bo_useOnlyUnAllocated)
												If ($_l_ApplicationType=4D Server:K5:6)
													// GOTO XY(0;0)
													// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 32")
												End if 
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
												If ($_l_ApplicationType=4D Server:K5:6)
													// GOTO XY(0;0)
													// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 32A")
												End if 
											Else 
												CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
												QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
												SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockPlus)
												// if the items are the same as the type plus.. then this movement type not being a
												If (Not:C34(STK_bo_CheckStockItemID3Index))
													ARRAY POINTER:C280($_aptr_Fields; 2)
													$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
													$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
													CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID3")
													STK_bo_CheckStockItemID3Index:=True:C214
												End if 
												CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
												
												If (Not:C34($_bo_IsStockReceipt))  // a stock receipt does not retain a sales order item number but that might be on
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_FromItemNumber; *)
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
												Else 
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
												End if 
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
													USE SET:C118("$Temp")
												End if 
												CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$usable")
												
												For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
													If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
														If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
															QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
															$_t_MovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
															$_t_MovementTypeStockAdd:=""
														Else 
															$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
															$_t_MovementTypeStockAdd:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
														End if 
														If ($_t_MovementTypeStockAdd="")
															If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
																QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
																$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
															End if 
														End if 
														If (Find in array:C230($_at_StockPlus; $_t_MovementTypeStockAdd)<0)
															ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
														End if 
														
													Else 
														ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$usable")
													End if 
													NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
												End for 
												USE SET:C118("$usable")
										End case 
									Else 
										If ($_bo_UseOnlyAllocated)
											// TRACE
										End if 
										If ($_bo_useOnlyUnAllocated)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
										End if 
									End if 
							End case 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 42A")
							End if 
							$_l_CopiedFromID:=0
							MESSAGES OFF:C175
							If (Not:C34(<>STK_bo_NotFirstPass))
								MESSAGES OFF:C175
								// QUERY([STOCK ITEMS];[STOCK ITEMS]Product Code=$_t_productCode)
								<>TellMe:=True:C214
								
								<>TellMe:=False:C215
								<>STK_bo_NotFirstPass:=True:C214
								MESSAGES ON:C181
							Else 
								
							End if 
							MESSAGES ON:C181
							If ($_d_MaxDate>!00-00-00!)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_MaxDate)
							End if 
							If (Not:C34(STK_bo_CheckStockItemID4Index))
								ARRAY POINTER:C280($_aptr_Fields; 2)
								$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockitemID4")
								STK_bo_CheckStockItemID4Index:=True:C214
							End if 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 43")
							End if 
							
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							// TRACE
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 43A")
							End if 
							// There are not sufficient  stock item  records at that price. So probably somethi
							// see if there are stock items of the same type that could be called off to link t
							
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
							
							
							
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							$_r_TotalAvailable:=0
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 44")
							End if 
							For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
									$_r_TotalAvailable:=$_r_TotalAvailable+([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_l_ApplicationType=4D Server:K5:6)
								// GOTO XY(0;0)
								// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 44A")
							End if 
							If ($_r_TotalAvailable>0)
								If ($_l_ApplicationType=4D Server:K5:6)
									// GOTO XY(0;0)
									// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 45")
								End if 
								FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
								$_r_TotalSelected:=0
								For ($_l_MovementItemIndex; 1; Size of array:C274($_ar_PreviousCalloff))
									$_r_TotalSelected:=$_r_TotalSelected+$_ar_PreviousCalloff{$_l_MovementItemIndex}
								End for 
								// TRACE
								For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									
									If (Find in array:C230($_al_PreviousID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)<0)
										If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotID) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#$_l_NotID)
											$_r_Available:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
											While (Semaphore:C143("HoldsInUse"))
												DelayTicks(2)
											End while 
											
											QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3=[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											If (STK_l_TransactionID>0) & (In transaction:C397)
												QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2#STK_l_TransactionID)
											End if 
											$_r_Available:=$_r_Available-Sum:C1([STK_TransactionHolds:192]xCalledOffQty:4)
											
											CLEAR SEMAPHORE:C144("HoldsInUse")
											
											If (($_r_TotalSelected+$_r_Available)>=$_r_Quantity)
												$_r_Available:=$_r_Quantity-$_r_TotalSelected
											End if 
											If ($_r_Available>0)
												APPEND TO ARRAY:C911($_al_PreviousID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												APPEND TO ARRAY:C911($_ar_PreviousCalloff; $_r_Available)
												APPEND TO ARRAY:C911($_al_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
												APPEND TO ARRAY:C911($_at_TakeFromLocation; [STOCK_MOVEMENT_ITEMS:27]Location:7)
												APPEND TO ARRAY:C911($_at_TakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
												APPEND TO ARRAY:C911($_at_TakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
												APPEND TO ARRAY:C911($_at_TakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
												$_r_TotalSelected:=$_r_TotalSelected+$_r_Available
											End if 
										End if 
									End if 
									If ($_r_TotalSelected=$_r_Quantity)
										$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								If ($_l_ApplicationType=4D Server:K5:6)
									// GOTO XY(0;0)
									// MESSAGE("GET PREVIOUS MOVT"+$_t_productCode+" 45A")
								End if 
								If (Size of array:C274($_al_PreviousID)>0)
									// the stock item we are trying to create cannot be copied from a single stock item
									If ($_r_TotalSelected=$_r_Quantity)
										$_l_CopiedFromID:=-1
									Else 
										If (<>STOCK_bo_NoSuperSplit) & (Not:C34(STK_bo_CallisPreTry))
											$_l_CopiedFromID:=-2  // not enough
										Else 
											$_r_SelectedSoFar:=0
											For ($_l_SelFromPrevIndex; 1; Size of array:C274($_al_PreviousID))
												$_r_SelectedSoFar:=$_r_SelectedSoFar+$_ar_PreviousCalloff{$_l_SelFromPrevIndex}
											End for 
											APPEND TO ARRAY:C911($_al_PreviousID; 0)
											APPEND TO ARRAY:C911($_ar_PreviousCalloff; $_r_Quantity-$_r_SelectedSoFar)
											APPEND TO ARRAY:C911($_al_TakeFromCSID; 0)
											APPEND TO ARRAY:C911($_at_TakeFromLocation; "")
											APPEND TO ARRAY:C911($_at_TakeFromCurrency; "")
											APPEND TO ARRAY:C911($_at_TakeFromAnalysis; "")
											APPEND TO ARRAY:C911($_at_TakeFromLayer; "")
											
											$_r_TotalSelected:=$_r_Quantity
											$_l_CopiedFromID:=-1
										End if 
									End if 
								Else 
									$_l_CopiedFromID:=-2
								End if 
								
								
								
								
							Else 
								$_l_CopiedFromID:=-2
							End if 
						End if 
						
						
						
					End if 
					
				Else 
					// $_l_CopiedFromID:=-2
				End if 
			Else 
				If ($_r_CostPrice=0) & ($_d_MaxDate=!00-00-00!) & ($_l_CurrentStockID=0)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
						// TRACE
						DB_bo_NoMoreItems:=True:C214
					End if 
				End if 
			End if 
			
		Else 
			$_l_POAttempts:=$_l_Max+1
			$_l_CopiedFromID:=$2
		End if 
		$_bo_TryPO:=False:C215
	End for 
End if 
If ($_l_CallingProcess>0)
	ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
	ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
	ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
	ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
	ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
	ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
	ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
	If ($_l_CopiedFromID=-1)
		// The stock item has to be split because it comes from more than one.
		COPY ARRAY:C226($_al_PreviousID; STK_al_PreviousMovementIDS)
		COPY ARRAY:C226($_ar_PreviousCalloff; STK_ar_PreviousMovementQTY)
		COPY ARRAY:C226($_al_TakeFromCSID; STK_al_PreviousMovementCSID)
		COPY ARRAY:C226($_at_TakeFromLocation; STK_at_PreviousMovementLocation)
		COPY ARRAY:C226($_at_TakeFromCurrency; STK_at_PreviousMovementCurrency)
		COPY ARRAY:C226($_at_TakeFromAnalysis; STK_at_PreviousMovementAnalysis)
		COPY ARRAY:C226($_at_TakeFromLayer; STK_at_PreviousMovementLayer)
		
		// STK_ar_PreviousMovementCSID
		// STK_ar_PreviousMovementCSID
	End if 
	$_l_FromCurrentStockID:=0
	$_t_FromLocation:=""
	$_r_FromCostPrice:=0
	$_t_FromAnalysis:=""
	$_t_FromCurrency:=""
	$_t_FromLayer:=""
	$_t_FromSerialNumber:=""
	If ($_l_CopiedFromID>0)
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_CopiedFromID)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromID)
			$_l_FromCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
			$_t_FromLocation:=[STOCK_MOVEMENT_ITEMS:27]Location:7
			$_t_FromSerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
			$_r_FromCostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			$_t_FromAnalysis:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
			$_t_FromCurrency:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
			$_t_FromLayer:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
		End if 
	Else 
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		
	End if 
	If (Not:C34(DB_bo_NoMoreItems))
		SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_l_PreviousMovementID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16>0) & (Not:C34(STK_bo_CallisPreTry))
			$_r_AlreadyCalledOffQTY:=0
			//ARRAY LONGINT(STK_al_CalledoffByID;0)
			//ARRAY LONGINT(STK_al_CalledoffFromID;0)
			//ARRAY REAL(STK_ar_CalledOffQuantity;0)
			
			For ($_l_ResetIndex; 1; Size of array:C274(STK_al_CalledoffByID))
				If (STK_al_CalledoffFromID{$_l_ResetIndex}=[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					If (STK_al_CalledoffByID{$_l_ResetIndex}#$_l_NotID)
						$_r_AlreadyCalledOffQTY:=$_r_AlreadyCalledOffQTY+STK_ar_CalledOffQuantity{$_l_ResetIndex}
					End if 
					
				End if 
			End for 
			//TRACE
			//TRACE
			$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockMovementItemID)
			STK_R_CALLEDOFF:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+(STK_CountonHold($_l_StockMovementItemID)))
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockMovementItemID)
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			//TRACE
			If ((STK_R_CALLEDOFF+$_r_Quantity)<=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF+$_r_Quantity  //[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity+($_r_Quantity+$_r_AlreadyCalledOffQTY)
				If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					//TRACE
				End if 
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				$_l_ItemRow:=Find in array:C230(STK_al_CalledoffByID; $_l_NotID)
				If ($_l_ItemRow<0)
					APPEND TO ARRAY:C911(STK_al_CalledoffByID; $_l_NotID)
					APPEND TO ARRAY:C911(STK_al_CalledoffFromID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					APPEND TO ARRAY:C911(STK_ar_CalledOffQuantity; $_r_Quantity)
				Else 
					STK_al_CalledoffFromID{$_l_ItemRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					STK_ar_CalledOffQuantity{$_l_ItemRow}:=$_r_Quantity
				End if 
				If (False:C215)  // removed January 2015
					If (<>STK_l_ValidateCalledOff=0)
						
						<>STK_l_ValidateCalledOff:=New process:C317("STK_ManageCalledOff"; 512000; "Validate Called off manager"; $_l_CallingProcess; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; *)
					Else 
						STK_l_addID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						$_l_addID:=STK_l_addID
						While (Semaphore:C143("STKbVCM"; 60))
							DelayTicks(2)
						End while 
						//Repeat
						$_l_Retries:=0
						STK_l_addID:=$_l_addID
						//TRACE
						SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addCallingProcess; $_l_CallingProcess)
						SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_Resume; Current process:C322)
						RESUME PROCESS:C320(<>STK_l_ValidateCalledOff)
						//DelayTicks (60)
						If (False:C215)
							Repeat 
								GET PROCESS VARIABLE:C371(<>STK_l_ValidateCalledOff; STK_l_addID; STK_l_addID)
								If (STK_l_addID>0)
									$_l_Retries:=$_l_Retries+1
									DelayTicks(60)
								End if 
							Until (STK_l_addID=0) | ($_l_Retries>2)
						End if 
						$_l_Retries:=0
						//Until (STK_l_addID=0)
						
						
						CLEAR SEMAPHORE:C144("STKbVCM")
						
					End if 
				End if 
				
				// $_l_Process:=New Process("STK_ValidateCalledafterProcess";512000;"Validate Called off"+String([STOCK ITEMS]x_ID);$_l_CallingProcess;[STOCK ITEMS]x_ID;*)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			Else 
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF  //[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity+($_r_Quantity+$_r_AlreadyCalledOffQTY)
				If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					//TRACE
				End if 
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
				ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
				ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
				ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
				ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
				ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
				ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
				APPEND TO ARRAY:C911(STK_al_PreviousMovementIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911(STK_ar_PreviousMovementQTY; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				APPEND TO ARRAY:C911(STK_al_PreviousMovementCSID; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				APPEND TO ARRAY:C911(STK_at_PreviousMovementLocation; [STOCK_MOVEMENT_ITEMS:27]Location:7)
				APPEND TO ARRAY:C911(STK_at_PreviousMovementCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
				APPEND TO ARRAY:C911(STK_at_PreviousMovementAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
				APPEND TO ARRAY:C911(STK_at_PreviousMovementLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
				$_r_TotalRemaining:=$_r_Quantity-[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
				APPEND TO ARRAY:C911(STK_al_PreviousMovementIDS; 0)
				APPEND TO ARRAY:C911(STK_ar_PreviousMovementQTY; $_r_TotalRemaining)
				APPEND TO ARRAY:C911(STK_al_PreviousMovementCSID; 0)
				APPEND TO ARRAY:C911(STK_at_PreviousMovementLocation; "")
				APPEND TO ARRAY:C911(STK_at_PreviousMovementCurrency; "")
				APPEND TO ARRAY:C911(STK_at_PreviousMovementAnalysis; "")
				APPEND TO ARRAY:C911(STK_at_PreviousMovementLayer; "")
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			End if 
		End if 
	Else 
		// TRACE
		SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_l_PreviousMovementID; -9999)
	End if 
	
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_l_PreviousStockItemNumber; $_l_FromCurrentStockID)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_t_PreviousStockLocation; $_t_FromLocation)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_t_PreviousStockSerial; $_t_FromSerialNumber)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_R_PreviousCostPrice; $_r_FromCostPrice)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_T_PreviousStockItemAnal; $_t_FromAnalysis)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_T_PreviousStockItemCurrency; $_t_FromCurrency)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_T_PreviousStockItemLayer; $_t_FromLayer)
	// STK_T_PreviousStockItemAnal:=""
	// STK_T_PreviousStockItemLayer:=""
	// STK_T_PreviousStockItemCurrency:=""
	// have to deal with tthe following and also pass back the cost and currency
	VARIABLE TO VARIABLE:C635($_l_CallingProcess; STK_al_PreviousMovementIDS; STK_al_PreviousMovementIDS; STK_ar_PreviousMovementQTY; STK_ar_PreviousMovementQTY; STK_al_PreviousMovementCSID; STK_al_PreviousMovementCSID)
	VARIABLE TO VARIABLE:C635($_l_CallingProcess; STK_at_PreviousMovementLocation; STK_at_PreviousMovementLocation; STK_at_PreviousMovementCurrency; STK_at_PreviousMovementCurrency; STK_at_PreviousMovementAnalysis; STK_at_PreviousMovementAnalysis; STK_at_PreviousMovementLayer; STK_at_PreviousMovementLayer)
	For ($_l_UpdateCalledoff; 1; Size of array:C274(STK_al_PreviousMovementIDS))
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		If (STK_al_PreviousMovementIDS{$_l_UpdateCalledoff}>0) & (Not:C34(STK_bo_CallisPreTry))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_PreviousMovementIDS{$_l_UpdateCalledoff})
			$_r_AlreadyCalledOffQTY:=0
			$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockMovementItemID)
			STK_R_CALLEDOFF:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+(STK_CountonHold($_l_StockMovementItemID)))
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockMovementItemID)
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			//TRACE
			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF+STK_ar_PreviousMovementQTY{$_l_UpdateCalledoff}  //ARRAY LONGINT(STK_al_CalledoffByID;0)
			//ARRAY LONGINT(STK_al_CalledoffFromID;0)
			//ARRAY REAL(STK_ar_CalledOffQuantity;0)
			If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				//TRACE
			End if 
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			$_l_ItemRow:=Find in array:C230(STK_al_CalledoffByID; $_l_NotID)
			If ($_l_ItemRow<0)
				APPEND TO ARRAY:C911(STK_al_CalledoffByID; $_l_NotID)
				APPEND TO ARRAY:C911(STK_al_CalledoffFromID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911(STK_ar_CalledOffQuantity; STK_ar_PreviousMovementQTY{$_l_UpdateCalledoff})
			Else 
				STK_al_CalledoffFromID{$_l_ItemRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				STK_ar_CalledOffQuantity{$_l_ItemRow}:=STK_ar_PreviousMovementQTY{$_l_UpdateCalledoff}
				
			End if 
			If (False:C215)  //removed january 2015
				If (<>STK_l_ValidateCalledOff=0)
					
					<>STK_l_ValidateCalledOff:=New process:C317("STK_ManageCalledOff"; 512000; "Validate Called off manager"; $_l_CallingProcess; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; *)
					
				Else 
					STK_l_addID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
					While (Semaphore:C143("STKbVCM"; 60))
						DelayTicks(2)
					End while 
					//TRACE
					SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addCallingProcess; $_l_CallingProcess)
					SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
					SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_Resume; Current process:C322)
					RESUME PROCESS:C320(<>STK_l_ValidateCalledOff)
					If (False:C215)
						Repeat 
							GET PROCESS VARIABLE:C371(<>STK_l_ValidateCalledOff; STK_l_addID; STK_l_addID)
							If (STK_l_addID>0)
								DelayTicks(60)
							End if 
						Until (STK_l_addID=0)
					End if 
					CLEAR SEMAPHORE:C144("STKbVCM")
					
				End if 
			End if 
			// $_l_Process:=New Process("STK_ValidateCalledafterProcess";1512000;"Validate Called off"+String([STOCK ITEMS]x_ID);$_l_CallingProcess;[STOCK ITEMS]x_ID;*)
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		End if 
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	End for 
	
	SET PROCESS VARIABLE:C370($_l_CallingProcess; STK_bo_PreviousSet; True:C214)
	$_l_Retries:=0
	Repeat 
		//TRACE
		//   //MESSAGE("Waiting for process"+String($_l_CallingProcess))
		RESUME PROCESS:C320($_l_CallingProcess)
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
		
	Until (STK_bo_CalledBACK) | ($_l_Retries>10)
	
	
	
	
	
	
	
Else 
	
	
End if 
ERR_MethodTrackerReturn("STK_GetPreviousStockMovement"; $_t_oldMethodName)
