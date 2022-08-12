//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_Watcher
	//------------------ Method Notes ------------------
	//the purpose of this method is to replace Process Services for stock  movement items
	//the way this will work is that this will look for modified stock movement items.
	//it will update the called from stock movement item(which in turn would then get updated so it would get looked at)
	//the add to and take from current stock records and therefore the stock level records
	// /the reason for replacing the complex code i have currently is that we are getting problems with inside and outside a transaction.
	//this method will NEVER change the residual stock quantity on the record updated only on its parents this is to allow manipulation inside a transaction
	//in the transaction we might alter a parent residual quantity and then the process service
	//runs gets the called of quantity(before the transaction is done) and that alters the residual)quanity back to what it was
	//TRACE
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2015 14:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AddToCurrentStock2IDS; 0)
	ARRAY LONGINT:C221($_al_AddToCurrentStockIDS; 0)
	ARRAY LONGINT:C221($_al_CheckAllocationCSIDS; 0)
	ARRAY LONGINT:C221($_al_CheckAllocations; 0)
	ARRAY LONGINT:C221($_al_CheckThisTime; 0)
	ARRAY LONGINT:C221($_al_CopiedFromIDS; 0)
	ARRAY LONGINT:C221($_al_CopiedFromIDS2; 0)
	ARRAY LONGINT:C221($_al_ModifiedItemIDS; 0)
	ARRAY LONGINT:C221($_al_StockItemsChecked; 0)
	ARRAY LONGINT:C221($_al_StockItemsCheckedStamps; 0)
	ARRAY LONGINT:C221($_al_TakeFromCurrentStockIDS; 0)
	ARRAY LONGINT:C221($_al_TakenFromCSIDs; 0)
	ARRAY LONGINT:C221($_al_TakenFromCSIDS2; 0)
	C_BOOLEAN:C305(<>STK_bo_CHeckWhatisHappening; <>SYS_bo_QuitCalled; $_bo_TestThis)
	C_LONGINT:C283($_l_AddtoCurrentStockID; $_l_CSIDROw; $_l_CurrentStockIDIndex; $_l_LastStamp; $_l_LastStampOLD; $_l_ModifiedItemsIndex; $_l_StockItemRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_Watcher")

ARRAY LONGINT:C221($_al_StockItemsChecked; 0)
ARRAY LONGINT:C221($_al_StockItemsCheckedStamps; 0)
If (Current time:C178>?01:00:00?)
	$_l_LastStamp:=GEN_TimeDateStamp(Current date:C33; ?00:00:00?)
Else 
	$_l_LastStamp:=GEN_TimeDateStamp(Current date:C33-1; ?00:00:00?)
End if 

Repeat 
	$_l_LastStampOLD:=$_l_LastStamp
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46>=$_l_LastStamp)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		
		If (Current time:C178>?01:00:00?)
			$_l_LastStamp:=GEN_TimeDateStamp(Current date:C33; Time:C179(Time string:C180((Current time:C178)-(60*60))))
		Else 
			$_l_LastStamp:=GEN_TimeDateStamp(Current date:C33-1; ?23:00:00?)
		End if 
		
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ModifiedItems")
		ARRAY LONGINT:C221($_al_CheckThisTime; 0)
		For ($_l_CurrentStockIDIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			$_l_StockItemRow:=Find in array:C230($_al_StockItemsChecked; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			If ($_l_StockItemRow<0)
				APPEND TO ARRAY:C911($_al_CheckThisTime; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911($_al_StockItemsChecked; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911($_al_StockItemsCheckedStamps; [STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46)
			Else 
				If ($_al_StockItemsCheckedStamps{$_l_StockItemRow}#[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46)
					APPEND TO ARRAY:C911($_al_CheckThisTime; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					$_al_StockItemsCheckedStamps{$_l_StockItemRow}:=[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46
				End if 
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		
		For ($_l_CurrentStockIDIndex; Size of array:C274($_al_StockItemsCheckedStamps); 1; -1)
			If ($_al_StockItemsCheckedStamps{$_l_CurrentStockIDIndex}<$_l_LastStampOLD)
				DELETE FROM ARRAY:C228($_al_StockItemsChecked; $_l_CurrentStockIDIndex)
				DELETE FROM ARRAY:C228($_al_StockItemsCheckedStamps; $_l_CurrentStockIDIndex)
			End if 
		End for 
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_CheckThisTime)
		ARRAY LONGINT:C221($_al_CheckAllocations; 0)
		ARRAY LONGINT:C221($_al_CheckAllocationCSIDS; 0)
		FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_CurrentStockIDIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
				If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					APPEND TO ARRAY:C911($_al_CheckAllocations; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
						//TRACE
					End if 
					APPEND TO ARRAY:C911($_al_CheckAllocationCSIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				End if 
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ModifiedItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_CopiedFromIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_TakenFromCSIDs)
		
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_CopiedFromIDS)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_TakeFromCurrentStockIDS)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_AddToCurrentStockIDS)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_OLDCOPIEDFROMID:48; $_al_CopiedFromIDS2)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_OLDTAKEFROMCSID:50; $_al_TakenFromCSIDS2)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_OLDADDTOCSID:49; $_al_AddToCurrentStock2IDS)
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		While (Semaphore:C143("$VerifyinAction"))
			DelayTicks(10)
		End while 
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_CopiedFromIDS))
			If ($_al_CopiedFromIDS{$_l_CurrentStockIDIndex}>0)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS{$_l_CurrentStockIDIndex})
				$_l_AddtoCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
				
				
				If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
					If (STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
							DelayTicks(10)
						End while 
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						$_l_CSIDROw:=Find in array:C230($_al_AddToCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
						If ($_l_CSIDROw<0)
							APPEND TO ARRAY:C911($_al_AddToCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
						End if 
						UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
						
						STK_UpdateCalledOffQuantity(-$_al_CopiedFromIDS{$_l_CurrentStockIDIndex})
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS{$_l_CurrentStockIDIndex})
						$_l_AddtoCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						
						For ($_l_ModifiedItemsIndex; 1; Size of array:C274($_al_ModifiedItemIDS))
							If ($_al_CopiedFromIDS{$_l_ModifiedItemsIndex}=$_al_CopiedFromIDS{$_l_CurrentStockIDIndex})
								If ($_al_TakenFromCSIDs{$_l_ModifiedItemsIndex}#$_l_AddtoCurrentStockID)
									//TRACE
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ModifiedItemIDS{$_l_ModifiedItemsIndex})
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
										DelayTicks(10)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddtoCurrentStockID
									$_l_CSIDROw:=Find in array:C230($_al_TakeFromCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
									If ($_l_CSIDROw<0)
										APPEND TO ARRAY:C911($_al_TakeFromCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
										
									End if 
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS{$_l_CurrentStockIDIndex})
								End if 
							End if 
						End for 
						UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
						
						
					End if 
				End if 
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_CopiedFromIDS2))
			If ($_al_CopiedFromIDS2{$_l_CurrentStockIDIndex}>0)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
				
				
				If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
					If (STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
							DelayTicks(10)
						End while 
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						$_l_CSIDROw:=Find in array:C230($_al_AddToCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
						If ($_l_CSIDROw<0)
							APPEND TO ARRAY:C911($_al_AddToCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
						End if 
						UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
						STK_UpdateCalledOffQuantity(-$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
						
						$_l_AddtoCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						For ($_l_ModifiedItemsIndex; 1; Size of array:C274($_al_ModifiedItemIDS))
							If ($_al_CopiedFromIDS{$_l_ModifiedItemsIndex}=$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
								If ($_al_TakenFromCSIDs{$_l_ModifiedItemsIndex}#$_l_AddtoCurrentStockID)
									//TRACE
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ModifiedItemIDS{$_l_ModifiedItemsIndex})
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
										DelayTicks(10)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddtoCurrentStockID
									$_l_CSIDROw:=Find in array:C230($_al_TakeFromCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
									If ($_l_CSIDROw<0)
										APPEND TO ARRAY:C911($_al_TakeFromCurrentStockIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
										
									End if 
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_CopiedFromIDS2{$_l_CurrentStockIDIndex})
								End if 
							End if 
						End for 
						UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
					End if 
				End if 
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_TakeFromCurrentStockIDS))
			If ($_al_TakeFromCurrentStockIDS{$_l_CurrentStockIDIndex}>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_TakeFromCurrentStockIDS{$_l_CurrentStockIDIndex})
				
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				STK_UpdateCurrentStock2011($_al_TakeFromCurrentStockIDS{$_l_CurrentStockIDIndex})
				
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_TakenFromCSIDS2))
			If ($_al_TakenFromCSIDS2{$_l_CurrentStockIDIndex}>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_TakenFromCSIDS2{$_l_CurrentStockIDIndex})
				
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				STK_UpdateCurrentStock2011($_al_TakenFromCSIDS2{$_l_CurrentStockIDIndex})
				
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_AddToCurrentStockIDS))
			If ($_al_AddToCurrentStockIDS{$_l_CurrentStockIDIndex}>0)
				$_bo_TestThis:=False:C215
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AddToCurrentStockIDS{$_l_CurrentStockIDIndex})
				$_l_CSIDROw:=Find in array:C230($_al_CheckAllocationCSIDS; $_al_AddToCurrentStockIDS{$_l_CurrentStockIDIndex})
				If ($_l_CSIDROw>0)
					If ([CURRENT_STOCK:62]Quantity:4=0)
						$_bo_TestThis:=True:C214
					End if 
				End if 
				
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				If ($_bo_TestThis)
					<>STK_bo_CHeckWhatisHappening:=True:C214
				Else 
					<>STK_bo_CHeckWhatisHappening:=False:C215
				End if 
				STK_UpdateCurrentStock2011($_al_AddToCurrentStockIDS{$_l_CurrentStockIDIndex})
				If ($_bo_TestThis)
					DelayTicks(30*60)
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AddToCurrentStockIDS{$_l_CurrentStockIDIndex})
					If ([CURRENT_STOCK:62]Quantity:4=0)
						//TRACE
					End if 
				End if 
				<>STK_bo_CHeckWhatisHappening:=False:C215
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		For ($_l_CurrentStockIDIndex; 1; Size of array:C274($_al_AddToCurrentStock2IDS))
			If ($_al_AddToCurrentStock2IDS{$_l_CurrentStockIDIndex}>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AddToCurrentStock2IDS{$_l_CurrentStockIDIndex})
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				STK_UpdateCurrentStock2011($_al_AddToCurrentStock2IDS{$_l_CurrentStockIDIndex})
				
			End if 
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		CLEAR SEMAPHORE:C144("$VerifyinAction")
		
	End if 
	
	If (Not:C34(<>SYS_bo_QuitCalled))
		DelayTicks(60*2)
	End if 
	
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("STK_Watcher"; $_t_oldMethodName)
