//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PseudoTrigger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/05/2012 09:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrentStocktoUpdate; 0)
	ARRAY LONGINT:C221($_al_ModifiedLineIDS; 0)
	ARRAY LONGINT:C221($_al_ModifiedLineIDS2; 0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	ARRAY TEXT:C222($_at_ProcessServicesCalledAlread; 0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>SYS_bo_QuitCalled; $_bo_AlertTimes; $_bo_allocationLog; $_bo_DeferValidation; $_bo_Edits; $_bo_Editss; $_bo_FirstSave; $_bo_inTransaction; $_bo_IsAllocation; $_bo_IsAnalysed)
	C_BOOLEAN:C305($_bo_IsNewRecord; $_bo_isStockReceipt; $_bo_isUnallocation; $_bo_ProcessVisible; $_bo_ReadOnlyState; $_bo_ReloadSelection; $_bo_Unload; $_bo_UseOnlyAllocated; $_bo_UseOnlyFree; DB_bo_IgnoreProductStatus; DB_bo_UsedArrayInited)
	C_BOOLEAN:C305(DB_bo_VerboseMessaging; STK_bo_DeferValidation; STK_bo_inTransaction; STK_bo_LineTrackerActive; STK_bo_isAllocation; STK_bo_isUnallocation; STK_bo_UseOnlyAllocated)
	C_DATE:C307($_d_HeaderDate; STK_d_pTakeFrommaxHeaderDate)
	C_LONGINT:C283(<>STK_l_PSProcessID; $_l_AddToCSID; $_l_CopiedFromID; $_l_CountProcesses; $_l_CurrentStockindex; $_l_GetCurrentStockProcess; $_l_IncomingSelectedRecord; $_l_MovementItemIndex; $_l_MovementItemsCount; $_l_ProcessIndex; $_l_ProcessIndextime)
	C_LONGINT:C283($_l_ProcessOrigin; $_l_ProcessState; $_l_RecordNumber; $_l_Retries; $_l_RunningProcessCheck; $_l_SelectedMovementItemRecord; $_l_SelectedMovementItemRecordef; $_l_SelectedRecordNumber; $_l_SelectedRecordNumberRecordNu; $_l_StockLevelIDOLD; $_l_TakeFromCSID)
	C_LONGINT:C283($_l_UniqueProcessID; $_l_ValidationProcess; $_l_ZeroLongint; STK_l_pCallBackProcess; STK_l_pCopiedFromID; STK_l_pNotFromSIID; STK_l_pTakeFromCSID; STK_l_pTakeFromItemID; STK_l_SpeedTest; vadd)
	C_REAL:C285($_r_CostPrice; $_r_Milliseconds; $_r_Time2; $_r_TimeTaken; $_r_ZeroReal; $1; $2; STK_r_pTakeFromCostPrice; STK_r_pTakeQuantity)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_MovementCode; $_t_oldMethodName; $_t_ProcessName; STK_t_pProductCode; STK_t_pTakeFromAnalysis; STK_t_pTakeFromCurrency; STK_t_pTakeFromLayer; STK_t_pTakeFromStockType)
	C_TIME:C306($_ti_POTime)
End if 

//Code Starts Here

//C_LONGINT($2)
$_t_oldMethodName:=ERR_MethodTracker("DB_PseudoTrigger")
$_bo_IsNewRecord:=($1=-3)

If (Current user:C182="Designer") | (Gen_Option)
	DB_bo_VerboseMessaging:=False:C215
Else 
	DB_bo_VerboseMessaging:=False:C215
End if 
If (STK_l_SpeedTest=0)
	STK_l_SpeedTest:=10000
