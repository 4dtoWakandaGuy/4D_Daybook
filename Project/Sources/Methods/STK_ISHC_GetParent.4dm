//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ISHC_GetParent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2012 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_PreviousMovementCSID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	ARRAY TEXT:C222($_at_MovementCodes; 0)
	//ARRAY TEXT(STK_at_PreviousMovementAnalysis;0)
	//ARRAY TEXT(STK_at_PreviousMovementCurrency;0)
	//ARRAY TEXT(STK_at_PreviousMovementLayer;0)
	//ARRAY TEXT(STK_at_PreviousMovementLocation;0)
	C_BOOLEAN:C305(<>STOCK_bo_NoSplit; <>STOCK_bo_NoSuperSplit; $_bo_Continue; $_bo_CSIDMatch; $_bo_DateMatch; $_bo_Edit; $_bo_Exit; $_bo_IsAllocation; $_bo_IsSourceStockType; $_bo_isUnallocation; $_bo_NoExit)
	C_BOOLEAN:C305($_bo_NoSplit; $_bo_NoSuperSplit; $_bo_PreTry; $_bo_PriceMatch; $_bo_SplitItem; $_bo_UseOnlyAllocated; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; STK_bo_PreviousSet)
	C_DATE:C307($_d_HeaderDate)
	C_LONGINT:C283(<>STK_l_PreviousProcess; $_l_AddToCurrentStockID; $_l_DelaysCount; $_l_GetItemNumber; $_l_RecordsIndex; $_l_RecordsinSelection; $_l_Retries; $_l_TakeFromCSID; $_l_TakeFromItemID; $_l_Time; $_l_Zero)
	C_LONGINT:C283(STK_l_PreviousItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber)
	C_REAL:C285($_r_CostPrice; $_r_Zero; STK_R_PreviousCostPrice)
	C_TEXT:C284($_t_oldMethodName; $_t_PSCProductCode; STK_T_PreviousStockItemAnal; STK_T_PreviousStockItemCurrency; STK_T_PreviousStockItemLayer; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ISHC_GetParent")
//This is a special method written to populate[STOCK ITEMS]xnonlinkedCopiedFromID
//this is to be used only for data copied from a stock item where the take from type is blank.
//when this is blank it cannot be said to be copied from the previous-the 'remainder' of that previous does not change.
//however in order to speed up(Potentially) the process when we then copy from this blank stock item knowing where it was copied from would be useful
//uncluding marking the [stock items]xnonlinkedcopiedfromID as -1
If (Count parameters:C259=0)
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6="ISHC"; *)
	QUERY:C277([STOCK_MOVEMENTS:40];  | [STOCK_MOVEMENTS:40]Movement_Type:6="ISH")
	
	SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
	
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; <)
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
Else 
	$_l_RecordsinSelection:=1
End if 

