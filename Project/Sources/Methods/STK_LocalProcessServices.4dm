//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_LocalProcessServices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      30/06/2011 18:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_abo_UpChecked;0)
	//ARRAY LONGINT(<>STK_AL_UpCallingProcess;0)
	//ARRAY LONGINT(<>STK_AL_UpstockID;0)
	//ARRAY LONGINT(<>STK_AL_UpStocktable;0)
	//ARRAY LONGINT(STK_al_RecordID;0)
	//ARRAY LONGINT(STK_al_RecordID2;0)
	//ARRAY LONGINT(STK_AL_Stocktable;0)
	//ARRAY LONGINT(STK_AL_Stocktable2;0)
	//ARRAY LONGINT(STK_al_WaitForProcess;0)
	//ARRAY LONGINT(STK_al_WaitForProcess2;0)
	//ARRAY TEXT(<>STK_At_UpCallFUnction;0)
	//ARRAY TEXT(STK_at_CallFunction;0)
	//ARRAY TEXT(STK_at_CallFunction2;0)
	C_BOOLEAN:C305(<>StockAnal; <>SYS_bo_QuitCalled; $_bo_Continue; $_bo_IsTransactionRunning; $_bo_Locked; $_bo_NoTry; $_bo_Reset; CSStockLevelCompleted; STK_bo_SLCreate)
	C_LONGINT:C283($_l_CallingProcess; $_l_CopyIndex; $_l_CSAppend; $_l_CSBusy; $_l_Index; $_l_LastAction; $_l_NoGo; $_l_NotCheckedRow; $_l_Process; $_l_ProcessState; $_l_RecordsinSelectionStockLevel)
	C_LONGINT:C283($_l_Retries; $_l_SizeofArray; STK_l_CALLID)
	C_REAL:C285(CSStockLevelID)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Machine; $_t_oldMethodName; $_t_ProcessName; $_t_user)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STK_LocalProcessServices")
ARRAY TEXT:C222(STK_at_CallFunction; 0)
ARRAY LONGINT:C221(STK_al_WaitForProcess; 0)
ARRAY LONGINT:C221(STK_AL_Stocktable; 0)
ARRAY LONGINT:C221(STK_al_RecordID; 0)
CLEAR SEMAPHORE:C144("$LockCSArrays")
ARRAY TEXT:C222(STK_at_CallFunction2; 0)
ARRAY LONGINT:C221(STK_al_WaitForProcess2; 0)
ARRAY LONGINT:C221(STK_AL_Stocktable2; 0)
ARRAY LONGINT:C221(STK_al_RecordID2; 0)