End if 
Case of 
	: ($2=Table:C252(->[COMPANIES:2]))
		
	: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_bo_allocationLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)
		
		$_r_Milliseconds:=Milliseconds:C459
		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENTS:40])
		If ($_l_RecordNumber#-1)
			If ([STOCK_MOVEMENTS:40]Type_Number:4#"*TBA") & ([STOCK_MOVEMENTS:40]Movement_Code:1#"*T@")
				$_bo_FirstSave:=False:C215
				$_bo_FirstSave:=(Old:C35([STOCK_MOVEMENTS:40]Type_Number:4)="*TBA")
				$_t_ProcessName:=Process_Name(Current process:C322)
				$_bo_DeferValidation:=STK_bo_DeferValidation
				STK_bo_DeferValidation:=False:C215
				$_bo_inTransaction:=STK_bo_inTransaction
				If ($_t_ProcessName="Validate_Movement@") | (Not:C34($_bo_DeferValidation))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
					
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					End if 
					$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
					$_bo_isUnallocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
					$_bo_isStockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
					$_bo_UseOnlyAllocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
					$_bo_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$stockItems")
					$_l_MovementItemsCount:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					ARRAY LONGINT:C221($_al_CurrentStocktoUpdate; 0)
					ARRAY LONGINT:C221($_al_ModifiedLineIDS2; 0)
					If (STK_bo_LineTrackerActive) & (vadd=0)
						COPY ARRAY:C226(STK_al_ModifiedLineIDS; $_al_ModifiedLineIDS)
						COPY ARRAY:C226($_al_ModifiedLineIDS; $_al_ModifiedLineIDS2)
					Else 
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ModifiedLineIDS)
					End if 
					If ($_bo_FirstSave) | (DB_bo_VerboseMessaging)
						Open window:C153((Screen width:C187/2)-200; (Screen height:C188/2)-100; (Screen width:C187/2)+200; (Screen height:C188/2)+100; Palette window:K34:3)
					End if 
					$_bo_AlertTimes:=False:C215
					$_ti_POTime:=Current time:C178
					//TRACE
					If ($_bo_allocationLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Process Stock Movement Items start="+String:C10(Current time:C178)
					End if 
					For ($_l_MovementItemIndex; 1; $_l_MovementItemsCount)
						USE NAMED SELECTION:C332("$stockItems")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_MovementItemIndex)
						ARRAY TEXT:C222($_at_ProcessServicesCalledAlread; 0)
						If ($_bo_FirstSave) | (DB_bo_VerboseMessaging)
							GOTO XY:C161(0; 0)
							MESSAGE:C88("Verifying Stock item "+String:C10($_l_MovementItemIndex)+" of "+String:C10($_l_MovementItemsCount))
						End if 
						If ($_bo_allocationLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Verifying Stock item "+String:C10($_l_MovementItemIndex)+" of "+String:C10($_l_MovementItemsCount)+"="+String:C10(Current time:C178)
						End if 
						$_l_SelectedMovementItemRecordef:=Find in array:C230($_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						$_l_SelectedMovementItemRecordef:=Find in array:C230($_al_ModifiedLineIDS2; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						$_bo_Edits:=False:C215
						If ($_l_SelectedMovementItemRecordef>0)
							If (([MOVEMENT_TYPES:60]Delivery_Type:12) & ([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6=!00-00-00!)) | (([MOVEMENT_TYPES:60]UseForStockReceipt:33) & ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5=!00-00-00!))
								$_bo_Edits:=False:C215
								If ([MOVEMENT_TYPES:60]Delivery_Type:12) & ([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6=!00-00-00!)
									[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6:=[STOCK_MOVEMENTS:40]Posted_Date:7
									$_bo_Edits:=True:C214
								End if 
								If ([MOVEMENT_TYPES:60]UseForStockReceipt:33) & ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5=!00-00-00!)
									[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=[STOCK_MOVEMENTS:40]Posted_Date:7
									$_bo_Edits:=True:C214
								End if 
							End if 
							If (([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)) | (($_bo_isUnallocation) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)) | (($_bo_isUnallocation) & ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)) | (($_bo_IsAllocation) & ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)) | (([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)) & (Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)#"")) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="") | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="") | ($_l_SelectedMovementItemRecordef>0) | (([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & (Not:C34(STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32))))
								$_l_Retries:=0
								While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
									If ($_bo_allocationLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock Item Locked Tries"+"="+String:C10($_l_Retries)+" "+String:C10(Current time:C178)
									End if 
									If (DB_bo_VerboseMessaging)
										GOTO XY:C161(0; 0)
										MESSAGE:C88("Waiting for record unlocked current stock"+String:C10($_l_Retries))
									End if 
									$_l_Retries:=$_l_Retries+1
									DelayTicks(60*$_l_Retries)
								End while 
								$_l_AddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
								$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
								// the following lines prevent any scenaraio that has changed the stock movement ty
								// those lines will be faulty and need fixing
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)  // something has changed the movement type..so change the stock item type
									[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
									$_bo_Edits:=True:C214
									If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>=0)
										If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Plus:3)
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Changing add to stock type"+""+String:C10(Current time:C178)
											End if 
											[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
											[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
											$_bo_Edits:=True:C214
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Minus:4)
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Changing take from stock type"+""+String:C10(Current time:C178)
											End if 
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											$_bo_Edits:=True:C214
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Resetting copied from to zero"+""+String:C10(Current time:C178)
											End if 
											$_bo_Edits:=True:C214
										End if 
										
									Else 
										If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Changing add to stock type"+" "+String:C10(Current time:C178)
											End if 
											[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
											[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
											$_bo_Edits:=True:C214
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Changing take from stock type"+" "+String:C10(Current time:C178)
												
											End if 
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											$_bo_Edits:=True:C214
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											If ($_bo_allocationLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Resetting copied from to zero"+""+String:C10(Current time:C178)
												
											End if 
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											$_bo_Edits:=True:C214
										End if 
									End if 
								End if 
								
								// if this is an unallocation type and the [stock items]item number is filled it should be moved to the correct field
								$_bo_Edits:=$_bo_Edits | STK_EditCheckUnallocation($_bo_isUnallocation) | STK_EditCheckAllocation($_bo_IsAllocation)
								
								If ($_bo_allocationLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"allocation/unallocation checked="+String:C10(Current time:C178)
								End if 
								
								
								If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
									
									$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
									$_bo_isUnallocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
									$_bo_isStockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
									$_bo_UseOnlyAllocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
									$_bo_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
									$_l_Retries:=0
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
										If (DB_bo_VerboseMessaging)
											GOTO XY:C161(0; 0)
											MESSAGE:C88("Waiting for record unlocked current stock"+String:C10($_l_Retries))
										End if 
										If ($_bo_allocationLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for record unlocked current stock "+String:C10($_l_Retries)+" "+String:C10(Current time:C178)
										End if 
										$_l_Retries:=$_l_Retries+1
										DelayTicks(60*$_l_Retries)
									End while 
									$_l_AddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
									$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
									$_bo_Edits:=$_bo_Edits | STK_EditCheckMovementType
									
									$_bo_Edits:=$_bo_Edits | STK_SetHeaderInfo
									
									$_bo_Edits:=$_bo_Edits | STK_EditCheckQuantity | STK_EditCheckUnallocation($_bo_isUnallocation) | STK_EditCheckAllocation($_bo_IsAllocation)
									If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & ([STOCK_MOVEMENTS:40]Movement_Code:1#"*T@") & ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
										
										$_bo_Edits:=STK_EditCheckItemIntegrity($_bo_Edits; $_bo_IsAllocation; $_bo_isUnallocation; $_bo_isStockReceipt; $_bo_UseOnlyAllocated; $_bo_UseOnlyFree; $_l_CopiedFromID; $_l_TakeFromCSID; $_l_AddToCSID)
									End if 
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								End if 
								
							End if 
						Else 
							If ($_bo_Edits)
								
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_bo_Edits:=False:C215
								
							End if 
							// NEXT RECORD([STOCK ITEMS])
						End if 
						$_r_Time2:=Milliseconds:C459
						
						
						$_r_TimeTaken:=$_r_Time2-$_r_Milliseconds
						//SEND PACKET($_ti_DocumentRef;"196 "+String($_l_MovementItemIndex)+"-"+String($_r_TimeTaken)+Char(13))
						
						
						If (STK_bo_LineTrackerActive)
							Repeat 
								$_l_SelectedMovementItemRecordef:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								If ($_l_SelectedMovementItemRecordef>0)
									DELETE FROM ARRAY:C228(STK_al_ModifiedLineIDS; $_l_SelectedMovementItemRecordef)
								End if 
							Until ($_l_SelectedMovementItemRecordef<0)
						End if 
						$_r_Time2:=Milliseconds:C459
						
						
						$_r_TimeTaken:=$_r_Time2-$_r_Milliseconds
						//SEND PACKET($_ti_DocumentRef;"198 "+String($_l_MovementItemIndex)+"-"+String($_r_TimeTaken)+Char(13))
						
						
					End for 
					If ($_bo_FirstSave) | (DB_bo_VerboseMessaging)
						CLOSE WINDOW:C154
						
					End if 
					//Close DocUMENT($_ti_DocumentRef)
					
					
					
					If (Size of array:C274($_al_CurrentStocktoUpdate)>0)
						
						// COPY NAMED SELECTION([STOCK ITEMS];"$CSI")
						$_l_SelectedMovementItemRecord:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
						$_bo_ReadOnlyState:=Read only state:C362([CURRENT_STOCK:62])
						COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
						$_l_SelectedRecordNumber:=Selected record number:C246([CURRENT_STOCK:62])
						
						//TRACE
						//READ WRITE([CURRENT STOCK])
						//QUERY WITH ARRAY([CURRENT STOCK]XREC_ID;$_al_CurrentStocktoUpdate)
						MESSAGES OFF:C175
						For ($_l_CurrentStockindex; 1; Size of array:C274($_al_CurrentStocktoUpdate))
							Repeat 
								$_l_RunningProcessCheck:=0
								$_l_CountProcesses:=Count tasks:C335
								For ($_l_ProcessIndex; 1; $_l_CountProcesses)
									PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_ProcessName; $_l_ProcessState; $_l_ProcessIndextime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
									If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
										If ($_l_ProcessState>=0)
											$_l_RunningProcessCheck:=$_l_RunningProcessCheck+1
										End if 
									End if 
								End for 
							Until ($_l_RunningProcessCheck<10)
							
							$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 128000; "ValidateCurrentStock-"+String:C10(Abs:C99($_al_CurrentStocktoUpdate{$_l_CurrentStockindex})); $_al_CurrentStocktoUpdate{$_l_CurrentStockindex}; 0; *)
							
							
						End for 
						//End if
						
						//APPLY TO SELECTION([CURRENT STOCK];STK_UpdateCurrentStock2011 )
						MESSAGES ON:C181
						//UNLOAD RECORD([CURRENT STOCK])
						If ($_bo_ReadOnlyState)
							READ ONLY:C145([CURRENT_STOCK:62])
						End if 
						USE NAMED SELECTION:C332("$TempCS")
						GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedRecordNumber)
						
						USE NAMED SELECTION:C332("$stockItems")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SelectedMovementItemRecord)
					End if 
				Else 
					$_t_MovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
					$_l_ValidationProcess:=New process:C317("ValidateMovement"; 512000; "Validate_Movement_"+$_t_MovementCode; $_t_MovementCode; Current process:C322; $_bo_inTransaction; *)
				End if 
			End if 
		End if 
		//Close DocUMENT($_ti_DocumentRef)
		
		
		
	: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		
		$_bo_ReloadSelection:=False:C215
		DB_bo_VerboseMessaging:=False:C215
		ARRAY TEXT:C222($_at_ProcessServicesCalledAlread; 0)
		
		$_bo_Edits:=False:C215
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
			$_l_SelectedRecordNumberRecordNu:=0
			$_bo_ReloadSelection:=True:C214
			$_l_IncomingSelectedRecord:=0
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$IncomingSelection")
			If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])>=0)
				$_l_IncomingSelectedRecord:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
			End if 
		End if 
		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
		
		If ($_l_RecordNumber#-1)
			
			$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
			
			If ([STOCK_MOVEMENTS:40]Movement_Code:1#"")
				If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11="")
					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
					$_bo_Edits:=True:C214
				End if 
			End if 
			If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11) & ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			End if 
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			End if 
			
			If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
				$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
				$_bo_isUnallocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
				$_bo_isStockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
				$_bo_UseOnlyAllocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
				$_bo_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
				
				
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
					If (DB_bo_VerboseMessaging) | ($_l_Retries>10)
						If (DB_bo_VerboseMessaging)
							GOTO XY:C161(0; 0)
						End if 
						MESSAGE:C88("Waiting for record unlocked current stock"+String:C10($_l_Retries))
					End if 
					$_l_Retries:=$_l_Retries+1
					DelayTicks(60*$_l_Retries)
				End while 
				$_l_AddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
				$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
				$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				
				$_bo_Edits:=$_bo_Edits | STK_EditCheckMovementType
				
				$_bo_Edits:=$_bo_Edits | STK_SetHeaderInfo
				
				
				$_bo_Edits:=$_bo_Edits | STK_EditCheckQuantity | STK_EditCheckUnallocation($_bo_isUnallocation) | STK_EditCheckAllocation($_bo_IsAllocation)
				
				If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & ([STOCK_MOVEMENTS:40]Movement_Code:1#"*T@") & ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
					
					
					$_bo_Edits:=STK_EditCheckItemIntegrity($_bo_Edits; $_bo_IsAllocation; $_bo_isUnallocation; $_bo_isStockReceipt; $_bo_UseOnlyAllocated; $_bo_UseOnlyFree; $_l_CopiedFromID; $_l_TakeFromCSID; $_l_AddToCSID)
				End if 
			End if 
		End if 
		
		If ($_bo_ReloadSelection)
			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			USE NAMED SELECTION:C332("$IncomingSelection")
			If ($_l_IncomingSelectedRecord>0)
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_IncomingSelectedRecord)
			End if 
		End if 
		
		
		
		
	: ($2=Table:C252(->[CURRENT_STOCK:62]))
		
		
		
		$_l_RecordNumber:=Record number:C243([CURRENT_STOCK:62])
		If ($_l_RecordNumber#-1)
			
			$_l_StockLevelIDOLD:=[CURRENT_STOCK:62]x_Stock_Level_ID:15
			If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)  // Note this does not set the stock level just ties this record to it.
				
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
			Else 
				If ([CURRENT_STOCK:62]x_Stock_Level_ID:15>0)
					$_bo_Unload:=False:C215
					If ([STOCK_LEVELS:58]X_ID:10#[CURRENT_STOCK:62]x_Stock_Level_ID:15)
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
						$_bo_Unload:=True:C214
					End if 
					Case of 
						: ([STOCK_LEVELS:58]Product_Code:1#[CURRENT_STOCK:62]Product_Code:1) | ([STOCK_LEVELS:58]Stock_Type:2#[CURRENT_STOCK:62]Stock_Type:3)
							
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
						: ([CURRENT_STOCK:62]Currency_Code:11#"") & ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
							
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
						: ([CURRENT_STOCK:62]Analysis_Code:10#"") & ([STOCK_LEVELS:58]Analysis_Code:7#[CURRENT_STOCK:62]Analysis_Code:10)
							
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
						: ([CURRENT_STOCK:62]Layer_Code:12#"") & ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
							
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
					End case 
					If ($_bo_Unload)
						UNLOAD RECORD:C212([STOCK_LEVELS:58])
					End if 
				End if 
			End if 
			$_bo_IsAnalysed:=STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)
			If ($_bo_IsAnalysed)
				STK_UpdateCurrentStock2011
			End if 
			
		End if 
	: ($2=Table:C252(->[STOCK_LEVELS:58]))
		$_l_RecordNumber:=Record number:C243([STOCK_LEVELS:58])
		If ($_l_RecordNumber#-1)
			$_bo_IsAnalysed:=STK_IsProductAnalysed([STOCK_LEVELS:58]Product_Code:1)
			If ($_bo_IsAnalysed)
				STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10; [STOCK_LEVELS:58]Product_Code:1; [STOCK_LEVELS:58]Stock_Type:2; [STOCK_LEVELS:58]Analysis_Code:7; [STOCK_LEVELS:58]Currency_Code:8; [STOCK_LEVELS:58]Layer_Code:9)
			End if 
		End if 
	: ($2=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		Case of 
			: ([PROCESSES_TO_HANDLE:115]ServiceType:6="create revision") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="AutoAllocate")
				If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[ORDERS:24]))
					[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[ORDERS:24])
					[PROCESSES_TO_HANDLE:115]Status:2:=1
				End if 
				
			: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockLevelsUpdate")
				If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[STOCK_LEVELS:58]))
					[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[STOCK_LEVELS:58])
					[PROCESSES_TO_HANDLE:115]Status:2:=1
				End if 
			: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateStockLevel")
				If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[CURRENT_STOCK:62]))
					[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[CURRENT_STOCK:62])
					[PROCESSES_TO_HANDLE:115]Status:2:=1
				End if 
			: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCS") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCurrentSt@")
				If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
					
					[PROCESSES_TO_HANDLE:115]Status:2:=1
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("DB_PseudoTrigger"; $_t_oldMethodName)