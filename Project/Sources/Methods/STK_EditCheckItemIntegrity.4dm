//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EditCheckItemIntegrity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2015 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PreviousMovementCSID; 0)
	ARRAY LONGINT:C221($_al_PreviousMovementIDS; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
	//ARRAY LONGINT(STK_al_PreviousMovementCSID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	ARRAY REAL:C219($_ar_PreviousMovementQTY; 0)
	ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
	ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
	ARRAY TEXT:C222($_at_ProcessServicesCalledAlread; 0)
	//ARRAY TEXT(STK_at_PreviousMovementAnalysis;0)
	//ARRAY TEXT(STK_at_PreviousMovementCurrency;0)
	//ARRAY TEXT(STK_at_PreviousMovementLayer;0)
	//ARRAY TEXT(STK_at_PreviousMovementLocation;0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>STOCK_bo_NoSplit; <>STOCK_bo_NoSuperSplit; $_bo_AllocCLog; $_bo_Continue; $_bo_CSIDMatch; $_bo_DateMatch; $_bo_Edit; $_bo_Exit; $_bo_ExitIntegrity; $_bo_IsAllocation)
	C_BOOLEAN:C305($_bo_IsAnalysed; $_bo_IsSourceStockType; $_bo_isStockReceipt; $_bo_IsUnallocation; $_bo_NoExit; $_bo_NoSuperSplit; $_bo_PreTry; $_bo_PriceMatch; $_bo_Split; $_bo_SplitChildren; $_bo_SplitItem)
	C_BOOLEAN:C305($_bo_UpdateCurrentStock; $_bo_UseOnlyAllocated; $_bo_UseOnlyFree; $0; $1; $2; $3; $4; $5; $6; DB_bo_IgnoreProductStatus)
	C_BOOLEAN:C305(DB_bo_VerboseMessaging; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; STK_bo_PreviousSet)
	C_DATE:C307($_d_HeaderDate)
	C_LONGINT:C283(<>STK_l_PreviousProcess; <>STK_l_PSProcessID; $_l_AddToCurrentStockID; $_l_AddtoItemID; $_l_CopiedFromID; $_l_Count; $_l_CountMovementItems2; $_l_FromStockItemID; $_l_GetItemNumProcess; $_l_PreviousItemQtyIndex; $_l_RecordNumber)
	C_LONGINT:C283($_l_Retries; $_l_SMICopiedFromID; $_l_SplitChildrenOf; $_l_StockItemRecord; $_l_StockMovementItemNumber; $_l_TakeFromCSID; $_l_TakeFromCurrentStockID; $_l_TakeFromItemID; $_l_Time; $_l_Zero; $7)
	C_LONGINT:C283($8; $9; STK_l_PreviousItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber)
	C_REAL:C285($_r_CalledOffQuantity; $_r_CostPrice; $_r_OriginalQuantity; $_r_QuantityStillRequired; $_r_Zero; STK_R_PreviousCostPrice)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_LocationOnPrevious; $_t_oldMethodName; $_t_PSCProductCode; $_t_SerialNumber; $_t_SourceStockType; $_t_SourceTakeFromStockType)
	C_TEXT:C284(STK_T_PreviousStockItemAnal; STK_T_PreviousStockItemCurrency; STK_T_PreviousStockItemLayer; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckItemIntegrity")

ARRAY TEXT:C222($_at_ProcessServicesCalledAlread; 0)
$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)

