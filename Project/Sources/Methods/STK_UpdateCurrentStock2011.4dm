//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UpdateCurrentStock2011
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 15:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AddtoCurrentStockID; 0)
	ARRAY LONGINT:C221($_al_CopiedFromIDS; 0)
	ARRAY LONGINT:C221($_al_StockCopiedFromIDS; 0)
	ARRAY LONGINT:C221($_al_StockCopiedToIDS; 0)
	ARRAY LONGINT:C221($_al_StockFromCSIDs; 0)
	ARRAY LONGINT:C221($_al_StockItemIDS; 0)
	ARRAY LONGINT:C221($_al_TakeFromCSID; 0)
	ARRAY LONGINT:C221($_al_ValidFromIDS; 0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	C_BOOLEAN:C305(<>STK_bo_CHeckWhatisHappening; <>SYS_bo_QuitCalled; $_bo_CloseWindow; $_bo_Continue; $_bo_Exit; $_bo_GiveUp; $_bo_HasSalesOrderItemNumber; $_bo_isAnalysed; $_bo_LookedForItemNos; $_bo_NewProcess; $_bo_ProcessVisible)
	C_BOOLEAN:C305($_bo_RemoveItemNumber; $_bo_RemoveItemNumberFromStockIt; $_bo_Reset; $_bo_WasLocked; $_bo_WindowOpen; $6; CSStockLevelCompleted; DB_bo_LockedMessage; STK_bo_AllocationTypesKnown; STK_bo_ClearItemNumber; STK_bo_CSupdate)
	C_BOOLEAN:C305(STK_bo_CurrentStockValidate; STK_bo_IDisincluded; STK_bo_IncludeCheck; STK_bo_SetSuccess; STK_bo_SLCreate)
	C_LONGINT:C283(<>STK_l_GetCurrentStockProcess; $_l_ABSCurrentStockID; $_l_AddToProcessNumber; $_l_ApplicationType; $_l_Calls; $_l_CheckCount1; $_l_CheckCount2; $_l_CheckCount3; $_l_CheckCount4; $_l_CopiedFromRow; $_l_CountOnHolds)
	C_LONGINT:C283($_l_CountStockMovementItems; $_l_CountTasks; $_l_CurrentStockID; $_l_GetCurrentStockProcess; $_l_GiveItUp; $_l_IncomingID; $_l_proc; $_l_Process; $_l_ProcessOrigin; $_l_ProcessTime; $_l_procstate)
	C_LONGINT:C283($_l_RecordsinSelection; $_l_Retries; $_l_RunningProcessCheck; $_l_SelectedCSRecord; $_l_SMIIndex; $_l_UniqueProcessID; $_l_Waiting; $4; STK_l_Callback; STK_l_CurrentStockID; STL_l_includeID)
	C_REAL:C285($_r_CurrentStockQuantity; $_r_Difference; $_r_Net; $_r_Residual; $_r_SMIRecordNumber; $_r_Sum; $_r_Sum2; $_r_Sum3; $1; $2; $3)
	C_REAL:C285(CSStockLevelID; STK_R_IncludedQuantity; STK_R_qty; STK_R_StockCount)
	C_TEXT:C284($_t_AddToProcessName; $_t_CurrentStockType; $_t_oldMethodName; $_t_ProcessName; $_t_productCode; $5; $incTYPE; STK_T_includeType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdateCurrentStock2011"; Form event code:C388)
STK_bo_ClearItemNumber:=False:C215

//TRACE
If (Not:C34(STK_bo_AllocationTypesKnown))
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds)
	STK_bo_AllocationTypesKnown:=True:C214
End if 


Case of 
	: (Count parameters:C259>=5)
		$_bo_NewProcess:=True:C214
	: (Count parameters:C259>=4)
		
		$_bo_NewProcess:=False:C215
		
	: (Count parameters:C259>=2)
		$_bo_NewProcess:=True:C214
		
	Else 
		
		$_bo_NewProcess:=False:C215
End case 

$_l_ApplicationType:=Application type:C494
If ($_bo_NewProcess)
	$_bo_WindowOpen:=False:C215
	DB_bo_LockedMessage:=True:C214
	If (Not:C34($_bo_WindowOpen))
		//Open window(Screen width/2;Screen height/2;(Screen width/2)+200;(Screen height/2)+100;Palette window)
	End if 
	//GOTO XY(0;0)
	$_bo_WindowOpen:=True:C214
	STK_bo_CSupdate:=True:C214
	STK_l_CurrentStockID:=$1
	STK_l_Callback:=$2
	If ($2<0)
		STK_bo_IncludeCheck:=True:C214
		STK_l_Callback:=Abs:C99(STK_l_Callback)
	Else 
		STK_bo_IncludeCheck:=False:C215
	End if 
	If (STK_bo_IncludeCheck) & (Count parameters:C259<4)
		$_l_Retries:=0
		While (STL_l_includeID=0) & ($_l_Retries<100)
			
			If (STL_l_includeID=0)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End if 
		End while 
		If (STL_l_includeID=0)
			STK_bo_IncludeCheck:=False:C215
		End if 
		
	End if 
	STK_R_IncludedQuantity:=0
	If (Count parameters:C259>=3)
		STK_R_IncludedQuantity:=$3
	End if 
	STL_l_includeID:=0
	If (Count parameters:C259>=4)
		STL_l_includeID:=$4
	End if 
	STK_T_includeType:=""
	If (Count parameters:C259>=5)
		STK_T_includeType:=$5
	End if 
	STK_bo_IncludeCheck:=False:C215
	If (Count parameters:C259>=6)
		STK_bo_IncludeCheck:=$6
	End if 
	$_bo_Exit:=False:C215
	$_bo_CloseWindow:=False:C215
	STK_bo_ClearItemNumber:=False:C215
	
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	READ ONLY:C145([CURRENT_STOCK:62])
	$_l_ABSCurrentStockID:=Abs:C99(STK_l_CurrentStockID)
	
	If ([CURRENT_STOCK:62]X_ID:13#$_l_ABSCurrentStockID)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_ABSCurrentStockID)
	End if 
	$_bo_Reset:=False:C215
	
	$_bo_isAnalysed:=STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)
	//`message("Product is analysed")
	If ($_bo_isAnalysed)
		$_t_productCode:=[CURRENT_STOCK:62]UniqueConstruct:14
		$_r_Net:=[CURRENT_STOCK:62]Quantity:4
		
		$_bo_RemoveItemNumber:=False:C215  //this is to cope with a scenario where the stock items have had an item number added to them but now have it taken off
		$_bo_HasSalesOrderItemNumber:=([CURRENT_STOCK:62]Item_Number:5#0)
		$_t_CurrentStockType:=[CURRENT_STOCK:62]Stock_Type:3  //if the current stock record has an item number on it will make the stock levels wrong
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		STK_bo_IDisincluded:=False:C215
		STK_R_IncludedQuantity:=0
		If (Not:C34(Test semaphore:C652("DONTCHECKTWICE"+$_t_productCode)))
			$_l_Retries:=0
			While (Semaphore:C143("DONTCHECKTWICE"+$_t_productCode)) & ($_l_Retries<100)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2)
			End while 
			If ($_l_Retries<100)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_ABSCurrentStockID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ValidFromIDS)
				FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
				
				STK_bo_IDisincluded:=False:C215
				If (STK_bo_IncludeCheck) & (STK_T_includeType="Add") & (STL_l_includeID#0)
					
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STL_l_includeID)
					STK_R_IncludedQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					STK_bo_IDisincluded:=(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
				End if 
				$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				If (<>STK_bo_CHeckWhatisHappening)
					If ($_r_Sum=0)
						//TRACE
					End if 
				End if 
				$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$withResidual")
				$_bo_LookedForItemNos:=False:C215
				If ($_bo_HasSalesOrderItemNumber) & (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					$_l_CountStockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					$_bo_Reset:=False:C215
					
					If (Find in array:C230(STK_at_AllocationAds; $_t_CurrentStockType)>0)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
						//QUERY SELECTION([STOCK ITEMS]; | ;[STOCK ITEMS]Item Number#0)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							$_bo_RemoveItemNumber:=True:C214
						Else 
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<$_l_CountStockMovementItems)
								
								//Some of these records should not be counted
								//reset the counted residuals
								$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
								USE NAMED SELECTION:C332("$Temp")
								READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$_bo_Reset")
								$_bo_Reset:=True:C214
								$_bo_RemoveItemNumberFromStockIt:=True:C214
								//QUERY SELECTION([STOCK ITEMS]; | ;[STOCK ITEMS]Item Number=0)
								
							End if 
						End if 
						$_bo_LookedForItemNos:=True:C214
					End if 
					//we can also have the opposite problem..where the current stock record has NO item number
				Else 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						
						If (Find in array:C230(STK_at_AllocationAds; $_t_CurrentStockType)>0)
							COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$_bo_Reset")
								USE NAMED SELECTION:C332("$Temp")
								$_bo_Reset:=True:C214
								$_bo_RemoveItemNumberFromStockIt:=False:C215
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
								$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
								
								
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$withResidual")
								//get the on holds
								$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								$_r_Sum3:=0
								For ($_l_CountOnHolds; 1; $_l_RecordsinSelection)
									USE NAMED SELECTION:C332("$withResidual")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CountOnHolds)
									$_r_Sum3:=$_r_Sum3+STK_CountonHold([STOCK_MOVEMENT_ITEMS:27]x_ID:16; True:C214)
								End for 
								USE NAMED SELECTION:C332("$withResidual")
							End if 
						End if 
					End if 
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_ABSCurrentStockID)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
				If (STK_bo_IncludeCheck) & (STK_T_includeType="Subtract") & (STL_l_includeID#0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STL_l_includeID)
					STK_R_IncludedQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					STK_bo_IDisincluded:=(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
				End if 
				$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				If ($_r_Sum<0)
					$_r_Net:=$_r_Sum2-($_r_Sum-$_r_Sum3)
				Else 
					$_r_Net:=($_r_Sum-$_r_Sum2)-$_r_Sum3
				End if 
				If (<>STK_bo_CHeckWhatisHappening)
					If ($_r_Net=0)
						//TRACE
					End if 
				End if 
				If ($_r_Net#$_r_Residual)
					//TRACE
				End if 
				If ($_r_Net<0) | ($_r_Residual<0)  //($_r_Net#$_r_Residual) & (False)
					//the most likely thing wrong is JUST the called off quantity
					//TRACE
					// /but this can be because the residual is updated with a stock movement item that is in a transaction we must therefore ignore this.
					//$_r_Net:=$_r_Residual
					
					//READ WRITE([STOCK ITEMS])
					//TRACE
					For ($_l_SMIIndex; 1; Size of array:C274($_al_ValidFromIDS))
						$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; $_al_ValidFromIDS{$_l_SMIIndex}; 0; -1)
						$_l_CheckCount2:=0
						Repeat 
							$_l_CheckCount2:=$_l_CheckCount2+2
							DelayTicks(2)
						Until (Process state:C330($_l_Process)<=0) | (Process_Name($_l_Process)#"Change a stock item") | ($_l_CheckCount2>100)
						
						
						
						
					End for 
					//DelayTicks (60*2)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_ABSCurrentStockID; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ValidFromIDS)
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					
					STK_bo_IDisincluded:=False:C215
					If (STK_bo_IncludeCheck) & (STK_T_includeType="Add") & (STL_l_includeID#0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STL_l_includeID)
						STK_R_IncludedQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						STK_bo_IDisincluded:=(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
					End if 
					$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					$_r_Net:=$_r_Residual
					
					//$_r_Residual:=Sum([STOCK_MOVEMENT_ITEMS]X_Residual_Stock_Quantity)
					//QUERY WITH ARRAY([STOCK_MOVEMENT_ITEMS]X_CopiedFromID;$_al_ValidFromIDS)
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$TakenStock")
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_StockCopiedFromIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockCopiedToIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_StockFromCSIDs)
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockCopiedFromIDS)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_CopiedFromIDS)
					USE NAMED SELECTION:C332("$TakenStock")
					If ($_r_Net#$_r_Residual)
						//TRACE
					End if 
					
					If ($_r_Net#$_r_Residual) & (False:C215)
						
						//TRACE
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							$_l_CopiedFromRow:=Find in array:C230($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
							If ($_l_CopiedFromRow>0)
								$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_TakeFromCSID{$_l_CopiedFromRow}; 1)
							End if 
							
							
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							$_l_GiveItUp:=0
							
							$_l_CopiedFromRow:=Find in array:C230($_al_ValidFromIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
							If ($_l_CopiedFromRow>0)
								$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_ABSCurrentStockID; 1)
							End if 
							
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
						
					End if 
					
				End if 
				
				If (STK_l_CurrentStockID<0)
					
					READ WRITE:C146([CURRENT_STOCK:62])
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=Abs:C99(STK_l_CurrentStockID))
					$_l_Retries:=0
					$_bo_Continue:=True:C214
					//$_bo_WindowOpen:=False
					//TRACE
					While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 1))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<10)
						
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>2)
							DB_bo_LockedMessage:=True:C214
							If (Not:C34($_bo_WindowOpen))
								//Open window(Screen width/2;Screen height/2;(Screen width/2)+200;(Screen height/2)+100;Palette window)
							End if 
							//GOTO XY(0;0)
							$_bo_WindowOpen:=True:C214
						End if 
						If ($_bo_WindowOpen)
							//CLOSE WINDOW
						End if 
						DelayTicks(60*$_l_Retries)
						If ($_l_Retries>2)
							$_bo_GiveUp:=True:C214
							$_l_Retries:=1000
							$_bo_Continue:=False:C215
						End if 
					End while 
					If ($_bo_Continue)
						
						If ($_r_Net#[CURRENT_STOCK:62]Quantity:4)
							If ([CURRENT_STOCK:62]Quantity:4=0)
								
								[CURRENT_STOCK:62]Quantity:4:=$_r_Net
								[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
								SAVE RECORD:C53([CURRENT_STOCK:62])
								If (STK_l_Callback>0)
									SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_SetSuccess; True:C214)
									RESUME PROCESS:C320(STK_l_Callback)
								End if 
								If (<>STK_bo_CHeckWhatisHappening)
									If ([CURRENT_STOCK:62]Quantity:4=0)
										//TRACE
									End if 
								End if 
								STK_UpdateStockLevels([CURRENT_STOCK:62]x_Stock_Level_ID:15; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12)
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								//here call to update the stock level
								//must use this here to avoid recursive calls
							Else 
								//TRACE
								[CURRENT_STOCK:62]Quantity:4:=$_r_Net
								If ($_bo_RemoveItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
									[CURRENT_STOCK:62]Item_Number:5:=0
								End if 
								[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
								SAVE RECORD:C53([CURRENT_STOCK:62])
								If (STK_l_Callback>0)
									SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_SetSuccess; True:C214)
									RESUME PROCESS:C320(STK_l_Callback)
								End if 
								
								STK_UpdateStockLevels([CURRENT_STOCK:62]x_Stock_Level_ID:15; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12)
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								
							End if 
						Else 
							If (<>STK_bo_CHeckWhatisHappening)
								If ($_r_Net=0)
									//TRACE
								End if 
							End if 
							If (STK_l_Callback>0)
								SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_SetSuccess; True:C214)
								RESUME PROCESS:C320(STK_l_Callback)
							End if 
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
							If (Records in selection:C76([STOCK_LEVELS:58])=0)
								If ($_bo_RemoveItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
									[CURRENT_STOCK:62]Item_Number:5:=0
								End if 
								[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
								SAVE RECORD:C53([CURRENT_STOCK:62])
								CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
								CSStockLevelCompleted:=False:C215
								$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
								DelayTicks(30*60)
								
								$_bo_Continue:=True:C214
								$_l_Retries:=0
								While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & ($_l_Retries<2) & (Process_Name($_l_Process)="Create New Stock Level Record")
									
									//MESSAGE("at 3")
									If (Not:C34(CSStockLevelCompleted))
										$_l_Retries:=$_l_Retries+1
										$_t_ProcessName:=Process_Name($_l_Process)
										If ($_t_ProcessName="Create New Stock Level Record")
											DelayTicks(6)
										Else 
											$_l_Process:=0
										End if 
										
									Else 
										$_l_Retries:=1000
									End if 
								End while 
								If ($_l_Process>0)
									SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
								End if 
								[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
								QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
								ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
							End if 
							UNLOAD RECORD:C212([STOCK_LEVELS:58])
							
						End if 
						
					Else 
						If (<>STK_bo_CHeckWhatisHappening)
							
							//TRACE
							
						End if 
						//cant do anything
					End if 
				Else 
					If (<>STK_bo_CHeckWhatisHappening)
						If ($_r_Net=0)
							
							//why is STK_l_CUrrentStockID>=0)
							//TRACE
						End if 
					End if 
					
					If (STK_l_Callback>0)
						SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_StockCount; $_r_Net)
						SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_IncludedQuantity; STK_R_IncludedQuantity)
						SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_IDisincluded; STK_bo_IDisincluded)
						SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_ClearItemNumber; $_bo_RemoveItemNumber)
						SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_SetSuccess; True:C214)
						RESUME PROCESS:C320(STK_l_Callback)
						RESUME PROCESS:C320(STK_l_CallBack)
					End if 
				End if 
			Else 
				If (STK_l_Callback>0)
					STK_bo_IDisincluded:=False:C215
					SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_StockCount; [CURRENT_STOCK:62]Quantity:4)
					SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_IncludedQuantity; 0)
					SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_IDisincluded; STK_bo_IDisincluded)
					SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_ClearItemNumber; $_bo_RemoveItemNumber)
					RESUME PROCESS:C320(STK_l_CallBack)
					UNLOAD RECORD:C212([CURRENT_STOCK:62])
				End if 
			End if 
			CLEAR SEMAPHORE:C144("DONTCHECKTWICE"+$_t_productCode)
		Else 
			If (<>STK_bo_CHeckWhatisHappening)
				//TRACE
			End if 
			//TRACE
			If (STK_l_Callback>0)
				STK_bo_IDisincluded:=False:C215
				SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_StockCount; $_r_Net)
				SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_IncludedQuantity; 0)
				SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_IDisincluded; STK_bo_IDisincluded)
				SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_ClearItemNumber; $_bo_RemoveItemNumber)
				RESUME PROCESS:C320(STK_l_CallBack)
			End if 
			
		End if 
		
	Else 
		If (STK_l_Callback>0)
			STK_bo_IDisincluded:=False:C215
			SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_StockCount; [CURRENT_STOCK:62]Quantity:4)
			SET PROCESS VARIABLE:C370(STK_l_Callback; STK_R_IncludedQuantity; 0)
			SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_IDisincluded; STK_bo_IDisincluded)
			SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_bo_ClearItemNumber; $_bo_RemoveItemNumber)
			RESUME PROCESS:C320(STK_l_CallBack)
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
		End if 
	End if 
	
	STK_bo_CSupdate:=False:C215
	If (STK_l_Callback>0)
		SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_CurrentStockValidate; True:C214)
		RESUME PROCESS:C320(STK_l_Callback)
	End if 
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	UNLOAD RECORD:C212([CURRENT_STOCK:62])
	UNLOAD RECORD:C212([STOCK_LEVELS:58])
	CLEAR SEMAPHORE:C144("UpdatingCurrentStockCount_")
	STK_bo_IncludeCheck:=False:C215
	STK_T_includeType:=""
	STL_l_includeID:=0
	$_l_Calls:=0
	STK_bo_CSupdate:=False:C215
	If ($_bo_Reset)  //There are some stock items that should not have this on
		//TRACE
		DelayTicks(10*60)
		
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		USE NAMED SELECTION:C332("$_bo_Reset")
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
		
		FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			//TRACE
			If ($_bo_RemoveItemNumberFromStockIt)
				$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; 3)
			Else 
				
				$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; 2)
			End if 
			
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		
		//APPLY TO SELECTION([STOCK ITEMS];STK_UpdateCalledOffQuantity )
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_AddtoCurrentStockID)
		
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_StockItemIDS)
		For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			$_l_CopiedFromRow:=Find in array:C230($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			If ($_l_CopiedFromRow>0)
				$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AddtoCurrentStockID{$_l_CopiedFromRow}; 1)
			End if 
			
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		
	End if 
	If ($_bo_WindowOpen)
		CLOSE WINDOW:C154
	End if 