For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
	If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	End if 
	STK_SetHeaderInfo
	If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="")
		Case of 
			: ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ISHC") | ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ISH")
				//[STOCK ITEMS]xTakeFromStockType:="O"
				//Here we no try to copy from...
				//BUT we dont store that in the [stock items]x_copied from field
				If ([STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
					
					$_bo_IsAllocation:=False:C215
					$_bo_isUnallocation:=False:C215
					$_bo_UseOnlyAllocated:=False:C215
					$_l_AddToCurrentStockID:=0  //[STOCK ITEMS]xAddtoCurrentStockID<---make sure it stays 0
					$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
					
					If ([STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
						$_bo_Continue:=False:C215
						$_bo_NoSplit:=True:C214
						$_bo_NoSuperSplit:=True:C214
						$_bo_PriceMatch:=True:C214
						$_bo_DateMatch:=True:C214
						$_bo_CSIDMatch:=True:C214
						$_bo_Exit:=False:C215
						$_bo_SplitItem:=False:C215
						$_bo_IsSourceStockType:=False:C215
						If (Not:C34($_bo_IsSourceStockType))  //if this is a source stock type dont waste time looking for a previous movement item!
							$_bo_PreTry:=True:C214
							Repeat 
								Repeat 
									STK_l_PreviousStockItemNumber:=0
									STK_l_PreviousMovementID:=0
									STK_t_PreviousStockLocation:=""
									STK_T_PreviousStockItemAnal:=""
									STK_T_PreviousStockItemLayer:=""
									STK_T_PreviousStockItemCurrency:=""
									STK_t_PreviousStockSerial:=""
									STK_R_PreviousCostPrice:=0
									Case of 
										: ($_bo_isUnallocation)
											$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
											If ($_l_TakeFromItemID=0)
												//TRACE
												STK_l_PreviousItemNumber:=0
												STK_bo_PreviousItemNumberTested:=False:C215
												$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												$_l_Retries:=0
												Repeat 
													//Message("Waiting for Get allocation Item number")
													$_l_Retries:=$_l_Retries+1
													DelayTicks(60*$_l_Retries)
												Until (STK_bo_PreviousItemNumberTested)
												SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
												$_l_TakeFromItemID:=STK_l_PreviousItemNumber
												[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_TakeFromItemID
												$_bo_Edit:=True:C214
											End if 
										: ($_bo_IsAllocation)
											$_l_TakeFromItemID:=0
										Else 
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
									While (Semaphore:C143("PSC"+$_t_PSCProductCode))
										//Message("Waiting for semaphore PSC"+[STOCK ITEMS]Product Code)
										$_l_Retries:=$_l_Retries+1
										DelayTicks(10*$_l_Retries)
									End while 
									<>STOCK_bo_NoSplit:=$_bo_NoSplit
									<>STOCK_bo_NoSuperSplit:=$_bo_NoSuperSplit
									If (<>STOCK_bo_NoSuperSplit=False:C215)
										<>STOCK_bo_NoSplit:=False:C215
									End if 
									
									Repeat 
										Case of 
												
											: ($_bo_PreTry)
												$_r_CostPrice:=$_r_Zero
												$_d_HeaderDate:=!00-00-00!
												$_l_TakeFromCSID:=$_l_Zero
												$_bo_NoSuperSplit:=False:C215
												$_bo_NoSplit:=False:C215
											: ($_bo_PriceMatch)  //is date match or CSID Match on
												$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
												Case of 
													: ($_bo_DateMatch)
														$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
														If ($_bo_CSIDMatch)
															If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																
															Else 
																$_l_TakeFromCSID:=$_l_Zero
																
															End if 
															
															
														Else 
															$_l_TakeFromCSID:=$_l_Zero
															
														End if 
													Else 
														$_d_HeaderDate:=!00-00-00!
														If ($_bo_CSIDMatch)
															If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																
															Else 
																$_l_TakeFromCSID:=$_l_Zero
																
															End if 
															
															
														Else 
															$_l_TakeFromCSID:=$_l_Zero
															//GOTO XY(4;1)
															//MESSAGE("Finding Preceding Stock item"+" using Prce Match")
															
														End if 
												End case 
											: ($_bo_DateMatch)  //price match is off is CS ID match on
												$_r_CostPrice:=$_r_Zero
												$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
												If ($_bo_CSIDMatch)
													If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
														$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
														//GOTO XY(4;1)
														//MESSAGE("Finding Preceding Stock item"+" using Prce Match current stock match and date match(no price match)")
														
													Else 
														$_l_TakeFromCSID:=$_l_Zero
														//GOTO XY(4;1)
														//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match(no price match)")
														
													End if 
													
													
												Else 
													$_l_TakeFromCSID:=$_l_Zero
													//GOTO XY(4;1)
													//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match(no price match)")
													
												End if 
											: ($_bo_CSIDMatch)  //Price match and  Date match are off
												$_r_CostPrice:=$_r_Zero
												$_d_HeaderDate:=!00-00-00!
												If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
													$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
													//GOTO XY(4;1)
													//MESSAGE("Finding Preceding Stock item"+" using current stock id Match (no date match,no price match)")
													
												Else 
													$_l_TakeFromCSID:=$_l_Zero
													//GOTO XY(4;1)
													//MESSAGE("Finding Preceding Stock item"+" No  current stock id Match (no date match,no price match)")
													
												End if 
												
												
												
											Else 
												$_r_CostPrice:=$_r_Zero
												$_d_HeaderDate:=!00-00-00!
												$_l_TakeFromCSID:=$_l_Zero
												//GOTO XY(4;1)
												//MESSAGE("Finding Preceding Stock item"+" No  current stock id Match (no date match,no price match)")
												
												
										End case 
										$_l_Retries:=0
										While (Test semaphore:C652("GetPrevious"))
											//GOTO XY(4;1)
											//MESSAGE("Waiting for semaphore GetPrevious")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(10*$_l_Retries)
										End while 
										If (<>STK_l_PreviousProcess=0)
											<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 128000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_l_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; "O"; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_d_HeaderDate; $_r_CostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_isUnallocation; $_l_TakeFromItemID; $_bo_UseOnlyAllocated; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_bo_PreTry; *)
											//GOTO XY(4;1)
											
											//MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(3)"+String(◊STK_l_PreviousProcess))
											DelayTicks(30*60)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
										Else 
											$_l_Retries:=0
											While (Semaphore:C143("STK_GetPrevious"))
												//GOTO XY(4;1)
												//MESSAGE("Waiting for semaphore STK_GetPrevious")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*$_l_Retries)
											End while 
											$_l_Retries:=0
											While (Test semaphore:C652("GetPrevious"))
												//GOTO XY(4;1)
												//MESSAGE("Waiting for semaphore GetPrevious")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*$_l_Retries)
											End while 
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_TakeFromCSID)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; "O")
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_isUnallocation)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CallisPreTry; $_bo_PreTry)
											RESUME PROCESS:C320(<>STK_l_PreviousProcess)
											//GOTO XY(4;1)
											//MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(4)"+String(◊STK_l_PreviousProcess))
											DelayTicks(30*60)
											SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
											//While (Not(Test semaphore("GetPrevious"))) & (Not(STK_bo_PreviousSet))
											//`Message("Waiting for semaphore GetPrevious to be true")
											//DelayTicks (10)
											//RESUME PROCESS(◊STK_l_PreviousProcess)
											//End while
											
											CLEAR SEMAPHORE:C144("STK_GetPrevious")
											$_l_Retries:=0
											While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
												//GOTO XY(4;1)
												//MESSAGE("Waiting for semaphore GetPrevious(3)")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*$_l_Retries)
											End while 
											
											
										End if 
										
										$_l_Time:=Current time:C178*1
										$_bo_NoExit:=False:C215
										$_l_DelaysCount:=0
										While (STK_bo_PreviousSet=False:C215) & ($_l_DelaysCount<100)
											//Message("Waiting for Boolean STK_bo_PreviousSet")
											$_l_DelaysCount:=$_l_DelaysCount+1
											DelayTicks(60*$_l_DelaysCount)
											
										End while 
									Until (STK_bo_PreviousSet)
									
									CLEAR SEMAPHORE:C144("PSC"+$_t_PSCProductCode)
									<>STOCK_bo_NoSplit:=False:C215
									If ($_bo_NoExit=False:C215)
										$_bo_Continue:=True:C214
									End if 
									If (STK_l_PreviousMovementID=0)
										Case of 
											: ($_bo_PreTry=True:C214)
												//TRACE
												//GOTO XY(4;1)
												//MESSAGE("Pre-try found no item id;exit")
												
												
												$_bo_PreTry:=False:C215
												$_bo_Exit:=True:C214
												$_bo_NoSplit:=True:C214
												$_bo_NoSuperSplit:=True:C214
											: ($_bo_PriceMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
												$_bo_PriceMatch:=False:C215
												//GOTO XY(5;1)
												//MESSAGE("not price match found")
												
											: ($_bo_DateMatch) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
												$_bo_DateMatch:=False:C215
												$_bo_PriceMatch:=True:C214
												//GOTO XY(5;1)
												//MESSAGE("not date  match found")
												
											: ($_bo_CSIDMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
												$_bo_CSIDMatch:=False:C215
												$_bo_DateMatch:=True:C214
												$_bo_PriceMatch:=True:C214
												//GOTO XY(5;1)
												//MESSAGE("not ID match found")
												
											: ($_bo_NoSplit=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
												$_bo_NoSplit:=False:C215
												$_bo_PriceMatch:=True:C214
												$_bo_DateMatch:=True:C214
												$_bo_CSIDMatch:=True:C214
												//GOTO XY(5;1)
												//MESSAGE("going to test split m")
												
											: ($_bo_NoSuperSplit) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
												
												
												//If (($Filtertomovementtype="ALO") & ($AllocationFirstTry)) | (($OscFIrstTry) & ($Filtertomovementtype="OSC"))
												//actually this should never get here... but dont try super split on these`
												//2nd pass-data match break out
												//Else
												$_bo_NoSuperSplit:=False:C215
												$_bo_NoSplit:=False:C215
												$_bo_PriceMatch:=True:C214
												$_bo_DateMatch:=True:C214
												$_bo_CSIDMatch:=True:C214
												//GOTO XY(5;1)
												//MESSAGE("going to test super split")
												
											Else 
												//all are false and we tried spliting
												If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													//TRACE
													//GOTO XY(5;1)
													//MESSAGE("no match exit")
													
													$_bo_Exit:=True:C214
												Else 
													//GOTO XY(5;1)
													//MESSAGE("no match exit")
													
													$_bo_Exit:=True:C214
												End if 
										End case 
									Else 
										If ($_bo_PreTry)
											//GOTO XY(5;1)
											//MESSAGE("Pre try success")
											
											If (STK_l_PreviousMovementID=-9999)
												//TRACE
												STK_l_PreviousMovementID:=0
												$_bo_Exit:=True:C214
											End if 
											$_bo_PreTry:=False:C215
											$_bo_NoSplit:=True:C214
											$_bo_NoSuperSplit:=True:C214
										Else 
											If (STK_l_PreviousMovementID=-9999)
												STK_l_PreviousMovementID:=0
												//GOTO XY(5;1)
												//MESSAGE("no records exit")
												
											End if 
											$_bo_Exit:=True:C214
										End if 
									End if 
								Until ($_bo_Continue)
								
							Until ($_bo_Exit)
							[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47:=STK_l_PreviousMovementID
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
							If ([STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47=0)
								[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47:=-1
							End if 
							
							
						End if 
						
						
						
					End if 
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
				End if 
		End case 
	End if 
	If ($_l_RecordsIndex<$_l_RecordsinSelection)
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End if 
End for 
ERR_MethodTrackerReturn("STK_ISHC_GetParent"; $_t_oldMethodName)