// While (Semaphore("$LockCSArrays"))
// DelayTicks (1)
// End while
// CLEAR SEMAPHORE("CSBusy")
//<>StkLocalMessage:=""
// Open window(20;100;120;200;-Palette window )
// GOTO XY(0;0)
// MESSAGE("Local posting Process ")
ARRAY BOOLEAN:C223(STK_abo_UpChecked; 0)
Repeat 
	
	$_l_CSBusy:=0
	$_l_CSAppend:=0
	$_l_CSBusy:=0
	$_l_LastAction:=0
	
	// Open window(300;Screen height-200;600;Screen height-100;-Palette window )
	
	$_l_Retries:=0
	While (Semaphore:C143("CSBusy"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(3*$_l_Retries)
	End while 
	// CLOSE WINDOW
	
	
	
	If (Size of array:C274(<>STK_AL_UpStocktable)>0)
		While (Semaphore:C143("L_LockCSArrays"))
			DelayTicks(9)
		End while 
		
		ARRAY BOOLEAN:C223(STK_abo_UpChecked; Size of array:C274(<>STK_AL_UpStocktable))
		$_l_NotCheckedRow:=Find in array:C230(STK_abo_UpChecked; False:C215)  //Not added to this array
		If ($_l_NotCheckedRow>0)
			For ($_l_CopyIndex; $_l_NotCheckedRow; Size of array:C274(<>STK_AL_UpStocktable))
				$_l_CallingProcess:=Abs:C99(<>STK_AL_UpCallingProcess{$_l_CopyIndex})
				APPEND TO ARRAY:C911(STK_at_CallFunction2; <>STK_At_UpCallFUnction{$_l_CopyIndex})
				APPEND TO ARRAY:C911(STK_al_WaitForProcess2; <>STK_AL_UpCallingProcess{$_l_CopyIndex})
				APPEND TO ARRAY:C911(STK_AL_Stocktable2; <>STK_AL_UpStocktable{$_l_CopyIndex})
				APPEND TO ARRAY:C911(STK_al_RecordID2; <>STK_AL_UpstockID{$_l_CopyIndex})
				STK_abo_UpChecked{$_l_CopyIndex}:=True:C214
			End for 
			CLEAR SEMAPHORE:C144("CSBusy")  // extra call here so calling process does not see it as busy and wait longer
			RESUME PROCESS:C320($_l_CallingProcess)
			
			
		End if 
		CLEAR SEMAPHORE:C144("L_LockCSArrays")
	End if 
	CLEAR SEMAPHORE:C144("CSBusy")
	For ($_l_Index; Size of array:C274(STK_at_CallFunction2); 1; -1)
		$_l_Retries:=0
		If (Size of array:C274(<>STK_AL_UpStocktable)#Size of array:C274(STK_abo_UpChecked))
			$_l_Retries:=0
			While (Semaphore:C143("CSBusy"))
				DelayTicks(3*$_l_Retries)
			End while 
			
			While (Semaphore:C143("L_LockCSArrays"))
				DelayTicks(9)
			End while 
			ARRAY BOOLEAN:C223(STK_abo_UpChecked; Size of array:C274(<>STK_AL_UpStocktable))
			$_l_NotCheckedRow:=Find in array:C230(STK_abo_UpChecked; False:C215)  //Not added to this array
			If ($_l_NotCheckedRow>0)
				For ($_l_CopyIndex; $_l_NotCheckedRow; Size of array:C274(<>STK_AL_UpStocktable))
					$_l_CallingProcess:=Abs:C99(<>STK_AL_UpCallingProcess{$_l_CopyIndex})
					APPEND TO ARRAY:C911(STK_at_CallFunction2; <>STK_At_UpCallFUnction{$_l_CopyIndex})
					APPEND TO ARRAY:C911(STK_al_WaitForProcess2; <>STK_AL_UpCallingProcess{$_l_CopyIndex})
					APPEND TO ARRAY:C911(STK_AL_Stocktable2; <>STK_AL_UpStocktable{$_l_CopyIndex})
					APPEND TO ARRAY:C911(STK_al_RecordID2; <>STK_AL_UpstockID{$_l_CopyIndex})
					STK_abo_UpChecked{$_l_CopyIndex}:=True:C214
				End for 
				CLEAR SEMAPHORE:C144("CSBusy")  // extra call here so calling process does not see it as busy and wait longer
				If ($_l_CallingProcess>0)
					RESUME PROCESS:C320($_l_CallingProcess)
				End if 
				
			End if 
			CLEAR SEMAPHORE:C144("L_LockCSArrays")
			CLEAR SEMAPHORE:C144("CSBusy")
		End if 
		$_bo_Reset:=False:C215
		If ($_l_Index>0)
			If (STK_at_CallFunction2{$_l_Index}#"")
				$_bo_IsTransactionRunning:=Test semaphore:C652("NoINDEXING")
				If (Not:C34($_bo_IsTransactionRunning))
					$_bo_Continue:=True:C214
				Else 
					$_bo_Continue:=False:C215
					If (STK_al_WaitForProcess2{$_l_Index}<0)  //only wait if the process was inside a transaction
						$_l_ProcessState:=Process state:C330(Abs:C99(STK_al_WaitForProcess2{$_l_Index}))
						If ($_l_ProcessState<0)
							$_bo_Continue:=True:C214
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
				End if 
				If ($_bo_Continue)
					Case of 
						: (STK_at_CallFunction2{$_l_Index}="StockUpdateCS")
							READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])  //   `` why does this need to be RW?-now setting it to read only!!
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_RecordID2{$_l_Index})
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								$_l_NoGo:=0
								$_bo_NoTry:=False:C215
								$_bo_Locked:=Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 2))
								If ($_bo_Locked)
									$_bo_NoTry:=True:C214
								End if 
								If (Not:C34($_bo_NoTry))
									
									If (STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
										
										$_l_Process:=New process:C317("STK_UpdateCalledOffQuantity"; 128000; "Update Called off"; (STK_al_RecordID2{$_l_Index}))
										
										
										APPEND TO ARRAY:C911(STK_at_CallFunction2; "StockUpdateCurrentStock")
										APPEND TO ARRAY:C911(STK_al_WaitForProcess2; 0)
										APPEND TO ARRAY:C911(STK_AL_Stocktable2; Table:C252(->[CURRENT_STOCK:62]))
										APPEND TO ARRAY:C911(STK_al_RecordID2; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
										
										APPEND TO ARRAY:C911(STK_at_CallFunction2; "StockUpdateCurrentStock")
										APPEND TO ARRAY:C911(STK_al_WaitForProcess2; 0)
										APPEND TO ARRAY:C911(STK_AL_Stocktable2; Table:C252(->[CURRENT_STOCK:62]))
										APPEND TO ARRAY:C911(STK_al_RecordID2; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
										$_bo_Reset:=True:C214
										
									End if 
								End if 
							End if 
							UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
						: (STK_at_CallFunction2{$_l_Index}="StockUpdateCurrentStock")
							$_l_NoGo:=0
							$_bo_NoTry:=False:C215
							READ WRITE:C146([CURRENT_STOCK:62])
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=STK_al_RecordID2{$_l_Index})
							If (Records in selection:C76([CURRENT_STOCK:62])=1)
								$_l_NoGo:=0
								$_bo_NoTry:=False:C215
								
								$_bo_Locked:=Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 2))
								If ($_bo_Locked)
									$_bo_NoTry:=True:C214
								End if 
								If (Not:C34($_bo_NoTry))
									If (STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1))
										
										STK_UpdateCurrentStock2011  // (STK_al_RecordID2{$_l_Index})
										SAVE RECORD:C53([CURRENT_STOCK:62])
										If ([CURRENT_STOCK:62]x_Stock_Level_ID:15>0)
											QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
											If ([STOCK_LEVELS:58]Product_Code:1#[CURRENT_STOCK:62]Product_Code:1) | ([STOCK_LEVELS:58]Stock_Type:2#[CURRENT_STOCK:62]Stock_Type:3)
												[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
											End if 
										End if 
										If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
											READ WRITE:C146([CURRENT_STOCK:62])
											LOAD RECORD:C52([CURRENT_STOCK:62])
											//Open window(300;Screen height-200;600;Screen height-100;-Palette window )
											$_l_Retries:=0
											While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2+$_l_Retries)
											End while 
											
											READ ONLY:C145([STOCK_LEVELS:58])
											QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
											If (<>StockAnal)
												QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
											End if 
											QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
											
											$_l_RecordsinSelectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
											
											If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
												If ($_l_RecordsinSelectionStockLevel>0)
													If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
														If ($_l_RecordsinSelectionStockLevel=1)
															If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
																REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
															End if 
														Else 
															QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
															QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
														End if 
													Else 
														If ($_l_RecordsinSelectionStockLevel=1)
															If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
																REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
															End if 
														Else 
															QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
														End if 
													End if 
													$_l_RecordsinSelectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
												End if 
											End if 
											$_l_RecordsinSelectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
											If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
												If ($_l_RecordsinSelectionStockLevel>0)
													If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
														If ($_l_RecordsinSelectionStockLevel=1)
															If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
																REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
															End if 
														Else 
															QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
															QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
														End if 
													Else 
														If ($_l_RecordsinSelectionStockLevel=1)
															If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
																REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
															End if 
														Else 
															QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
														End if 
													End if 
													$_l_RecordsinSelectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
												End if 
											End if 
											If (Records in selection:C76([STOCK_LEVELS:58])=0)
												CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
												CSStockLevelCompleted:=False:C215
												$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
												UNLOAD RECORD:C212([CURRENT_STOCK:62])
												PAUSE PROCESS:C319(Current process:C322)
												$_l_Retries:=0
												While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
													If (Not:C34(CSStockLevelCompleted))
														$_t_ProcessName:=Process_Name($_l_Process)
														If ($_t_ProcessName="Create New Stock Level Record")
															$_l_Retries:=$_l_Retries+1
															DelayTicks(($_l_Retries+3)*60)
															//PAUSE PROCESS
														Else 
															$_l_Process:=0
														End if 
													Else 
														SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
													End if 
												End while 
												//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
												[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
												SAVE RECORD:C53([CURRENT_STOCK:62])
												APPEND TO ARRAY:C911(STK_at_CallFunction2; "UpdateStockLevel")
												APPEND TO ARRAY:C911(STK_al_WaitForProcess2; 0)
												APPEND TO ARRAY:C911(STK_AL_Stocktable2; Table:C252(->[STOCK_LEVELS:58]))
												APPEND TO ARRAY:C911(STK_al_RecordID2; [CURRENT_STOCK:62]x_Stock_Level_ID:15)
												$_bo_Reset:=True:C214
												
											Else 
												[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
												SAVE RECORD:C53([CURRENT_STOCK:62])
												
												APPEND TO ARRAY:C911(STK_at_CallFunction2; "UpdateStockLevel")
												APPEND TO ARRAY:C911(STK_al_WaitForProcess2; 0)
												APPEND TO ARRAY:C911(STK_AL_Stocktable2; Table:C252(->[STOCK_LEVELS:58]))
												APPEND TO ARRAY:C911(STK_al_RecordID2; [CURRENT_STOCK:62]x_Stock_Level_ID:15)
												$_bo_Reset:=True:C214
												
											End if 
											CLEAR SEMAPHORE:C144("StockLevel"+[CURRENT_STOCK:62]Product_Code:1)
										Else 
											
											APPEND TO ARRAY:C911(STK_at_CallFunction2; "UpdateStockLevel")
											APPEND TO ARRAY:C911(STK_al_WaitForProcess2; 0)
											APPEND TO ARRAY:C911(STK_AL_Stocktable2; Table:C252(->[STOCK_LEVELS:58]))
											APPEND TO ARRAY:C911(STK_al_RecordID2; [CURRENT_STOCK:62]x_Stock_Level_ID:15)
											$_bo_Reset:=True:C214
										End if 
										SAVE RECORD:C53([CURRENT_STOCK:62])  //use this to avoid a recursive call
										
										
									End if 
								End if 
							End if 
							UNLOAD RECORD:C212([CURRENT_STOCK:62])
							
							
						: (STK_at_CallFunction2{$_l_Index}="UpdateStockLevel") | (STK_at_CallFunction2{$_l_Index}="StockLevelsUpdate")
							READ WRITE:C146([STOCK_LEVELS:58])
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=STK_al_RecordID2{$_l_Index})
							$_l_NoGo:=0
							$_bo_NoTry:=False:C215
							$_bo_Locked:=Not:C34(Check_Locked(->[STOCK_LEVELS:58]; 2))
							
							If ($_bo_Locked)
								$_bo_NoTry:=True:C214
							End if 
							If (Not:C34($_bo_NoTry))
								STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10; [STOCK_LEVELS:58]Product_Code:1; [STOCK_LEVELS:58]Stock_Type:2; [STOCK_LEVELS:58]Analysis_Code:7; [STOCK_LEVELS:58]Currency_Code:8; [STOCK_LEVELS:58]Layer_Code:9)
							End if 
							UNLOAD RECORD:C212([STOCK_LEVELS:58])
							
							
							
					End case 
					If (Not:C34($_bo_NoTry)) & ($_l_Index>0)
						DELETE FROM ARRAY:C228(STK_at_CallFunction2; $_l_Index)
						
						DELETE FROM ARRAY:C228(STK_al_WaitForProcess2; $_l_Index)
						DELETE FROM ARRAY:C228(STK_AL_Stocktable2; $_l_Index)
						DELETE FROM ARRAY:C228(STK_al_RecordID2; $_l_Index)
					End if 
					$_bo_NoTry:=False:C215
				Else 
					DelayTicks(30)
					
				End if 
			End if 
			
			If ($_bo_Reset)
				$_l_Index:=0
			Else 
				DelayTicks(30)
			End if 
			$_bo_Reset:=False:C215
		End if 
		
	End for 
	If (Size of array:C274(STK_at_CallFunction2)=0)
		$_l_Retries:=0
		While (Semaphore:C143("CSBusy"))
			DelayTicks(3*$_l_Retries)
		End while 
		While (Semaphore:C143("L_LockCSArrays"))
			DelayTicks(9)
		End while 
		
		If (Size of array:C274(<>STK_AL_UpStocktable)=Size of array:C274(STK_abo_UpChecked))
			//Nothing has been added so we are in an 'idle' situation
			ARRAY BOOLEAN:C223(STK_abo_UpChecked; Size of array:C274(<>STK_AL_UpStocktable))
			$_l_SizeofArray:=Size of array:C274(STK_abo_UpChecked)
			If ($_l_SizeofArray>0)
				For ($_l_Index; $_l_SizeofArray; 1; -1)
					If (STK_abo_UpChecked{$_l_Index})
						DELETE FROM ARRAY:C228(<>STK_At_UpCallFUnction; $_l_Index)
						DELETE FROM ARRAY:C228(<>STK_AL_UpCallingProcess; $_l_Index)
						DELETE FROM ARRAY:C228(<>STK_AL_UpStocktable; $_l_Index)
						DELETE FROM ARRAY:C228(<>STK_AL_UpstockID; $_l_Index)
						DELETE FROM ARRAY:C228(STK_abo_UpChecked; $_l_Index)
					End if 
				End for 
			End if 
			
			ARRAY TEXT:C222(STK_at_CallFunction2; 0)
			ARRAY LONGINT:C221(STK_al_WaitForProcess2; 0)
			ARRAY LONGINT:C221(STK_AL_Stocktable2; 0)
			ARRAY LONGINT:C221(STK_al_RecordID2; 0)
			
		End if 
		CLEAR SEMAPHORE:C144("L_LockCSArrays")
		CLEAR SEMAPHORE:C144("CSBusy")
		PAUSE PROCESS:C319(Current process:C322)
	Else 
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			//GOTO XY(0;0)
			//MESSAGE("Idling")
			DelayTicks(60)
			
		End if 
	End if 
	
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("STK_LocalProcessServices"; $_t_oldMethodName)