Else 
	$_bo_WindowOpen:=False:C215
	DB_bo_LockedMessage:=True:C214
	If (Not:C34($_bo_WindowOpen))
		//Open window(Screen width/2;Screen height/2;(Screen width/2)+200;(Screen height/2)+100;Palette window)
	End if 
	//GOTO XY(0;0)
	$_bo_WindowOpen:=True:C214
	$_l_Waiting:=0
	
	While (Semaphore:C143("$UpdatingCurrentStockCountANY")) & ($_l_Waiting<100)
		
		//GOTO XY(0;0)
		//MESSAGE("Waiting for $UpdatingCurrentStockCountANY")
		$_l_Waiting:=$_l_Waiting+1
		DelayTicks(9*$_l_Waiting)
		If ($_l_Waiting>10)
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			DelayTicks(9*$_l_Waiting)
			LOAD RECORD:C52([CURRENT_STOCK:62])
		End if 
	End while 
	If ($_l_Waiting<100)  //GOTO XY(0;0)
		//MESSAGE("")
		
		STK_l_Callback:=Current process:C322
		If (Count parameters:C259>=1)
			$_l_IncomingID:=$1
		Else 
			$_l_IncomingID:=0
		End if 
		If (Count parameters:C259=0) | ($_l_IncomingID<0)
			If (Count parameters:C259>=4)
				$_l_ABSCurrentStockID:=Abs:C99($1)
			Else 
				$_l_ABSCurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				If (Record number:C243([CURRENT_STOCK:62])>=0)
					//$_bo_WindowOpen:=False
					$_l_Retries:=0
					$_bo_WasLocked:=False:C215
					//TRACE
					While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 0; False:C215))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<10)
						
						CLEAR SEMAPHORE:C144("$UpdatingCurrentStockCountANY")  //Clear this semaphore because if the record is locked the process may be held up by this semaphore
						$_bo_WasLocked:=True:C214
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>2)
							DB_bo_LockedMessage:=True:C214
							If (Not:C34($_bo_WindowOpen))
								//Open window(Screen width/2;Screen height/2;(Screen width/2)+200;(Screen height/2)+100;Palette window)
							End if 
							//GOTO XY(0;0)
							//MESSAGE("Process"+String(Current process)+"is waiting for LockOffStockCount"+String($Semid)+String($_l_Retries))
							$_bo_WindowOpen:=True:C214
						End if 
						DelayTicks(9*$_l_Retries)
					End while 
					If ($_bo_WasLocked)
						$_l_Waiting:=0
						While (Semaphore:C143("$UpdatingCurrentStockCountANY")) & ($_l_Waiting<100)  //Reset the semaphore here because we might have cleared it in locked
							//GOTO XY(0;0)
							//MESSAGE("Waiting for $UpdatingCurrentStockCountANY")
							$_l_Waiting:=$_l_Waiting+1
							DelayTicks(9*$_l_Waiting)
							If ($_l_Waiting>10)
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
								DelayTicks(9*$_l_Waiting)
								LOAD RECORD:C52([CURRENT_STOCK:62])
							End if 
						End while 
						If ($_l_Waiting>=100)
							$_l_ABSCurrentStockID:=0
						End if 
					End if 
					//GOTO XY(0;0)
					//MESSAGE("")
					
					If ($_bo_WindowOpen)
						//CLOSE WINDOW
					End if 
				Else 
					$_l_ABSCurrentStockID:=0
				End if 
			End if 
			If ($_l_ABSCurrentStockID#0)
				$_l_Waiting:=0
				While (Semaphore:C143("LockOffCurrentStock"+String:C10($_l_ABSCurrentStockID))) & ($_l_Waiting<100)
					//GOTO XY(0;0)
					//MESSAGE("Waiting for LockOffCurrentStock"+String($_l_ABSCurrentStockID))
					
					
					$_l_Waiting:=$_l_Waiting+1
					DelayTicks(9*$_l_Waiting)
				End while 
				
				If ($_l_Waiting<100)
					If (Count parameters:C259>=4)
						If ($1<0)
							READ WRITE:C146([CURRENT_STOCK:62])
							If ([CURRENT_STOCK:62]X_ID:13#$_l_ABSCurrentStockID)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_ABSCurrentStockID)
							End if 
							LOAD RECORD:C52([CURRENT_STOCK:62])
						End if 
					End if 
					If ([CURRENT_STOCK:62]Product_Code:1#"")
						$_bo_isAnalysed:=STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)
						If ($_bo_isAnalysed)
							If (Count parameters:C259>=5)
								STL_l_includeID:=Abs:C99($2)  //the srock item id
								STK_R_qty:=$3
								STK_T_includeType:=$5
								STK_bo_IncludeCheck:=True:C214
							Else 
								
								STL_l_includeID:=0  //the srock item id
								STK_R_qty:=0
								STK_T_includeType:=""
								STK_bo_IncludeCheck:=False:C215
							End if 
							$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
							STK_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
							STK_l_Callback:=Current process:C322
							STK_bo_CurrentStockValidate:=False:C215
							STK_R_StockCount:=0
							STK_bo_IDisincluded:=False:C215
							$_l_Waiting:=0
							//`GOTO XY(0;6)
							//MESSAGE("Stock count="+String(STK_R_StockCount))
							$_t_AddToProcessName:=""
							$_l_AddToProcessNumber:=0
							If (Not:C34(In transaction:C397))
								$_l_CheckCount3:=0
								Repeat 
									$_l_CheckCount3:=$_l_CheckCount3+1
									$_l_RunningProcessCheck:=0
									$_l_CountTasks:=Count tasks:C335
									For ($_l_proc; 1; $_l_CountTasks)
										PROCESS PROPERTIES:C336($_l_proc; $_t_ProcessName; $_l_procstate; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
										If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
											If ($_l_procstate>=0)
												$_l_RunningProcessCheck:=$_l_RunningProcessCheck+1
											End if 
										End if 
									End for 
									If ($_l_RunningProcessCheck>=10)
										CLEAR SEMAPHORE:C144("$UpdatingCurrentStockCountANY")  //Clear this semaphore because if the record is locked the process may be held up by this semaphore
									End if 
								Until ($_l_RunningProcessCheck<10) | ($_l_CheckCount3>100)
								$_l_Waiting:=0
								While (Semaphore:C143("$UpdatingCurrentStockCountANY")) & ($_l_Waiting<100)
									$_l_Waiting:=$_l_Waiting+1
									DelayTicks(9*$_l_Waiting)
									If ($_l_Waiting>10)
										UNLOAD RECORD:C212([CURRENT_STOCK:62])
										DelayTicks(9*$_l_Waiting)
										LOAD RECORD:C52([CURRENT_STOCK:62])
									End if 
								End while 
								If ($_l_Waiting<100)
									STK_R_StockCount:=[CURRENT_STOCK:62]Quantity:4
									$_l_CheckCount1:=0
									Repeat 
										$_l_CheckCount1:=$_l_CheckCount1+1
										If (STK_bo_IncludeCheck)
											STK_bo_SetSuccess:=False:C215
											$_l_CheckCount4:=0
											Repeat 
												$_l_CheckCount4:=$_l_CheckCount4+1
												$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10([CURRENT_STOCK:62]X_ID:13)+$_t_AddToProcessName; ([CURRENT_STOCK:62]X_ID:13); -Current process:C322; STK_R_qty; STL_l_includeID; STK_T_includeType; STK_bo_IncludeCheck; *)
												DelayTicks(1*60)
											Until (STK_bo_SetSuccess) | ($_l_CheckCount4>0)
											
										Else 
											STK_bo_SetSuccess:=False:C215
											$_l_CheckCount4:=0
											Repeat 
												$_l_CheckCount4:=$_l_CheckCount4+1
												$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10([CURRENT_STOCK:62]X_ID:13)+$_t_AddToProcessName; ([CURRENT_STOCK:62]X_ID:13); Current process:C322; STK_R_qty; STL_l_includeID; STK_T_includeType; False:C215; *)
												DelayTicks(1*60)
											Until (STK_bo_SetSuccess) | ($_l_CheckCount4>100)
										End if 
										//DelayTicks (30*60)
										$_l_Waiting:=0
										While (Not:C34(STK_bo_CurrentStockValidate)) & ($_l_Waiting<100) & ($_l_GetCurrentStockProcess#Current process:C322)
											//GOTO XY(0;0)
											//MESSAGE("Waiting for STK_bo_CurrentStockValidate"+String($_l_Waiting)+" from "+String($_l_GetCurrentStockProcess))
											
											If (Process_Name($_l_GetCurrentStockProcess)=("ValidateCurrentStock"+String:C10([CURRENT_STOCK:62]X_ID:13)+$_t_AddToProcessName))
												
												If (Process state:C330($_l_GetCurrentStockProcess)>=Executing:K13:4)
													If ($_l_Waiting>60)
														$_l_Waiting:=1
													End if 
													DelayTicks(1*$_l_Waiting)
												Else 
													$_l_Waiting:=1000
												End if 
											Else 
												$_l_Waiting:=1000
											End if 
											
										End while 
										//GOTO XY(0;0)
										//MESSAGE("")
										If ($_l_GetCurrentStockProcess=Current process:C322)
											$_l_AddToProcessNumber:=$_l_AddToProcessNumber+1
											$_t_AddToProcessName:=$_t_AddToProcessName+String:C10($_l_AddToProcessNumber)
										End if 
										
									Until (STK_bo_CurrentStockValidate) | ($_l_CheckCount1>100)
									
									If (STK_R_StockCount#[CURRENT_STOCK:62]Quantity:4)
										[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount
										SAVE RECORD:C53([CURRENT_STOCK:62])
									End if 
									
									If ([CURRENT_STOCK:62]x_Stock_Level_ID:15>0)
										QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
										If (Records in selection:C76([STOCK_LEVELS:58])=0)
											[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
											SAVE RECORD:C53([CURRENT_STOCK:62])
											CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
											CSStockLevelCompleted:=False:C215
											$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
											DelayTicks(30*60)
											$_l_Retries:=0
											While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record") & ($_l_Retries<100)
												
												//GOTO XY(0;0)
												//MESSAGE("Waiting for Stock level")
												
												If (Not:C34(CSStockLevelCompleted))
													$_t_ProcessName:=Process_Name($_l_Process)
													$_l_Retries:=$_l_Retries+1
													If ($_t_ProcessName="Create New Stock Level Record")
														DelayTicks(6*$_l_Retries)
													Else 
														$_l_Process:=0
													End if 
												Else 
												End if 
											End while 
											//GOTO XY(0;0)
											//MESSAGE("")
											
											If ($_l_Process>0)
												SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
											End if 
											[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
											QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
											ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
											
										End if 
										UNLOAD RECORD:C212([STOCK_LEVELS:58])
									End if 
								End if 
							Else 
								$_t_productCode:=[CURRENT_STOCK:62]UniqueConstruct:14
								If (Not:C34(Test semaphore:C652("DONTCHECKTWICE"+$_t_productCode)))
									$_l_Retries:=0
									While (Semaphore:C143("DONTCHECKTWICE"+$_t_productCode)) & ($_l_Retries<100)
										$_l_Retries:=$_l_Retries+1
										DelayTicks(5)
									End while 
									//GOTO XY(0;0)
									//MESSAGE("")
									If ($_l_Retries<100)
										$_bo_Reset:=False:C215
										$_bo_RemoveItemNumberFromStockIt:=False:C215
										$_bo_RemoveItemNumber:=False:C215  //this is to cope with a scenario where the stock items have had an item number added to them but now have it taken off
										$_bo_HasSalesOrderItemNumber:=([CURRENT_STOCK:62]Item_Number:5#0)
										
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CSI")
										$_r_SMIRecordNumber:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										//````````
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13; *)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ValidFromIDS)
										$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$withResidual")
										
										If ($_bo_HasSalesOrderItemNumber) & (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											If (Find in array:C230(STK_at_AllocationAds; $_t_CurrentStockType)>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0; *)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
													$_bo_RemoveItemNumber:=True:C214
												Else 
													If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<$_l_CountStockMovementItems)
														
														//Some of these records should not be counted
														//reset the counted residuals
														$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
														$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
														COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$withResidual")
														USE NAMED SELECTION:C332("$Temp")
														READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
														QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
														COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$_bo_Reset")
														$_bo_Reset:=True:C214
														$_bo_RemoveItemNumberFromStockIt:=True:C214
														//QUERY SELECTION([STOCK ITEMS]; | ;[STOCK ITEMS]Item Number=0)
														
													End if 
												End if 
											End if 
										Else 
											If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
												
												If (Find in array:C230(STK_at_AllocationAds; $_t_CurrentStockType)>0)
													COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
													If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
														COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$_bo_Reset")
														USE NAMED SELECTION:C332("$Temp")
														$_bo_Reset:=True:C214
														$_bo_RemoveItemNumberFromStockIt:=False:C215
														QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
														$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
														$_r_Residual:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
														COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$withResidual")
														$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
														$_r_Sum3:=0
														For ($_l_CountOnHolds; 1; $_l_RecordsinSelection)
															USE NAMED SELECTION:C332("$withResidual")
															GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CountOnHolds)
															$_r_Sum3:=$_r_Sum3+STK_CountonHold([STOCK_MOVEMENT_ITEMS:27]x_ID:16; True:C214)
														End for 
														USE NAMED SELECTION:C332("$withResidual")
													End if 
												End if 
											End if 
										End if   //note that we only check on the add side
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										If ($_r_Sum<0)
											$_r_Net:=$_r_Sum2-($_r_Sum-$_r_Sum3)
										Else 
											$_r_Net:=($_r_Sum-$_r_Sum2)-$_r_Sum3
										End if 
										If ($_r_Net#$_r_Residual)
											//TRACE
										End if 
										If ($_r_Net<0) | ($_r_Residual<0)  //($_r_Net#$_r_Residual) & (False)
											//TRACE
											$_r_Net:=$_r_Residual
											READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
											
											COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$TakenStock")
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_StockCopiedFromIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockCopiedToIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_StockFromCSIDs)
											QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockCopiedFromIDS)
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_TakeFromCSID)
											USE NAMED SELECTION:C332("$TakenStock")
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
												$_l_CopiedFromRow:=Find in array:C230($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												If ($_l_CopiedFromRow>0)
													$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_TakeFromCSID{$_l_CopiedFromRow}; 1)
												End if 
												
												NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
												
											End for 
											QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
											For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
												$_l_CopiedFromRow:=Find in array:C230($_al_ValidFromIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												If ($_l_CopiedFromRow>0)
													$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13; 1)
													
												End if 
												
												NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											End for 
											
										End if 
										
										
										
										STK_R_StockCount:=$_r_Net
										
										If ($_r_Net#[CURRENT_STOCK:62]Quantity:4)
											If ([CURRENT_STOCK:62]Quantity:4=0)
												//TRACE
												[CURRENT_STOCK:62]Quantity:4:=$_r_Net
												If ($_bo_RemoveItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
													[CURRENT_STOCK:62]Item_Number:5:=0
												End if 
												STK_R_StockCount:=[CURRENT_STOCK:62]Quantity:4
												[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
												SAVE RECORD:C53([CURRENT_STOCK:62])
												COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
												$_l_SelectedCSRecord:=Selected record number:C246([CURRENT_STOCK:62])
												STK_UpdateStockLevels([CURRENT_STOCK:62]x_Stock_Level_ID:15; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12)
												UNLOAD RECORD:C212([STOCK_LEVELS:58])
												USE NAMED SELECTION:C332("$TempCS")
												GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedCSRecord)
												//here call to update the stock level
												//must use this here to avoid recursive calls
											Else 
												//TRACE
												[CURRENT_STOCK:62]Quantity:4:=$_r_Net
												If ($_bo_RemoveItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
													[CURRENT_STOCK:62]Item_Number:5:=0
												End if 
												STK_R_StockCount:=[CURRENT_STOCK:62]Quantity:4
												[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
												SAVE RECORD:C53([CURRENT_STOCK:62])
												COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
												$_l_SelectedCSRecord:=Selected record number:C246([CURRENT_STOCK:62])
												STK_UpdateStockLevels([CURRENT_STOCK:62]x_Stock_Level_ID:15; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12)
												UNLOAD RECORD:C212([STOCK_LEVELS:58])
												USE NAMED SELECTION:C332("$TempCS")
												GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedCSRecord)
												
											End if 
										Else 
											If ([CURRENT_STOCK:62]x_Stock_Level_ID:15>0)
												QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
												If (Records in selection:C76([STOCK_LEVELS:58])=0)
													If ($_bo_RemoveItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
														[CURRENT_STOCK:62]Item_Number:5:=0
													End if 
													[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
													SAVE RECORD:C53([CURRENT_STOCK:62])
													CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
													CSStockLevelCompleted:=False:C215
													$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
													DelayTicks(30*60)
													
													$_l_Retries:=0
													While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record") & ($_l_Retries<100)
														If (Not:C34(CSStockLevelCompleted))
															$_t_ProcessName:=Process_Name($_l_Process)
															$_l_Retries:=$_l_Retries+1
															If ($_t_ProcessName="Create New Stock Level Record")
																DelayTicks(60*$_l_Retries)
															Else 
																$_l_Process:=0
															End if 
														Else 
														End if 
													End while 
													If ($_l_Process>0)
														SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
													End if 
													[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
													QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
													ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
													
												End if 
												UNLOAD RECORD:C212([STOCK_LEVELS:58])
											End if 
										End if 
										If ($_bo_Reset)  //There are some stock items that should not have this on
											//TRACE
											//READ On([STOCK ITEMS])
											
											USE NAMED SELECTION:C332("$_bo_Reset")
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
											//APPLY TO SELECTION([STOCK ITEMS];)
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
												//TRACE
												If ($_bo_RemoveItemNumberFromStockIt)
													$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; 3)
												Else 
													
													$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; 2)
												End if 
												
												NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											End for 
											$_bo_RemoveItemNumberFromStockIt:=False:C215
											UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
											QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_StockItemIDS)
											For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
												$_l_CopiedFromRow:=Find in array:C230($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												If ($_l_CopiedFromRow>0)
													
													
													
													
													
													$_l_Process:=New process:C317("STK_ChangeStockItem"; 128000; "Change a stock item"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AddtoCurrentStockID{$_l_CopiedFromRow}; 1)
												End if 
												
												
												NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											End for 
											
										End if 
										USE NAMED SELECTION:C332("$CSI")
										If ($_r_SMIRecordNumber>0) & (Not:C34(Record number:C243([STOCK_MOVEMENT_ITEMS:27])=$_r_SMIRecordNumber))
											
											GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_r_SMIRecordNumber)
										End if 
									End if 
									CLEAR SEMAPHORE:C144("DONTCHECKTWICE"+$_t_productCode)
								Else 
									//TRACE
									
								End if 
								
								//`message("Setting semaphore LockOffCurrentStock-4")
								//```
							End if 
							STL_l_includeID:=0  //the srock item id
							STK_R_qty:=0
							STK_T_includeType:=""
							STK_bo_IncludeCheck:=False:C215
							
							Case of 
								: (STK_T_includeType="Add")
									//`message("Setting semaphore LockOffCurrentStock-7")
									If (Not:C34(STK_bo_IDisincluded))
										If ($2>0)
											//TRACE
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount+STK_R_qty
										End if 
									Else 
										//This stock item is included.
										If ($2>0)
											$_r_Difference:=-STK_R_qty-STK_R_IncludedQuantity  //Take account of a quantity change
											//TRACE
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount+$_r_Difference
										Else 
											//this is being taken off this current stock record and it is included so
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount+STK_R_IncludedQuantity
										End if 
									End if 
								: (STK_T_includeType="Subtract")
									//`message("Setting semaphore LockOffCurrentStock-8")
									If (Not:C34(STK_bo_IDisincluded))
										If ($2>0)
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount-STK_R_qty
										End if 
									Else 
										If ($2>0)
											$_r_Difference:=STK_R_qty-STK_R_IncludedQuantity  //Take account of a quantity change
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount-$_r_Difference
										Else 
											[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount-STK_R_IncludedQuantity
										End if 
									End if 
								Else 
									[CURRENT_STOCK:62]Quantity:4:=STK_R_StockCount
							End case 
							//`message("Setting semaphore LockOffCurrentStock-9")
							[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
							If (STK_bo_ClearItemNumber) & ([CURRENT_STOCK:62]Quantity:4>0)
								//TRACE
								[CURRENT_STOCK:62]Item_Number:5:=0
							End if 
							If (Count parameters:C259=4)
								SAVE RECORD:C53([CURRENT_STOCK:62])
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
							End if 
							
							
						End if 
					End if 
				End if 
				CLEAR SEMAPHORE:C144("LockOffCurrentStock"+String:C10($_l_ABSCurrentStockID))
				
			End if 
		Else 
			STK_l_CurrentStockID:=$1
			If ([CURRENT_STOCK:62]X_ID:13=$1)
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
			End if 
			$_l_CurrentStockID:=Abs:C99(STK_l_CurrentStockID)
			If ($1>0)
				$_l_ABSCurrentStockID:=-(STK_l_CurrentStockID)
			Else 
				$_l_ABSCurrentStockID:=STK_l_CurrentStockID
			End if 
			$_l_Retries:=0
			While (Semaphore:C143("LockOffCurrentStock"+String:C10($_l_CurrentStockID))) & ($_l_Retries<100)
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				$_l_Retries:=$_l_Retries+1
				DelayTicks(9*$_l_Retries)
				LOAD RECORD:C52([CURRENT_STOCK:62])
			End while 
			If ($_l_Retries<100)
				STK_l_Callback:=Current process:C322
				STK_bo_CurrentStockValidate:=False:C215
				STK_R_StockCount:=0
				STL_l_includeID:=0  //the srock item id
				STK_R_qty:=0
				STK_T_includeType:=""
				STK_bo_IncludeCheck:=False:C215
				STK_bo_CurrentStockValidate:=False:C215
				STK_bo_ClearItemNumber:=False:C215
				$_l_CurrentStockID:=Abs:C99(STK_l_CurrentStockID)
				$_l_CheckCount3:=0
				Repeat 
					$_l_CheckCount3:=$_l_CheckCount3+1
					$_l_RunningProcessCheck:=0
					$_l_CountTasks:=Count tasks:C335
					For ($_l_proc; 1; $_l_CountTasks)
						PROCESS PROPERTIES:C336($_l_proc; $_t_ProcessName; $_l_procstate; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
						If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
							If ($_l_procstate>=0)
								$_l_RunningProcessCheck:=$_l_RunningProcessCheck+1
							End if 
						End if 
					End for 
					If ($_l_RunningProcessCheck>=10)
						CLEAR SEMAPHORE:C144("$UpdatingCurrentStockCountANY")  //Clear this semaphore because if the record is locked the process may be held up by this semaphore
					End if 
				Until ($_l_RunningProcessCheck<10) | ($_l_CheckCount3>100)
				$_l_Waiting:=0
				While (Semaphore:C143("$UpdatingCurrentStockCountANY")) & ($_l_Waiting<100)
					$_l_Waiting:=$_l_Waiting+1
					DelayTicks(9*$_l_Waiting)
					If ($_l_Waiting>10)
						UNLOAD RECORD:C212([CURRENT_STOCK:62])
						DelayTicks(9*$_l_Waiting)
						LOAD RECORD:C52([CURRENT_STOCK:62])
					End if 
				End while 
				If ($_l_Waiting<100)
					STK_bo_SetSuccess:=False:C215
					$_l_CheckCount4:=0
					Repeat 
						$_l_CheckCount4:=$_l_CheckCount4+1
						$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 128000; "ValidateCurrentStock"+String:C10(Abs:C99($_l_ABSCurrentStockID)); $_l_ABSCurrentStockID; Current process:C322; *)
						DelayTicks(1*60)
					Until (STK_bo_SetSuccess) | ($_l_CheckCount4>100)
				End if 
				$_l_Waiting:=0
			End if 
			
			CLEAR SEMAPHORE:C144("LockOffCurrentStock"+String:C10(Abs:C99(STK_l_CurrentStockID)))
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$UpdatingCurrentStockCountANY")
	//CLOSE WINDOW
	
End if 
ERR_MethodTrackerReturn("STK_UpdateCurrentStock2011"; $_t_oldMethodName)