$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckItemIntegritry")
$_bo_ExitIntegrity:=True:C214  //by default we will exit!-this will only be set to false if the copied from is 'overcalled'
Repeat 
	$_bo_ExitIntegrity:=True:C214
	$_bo_Edit:=$1
	$_bo_IsAllocation:=$2
	$_bo_IsUnallocation:=$3
	$_bo_isStockReceipt:=$4
	$_bo_UseOnlyAllocated:=$5
	$_bo_UseOnlyFree:=$6
	$_l_CopiedFromID:=$7
	$_l_TakeFromCSID:=$8
	$_l_AddToCurrentStockID:=$9
	$_bo_IsAnalysed:=STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
	
	If ($_bo_IsAnalysed) | (DB_bo_IgnoreProductStatus)
		If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)) & (Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)#"")
			$_bo_Edit:=True:C214
			[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
			$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			If ($_l_CopiedFromID>0)
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Product Code Changed-Recalculate called off  "+String:C10(Current time:C178)
				End if 
				//Ng January 2015 this is somewhere we do need this
				STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
			End if 
		End if 
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
			
			Case of 
				: ($_bo_IsAllocation)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock movement item is allocaiton"+" "+String:C10(Current time:C178)
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)
						$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						
						If ($_l_AddtoItemID=0)
							If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24>0)
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
							Else 
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Validate Sales order item"+" "+String:C10(Current time:C178)
								End if 
								STK_l_PreviousItemNumber:=0
								STK_bo_PreviousItemNumberTested:=False:C215
								$_l_GetItemNumProcess:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Item number"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Wait for Get Allocation Item number to Complete"+" "+String:C10(Current time:C178)
								End if 
								DB_WaitforProcessToEnd($_l_GetItemNumProcess; "Get Allocation Item number"; 60; "STK_bo_PreviousItemNumberTested")
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Get Allocation Item number Completed"+" "+String:C10(Current time:C178)
								End if 
								SET PROCESS VARIABLE:C370($_l_GetItemNumProcess; STK_bo_PreviousCAllback; True:C214)
								$_l_AddtoItemID:=STK_l_PreviousItemNumber
								STK_l_PreviousItemNumber:=0
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_AddtoItemID
							End if 
							$_bo_Edit:=True:C214
						End if 
						
						
					Else 
						$_l_AddtoItemID:=0
					End if 
				: ($_bo_IsUnallocation)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"is an unallocation"+" "+String:C10(Current time:C178)
					End if 
					//a negative un-allocation would be an allocation..this should add to the ITEM id and take from zero..but that could result in a doulbe allocation????
					$_l_AddtoItemID:=0
				Else 
					$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
			End case 
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Get Add to current stock iD"+" "+String:C10(Current time:C178)
			End if 
			$_l_AddtoCurrentStockID:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_l_AddtoItemID; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Add to current stock ID found"+" "+String:C10(Current time:C178)
			End if 
			If ($_l_AddtoCurrentStockID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				
				[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
				$_bo_Edit:=True:C214
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_AddtoCurrentStockID
					$_bo_Edit:=True:C214
				End if 
				
			End if 
		Else 
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
				$_bo_Edit:=True:C214
			End if 
		End if 
		$_bo_SplitItem:=False:C215
		
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
				
				$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
				$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
				$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
				$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
				$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
				$_t_LocationOnPrevious:=""
				If ($_bo_IsUnallocation)
					$_l_StockMovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
					If ($_l_StockMovementItemNumber=0)  // /this would be an extreme exception
						//TRACE
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Unallocated from sales order item is unkown-need to get it  "+String:C10(Current time:C178)
						End if 
						STK_l_PreviousItemNumber:=0
						STK_bo_PreviousItemNumberTested:=False:C215
						$_l_GetItemNumProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for Get Allocation Itemnumber to end "+String:C10(Current time:C178)
						End if 
						DB_WaitforProcessToEnd($_l_GetItemNumProcess; "Get Allocation Itemnumber"; 60; "STK_bo_PreviousItemNumberTested")
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Get Allocation Itemnumber ended "+String:C10(Current time:C178)
						End if 
						SET PROCESS VARIABLE:C370($_l_GetItemNumProcess; STK_bo_PreviousCAllback; True:C214)
						$_l_StockMovementItemNumber:=STK_l_PreviousItemNumber
						[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_StockMovementItemNumber
						$_bo_Edit:=True:C214
					End if 
				Else 
					$_l_StockMovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
					$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
				Else 
					$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#"")
					$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
				Else 
					
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#"")
					$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
					$_t_LocationOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#"")
					$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#"")
					$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41
				End if 
				If (Not:C34([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33))
					$_t_SerialNumber:=""
				End if 
				If (Not:C34(STK_VerifyCopiedFrom(0; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; $_r_CostPrice; $_t_CurrencyCode; $_t_Location; $_t_AnalysisCode; $_t_LayerCode)))
					//TRACE  //this would be an extreme exception
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Copied from Stock item ID did not verify-resetting "+String:C10(Current time:C178)
					End if 
					$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
					$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Updating the incorrect copied from called off quantity"+String:C10(Current time:C178)
					End if 
					//Ng January 2015 this is somewhere we do need thi
					STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" update completed"+String:C10(Current time:C178)
					End if 
					If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])#$_l_RecordNumber) & ($_l_RecordNumber>=0)
						USE NAMED SELECTION:C332("$CS")
						GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
					End if 
					$_bo_Edit:=True:C214
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)  // if there is no take from stock type there cant be a copied from ID
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" No take from stock type so copied from ID must be wrong-resetting"+String:C10(Current time:C178)
					End if 
					$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
					$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Updating the incorrect copied from called off quantity"+String:C10(Current time:C178)
					End if 
					//Ng January 2015 this is somewhere we do need thi
					STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" update completed"+String:C10(Current time:C178)
					End if 
					If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])#$_l_RecordNumber) & ($_l_RecordNumber>=0)
						USE NAMED SELECTION:C332("$CS")
						GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
					End if 
					$_bo_Edit:=True:C214
				End if 
			End if 
		End if 
		// /
		
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
			//TRACE
			STK_bo_PreviousSet:=False:C215
			$_bo_Continue:=False:C215
			$_bo_Split:=True:C214
			$_bo_NoSuperSplit:=True:C214
			$_bo_PriceMatch:=True:C214
			$_bo_DateMatch:=True:C214
			$_bo_CSIDMatch:=True:C214
			$_bo_Exit:=False:C215
			$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
			
			If (Not:C34($_bo_IsSourceStockType))  // if this is a source stock type dont waste time looking for a previous movement i
				
				$_bo_PreTry:=True:C214
				Repeat 
					Repeat 
						STK_T_PreviousStockItemAnal:=""
						STK_T_PreviousStockItemLayer:=""
						STK_T_PreviousStockItemCurrency:=""
						STK_l_PreviousStockItemNumber:=0
						STK_l_PreviousMovementID:=0
						STK_t_PreviousStockLocation:=""
						STK_t_PreviousStockSerial:=""
						STK_R_PreviousCostPrice:=0
						Case of 
							: ($_bo_IsUnallocation) | ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0)
								$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
								If ($_l_TakeFromItemID=0)
									//this would be an extreme exception
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" unallocation take from sales order item is unknown-this should not really happen-getting sales order item"+String:C10(Current time:C178)
									End if 
									//TRACE
									STK_l_PreviousItemNumber:=0
									STK_bo_PreviousItemNumberTested:=False:C215
									$_l_GetItemNumProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
									DB_WaitforProcessToEnd($_l_GetItemNumProcess; "Get Allocation Itemnumber"; 60; "STK_bo_PreviousItemNumberTested")
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" sales order item lookup completed"+String:C10(Current time:C178)
									End if 
									SET PROCESS VARIABLE:C370($_l_GetItemNumProcess; STK_bo_PreviousCAllback; True:C214)
									$_l_TakeFromItemID:=STK_l_PreviousItemNumber
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_TakeFromItemID
									$_bo_Edit:=True:C214
								End if 
							: ($_bo_IsAllocation)
								If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
									$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								Else 
									$_l_TakeFromItemID:=0
								End if 
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24>0) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
									//this should in theory not happen
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
								End if 
								$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						End case 
						ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
						ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
						ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
						ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
						ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
						ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
						ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
						STK_bo_PreviousSet:=False:C215
						$_l_Retries:=0
						$_t_PSCProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Wait to set semaphore"+"PSC"+$_t_PSCProductCode+String:C10(Current time:C178)
						End if 
						DB_WaitForSemaphore("PSC"+$_t_PSCProductCode; 2; 60; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"semaphore"+"PSC"+$_t_PSCProductCode+" is set"+String:C10(Current time:C178)
						End if 
						<>STOCK_bo_NoSplit:=$_bo_Split
						<>STOCK_bo_NoSuperSplit:=$_bo_NoSuperSplit
						
						If (<>STOCK_bo_NoSuperSplit=False:C215)
							<>STOCK_bo_NoSplit:=False:C215
						End if 
						$_bo_NoExit:=True:C214
						
						Repeat 
							Case of 
								: ($_bo_PreTry)  // this is first get-it checks there is a stock movement of some kind that we could copy from
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Pre-Try look for previous"+String:C10(Current time:C178)
									End if 
									//this is because if we fail to get on with the correct cost price we progressively try other things if none of that is going to
									//find a stock movement item there is little point in trying
									$_r_CostPrice:=$_r_Zero
									$_d_HeaderDate:=!00-00-00!
									$_l_TakeFromCSID:=$_l_Zero
									$_bo_NoSuperSplit:=False:C215
									$_bo_Split:=False:C215
								: ($_bo_PriceMatch)  // is date match or CSID Match on
									
									$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
									Case of 
										: ($_bo_DateMatch)
											$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
											If ($_bo_CSIDMatch)
												If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
													$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is true, Take from Current stock ID is true"+String:C10(Current time:C178)
													End if 
												Else 
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is true, Take from Current stock ID is false"+String:C10(Current time:C178)
													End if 
													$_l_TakeFromCSID:=$_l_Zero
												End if 
											Else 
												If ($_bo_AllocCLog)
													<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is true, Take from Current stock ID is false"+String:C10(Current time:C178)
												End if 
												$_l_TakeFromCSID:=$_l_Zero
												
											End if 
										Else 
											$_d_HeaderDate:=!00-00-00!
											If ($_bo_CSIDMatch)
												If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
													$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is false, Take from Current stock ID is true"+String:C10(Current time:C178)
													End if 
												Else 
													$_l_TakeFromCSID:=$_l_Zero
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is false, Take from Current stock ID is false"+String:C10(Current time:C178)
													End if 
												End if 
											Else 
												If ($_bo_AllocCLog)
													<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is true, Date match is false, Take from Current stock ID is false"+String:C10(Current time:C178)
												End if 
												$_l_TakeFromCSID:=$_l_Zero
												
											End if 
									End case 
								: ($_bo_DateMatch)  // price match is off is CS ID match on
									
									$_r_CostPrice:=$_r_Zero
									$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
									If ($_bo_CSIDMatch)
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is false, Date match is true, Take from Current stock ID is true"+String:C10(Current time:C178)
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
											$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
										Else 
											$_l_TakeFromCSID:=$_l_Zero
										End if 
										
									Else 
										$_l_TakeFromCSID:=$_l_Zero
										
									End if 
								: ($_bo_CSIDMatch)  // Price match and  Date match are off
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is false, Date match is false, Take from Current stock ID is true"+String:C10(Current time:C178)
									End if 
									$_r_CostPrice:=$_r_Zero
									$_d_HeaderDate:=!00-00-00!
									If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
										$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
									Else 
										$_l_TakeFromCSID:=$_l_Zero
									End if 
									
									
								Else   //last attempt
									$_r_CostPrice:=$_r_Zero
									$_d_HeaderDate:=!00-00-00!
									$_l_TakeFromCSID:=$_l_Zero
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+" Price Match is false, Date match is false, Take from Current stock ID is false"+String:C10(Current time:C178)
									End if 
									
							End case 
							
							While (Test semaphore:C652("GetPrevious"))
								DelayTicks(2)
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphore GetPrevious-not setting it"+String:C10(Current time:C178)
								End if 
							End while 
							
							If (<>STK_l_PreviousProcess>0)
								If (Process state:C330(<>STK_l_PreviousProcess)<0) | (Process_Name(<>STK_l_PreviousProcess)#"Get Previous Movement ID")
									<>STK_l_PreviousProcess:=0
								End if 
							End if 
							If ($_bo_AllocCLog)
								<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting to set semaphore $_GetPrevious"+String:C10(Current time:C178)
							End if 
							DB_WaitForSemaphore("$_GetPrevious"; 2; 60)
							If ($_bo_AllocCLog)
								<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"semaphore $_GetPrevious is set"+String:C10(Current time:C178)
							End if 
							While (Test semaphore:C652("GetPrevious"))
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphore GetPrevious-not setting it"+String:C10(Current time:C178)
								End if 
								DelayTicks(2)
							End while 
							
							If (<>STK_l_PreviousProcess=0)
								<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 512000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_l_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_d_HeaderDate; $_r_CostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUnallocation; $_l_TakeFromItemID; $_bo_UseOnlyAllocated; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_bo_PreTry; $_bo_UseOnlyFree; *)
								
							Else 
								
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_TakeFromCSID)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnallocation)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isStockReceipt; $_bo_isStockReceipt)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyFree; $_bo_UseOnlyFree)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CallisPreTry; $_bo_PreTry)
								
								RESUME PROCESS:C320(<>STK_l_PreviousProcess)
								
								
							End if 
							$_l_Retries:=0
							DelayTicks(30*60)
							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
							CLEAR SEMAPHORE:C144("$_GetPrevious")
							
							If ($_bo_AllocCLog)
								<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared semaphore $_GetPrevious"+String:C10(Current time:C178)
							End if 
							While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5) & (Process_Name(<>STK_l_PreviousProcess)="Get Previous Movement ID")
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for call back to complete"+String:C10(Current time:C178)
								End if 
								$_l_Retries:=$_l_Retries+1
								If ($_l_Retries>60)
									$_l_Retries:=1
								End if 
								DelayTicks(10*($_l_Retries+3))
							End while 
							
							$_l_Time:=Current time:C178*1
							
							$_bo_NoExit:=False:C215
							$_l_Count:=0
							$_l_Retries:=0
							While (STK_bo_PreviousSet=False:C215) & ($_l_Count<10) & (Process_Name(<>STK_l_PreviousProcess)="Get Previous Movement ID")
								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
								$_l_Retries:=$_l_Retries+1
								If ($_l_Retries>60)
									$_l_Retries:=1
								End if 
								$_l_Count:=$_l_Count+1
								DelayTicks(60*($_l_Retries+3))
							End while 
						Until (STK_bo_PreviousSet)
						CLEAR SEMAPHORE:C144("PSC"+$_t_PSCProductCode)
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared semaphore "+"PSC"+$_t_PSCProductCode+String:C10(Current time:C178)
						End if 
						<>STOCK_bo_NoSplit:=False:C215
						If ($_bo_NoExit=False:C215)
							$_bo_Continue:=True:C214
						End if 
						If (STK_l_PreviousMovementID=0)
							Case of 
								: ($_bo_PreTry=True:C214)  // there are no stock items to copy from anyway!
									$_bo_PreTry:=False:C215
									If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
										$_bo_Exit:=True:C214
									End if 
									$_bo_NoSuperSplit:=True:C214
									$_bo_Split:=True:C214
								: ($_bo_PriceMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
									$_bo_PriceMatch:=False:C215
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(1; 0)
										MESSAGE:C88("Turning Price Match off")
									End if 
								: ($_bo_DateMatch) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
									$_bo_DateMatch:=False:C215
									$_bo_PriceMatch:=True:C214
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(2; 0)
										MESSAGE:C88("Turning Date Match off Price match on")
									End if 
								: ($_bo_CSIDMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
									$_bo_CSIDMatch:=False:C215
									$_bo_DateMatch:=True:C214
									$_bo_PriceMatch:=True:C214
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(3; 0)
										MESSAGE:C88("TurningID Match off date match on and price match on")
									End if 
								: ($_bo_Split=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
									$_bo_Split:=False:C215
									$_bo_PriceMatch:=True:C214
									$_bo_DateMatch:=True:C214
									$_bo_CSIDMatch:=True:C214
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(4; 0)
										MESSAGE:C88("Turning no split off IDI Match on date match on and price match on")
									End if 
								: ($_bo_NoSuperSplit) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
									
									$_bo_NoSuperSplit:=False:C215
									$_bo_Split:=False:C215
									$_bo_PriceMatch:=True:C214
									$_bo_DateMatch:=True:C214
									$_bo_CSIDMatch:=True:C214
									
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(5; 0)
										MESSAGE:C88("Turning no supersplit off ID  Match on date match on and price match on")
									End if 
								Else 
									// all are false and we tried spliting
									If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
										//
										$_bo_Exit:=True:C214
									Else 
										$_bo_Exit:=True:C214
									End if 
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(6; 0)
										MESSAGE:C88("No Match all")
									End if 
									
							End case 
						Else 
							If ($_bo_PreTry)
								$_bo_Continue:=False:C215
								If (STK_l_PreviousMovementID=-9999)
									//TRACE  //this should be an extreme exception
									STK_l_PreviousMovementID:=0
									$_bo_Exit:=True:C214
									$_bo_Continue:=True:C214
								End if 
								$_bo_PreTry:=False:C215
								$_bo_NoSuperSplit:=True:C214
								$_bo_Split:=True:C214
								
								If (DB_bo_VerboseMessaging)
									GOTO XY:C161(6; 0)
									MESSAGE:C88("No Match at pretry")
								End if 
							Else 
								If (STK_l_PreviousMovementID=-9999)
									STK_l_PreviousMovementID:=0
								End if 
								$_bo_Exit:=True:C214
								If (DB_bo_VerboseMessaging)
									GOTO XY:C161(6; 0)
									MESSAGE:C88("No Match        ")
								End if 
							End if 
						End if 
					Until ($_bo_Continue)
					
				Until ($_bo_Exit)
				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_PreviousMovementID
				Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				If (STK_l_PreviousMovementID>0)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
				Else 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>=0)  //if it is a minus and we have not put a copied from ID on dont change it from the minus
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
					End if 
				End if 
				[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=STK_t_PreviousStockLocation
				$_bo_Edit:=True:C214
				If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#STK_T_PreviousStockItemAnal) & (STK_T_PreviousStockItemAnal#"") & (STK_T_PreviousStockItemAnal#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
					$_bo_Edit:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=STK_T_PreviousStockItemAnal
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#STK_T_PreviousStockItemLayer) & (STK_T_PreviousStockItemLayer#"") & (STK_T_PreviousStockItemLayer#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
					$_bo_Edit:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=STK_T_PreviousStockItemLayer
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#STK_T_PreviousStockItemCurrency) & (STK_T_PreviousStockItemCurrency#"") & (STK_T_PreviousStockItemCurrency#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
					$_bo_Edit:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=STK_T_PreviousStockItemCurrency
				End if 
				[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=(STK_t_PreviousStockSerial#"")
				If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
					$_bo_Edit:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=STK_R_PreviousCostPrice
					[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=STK_R_PreviousCostPrice
				Else 
					If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#STK_R_PreviousCostPrice)
						$_bo_Edit:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=STK_R_PreviousCostPrice
					End if 
				End if 
				
				// /here we handle the complex problem of splitting an item when it cant be copied from one item
				ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
				ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
				ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
				$_bo_SplitChildren:=False:C215
				$_l_SplitChildrenOf:=0
				$_r_OriginalQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
				ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
				ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
				ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
				
				COPY ARRAY:C226(STK_al_PreviousMovementIDS; $_al_PreviousMovementIDS)
				COPY ARRAY:C226(STK_ar_PreviousMovementQTY; $_ar_PreviousMovementQTY)
				COPY ARRAY:C226(STK_al_PreviousMovementCSID; $_al_PreviousMovementCSID)
				COPY ARRAY:C226(STK_at_PreviousMovementLocation; $_at_PreviousMovementLocation)
				COPY ARRAY:C226(STK_at_PreviousMovementCurrency; $_at_PreviousMovementCurrency)
				COPY ARRAY:C226(STK_at_PreviousMovementAnalysis; $_at_PreviousMovementAnalysis)
				COPY ARRAY:C226(STK_at_PreviousMovementLayer; $_at_PreviousMovementLayer)
				
				
				If (Size of array:C274($_al_PreviousMovementIDS)>0)  // this only happens if there is no single item to copy from-we must split the current item.
					If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0)  // this would be a highly unusual circumstance because the current item has either just had the called from changed or first set and it has already been called from-this would only happen in a correction
						
						$_bo_SplitChildren:=True:C214
						$_l_SplitChildrenOf:=([STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; $_ar_PreviousMovementQTY{1})
						APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; $_al_PreviousMovementCSID{1})
					End if 
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{1}
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{1}
					Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{1}
					$_bo_Edit:=True:C214
					If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{1}) & ($_at_PreviousMovementLocation{1}#"") & ($_at_PreviousMovementLocation{1}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
						[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{1}
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{1}) & ($_at_PreviousMovementAnalysis{1}#"") & ($_at_PreviousMovementAnalysis{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
						[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{1}
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{1}) & ($_at_PreviousMovementLayer{1}#"") & ($_at_PreviousMovementLayer{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
						$_bo_Edit:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{1}
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{1}) & ($_at_PreviousMovementCurrency{1}#"") & ($_at_PreviousMovementCurrency{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
						$_bo_Edit:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{1}
					End if 
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					// this item needs to be split
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					$_bo_Edit:=True:C214
					$_r_QuantityStillRequired:=$_r_OriginalQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					$_bo_SplitItem:=True:C214
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]StockItemThread:19=0)
					[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19)
				End if 
			End if 
			
			
		End if 
		If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])>=0)
			If (False:C215)
				$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				If (DB_bo_VerboseMessaging)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("Setting Called off")
				End if 
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
				$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				If ($_bo_Edit)
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				End if 
				STK_UpdateCalledOffQuantity
				If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])#$_l_RecordNumber) & ($_l_RecordNumber>=0)
					
					USE NAMED SELECTION:C332("$CS")
					GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
				End if 
				If ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
					$_bo_Edit:=True:C214
				End if 
				If (DB_bo_VerboseMessaging)
					GOTO XY:C161(0; 0)
					MESSAGE:C88(" Called off set")
				End if 
			End if   // don't do this here
		End if 
		$_bo_UpdateCurrentStock:=False:C215
		
		If ($_l_CopiedFromID#0) & ($_l_CopiedFromID#[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			$_l_SMICopiedFromID:=$_l_CopiedFromID
			$_bo_UpdateCurrentStock:=True:C214
		End if 
		
		If (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0) & ($_l_CopiedFromID#[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)) | ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#(Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)))
			$_l_SMICopiedFromID:=([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
			$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
			$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
			$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
			$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
			$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
			$_t_LocationOnPrevious:=""
			If ($_bo_IsUnallocation)
				$_l_StockMovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
				If ($_l_StockMovementItemNumber=0)
					//this is an extreme exception
					STK_l_PreviousItemNumber:=0
					STK_bo_PreviousItemNumberTested:=False:C215
					$_l_GetItemNumProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
					DB_WaitforProcessToEnd($_l_GetItemNumProcess; "Get Allocation Itemnumber"; 60; "STK_bo_PreviousItemNumberTested")
					SET PROCESS VARIABLE:C370($_l_GetItemNumProcess; STK_bo_PreviousCAllback; True:C214)
					$_l_StockMovementItemNumber:=STK_l_PreviousItemNumber
					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_StockMovementItemNumber
					$_bo_Edit:=True:C214
				End if 
			Else 
				$_l_StockMovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
				$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#"")
				$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#"")
				$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
				$_t_LocationOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#"")
				$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#"")
				$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41
			End if 
			If (Not:C34([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33))
				$_t_SerialNumber:=""
			End if 
		End if 
		Case of 
			: ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
					$_l_TakeFromCurrentStockID:=STK_GetTakeFromCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_t_CurrencyCode; $_t_LayerCode; $_t_AnalysisCode; $_r_CostPrice; $_l_StockMovementItemNumber; $_t_Location; $_t_SerialNumber; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; [STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33; $_t_LocationOnPrevious)
					If ($_l_TakeFromCurrentStockID#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_TakeFromCurrentStockID
						$_bo_Edit:=True:C214
					End if 
					
				Else 
					//TRACE// this should not happen
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					$_bo_Edit:=True:C214
					
				End if 
				
				
				
			: ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
				
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
					
					
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_GetTakeFromCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_t_CurrencyCode; $_t_LayerCode; $_t_AnalysisCode; $_r_CostPrice; $_l_StockMovementItemNumber; $_t_Location; $_t_SerialNumber; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; [STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33; $_t_LocationOnPrevious)
					$_bo_Edit:=True:C214
				End if 
				
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)
					// TRACE
					$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
					If (Not:C34($_bo_IsSourceStockType))
						//TRACE  //we shouuld not get here in this state
						$_t_SourceStockType:=[MOVEMENT_TYPES:60]Type_Code:1
						$_t_SourceTakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_SourceTakeFromStockType)
						If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=-(Abs:C99([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))
							$_bo_Edit:=True:C214
						End if 
						If ($_t_SourceStockType#"")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_SourceStockType)
						End if 
					End if 
				End if 
		End case 
		
		
		
		
		
		
		If (([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & ($_l_AddToCurrentStockID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)) | ($_l_RecordNumber=-3)  //Current stock added to has changed or this is a new record
			
			$_l_SMICopiedFromID:=([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
			
			
		End if 
		
		
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
		
		
		
		
		If ($_bo_SplitItem)
			If (DB_bo_VerboseMessaging)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("Splitting Item as cannot have come from a single previous item")
			End if 
			//TRACE
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
			$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
			$_l_CountMovementItems2:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
			$_l_StockItemRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
			//ARRAY LONGINT($aForceRecalc;0)
			
			For ($_l_PreviousItemQtyIndex; 2; Size of array:C274($_ar_PreviousMovementQTY))
				GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_StockItemRecord)
				STK_ItemDuplicate
				//APPEND TO ARRAY($aForceRecalc;[STOCK_MOVEMENT_ITEMS]x_ID)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
				[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{$_l_PreviousItemQtyIndex}
				
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
				$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{$_l_PreviousItemQtyIndex}
				Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{$_l_PreviousItemQtyIndex}
				If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{$_l_PreviousItemQtyIndex}) & ($_at_PreviousMovementLocation{$_l_PreviousItemQtyIndex}#"") & ($_at_PreviousMovementLocation{$_l_PreviousItemQtyIndex}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
					[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{$_l_PreviousItemQtyIndex}
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{$_l_PreviousItemQtyIndex}) & ($_at_PreviousMovementAnalysis{$_l_PreviousItemQtyIndex}#"") & ($_at_PreviousMovementAnalysis{$_l_PreviousItemQtyIndex}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
					[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{$_l_PreviousItemQtyIndex}
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{$_l_PreviousItemQtyIndex}) & ($_at_PreviousMovementLayer{$_l_PreviousItemQtyIndex}#"") & ($_at_PreviousMovementLayer{$_l_PreviousItemQtyIndex}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
					
					[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{$_l_PreviousItemQtyIndex}
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{$_l_PreviousItemQtyIndex}) & ($_at_PreviousMovementCurrency{$_l_PreviousItemQtyIndex}#"") & ($_at_PreviousMovementCurrency{$_l_PreviousItemQtyIndex}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
					
					[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{$_l_PreviousItemQtyIndex}
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
				
				
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				If ($_bo_SplitChildren)
					APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0) | (Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)>0)
					$_l_FromStockItemID:=Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)) & (Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)>0)
						
					End if 
					
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				End if 
				$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				// ProcessServices_CreateRecord (->[STOCK ITEMS];->[STOCK ITEMS]x_ID;"StockUpdateCS";[STOCK ITEMS]x_ID;[STOCK ITEMS]X_CopiedFromID)
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
					
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) | ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
					If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) & (Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)>0)
						$_l_SMICopiedFromID:=Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
						
					End if 
					
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
					
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0) | (Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
					
					
					
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
					
					
				End if 
				
			End for 
			If ($_r_QuantityStillRequired>0)
				GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_StockItemRecord)
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				STK_ItemDuplicate
				//APPEND TO ARRAY($aForceRecalc;[STOCK_MOVEMENT_ITEMS]x_ID)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityStillRequired
				$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				DB_PseudoTrigger(Record number:C243([STOCK_MOVEMENT_ITEMS:27]); Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
				
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				If ($_bo_SplitChildren)
					APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				End if 
			End if 
			If ($_bo_Edit)
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			End if 
			
			USE NAMED SELECTION:C332("$CS")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CountMovementItems2)
			If ($_bo_SplitChildren)
				STK_SplitChildren($_l_SplitChildrenOf; ->$_ar_SplitChildrenQuantity; ->$_al_SplitChildrenParentID; ->$_al_SplitChildrenFromCSID)
			End if 
		End if 
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="") & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
			STK_ISHC_GetParent([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
		End if 
	End if 
	
	
	
	If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="") & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
		STK_ISHC_GetParent([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
	End if 
	$0:=$_bo_Edit
Until ($_bo_ExitIntegrity=True:C214)

//End if
//End if

//End if
ERR_MethodTrackerReturn("STK_EditCheckItemIntegritry"; $_t_oldMethodName)
