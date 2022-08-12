//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_StockItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2011 12:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; <>SYS_bo_QuitCalled; $_bo_Delete; $_bo_OK; $0; CSStockLevelCompleted; DB_bo_NotFound)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_Giveup; $_l_Process; $_l_recordsinselectionStockLevel; $_l_StockItemID)
	C_REAL:C285($_r_StockItemQuantity; $_r_StockItemResidualQuantity; $_r_TakeFromCSID; CSStockLevelID)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ProcessName)
	C_TIME:C306($_ti_Cuttof)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_StockItems")
$0:=False:C215
Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Linkitem1")
		STOCK_UpdateItemCT([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9)
		$0:=True:C214
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCS")
		
		$_l_Giveup:=0
		If ([PROCESSES_TO_HANDLE:115]Data1Longint:8>0)
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			Repeat   //dont do anything till the record exists... its still being created
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=[PROCESSES_TO_HANDLE:115]Data1Longint:8)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					$_bo_OK:=False:C215  //Test semaphore("NoINDEXING")  `This semaphore is set if we are in a transaction. dont give up if there is a transaction still runningx
					
					DelayTicks(4)
					If (Not:C34($_bo_OK))
						$_l_Giveup:=$_l_Giveup+1
					End if 
				End if 
			Until ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0) | (<>SYS_bo_QuitCalled) | ($_l_Giveup>100))
			
			If ($_l_Giveup<100)
				$_l_Giveup:=0
				
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Giveup<100)
					
					DelayTicks(4)
				End while 
				If ($_l_Giveup<100)
					//note we are now at the record that was changed which causes another record to need updating.
					//now move to the record to update
					$_l_Giveup:=0
					Repeat   //dont do anything till the record exists... its still being created
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=[PROCESSES_TO_HANDLE:115]Data2Longint:9)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							$_l_Giveup:=100
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=[PROCESSES_TO_HANDLE:115]Data1Longint:8)
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							[PROCESSES_TO_HANDLE:115]Data2Longint:9:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
							SAVE RECORD:C53([PROCESSES_TO_HANDLE:115])
							
						End if 
					Until ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0) | (<>SYS_bo_QuitCalled) | ($_l_Giveup>100))
					If ($_l_Giveup<100)
						$_l_Giveup:=0
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
							
							DelayTicks(4)
						End while 
						If ($_l_Giveup<100)
							If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
								If (STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
									$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									$_r_StockItemQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_r_StockItemResidualQuantity:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
									$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_r_TakeFromCSID:=([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
									UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
									//TRACE
									STK_UpdateCalledOffQuantity([PROCESSES_TO_HANDLE:115]Data2Longint:9)
									If ($_r_StockItemResidualQuantity#[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37) | ($_l_AddToCurrentStockID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) | ($_r_TakeFromCSID#([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))
										//SAVE RECORD([STOCK ITEMS])  `avoid a recursive call
										//When we save a stock item this will affect the current stock
										If ($_l_AddToCurrentStockID>0)
											LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
											ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
										End if 
										If ($_r_TakeFromCSID>0)
											LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
											ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
										End if 
									End if 
								End if 
								
							End if 
							UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
							$0:=True:C214
						Else 
							DB_bo_NotFound:=True:C214
							$0:=False:C215
							
						End if 
					Else 
						
						//did not process it
						DB_bo_NotFound:=True:C214
						$0:=False:C215
						
					End if 
				Else 
					//dont process it because its locked move on
					DB_bo_NotFound:=True:C214
					$0:=False:C215
				End if 
				
				
			Else 
				//did not process it
				$_bo_Delete:=False:C215
				If ([PROCESSES_TO_HANDLE:115]DateCreated:4=Current date:C33(*))
					$_ti_Cuttof:=(Current time:C178*1)-(60*60)
					If ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_Cuttof)
						$_bo_Delete:=True:C214
					End if 
				Else 
					If (Current time:C178>?01:00:00?)
						$_bo_Delete:=True:C214
					End if 
				End if 
				If ($_bo_Delete)
					DB_bo_NotFound:=False:C215
					$0:=False:C215
				Else 
					DB_bo_NotFound:=True:C214
					$0:=False:C215
				End if 
				
			End if 
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		Else 
			//its a dud so its processesed
			$0:=True:C214
			
			
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCurrentStock") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCurrentSt")  //& (False)"
		
		
		
		//note that there is a similare call in process service current stock except this one here is controlled by the creaion of the stock item record
		//this is going to update the current stock records
		$_l_Giveup:=0
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		READ ONLY:C145([CURRENT_STOCK:62])
		If ([PROCESSES_TO_HANDLE:115]RecordNumber:7>0)
			Repeat   //dont do anything till the record exists... its still being created
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					$_bo_OK:=False:C215  // semaphore("NoINDEXING")
					
					DelayTicks(20)
					If (Not:C34($_bo_OK))
						$_l_Giveup:=$_l_Giveup+1
					End if 
				End if 
			Until ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0) | (<>SYS_bo_QuitCalled) | ($_l_Giveup>100))
			If ($_l_Giveup<100)
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(4)
				End while 
				$_l_Giveup:=0
				If ([PROCESSES_TO_HANDLE:115]Data2Longint:9>0)
					Repeat   //dont do anything till the record exists... its still being created
						
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[PROCESSES_TO_HANDLE:115]Data2Longint:9)
						If (Records in selection:C76([CURRENT_STOCK:62])=0)
							$_bo_OK:=False:C215  //Test semaphore("NoINDEXING")
							
							DelayTicks(4)
							If (Not:C34($_bo_OK))
								$_l_Giveup:=$_l_Giveup+1
							End if 
						End if 
					Until ((Records in selection:C76([CURRENT_STOCK:62])>0) | (<>SYS_bo_QuitCalled) | ($_l_Giveup>100))
					If ($_l_Giveup<100)
						While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
							DelayTicks(4)
						End while 
						If ([CURRENT_STOCK:62]Product_Code:1#"")
							If (STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1))
								//TRACE
								//we are not editing the stock item but we dont want to edit the current stock till the stock item is unloaded
								//When we save a stock item this will affect the current stock
								//TRACE
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								
								STK_UpdateCurrentStock2011([PROCESSES_TO_HANDLE:115]Data2Longint:9)
								SAVE RECORD:C53([CURRENT_STOCK:62])
								If ([CURRENT_STOCK:62]x_Stock_Level_ID:15>0)
									QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
									If ([STOCK_LEVELS:58]Product_Code:1#[CURRENT_STOCK:62]Product_Code:1) | ([STOCK_LEVELS:58]Stock_Type:2#[CURRENT_STOCK:62]Stock_Type:3)
										[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
									End if 
								End if 
							End if 
						End if 
					End if 
					If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
						READ WRITE:C146([CURRENT_STOCK:62])
						LOAD RECORD:C52([CURRENT_STOCK:62])
						
						While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
							
							DelayTicks(2)
						End while 
						READ ONLY:C145([STOCK_LEVELS:58])
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
						If (<>StockAnal)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
						End if 
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
						
						$_l_recordsinselectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
						
						If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
							
							If ($_l_recordsinselectionStockLevel>0)
								If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
									If ($_l_recordsinselectionStockLevel=1)
										If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
											REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
										End if 
									Else 
										QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
										QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
									End if 
								Else 
									If ($_l_recordsinselectionStockLevel=1)
										If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
											REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
										End if 
									Else 
										QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
									End if 
								End if 
								$_l_recordsinselectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
							End if 
						End if 
						$_l_recordsinselectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
						If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
							
							If ($_l_recordsinselectionStockLevel>0)
								If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
									If ($_l_recordsinselectionStockLevel=1)
										If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
											REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
										End if 
									Else 
										QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
										QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
									End if 
								Else 
									If ($_l_recordsinselectionStockLevel=1)
										If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
											REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
										End if 
									Else 
										QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
									End if 
								End if 
								$_l_recordsinselectionStockLevel:=Records in selection:C76([STOCK_LEVELS:58])
							End if 
						End if 
						If (Records in selection:C76([STOCK_LEVELS:58])=0)
							
							CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
							CSStockLevelCompleted:=False:C215
							$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
							
							UNLOAD RECORD:C212([CURRENT_STOCK:62])
							PAUSE PROCESS:C319(Current process:C322)
							
							
							
							While (Process state:C330($_l_Process)>=0) & ($_l_Process>0)
								If (Not:C34(CSStockLevelCompleted))
									$_t_ProcessName:=Process_Name($_l_Process)
									
									If ($_t_ProcessName="Create New Stock Level Record")
										DelayTicks(30*60)
									Else 
										$_l_Process:=0
									End if 
								Else 
								End if 
							End while 
							LOAD RECORD:C52([CURRENT_STOCK:62])
							
							//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
							ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
							
						Else 
							[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
							ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
							UNLOAD RECORD:C212([STOCK_LEVELS:58])
							
							
						End if 
						CLEAR SEMAPHORE:C144("StockLevel"+[CURRENT_STOCK:62]Product_Code:1)
					Else 
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
						ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
						
					End if 
					SAVE RECORD:C53([CURRENT_STOCK:62])  //use this to avoid a recursive call
					
					
					$0:=True:C214
				Else 
					$_bo_Delete:=False:C215
					If ([PROCESSES_TO_HANDLE:115]DateCreated:4=Current date:C33(*))
						$_ti_Cuttof:=(Current time:C178*1)-(60*60)
						If ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_Cuttof)
							$_bo_Delete:=True:C214
						End if 
					Else 
						If (Current time:C178>?01:00:00?)
							$_bo_Delete:=True:C214
						End if 
					End if 
					If ($_bo_Delete)
						DB_bo_NotFound:=False:C215
						$0:=False:C215
					Else 
						DB_bo_NotFound:=True:C214
						$0:=False:C215
					End if 
				End if 
			Else 
				$0:=True:C214
			End if 
		End if 
	Else 
		$_bo_Delete:=False:C215
		If ([PROCESSES_TO_HANDLE:115]DateCreated:4=Current date:C33(*))
			$_ti_Cuttof:=(Current time:C178*1)-(60*60)
			If ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_Cuttof)
				$_bo_Delete:=True:C214
			End if 
		Else 
			If (Current time:C178>?01:00:00?)
				$_bo_Delete:=True:C214
			End if 
		End if 
		If ($_bo_Delete)
			DB_bo_NotFound:=False:C215
			$0:=False:C215
		Else 
			DB_bo_NotFound:=True:C214
			$0:=False:C215
		End if 
		
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		
End case 
ERR_MethodTrackerReturn("ProcessService_StockItems"; $_t_oldMethodName)
