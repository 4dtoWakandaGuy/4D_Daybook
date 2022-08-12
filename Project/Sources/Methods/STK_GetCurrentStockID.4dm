//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetCurrentStockID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/12/2010 10:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CSIDsDeleted; 0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	ARRAY POINTER:C280($_aptr_Fields; 0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_AddItemNumber; $_bo_IsAllocation; $_bo_IsAllocationType; $_bo_IsUnAllocation; $_bo_IsUnAllocationType; $_bo_LocationWasOnPrevious; $_bo_MustCheckPrevious; $_bo_NoRealMove; $_bo_SNWasonPrevious; $_bo_UseOnlyAllocated)
	C_BOOLEAN:C305($11; $12; $17; CSCreated; CSready; DB_bo_CSset; STK_bo_CalledBACK; STK_bo_CheckProdTypeCostIndex; STK_bo_CheckProductItemIndex; STK_bo_CheckProductTypeIndex; STK_bo_CreateCS)
	C_BOOLEAN:C305(STK_bo_CSReceived; STK_bo_NOProcess; STK_bo_PreviousSet)
	C_DATE:C307($_d_Date; $_d_HeaderDate; $15)
	C_LONGINT:C283(<>STK_l_PreviousProcess; $_l_CopiedFromCSID; $_l_CopiedFromID; $_l_CountCurrentStockRecords; $_l_Creation; $_l_CSIDOLD; $_l_CSIStockItemNumber; $_l_DeletedIndex; $_l_ItemNumber; $_l_OrderBy; $_l_Process)
	C_LONGINT:C283($_l_QueryCurrentStock; $_l_QueryCurrentStock2; $_l_QueryMovement1; $_l_Retries; $_l_SemaphoreWaits; $_l_StockItemNumber; $_l_TakeFromItemID; $_l_Waits; $0; $1; $13)
	C_LONGINT:C283($14; $4; DB_l_CSID; STK_l_DummyOrderItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber; STK_l_SpeedTest)
	C_REAL:C285($_l_CSID; $_r_Cost; $_r_CostPrice; $_r_Quantity; $10; $16; STK_l_TakeFromStockID)
	C_TEXT:C284(<>CreationMessage; $_t_AnalysisCode; $_t_CreationMessage; $_t_CSLocationCode; $_t_CSSerialNumber; $_t_CurrencyCode; $_t_LayerCode; $_t_LocationCode; $_t_oldMethodName; $_t_productCode; $_t_SerialNo)
	C_TEXT:C284($_t_StockType; $18; $2; $3; $5; $6; $7; $8; $9; STK_t_CSStockMessage; STK_t_MovementType)
	C_TEXT:C284(STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetCurrentStockID"; Form event code:C388)
$0:=0
STK_t_CSStockMessage:=""
$_l_QueryMovement1:=0
$_l_QueryCurrentStock:=0
$_l_QueryCurrentStock2:=0
$_l_OrderBy:=0
$_l_Creation:=0
$_l_Waits:=0
$_t_CreationMessage:=""
<>CreationMessage:=""
$_l_SemaphoreWaits:=0

$_t_LocationCode:=""
If (Count parameters:C259>=12)
	$_t_productCode:=$2
	$_t_StockType:=$3
	$_l_StockItemNumber:=$4
	$_t_CurrencyCode:=$5
	$_t_LayerCode:=$6
	$_t_AnalysisCode:=$7
	$_t_LocationCode:=$8
	$_t_SerialNo:=$9
	$_r_CostPrice:=$10
	$_bo_IsAllocationType:=$11
	$_bo_IsUnAllocationType:=$12
	If (Count parameters:C259>=16)
		$_l_CopiedFromID:=$13
		$_l_CopiedFromCSID:=$14
		$_d_Date:=$15
		$_r_Quantity:=$16
	Else 
		$_l_CopiedFromID:=0
		$_l_CopiedFromCSID:=0
		$_d_Date:=!00-00-00!
		$_r_Quantity:=0
	End if 
	
	$_bo_MustCheckPrevious:=False:C215
	If (Count parameters:C259>=18)
		$_bo_SNWasonPrevious:=$17
		$_bo_LocationWasOnPrevious:=($18#"")
	Else 
		$_bo_MustCheckPrevious:=True:C214
		$_bo_SNWasonPrevious:=False:C215
		$_bo_LocationWasOnPrevious:=False:C215
	End if 
	
	Case of 
		: ($1=1)  //ADD
			
			If ($_t_StockType#"") & ($_t_productCode#"")
				If (Not:C34(STK_bo_CheckProductItemIndex))
					ARRAY POINTER:C280($_aptr_Fields; 8)
					$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
					$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
					$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Item_Number:5
					$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Currency_Code:11
					$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
					$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Analysis_Code:10
					$_aptr_Fields{7}:=->[CURRENT_STOCK:62]Location:8
					$_aptr_Fields{8}:=->[CURRENT_STOCK:62]Serial_Number:2
					
					CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "ProductItemType")
					
					STK_bo_CheckProductItemIndex:=True:C214
				End if 
				READ ONLY:C145([MOVEMENT_TYPES:60])
				If ([MOVEMENT_TYPES:60]Type_Code:1#STK_t_MovementType)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=STK_t_MovementType)
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
				If ($_t_StockType#"")
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
				Else 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=""; *)
				End if 
				Case of 
					: ([MOVEMENT_TYPES:60]Delivery_Type:12) | ([MOVEMENT_TYPES:60]UseAllocatedStock:27)
						$_bo_AddItemNumber:=True:C214
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
					: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)  //The current stock record adding to (say 0 stock) should not include the item ID
						
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
						$_l_StockItemNumber:=0
						//if this IS the rule then we need to make sure that the take from behaves to correct way....taking from the CORRECT stock item the stock item may have the item number on but the CS id does not
					: ($_bo_IsAllocationType)  //& (Records in selection([CURRENT STOCK])>0)  `this is in allocation movement
						
						If ($_l_StockItemNumber#0)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
						End if 
					: ($_bo_IsUnAllocationType)  //& (Records in selection([CURRENT STOCK])>0)
						
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
					Else 
						If ($_l_StockItemNumber#0)
							$_bo_AddItemNumber:=True:C214
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
						End if 
				End case 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
				If ($_t_AnalysisCode#"")
					If (<>StockAnal)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
					End if 
				Else 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
				End if 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_t_LocationCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_SerialNo)
				
				$_bo_AddItemNumber:=False:C215
				If ($_r_CostPrice#0) & (Records in selection:C76([CURRENT_STOCK:62])>0)
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_r_CostPrice)
				End if 
				
				
				If ($_r_CostPrice=0)
					ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6)
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 1)
					
				End if 
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					If (Records in selection:C76([CURRENT_STOCK:62])>1)
						//There should  not be multiple records so merge them
						$_r_Cost:=[CURRENT_STOCK:62]Cost_Price:6
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_r_Cost)
						If (Records in selection:C76([CURRENT_STOCK:62])>1)
							
							$_r_Quantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
							CREATE SET:C116([CURRENT_STOCK:62]; "$Match")
							$_l_CountCurrentStockRecords:=Records in selection:C76([CURRENT_STOCK:62])
							REDUCE SELECTION:C351([CURRENT_STOCK:62]; $_l_CountCurrentStockRecords-1)
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDsDeleted)
							DELETE SELECTION:C66([CURRENT_STOCK:62])
							USE SET:C118("$Match")
							[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
							
							$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
							For ($_l_DeletedIndex; 1; Size of array:C274($_al_CSIDsDeleted))
								$_l_CSIDOLD:=$_al_CSIDsDeleted{$_l_DeletedIndex}
								//MESSAGE("Query current stock(11) "+String(Records in selection([CURRENT STOCK])))
								//MESSAGE("adjust Current stock-deleteionfs")
								$_l_Process:=Execute on server:C373("STK_ADJUSTCURRENTSTOCKID"; 640000; "Modify Current Stock IDS"; $_l_CSIDOLD; $_l_CSID)
							End for 
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CSID)
							DB_SaveRecord(->[CURRENT_STOCK:62])
						Else 
							//MESSAGE("Query current stock(12) "+String(Records in selection([CURRENT STOCK])))
							
							$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
						End if 
						$0:=$_l_CSID
					Else 
						//MESSAGE("Query current stock(13) "+String(Records in selection([CURRENT STOCK])))
						
						$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
						//QUERY([CURRENT STOCK];[CURRENT STOCK]XREC_ID=$_l_CSID)
						$0:=[CURRENT_STOCK:62]X_ID:13
						
					End if 
				Else 
					//no current stock record so create it but dont put any numbers on it
					//TRACE
					//MESSAGE("Query current stock(14) "+"Creating new current stcok record")
					
					If ($_bo_IsUnAllocationType)
						$_l_StockItemNumber:=0
					End if 
					$_l_CSID:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
					//MESSAGE("Query current stock(15) "+"Creating new current stcok record")
					CSCreated:=False:C215
					If (Not:C34(STK_bo_NOProcess))
						CSready:=False:C215
						$_l_Process:=New process:C317("STK_CreateCurrentStock"; 512000; "Create Current Stock record"; $_l_CSID; $_t_StockType; $_t_productCode; $_r_CostPrice; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_t_LocationCode; $_t_SerialNo; $_l_StockItemNumber; Current process:C322; False:C215)
						
						$_l_Waits:=0
						CSready:=True:C214
						PAUSE PROCESS:C319(Current process:C322)
						
						SET PROCESS VARIABLE:C370($_l_Process; STK_bo_CreateCS; True:C214)
						
						
						$0:=$_l_CSID
						
						
						
					Else 
						
						//While (Semaphore("CreateCS"+$_t_productCode+$_t_StockType))
						//DelayTicks (3)
						//End while
						STK_CreateCurrentStock($_l_CSID; $_t_StockType; $_t_productCode; $_r_CostPrice; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_t_LocationCode; $_t_SerialNo; $_l_StockItemNumber; Current process:C322; False:C215)
						//CLEAR SEMAPHORE("CreateCS"+$_t_productCode+$_t_StockType)
						$0:=$_l_CSID
					End if 
				End if 
			Else 
				$0:=0
			End if 
			
		: ($1<1)  //SUBTRACT
			
			//WHEN WE SUBTRACT THE PREVIOUS STOCK MOVEMENT BECOMES IMPORTANT
			//how do we cope wth changing a location of changing the currency/value of stock
			//stock movement types will have to be created for them where the + and - are the same type.
			//$_bo_SNWasonPrevious:=False
			//$_bo_LocationWasOnPrevious:=False
			//The above are only relevant on here if the PREVIOUS movement item had the serial or location on as this affects which current stock record this will get subtracted from
			If ($_l_CopiedFromCSID=0) | ($_bo_MustCheckPrevious)
				If ($_t_LocationCode#"") | ($_t_SerialNo#"") | ($_bo_MustCheckPrevious)
					$_l_ItemNumber:=0
					If ($_bo_IsUnAllocationType)
						$_l_ItemNumber:=$_l_StockItemNumber
					End if 
					$_l_Retries:=0
					While (Semaphore:C143("GettingPreviousMovement"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(9*$_l_Retries)
					End while 
					ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
					ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
					STK_l_PreviousMovementID:=0
					STK_l_TakeFromStockID:=0
					STK_l_PreviousStockItemNumber:=0
					STK_t_PreviousStockLocation:=""
					STK_t_PreviousStockSerial:=""
					STK_bo_PreviousSet:=False:C215
					
					//MESSAGE("Drill DOwn Get previous Movement")
					//$_l_Process:=New Process("STK_GetPreviousStockMovement";512000;"Get Previous Movement";Current process;$_l_CopiedFromID;$_l_CopiedFromCSID;$_t_productCode;$_t_StockType;$_t_CurrencyCode;$_t_AnalysisCode;$_t_LayerCode;;$_r_CostPrice;$_d_Date;$_r_Quantity;[STOCK ITEMS]x_ID)
					$_bo_IsUnAllocation:=$_bo_IsUnAllocationType
					$_bo_IsAllocation:=False:C215
					$_bo_UseOnlyAllocated:=False:C215  //`([MOVEMENT TYPES]Delivery Type) | ([MOVEMENT TYPES]UseAllocatedStock)
					
					$_l_TakeFromItemID:=$_l_ItemNumber
					//$_l_Process:=New Process("STK_GetPreviousStockMovement";128000;"Get Previous Stock Item";Current process;$_l_CopiedFromID;$_l_CopiedFromCSID;$_t_productCode;$_t_StockType;$_t_CurrencyCode;$_t_AnalysisCode;$_t_LayerCode;!00/00/00!;$_r_CostPrice;$_r_Quantity;[STOCK ITEMS]x_ID;$_bo_IsAllocation;$_bo_IsUnAllocation;$_l_TakeFromItemID)
					If (<>STK_l_PreviousProcess=0)
						If ($_l_TakeFromItemID<0)
							
						End if 
						//◊STK_l_PreviousProcess:=New Process("STK_GetPreviousStockMovementPro";128000;"Get Previous Movement ID";Current process;$_l_CopiedFromID;$_l_CopiedFromCSID;$_t_productCode;$_t_StockType;$_t_CurrencyCode;$_t_AnalysisCode;$_t_LayerCode;!00/00/00!;$_r_CostPrice;$_r_Quantity;[STOCK ITEMS]x_ID;$_bo_IsAllocation;$_bo_IsUnAllocation;$_l_TakeFromItemID;*)
						If (<>STK_l_PreviousProcess=0)
							If ($_l_TakeFromItemID<0)
								
							End if 
							<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 512000; "Get Previous Movement ID"; Current process:C322; $_l_CopiedFromID; $_l_CopiedFromCSID; $_t_productCode; $_t_StockType; $_t_CurrencyCode; $_t_AnalysisCode; $_t_LayerCode; !00-00-00!; $_r_CostPrice; $_r_Quantity; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUnAllocation; $_l_TakeFromItemID; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; *)
							DelayTicks(3*6)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
							
						Else 
							$_l_Retries:=0
							While (Semaphore:C143("STK_GetPrevious"))
								//MESSAGE("Waiting for semaphore STK_GetPrevious")
								$_l_Retries:=$_l_Retries+1
								DelayTicks(9*$_l_Retries)
							End while 
							$_l_Retries:=0
							While (Test semaphore:C652("GetPrevious"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(9*$_l_Retries)
							End while 
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; $_l_CopiedFromID)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_CopiedFromCSID)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; $_t_productCode)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; $_t_StockType)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; $_t_CurrencyCode)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; $_t_AnalysisCode)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; $_t_LayerCode)
							
							//MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(1)"+String(◊STK_l_PreviousProcess))
							$_d_HeaderDate:=!00-00-00!
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; $_r_Quantity)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnAllocation)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
							RESUME PROCESS:C320(<>STK_l_PreviousProcess)
							// MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(2)"+String(◊STK_l_PreviousProcess))
							DelayTicks(3*6)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
							CLEAR SEMAPHORE:C144("STK_GetPrevious")
							$_l_Retries:=0
							While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
								//MESSAGE("Waiting for semaphore GetPrevious(2A)")
								DelayTicks(10*$_l_Retries)
							End while 
							
						End if 
						
					Else 
						$_l_Retries:=0
						While (Semaphore:C143("STK_GetPrevious"))
							//MESSAGE("Waiting for semaphore STK_GetPrevious")
							$_l_Retries:=$_l_Retries+1
							DelayTicks(9*$_l_Retries)
						End while 
						$_l_Retries:=0
						While (Test semaphore:C652("GetPrevious"))
							//MESSAGE("Waiting for semaphore GetPrevious")
							$_l_Retries:=$_l_Retries+1
							DelayTicks(9*$_l_Retries)
						End while 
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; $_l_CopiedFromID)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_CopiedFromCSID)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; $_t_productCode)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; $_t_StockType)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; $_t_CurrencyCode)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; $_t_AnalysisCode)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; $_t_LayerCode)
						
						$_d_HeaderDate:=!00-00-00!
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; $_r_Quantity)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnAllocation)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
						
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
						RESUME PROCESS:C320(<>STK_l_PreviousProcess)
						// MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(2)"+String(◊STK_l_PreviousProcess))
						DelayTicks(3*6)
						SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
						CLEAR SEMAPHORE:C144("STK_GetPrevious")
						$_l_Retries:=0
						
						While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
							//MESSAGE("Waiting for semaphore GetPrevious(2B)")
							$_l_Retries:=$_l_Retries+1
							DelayTicks(9*$_l_Retries)
						End while 
						
					End if 
					
					//While (Not(STK_bo_PreviousSet))
					//DelayTicks (30*60)
					//End while
					//SET PROCESS VARIABLE($_l_Process;STK_bo_CalledBACK;True)
					$_bo_SNWasonPrevious:=(STK_t_PreviousStockSerial#"")
					$_bo_LocationWasOnPrevious:=(STK_t_PreviousStockLocation#"")
					//Remember we ARE only here if we have a location code and serial number...
					//if we have a serial the quantity can only ever be one!!
					// so we can never be splitting a serial number!
					If (STK_l_PreviousMovementID>0)
						If (STK_l_PreviousMovementID#$_l_CopiedFromID)
							//Setting this is not the purpose of this method but it may be a by product if it was not set already
							//[STOCK ITEMS]X_CopiedFromID:=STK_l_PreviousMovementID
						End if 
					Else 
						//If (Size of array(STK_al_PreviousMovementIDS)>0)
						//this is the hardest one because this means we have to split the item because we cannot find a previous stock movement item with enough to call off..this should never really happen from here
						
						//Else
						
						
						//End if
					End if 
					CLEAR SEMAPHORE:C144("GettingPreviousMovement")
					
				End if 
			End if 
			
			
			
			
			If ($_t_StockType#"") & ($_t_productCode#"")
				//````
				REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				If ($_l_CopiedFromID>0)
					DB_bo_CSset:=False:C215
					DB_l_CSID:=0
					//`MESSAGE("Get CSfrom Stock item")
					$_l_Process:=New process:C317("STK_GetCSFromStockItem"; 128000; "Get Stock ItemID"; Current process:C322; 1; $_l_CopiedFromID)
					$_l_Retries:=0
					While (Not:C34(DB_bo_CSset))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(6*$_l_Retries)
					End while 
					SET PROCESS VARIABLE:C370($_l_Process; STK_bo_CSReceived; True:C214)
					If (DB_l_CSID>0)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=DB_l_CSID)
						If ([CURRENT_STOCK:62]Product_Code:1#$_t_productCode) | ([CURRENT_STOCK:62]Stock_Type:3#$_t_StockType)
							REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
						End if 
					End if 
				End if 
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					READ ONLY:C145([MOVEMENT_TYPES:60])
					If ([MOVEMENT_TYPES:60]Type_Code:1#STK_t_MovementType)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=STK_t_MovementType)
					End if 
					If (Not:C34(STK_bo_CheckProductTypeIndex))
						ARRAY POINTER:C280($_aptr_Fields; 7)
						$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
						$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
						//$aFields{3}:=->[CURRENT STOCK]Item Number
						$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
						$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Layer_Code:12
						$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Analysis_Code:10
						$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Location:8
						$_aptr_Fields{7}:=->[CURRENT_STOCK:62]Serial_Number:2
						
						CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "ProductType")
						
						STK_bo_CheckProductTypeIndex:=True:C214
					End if 
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
					If ($_t_StockType#"")
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
					End if 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
					If ($_t_AnalysisCode#"")
						If (<>StockAnal) & (Records in selection:C76([CURRENT_STOCK:62])>0)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
						End if 
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
					End if 
					//This is an interesting conuncdrum was the location on there before
					//we can ONLY work that out by finding if the preceeeding stock movement item had
					If ($_t_LocationCode#"")
						If ($_bo_LocationWasOnPrevious)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_t_LocationCode; *)
						Else 
							
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=""; *)
						End if 
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=""; *)
					End if 
					
					If ($_t_SerialNo#"") & ($_bo_SNWasonPrevious)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_SerialNo)
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2="")
					End if 
					
					
					//QUERY([CURRENT STOCK])
					
					Case of 
						: ([MOVEMENT_TYPES:60]Alloc_Type:10)  //`` & (Records in selection([CURRENT STOCK])>0)
							
							//this is in allocation movement
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
							//have to be careful
							
							//QUERY SELECTION([CURRENT STOCK]; | [CURRENT STOCK]Item Number=$_l_StockItemNumber)
							
							
						: ([MOVEMENT_TYPES:60]Unalloc_Type:13)  //& (Records in selection([CURRENT STOCK])>0)
							
							If ($_l_StockItemNumber#0)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber)
							Else 
								STK_l_DummyOrderItemNumber:=AA_GetNextID(->STK_l_DummyOrderItemNumber)
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=-STK_l_DummyOrderItemNumber
								$_l_StockItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
								//if we are trying to un-allocate and the item number=-
								REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
								
							End if 
							//this is the item we took it off
							If ([MOVEMENT_TYPES:60]Stock_Plus:3=[MOVEMENT_TYPES:60]Stock_Minus:4) & ($_l_StockItemNumber=0)
								If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25>0)
									$_l_Retries:=0
									
									While (Semaphore:C143("GettingPreviousMovement"))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(9*$_l_Retries)
									End while 
									
									ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
									ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
									STK_l_PreviousMovementID:=0
									STK_l_TakeFromStockID:=0
									STK_l_PreviousStockItemNumber:=0
									STK_t_PreviousStockLocation:=""
									STK_t_PreviousStockSerial:=""
									STK_bo_PreviousSet:=False:C215
									//MESSAGE("Drill down get previous movement 2")
									$_bo_IsUnAllocation:=True:C214
									$_bo_IsAllocation:=False:C215
									If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25>0)
										//TRACE
									End if 
									$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
									//$_l_Process:=New Process("STK_GetPreviousStockMovement";128000;"Get Previous Stock Item";Current process;$_l_CopiedFromID;$_l_CopiedFromCSID;$_t_productCode;$_t_StockType;$_t_CurrencyCode;$_t_AnalysisCode;$_t_LayerCode;!00/00/00!;$_r_CostPrice;$_r_Quantity;[STOCK ITEMS]x_ID;$_bo_IsAllocation;$_bo_IsUnAllocation;$_l_TakeFromItemID)
									If (<>STK_l_PreviousProcess=0)
										If ($_l_TakeFromItemID<0)
											
										End if 
										<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 128000; "Get Previous Movement ID"; Current process:C322; $_l_CopiedFromID; $_l_CopiedFromCSID; $_t_productCode; $_t_StockType; $_t_CurrencyCode; $_t_AnalysisCode; $_t_LayerCode; !00-00-00!; $_r_CostPrice; $_r_Quantity; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUnAllocation; $_l_TakeFromItemID; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; *)
										// MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(1)"+String(◊STK_l_PreviousProcess))
										DelayTicks(2*60)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
										
									Else 
										$_l_Retries:=0
										While (Semaphore:C143("STK_GetPrevious"))
											//MESSAGE("Waiting for semaphore STK_GetPrevious")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(9*$_l_Retries)
										End while 
										$_l_Retries:=0
										While (Test semaphore:C652("GetPrevious"))
											//MESSAGE("Waiting for semaphore GetPrevious")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(9*$_l_Retries)
										End while 
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; $_l_CopiedFromID)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_CopiedFromCSID)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; $_t_productCode)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; $_t_StockType)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; $_t_CurrencyCode)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; $_t_AnalysisCode)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; $_t_LayerCode)
										$_d_HeaderDate:=!00-00-00!
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; $_r_Quantity)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnAllocation)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
										
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
										RESUME PROCESS:C320(<>STK_l_PreviousProcess)
										// MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(2C)"+String(◊STK_l_PreviousProcess))
										DelayTicks(2*60)
										SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
										CLEAR SEMAPHORE:C144("STK_GetPrevious")
										$_l_Retries:=0
										While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
											//MESSAGE("Waiting for semaphore GetPrevious(2C)")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(9*$_l_Retries)
										End while 
										
									End if 
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=STK_l_PreviousStockItemNumber
								End if 
								$_bo_NoRealMove:=True:C214
								
								
							Else 
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_StockItemNumber
								
							End if 
						Else 
							If ([MOVEMENT_TYPES:60]Type_Code:1#"OSC")
								If ($_l_StockItemNumber#0)
									//if the stoc
									//$_t_StockType:=
								End if 
							End if 
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber)
							
					End case 
					If ($_r_CostPrice#0) & (Records in selection:C76([CURRENT_STOCK:62])>0)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_r_CostPrice)
					End if 
					If ($_r_CostPrice=0)
						ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6)
						REDUCE SELECTION:C351([CURRENT_STOCK:62]; 1)
					End if 
				End if 
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					If (Records in selection:C76([CURRENT_STOCK:62])>1)
						$_r_CostPrice:=[CURRENT_STOCK:62]Cost_Price:6
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$_r_CostPrice)
						If (Records in selection:C76([CURRENT_STOCK:62])>1)
							
							$_r_Quantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
							CREATE SET:C116([CURRENT_STOCK:62]; "$Match")
							$_l_CountCurrentStockRecords:=Records in selection:C76([CURRENT_STOCK:62])
							REDUCE SELECTION:C351([CURRENT_STOCK:62]; $_l_CountCurrentStockRecords-1)
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDsDeleted)
							DELETE SELECTION:C66([CURRENT_STOCK:62])
							USE SET:C118("$Match")
							[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
							DB_SaveRecord(->[CURRENT_STOCK:62])
							$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
							For ($_l_DeletedIndex; 1; Size of array:C274($_al_CSIDsDeleted))
								$_l_CSIDOLD:=$_al_CSIDsDeleted{$_l_DeletedIndex}
								//MESSAGE("Adjust Current stock")
								$_l_Process:=Execute on server:C373("STK_ADJUSTCURRENTSTOCKID"; 64000; "Modify Current Stock IDS"; $_l_CSIDOLD; $_l_CSID)
							End for 
						Else 
							$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
						End if 
						$0:=$_l_CSID
					Else 
						$0:=[CURRENT_STOCK:62]X_ID:13
					End if 
				Else 
					//no current stock record so create it but dont put any numbers on it
					//TRACE
					$_l_CSIStockItemNumber:=0
					$_t_CSLocationCode:=""
					$_t_CSSerialNumber:=""
					If ($_bo_LocationWasOnPrevious)
						$_t_CSLocationCode:=$_t_LocationCode
					End if 
					If ($_bo_SNWasonPrevious)
						$_t_CSSerialNumber:=$_t_SerialNo
					End if 
					CSCreated:=False:C215
					$_l_CSID:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
					If (Not:C34(STK_bo_NOProcess)) & ($_l_StockItemNumber=0)
						CSready:=False:C215
						$_l_Process:=New process:C317("STK_CreateCurrentStock"; 512000; "Create Current Stock record"; $_l_CSID; $_t_StockType; $_t_productCode; $_r_CostPrice; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_t_CSLocationCode; $_t_CSSerialNumber; $_l_StockItemNumber; Current process:C322; False:C215)
						$_l_Retries:=0
						CSready:=True:C214
						PAUSE PROCESS:C319(Current process:C322)
						
						SET PROCESS VARIABLE:C370($_l_Process; STK_bo_CreateCS; True:C214)
						$0:=$_l_CSID
					Else 
						$_l_Retries:=0
						While (Semaphore:C143("CreateCS"+$_t_productCode+$_t_StockType))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(3*$_l_Retries)
						End while 
						ARRAY POINTER:C280($_aptr_Fields; 9)
						If (Not:C34(STK_bo_CheckProdTypeCostIndex))
							$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
							$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
							$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Item_Number:5
							$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Currency_Code:11
							$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
							$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Analysis_Code:10
							$_aptr_Fields{7}:=->[CURRENT_STOCK:62]Location:8
							$_aptr_Fields{8}:=->[CURRENT_STOCK:62]Serial_Number:2
							$_aptr_Fields{9}:=->[CURRENT_STOCK:62]Cost_Price:6
							CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "ProductItemTypeCost")
							
							STK_bo_CheckProdTypeCostIndex:=True:C214
						End if 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
						
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_r_CostPrice; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
						If (<>StockAnal)
							QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
						Else 
							QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
						End if 
						QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
						QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_t_LocationCode; *)
						QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_SerialNo)
						If (Records in selection:C76([CURRENT_STOCK:62])=0)
							
							$_l_CSIStockItemNumber:=$_l_StockItemNumber
							CREATE RECORD:C68([CURRENT_STOCK:62])
							[CURRENT_STOCK:62]Item_Number:5:=$_l_StockItemNumber
							If (<>StockAnal)
								[CURRENT_STOCK:62]Analysis_Code:10:=$_t_AnalysisCode
							End if 
							[CURRENT_STOCK:62]Cost_Price:6:=$_r_CostPrice
							[CURRENT_STOCK:62]Currency_Code:11:=$_t_CurrencyCode
							[CURRENT_STOCK:62]Layer_Code:12:=$_t_LayerCode
							[CURRENT_STOCK:62]Location:8:=$_t_LocationCode
							[CURRENT_STOCK:62]Product_Code:1:=$_t_productCode
							[CURRENT_STOCK:62]Serial_Number:2:=$_t_SerialNo
							
							[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
							[CURRENT_STOCK:62]Stock_Type:3:=$_t_StockType
							[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
							If ($_l_CSID#0)
								[CURRENT_STOCK:62]X_ID:13:=$_l_CSID
							Else 
								
								
								[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
							End if 
							
							
							DB_SaveRecord(->[CURRENT_STOCK:62])
							
							
						Else 
							$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
						End if 
						CLEAR SEMAPHORE:C144("CreateCS"+$_t_productCode+$_t_StockType)
						
						$0:=$_l_CSID
					End if 
					
					
				End if 
			End if 
			
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("STK_GetCurrentStockID"; $_t_oldMethodName)
