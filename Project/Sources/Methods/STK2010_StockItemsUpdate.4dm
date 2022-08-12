//%attributes = {}
If (False:C215)
	//Project Method Name:      STK2010_StockItemsUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       06/01/2011 17:44 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_SerialForcing; 0)
	ARRAY LONGINT:C221($_al_CSIDS; 0)
	ARRAY LONGINT:C221($_al_CSIdsDeleted; 0)
	ARRAY LONGINT:C221($_al_PrevousIDS; 0)
	ARRAY LONGINT:C221($_al_SMIToLoseIDS; 0)
	ARRAY LONGINT:C221($_al_StockItemsToKeep; 0)
	ARRAY LONGINT:C221($_al_StockProblemIDS; 0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	ARRAY REAL:C219($_ar_PrevousCallOff; 0)
	ARRAY REAL:C219($_ar_StockItemQuanties; 0)
	ARRAY REAL:C219($_ar_ToLoseQuantity; 0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	ARRAY TEXT:C222($_at_PossibleMovementTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	C_BOOLEAN:C305(<>StockAnal; <>SYS_bo_QuitCalled; $_bo_AddItemNumber; $_bo_Changed; $_bo_CouldBeNegative; $_bo_Edit; $_bo_LocationWasOnPrevious; $_bo_NoMinus; $_bo_NoRealMove; $_bo_Reset; $_bo_Resolved)
	C_BOOLEAN:C305($_bo_SNWasOnPrevious; $_bo_StillWrong; $_bo_Update; STK_bo_PreviousSet)
	C_DATE:C307($_d_HeaderDate; $_d_MaxDate)
	C_LONGINT:C283($_l_AddtoCSID; $_l_ChangeTakenFromToCSID; $_l_CopiedFromSMIID; $_l_CopyFromID; $_l_CountChanges; $_l_CountCurrentStockRecords; $_l_CountStockItemsI; $_l_CountStockLevels; $_l_CountStockMoveItems; $_l_CountStockMoveItemsy; $_l_CSTakenFromID)
	C_LONGINT:C283($_l_CurrentStockID; $_l_Ex; $_l_Ex2; $_l_ExpectedTotalTime; $_l_Index; $_l_ItemNumber; $_l_NotSMIID; $_l_Process; $_l_QuantitiesRow; $_l_RecordsinSelection; $_l_SMIIndex)
	C_LONGINT:C283($_l_SMIINdex2; $_l_StockLevelID; $_l_TakeFromCSIDOLD; $_l_TakenFromCSID; $_l_TakenFromCSIDOLD; $_l_TimePerRecord; $_l_TotalTime; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber)
	C_REAL:C285($_r_Available; $_r_CalledOffQuantity; $_r_CostPrice; $_r_CostPriceOnPrevious; $_r_Difference; $_r_FindQuantity; $_r_Max; $_r_netQuantity; $_r_OverCount; $_r_Quantity; $_r_Quantity2)
	C_REAL:C285($_r_QuantityRow; $_r_Remainder; $_r_Sum; $_r_Sum2; $_r_Sum3; $_r_TooMany; $_r_Total; $_r_TotalAvailable; $_r_TotalSelected)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AddToStockType; $_t_AnalysisCode; $_t_Currency; $_t_CurrencyCode; $_t_HeaderLayer; $_t_LayerCode; $_t_Location; $_t_MovementType; $_t_oldMethodName; $_t_productCode)
	C_TEXT:C284($_t_SerialNumber; $_t_TakeFromStockType; $_t_TakeStockType; $_t_UniqueStockReference; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
	C_TIME:C306($_ti_CurrentTIme; $_ti_CurrentTIme2; $_ti_ExpectedEndTIme)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK2010_StockItemsUpdate")
//if the stock item<0 when we are calling we call off a positive quantity- and we cant call a negative quantity off a negative quantity
//-2+1
//QUERY BY FORMULA([STOCK ITEMS];STK_InvalidCalledoff )
Gen_Confirm("Has a validation of Current stock ids been run?"; "No"; "Yes")
If (OK=1)
	STK_2011ValidateCSIDS
End if 
If (False:C215)
	//ALL RECORDS([STOCK ITEMS])
	//APPLY TO SELECTION([STOCK ITEMS];STK_UpdateCalledOffQuantity )
	MESSAGES ON:C181
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	
	ALL RECORDS:C47([CURRENT_STOCK:62])
	ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4)
	
	APPLY TO SELECTION:C70([CURRENT_STOCK:62]; STK_UpdateCurrentStock2011)
	
	ALL RECORDS:C47([STOCK_LEVELS:58])
	CREATE EMPTY SET:C140([STOCK_LEVELS:58]; "ToDelete")
	For ($_l_Index; 1; Records in selection:C76([STOCK_LEVELS:58]))
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]x_Stock_Level_ID:15=[STOCK_LEVELS:58]X_ID:10)
		If (Records in selection:C76([CURRENT_STOCK:62])=0)
			ADD TO SET:C119([STOCK_LEVELS:58]; "ToDelete")
		End if 
		NEXT RECORD:C51([STOCK_LEVELS:58])
		
	End for 
	USE SET:C118("ToDelete")
	DELETE SELECTION:C66([STOCK_LEVELS:58])
	ALL RECORDS:C47([STOCK_LEVELS:58])
	ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Free_Level:3)
	
	APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels)
End if 


READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([CURRENT_STOCK:62])
ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])

QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
$_l_CountChanges:=0
ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$all")
$_ti_CurrentTIme:=Current time:C178
$_l_TotalTime:=0
$_l_TimePerRecord:=1
$_l_ExpectedTotalTime:=$_l_TimePerRecord*$_l_RecordsinSelection
$_ti_ExpectedEndTIme:=$_ti_CurrentTIme+$_l_ExpectedTotalTime
If (False:C215)  //recovery
	
	Repeat 
		For ($_l_Index; 1; $_l_RecordsinSelection)
			If ($_l_Index=861)
				//TRACE
			End if 
			
			USE NAMED SELECTION:C332("$all")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			//MESSAGE(String($_l_Index)+" of "+String(Records in selection([STOCK ITEMS]))+" "+[STOCK ITEMS]Product Code)
			$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			//MESSAGE([STOCK ITEMS]Product Code+" "+String($_r_CalledOffQuantity))
			STK_UpdateCalledOffQuantity
			If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				$_r_TooMany:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18-Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CurrentStockID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_TooMany)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; <)
					REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
				Else 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CurrentStockID)
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
				End if 
				USE NAMED SELECTION:C332("$all")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				STK_UpdateCalledOffQuantity
			End if 
			$_ti_CurrentTIme2:=Current time:C178
			$_l_TotalTime:=$_ti_CurrentTIme2-$_ti_CurrentTIme
			$_l_TimePerRecord:=$_l_TotalTime/$_l_Index
			$_l_ExpectedTotalTime:=$_l_TimePerRecord*$_l_RecordsinSelection
			$_ti_ExpectedEndTIme:=$_ti_CurrentTIme+$_l_ExpectedTotalTime
			
			If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#$_r_CalledOffQuantity)
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
					ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				End if 
				$_l_CountChanges:=$_l_CountChanges+1
				MESSAGE:C88(String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))+" "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" Called off was: "+String:C10($_r_CalledOffQuantity)+" Changed to: "+String:C10([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)+" expected end time "+Time string:C180($_ti_ExpectedEndTIme))
			Else 
				MESSAGE:C88(String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))+" "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" No change-total changed so far "+String:C10($_l_CountChanges)+" expected end time "+Time string:C180($_ti_ExpectedEndTIme))
				
				
				
			End if 
			
			//`NEXT RECORD([STOCK ITEMS])
			//USE NAMED SELECTION("ALL")
			//GOTO SELECTED RECORD([STOCK ITEMS];$_l_Index)
			//MESSAGE("Stock item update "+String($_l_Index)+" of "+String($_l_RecordsinSelection))
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
				STK_UpdateCalledOffQuantity
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				$_l_CountChanges:=$_l_CountChanges+1
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					STK_UpdateCalledOffQuantity
					$_l_CountChanges:=$_l_CountChanges+1
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				Else 
					If ([CURRENT_STOCK:62]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1) | ([CURRENT_STOCK:62]Stock_Type:3#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
						
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
						STK_UpdateCalledOffQuantity
						$_l_CountChanges:=$_l_CountChanges+1
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
					
				End if 
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					STK_UpdateCalledOffQuantity
					$_l_CountChanges:=$_l_CountChanges+1
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				Else 
					If ([CURRENT_STOCK:62]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1) | ([CURRENT_STOCK:62]Stock_Type:3#[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
						
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
						STK_UpdateCalledOffQuantity
						$_l_CountChanges:=$_l_CountChanges+1
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
				End if 
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
				$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
				$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
				$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CurrentStockID)
				//TRACE
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					USE NAMED SELECTION:C332("$all")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
					$_l_CountChanges:=$_l_CountChanges+1
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				Else 
					If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_productCode) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#$_t_TakeFromStockType) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#$_l_TakenFromCSID)
						USE NAMED SELECTION:C332("$all")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						STK_UpdateCalledOffQuantity
						$_l_CountChanges:=$_l_CountChanges+1
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
				End if 
			End if 
			
			
			
		End for 
		
	Until ($_l_CountChanges=0)
End if 
If (False:C215)  //Recovery
	
	
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		MESSAGE:C88("Stock item update "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
		$_l_AddtoCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CurrentStockID)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$CFrom")
		$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode)
		$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		USE SET:C118("$CFrom")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_AddtoCSID)
		$_r_Sum3:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		If ($_r_Sum3#$_r_Sum)
			APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
		Else 
			If ($_r_Sum2#$_r_Sum)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
				
			Else 
				USE NAMED SELECTION:C332("ALL")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#$_r_Sum)
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
					
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				End if 
			End if 
		End if 
	End for 
End if 

//first pass will check that the stock items have the correct information on.
//TRACE
If (True:C214)  //
	
	USE NAMED SELECTION:C332("ALL")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		MESSAGE:C88("Stock item update "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		$_bo_Edit:=False:C215
		If (([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0))
			If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			End if 
			
			If (Records in selection:C76([STOCK_MOVEMENTS:40])=1) & ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
				If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26=[STOCK_MOVEMENTS:40]Movement_Date:5) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10) | ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
					[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
					$_bo_Edit:=True:C214
				End if 
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
				End if 
				If (Records in selection:C76([MOVEMENT_TYPES:60])=1)
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
						$_bo_Edit:=True:C214
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
							[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
							$_bo_Edit:=True:C214
						End if 
					Else 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Minus:4) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Plus:3)
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
							[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
							$_bo_Edit:=True:C214
						End if 
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"") & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#"")
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#"") & (<>StockAnal)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]Location:7#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]Location:7; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; *)
						End if 
						$_bo_AddItemNumber:=False:C215
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
						QUERY:C277([CURRENT_STOCK:62])
						Case of 
							: ([MOVEMENT_TYPES:60]Alloc_Type:10)
								//this is in allocation movement
								If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
								Else 
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							: ([MOVEMENT_TYPES:60]Unalloc_Type:13)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								$_bo_Edit:=True:C214
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									$_bo_AddItemNumber:=True:C214
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
									
								Else 
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
									
								End if 
								
						End case 
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								//TRACE
								//There should  not be multiple records so merge them
								$_r_Quantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								CREATE SET:C116([CURRENT_STOCK:62]; "$Match")
								$_l_CountCurrentStockRecords:=Records in selection:C76([CURRENT_STOCK:62])
								REDUCE SELECTION:C351([CURRENT_STOCK:62]; $_l_CountCurrentStockRecords-1)
								SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIdsDeleted)
								
								DELETE SELECTION:C66([CURRENT_STOCK:62])
								USE SET:C118("$Match")
								[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
								STK_UpdateCurrentStock2011
								SAVE RECORD:C53([CURRENT_STOCK:62])
								
								
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIdsDeleted)
								$_bo_Update:=False:C215
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_CurrentStockID)
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Update:=True:C214
								End if 
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CSIdsDeleted)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_CurrentStockID)
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Update:=True:C214
								Else 
									
									If ($_bo_Update)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
									End if 
								End if 
								
								
								If ($_bo_Update)
									ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_CurrentStockID)
								End if 
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=[CURRENT_STOCK:62]X_ID:13
								
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_bo_Edit:=False:C215
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
								
								//FIRST RECORD([current stock
								//TRACE
							Else 
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=[CURRENT_STOCK:62]X_ID:13
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_bo_Edit:=False:C215
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
							End if 
						Else 
							//no current stock record so create it but dont put any numbers on it
							
							CREATE RECORD:C68([CURRENT_STOCK:62])
							If ([MOVEMENT_TYPES:60]Alloc_Type:10) | ($_bo_AddItemNumber)
								
								[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							End if 
							If (<>StockAnal)
								[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
							End if 
							[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
							[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
							[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
							[CURRENT_STOCK:62]Location:8:=[STOCK_MOVEMENT_ITEMS:27]Location:7
							[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
							[CURRENT_STOCK:62]Serial_Number:2:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
							[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
							[CURRENT_STOCK:62]Stock_Type:3:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
							[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
							
							SAVE RECORD:C53([CURRENT_STOCK:62])
							$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								//TRACE
							End if 
							[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=[CURRENT_STOCK:62]X_ID:13
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							$_bo_Edit:=False:C215
							ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
						End if 
					End if 
					
					//````
					$_bo_SNWasOnPrevious:=False:C215
					$_bo_LocationWasOnPrevious:=False:C215
					
					//how do we cope wth changing a location of changing the currency/value of stock
					//stock movement types will have to be created for them where the + and - are the same type.
					
					If ([STOCK_MOVEMENT_ITEMS:27]Location:7#"") | ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
						
						If ($_bo_Edit)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						End if 
						$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
						$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
						$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
						$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
						$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
						$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
						$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						$_d_MaxDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
						$_l_ItemNumber:=0
						If ([MOVEMENT_TYPES:60]Unalloc_Type:13)
							$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						End if 
						
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_AddToStockType)
						
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PossibleMovementTypes; [MOVEMENT_TYPES:60]Serial_Forcing:16; $_abo_SerialForcing)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$linked")
						//not sure how we cope with revaluing stock!
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
						QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_PossibleMovementTypes)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=$_t_CurrencyCode)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=$_t_LayerCode)
						If (<>StockAnal)
							QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=$_t_AnalysisCode)
						End if 
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5<=$_d_MaxDate)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$HeadersLinked")
						INTERSECTION:C121("$linked"; "$HeadersLinked"; "$linked")
						USE SET:C118("$linked")
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							//TRACE
						End if 
						USE NAMED SELECTION:C332("ALL")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
						If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
							QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
						End if 
						
						
					End if 
					
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"") & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#"")
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#"") & (<>StockAnal)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; *)
						End if 
						//This is an interesting conuncdrum was the location on there before
						//we can ONLY work that out by finding if the preceeeding stock movement item had
						If ([STOCK_MOVEMENT_ITEMS:27]Location:7#"") & ($_bo_LocationWasOnPrevious)
							[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=[STOCK_MOVEMENT_ITEMS:27]Location:7  //because prior to this there is no way to know if it was a location move
							
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]Location:7; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"") & ($_bo_SNWasOnPrevious)
							[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=True:C214
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; *)
						End if 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
						
						QUERY:C277([CURRENT_STOCK:62])
						Case of 
							: ([MOVEMENT_TYPES:60]Alloc_Type:10)
								//this is in allocation movement
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								
							: ([MOVEMENT_TYPES:60]Unalloc_Type:13) | ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
								If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
								Else 
									//TRACE
								End if 
								//this is the item we took it off
								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
									$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
									$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
									$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
									$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
									If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
										//TRACE
									End if 
									$_r_Quantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									$_l_ItemNumber:=0
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_TakeFromStockType; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_TakeFromStockType; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										If ((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)>=$_r_Quantity)
											$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
											$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									USE NAMED SELECTION:C332("ALL")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_ItemNumber
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Edit:=False:C215
									$_bo_NoRealMove:=True:C214
								Else 
									
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Edit:=False:C215
								End if 
							Else 
								
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								
								
						End case 
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								$_r_Quantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								CREATE SET:C116([CURRENT_STOCK:62]; "$Match")
								$_l_CountCurrentStockRecords:=Records in selection:C76([CURRENT_STOCK:62])
								REDUCE SELECTION:C351([CURRENT_STOCK:62]; $_l_CountCurrentStockRecords-1)
								SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIdsDeleted)
								DELETE SELECTION:C66([CURRENT_STOCK:62])
								USE SET:C118("$Match")
								[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
								STK_UpdateCurrentStock2011
								SAVE RECORD:C53([CURRENT_STOCK:62])
								
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIdsDeleted)
								$_bo_Update:=False:C215
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_CurrentStockID)
									$_bo_Update:=True:C214
								End if 
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CSIdsDeleted)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_CurrentStockID)
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Update:=True:C214
								Else 
									If ($_bo_Update)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
									End if 
								End if 
								If ($_bo_Update)
									ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_CurrentStockID)
								End if 
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_bo_Edit:=False:C215
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
								
							Else 
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_bo_Edit:=False:C215
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
								
							End if 
						Else 
							//no current stock record so create it but dont put any numbers on it
							//TRACE
							CREATE RECORD:C68([CURRENT_STOCK:62])
							If ([MOVEMENT_TYPES:60]Unalloc_Type:13)
								[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							End if 
							If (<>StockAnal)
								[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
							End if 
							[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
							[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
							[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
							If ($_bo_LocationWasOnPrevious)
								[CURRENT_STOCK:62]Location:8:=[STOCK_MOVEMENT_ITEMS:27]Location:7
							End if 
							[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
							If ($_bo_SNWasOnPrevious)
								[CURRENT_STOCK:62]Serial_Number:2:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
							End if 
							[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
							[CURRENT_STOCK:62]Stock_Type:3:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
							[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
							STK_UpdateCurrentStock2011
							SAVE RECORD:C53([CURRENT_STOCK:62])
							
							$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								//TRACE
							End if 
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							$_bo_Edit:=False:C215
							
							ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
							
						End if 
					End if 
					If ($_bo_Edit)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
				Else 
					If (Length:C16([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)>1)
						If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11[[1]]#"-")
							[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:="-"+([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						End if 
						
					End if 
				End if 
			Else 
				If (Length:C16([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)>1)
					If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11[[1]]#"-")
						[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:="-"+([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
					
				End if 
			End if 
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			//TRACE
		End if 
	End for 
End if 

If (True:C214)
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
	//QUERY([STOCK ITEMS];[STOCK ITEMS]x_ID=468441)
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		$_l_NotSMIID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		MESSAGE:C88("Linking items  "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
		If ($_l_CSTakenFromID>0) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
			$_l_CopyFromID:=0
			$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
			$_r_Quantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			//
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				//we are going to add the stock to this item...
				$_bo_CouldBeNegative:=False:C215
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Quantity; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>$_r_Quantity)
			Else 
				$_bo_CouldBeNegative:=True:C214
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Quantity; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18<$_r_Quantity)
			End if 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
				For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					
					If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
							
							$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						Else 
							//TRACE
						End if 
					End if 
					
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
				If ($_l_CopyFromID>0)
					USE NAMED SELECTION:C332("ALL")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
				End if 
			Else 
				If ($_bo_CouldBeNegative)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=-$_r_Quantity; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18<$_r_Quantity)
					//```
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ($_r_Quantity<0)
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)>=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										
										$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
										
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									Else 
										//TRACE
									End if 
								End if 
							Else 
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										
										$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									Else 
										//TRACE
									End if 
								End if 
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						If ($_l_CopyFromID>0)
							USE NAMED SELECTION:C332("ALL")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						End if 
					End if 
				End if 
			End if 
		End if 
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			//TRACE
		End if 
	End for 
	
	
	//now we can link th eless than quantities
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		MESSAGE:C88("Linking items  "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		$_l_NotSMIID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
		If ($_l_CSTakenFromID>0) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
			$_l_CopyFromID:=0
			$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
			$_r_Quantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				//we are going to add the stock to this item...
				$_bo_CouldBeNegative:=False:C215
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>=$_r_Quantity; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate)
				//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]CalledOffQuantity>$_r_Quantity)
			Else 
				$_bo_CouldBeNegative:=True:C214
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>=$_r_Quantity; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate)
				//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]CalledOffQuantity<$_r_Quantity)
			End if 
			
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
				For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					
					If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
							$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							
							
						End if 
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
				If ($_l_CopyFromID>0)
					USE NAMED SELECTION:C332("ALL")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				End if 
			Else 
				If ($_bo_CouldBeNegative)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<=-$_r_Quantity; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=$_d_HeaderDate)
					//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]CalledOffQuantity<$_r_Quantity)
					//```
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ($_r_Quantity<0)
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)>=(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										
										$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
										
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									Else 
										//TRACE
									End if 
								End if 
							Else 
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										
										$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
										
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										$_l_SMIIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									Else 
										//TRACE
									End if 
								End if 
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						If ($_l_CopyFromID>0)
							USE NAMED SELECTION:C332("ALL")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						End if 
					End if 
				End if 
			End if 
		End if 
		
	End for 
	
	
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
	
	
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Problems")
	
	
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		
		$_bo_NoMinus:=False:C215
		USE NAMED SELECTION:C332("ALL")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
		
		
		MESSAGE:C88("Linking items  "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		$_l_NotSMIID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
		$_t_TakeStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
		$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
		If ($_l_CSTakenFromID>0) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
			$_l_CopyFromID:=0
			$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
			$_r_Quantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CSTakenFromID)
			If ([CURRENT_STOCK:62]Stock_Type:3#$_t_TakeStockType) | ([CURRENT_STOCK:62]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"") & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#"")
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#"") & (<>StockAnal)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; *)
						End if 
						//This is an interesting conuncdrum was the location on there before
						//we can ONLY work that out by finding if the preceeeding stock movement item had
						If ([STOCK_MOVEMENT_ITEMS:27]Location:7#"")  //& ($_bo_LocationWasOnPrevious)
							[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=[STOCK_MOVEMENT_ITEMS:27]Location:7  //because prior to this there is no way to know if it was a location move
							
							
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENT_ITEMS:27]Location:7; *)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")  //& ($_bo_SNWasOnPrevious)
							
							[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=True:C214
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; *)
						End if 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
						
						QUERY:C277([CURRENT_STOCK:62])
						Case of 
							: ([MOVEMENT_TYPES:60]Alloc_Type:10)
								//this is in allocation movement
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								
							: ([MOVEMENT_TYPES:60]Unalloc_Type:13)
								If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
								Else 
									//TRACE
								End if 
								//this is the item we took it off
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							Else 
								
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								
								
						End case 
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								$_r_Quantity2:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								CREATE SET:C116([CURRENT_STOCK:62]; "$Match")
								$_l_CountCurrentStockRecords:=Records in selection:C76([CURRENT_STOCK:62])
								REDUCE SELECTION:C351([CURRENT_STOCK:62]; $_l_CountCurrentStockRecords-1)
								SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIdsDeleted)
								
								DELETE SELECTION:C66([CURRENT_STOCK:62])
								USE SET:C118("$Match")
								[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity2
								STK_UpdateCurrentStock2011
								SAVE RECORD:C53([CURRENT_STOCK:62])
								
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIdsDeleted)
								$_bo_Update:=False:C215
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_CurrentStockID)
									$_bo_Update:=True:C214
								End if 
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CSIdsDeleted)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_CurrentStockID)
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									$_bo_Update:=True:C214
								Else 
									If ($_bo_Update)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
									End if 
								End if 
								If ($_bo_Update)
									ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_CurrentStockID)
								End if 
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
								
							Else 
								$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
								
							End if 
						Else 
							//no current stock record so create it but dont put any numbers on it
							//TRACE
							CREATE RECORD:C68([CURRENT_STOCK:62])
							If ([MOVEMENT_TYPES:60]Unalloc_Type:13)
								[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							End if 
							If (<>StockAnal)
								[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
							End if 
							[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
							[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
							[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
							
							[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
							
							[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
							[CURRENT_STOCK:62]Stock_Type:3:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
							[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
							
							SAVE RECORD:C53([CURRENT_STOCK:62])
							
							$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
							If (Records in selection:C76([CURRENT_STOCK:62])>1)
								//TRACE
							End if 
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
							ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [CURRENT_STOCK:62]X_ID:13)
							
						End if 
					End if 
					$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				End if 
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSTakenFromID)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "CopyFromMaybe")
			$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
				
				For ($_l_SMIIndex; 1; $_l_CountStockMoveItemsy)
					USE NAMED SELECTION:C332("$SortedSelection")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
					If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
							$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
							//If (Records in selection([STOCK ITEMS])>0)
							//TRACE
							//End if
							$_l_SMIIndex:=$_l_CountStockMoveItemsy
						End if 
					Else 
						
					End if 
					//NEXT RECORD([STOCK ITEMS])
				End for 
				If ($_l_CopyFromID>0)
					USE NAMED SELECTION:C332("ALL")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				Else 
					$_r_TotalAvailable:=0
					USE SET:C118("CopyFromMaybe")
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
							If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_TotalAvailable:=$_r_TotalAvailable+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
							End if 
						End if 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					If ($_r_TotalAvailable>0)
						
						ARRAY LONGINT:C221($_al_PrevousIDS; 0)
						ARRAY REAL:C219($_ar_PrevousCallOff; 0)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						$_r_TotalSelected:=0
						//For ($_l_SMIIndex;1;Records in selection([STOCK ITEMS]))
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
						$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						
						For ($_l_SMIIndex; 1; $_l_CountStockMoveItemsy)
							USE NAMED SELECTION:C332("$SortedSelection")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
									
									$_r_Available:=(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
									If (($_r_TotalSelected+$_r_Available)>$_r_Quantity)
										$_r_Available:=$_r_Quantity-$_r_TotalSelected
									End if 
									If ($_r_Available>0)
										APPEND TO ARRAY:C911($_al_PrevousIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_ar_PrevousCallOff; $_r_Available)
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Available
										
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
										//If (Records in selection([STOCK ITEMS])>0)
										//TRACE
										//End if
										$_r_TotalSelected:=$_r_TotalSelected+$_ar_PrevousCallOff{Size of array:C274($_ar_PrevousCallOff)}
									End if 
								End if 
							End if 
							If ($_r_TotalSelected=$_r_Quantity)
								$_l_SMIIndex:=$_l_CountStockMoveItemsy
							End if 
							//NEXT RECORD([STOCK ITEMS])
						End for 
						If (Size of array:C274($_al_PrevousIDS)>0)
							For ($_l_SMIIndex; 1; Size of array:C274($_al_PrevousIDS))
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								If ($_l_SMIIndex=1) & ($_r_TotalSelected=$_r_Quantity)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								Else 
									STK_ItemDuplicate
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
									
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								End if 
							End for 
							If ($_r_TotalSelected<$_r_Quantity)
								$_r_Remainder:=$_r_Quantity-$_r_TotalSelected
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remainder
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_l_Index:=$_l_Index-1
								$_bo_NoMinus:=True:C214
							End if 
							
						End if 
						
					Else 
						//TRACE
						//There are not sufficient current stock records at that price. So probably somethiing has gone wrong in the selection of cost price.
						//see if there are stock items of the same type that could be called off to link this.
						USE NAMED SELECTION:C332("ALL")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
						If ($_l_CSTakenFromID#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
							//TRACE
							$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
						End if 
						
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CSTakenFromID)
						
						If ([CURRENT_STOCK:62]Stock_Type:3#$_t_TakeStockType) | ([CURRENT_STOCK:62]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
							//TRACE
						End if 
						$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
						$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
						$_t_Location:=[CURRENT_STOCK:62]Location:8
						$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
						$_t_TakeFromStockType:=[CURRENT_STOCK:62]Stock_Type:3
						$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
						$_t_SerialNumber:=[CURRENT_STOCK:62]Serial_Number:2
						$_l_ItemNumber:=[CURRENT_STOCK:62]Item_Number:5  //if there is an item number its important!
						
						$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
						End if 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_TakeFromStockType)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Location:8=$_t_Location)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode)
						SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "MatchbyPrice")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10<=$_r_CostPrice)
						ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; <)
						//For ($_l_SMIIndex;1;Records in selection([CURRENT STOCK]))
						//$_l_CurrentStockID:=[CURRENT STOCK]XREC_ID
						//QUERY([STOCK ITEMS];[STOCK ITEMS]xAddtoCurrentStockID=$_l_CurrentStockID)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
						$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						
						For ($_l_SMIINdex2; 1; $_l_CountStockMoveItemsy)
							USE NAMED SELECTION:C332("$SortedSelection")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIINdex2)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							
							If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
									$_r_CostPriceOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
									$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									
									//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
									//If (Records in selection([STOCK ITEMS])>0)
									//TRACE
									//End if
									$_l_SMIINdex2:=$_l_CountStockMoveItemsy
									$_l_SMIIndex:=Records in selection:C76([CURRENT_STOCK:62])
								End if 
							Else 
								
							End if 
							//NEXT RECORD([STOCK ITEMS])
						End for 
						
						If ($_l_CopyFromID=0)
							USE SET:C118("MatchbyPrice")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>$_r_CostPrice)
							ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; >)
							COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
							$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
							
							For ($_l_SMIINdex2; 1; $_l_CountStockMoveItemsy)
								USE NAMED SELECTION:C332("$SortedSelection")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIINdex2)
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										$_r_CostPriceOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
										$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
										$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										
										$_l_SMIINdex2:=$_l_CountStockMoveItemsy
										$_l_SMIIndex:=Records in selection:C76([CURRENT_STOCK:62])
										//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
										//If (Records in selection([STOCK ITEMS])>0)
										//TRACE
										//End if
									End if 
								Else 
									
								End if 
								//NEXT RECORD([STOCK ITEMS])
							End for 
							
						End if 
						//NEXT RECORD([CURRENT STOCK])
						
						//End for
						If ($_l_CopyFromID>0)
							USE NAMED SELECTION:C332("ALL")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
							$_l_TakeFromCSIDOLD:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_TakenFromCSID
							[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=$_r_CostPriceOnPrevious
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							If ($_l_TakeFromCSIDOLD#0)
								ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_TakeFromCSIDOLD)
							End if 
							ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_TakenFromCSID)
							
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
						Else 
							
							$_r_TotalAvailable:=0
							USE SET:C118("MatchbyPrice")
							FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
							For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										$_r_TotalAvailable:=$_r_TotalAvailable+([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
									End if 
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_r_TotalAvailable>=1)
								FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
								ARRAY LONGINT:C221($_al_PrevousIDS; 0)
								ARRAY REAL:C219($_ar_PrevousCallOff; 0)
								FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$XY")
								$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								$_r_TotalSelected:=0
								For ($_l_SMIIndex; 1; $_l_CountStockMoveItemsy)
									USE SET:C118("$XY")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
									//Records in selection([STOCK ITEMS]))
									If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotSMIID)
										If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
											$_r_Available:=(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
											If (($_r_TotalSelected+$_r_Available)>$_r_Quantity)
												$_r_Available:=$_r_Quantity-$_r_TotalSelected
											End if 
											If ($_r_Available>0)
												APPEND TO ARRAY:C911($_al_PrevousIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												APPEND TO ARRAY:C911($_ar_PrevousCallOff; $_r_Available)
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Available
												
												SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
												$_r_TotalSelected:=$_r_TotalSelected+$_ar_PrevousCallOff{Size of array:C274($_ar_PrevousCallOff)}
												//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
												//If (Records in selection([STOCK ITEMS])>0)
												//TRACE
												//End if
											End if 
										End if 
										If ($_r_TotalSelected=$_r_Quantity)
											$_l_SMIIndex:=$_l_CountStockMoveItemsy
										End if 
									End if 
									//NEXT RECORD([STOCK ITEMS])
								End for 
								If (Size of array:C274($_al_PrevousIDS)>0)
									For ($_l_SMIIndex; 1; Size of array:C274($_al_PrevousIDS))
										USE NAMED SELECTION:C332("ALL")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
										If ($_l_SMIIndex=1) & ($_r_TotalSelected=$_r_Quantity)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
											STK_UpdateCalledOffQuantity
											SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
											STK_UpdateCalledOffQuantity
											SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										Else 
											STK_ItemDuplicate
											[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
											STK_UpdateCalledOffQuantity
											SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
											STK_UpdateCalledOffQuantity
											SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										End if 
									End for 
									If ($_r_TotalSelected<$_r_Quantity)
										$_r_Remainder:=$_r_Quantity-$_r_TotalSelected
										USE NAMED SELECTION:C332("ALL")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remainder
										STK_UpdateCalledOffQuantity
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										$_l_Index:=$_l_Index-1
										$_bo_NoMinus:=True:C214
									End if 
									
								Else 
									USE NAMED SELECTION:C332("ALL")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
									
								End if 
							Else 
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								
								
							End if 
							
						End if 
						
					End if 
				End if 
				USE NAMED SELECTION:C332("ALL")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & (Not:C34($_bo_NoMinus))
					MESSAGE:C88("Linking items  "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
					$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_TakeFromStockType)
					If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
						//if the stock this came from is not existing and at this point it should then this is some widowed stock movement
						//so we should not take from or add it current stock
						$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
						
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=-Abs:C99([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_CurrentStockID)
						
					End if 
					
				End if 
			Else 
				USE NAMED SELECTION:C332("ALL")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				MESSAGE:C88("Linking items  "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
				$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
				//if that stock type has nothing that adds to it then its fine.
				If ($_l_CSTakenFromID#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
					//TRACE
					$_l_CSTakenFromID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CSTakenFromID)
				
				If ([CURRENT_STOCK:62]Stock_Type:3#$_t_TakeStockType) | ([CURRENT_STOCK:62]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
					//TRACE
				End if 
				$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
				$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
				$_t_Location:=[CURRENT_STOCK:62]Location:8
				$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
				$_t_TakeFromStockType:=[CURRENT_STOCK:62]Stock_Type:3
				$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
				$_t_SerialNumber:=[CURRENT_STOCK:62]Serial_Number:2
				$_l_ItemNumber:=[CURRENT_STOCK:62]Item_Number:5  //if there is an item number its important!
				
				$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementType)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_TakeFromStockType)
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode)
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Location:8=$_t_Location)
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode)
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode)
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "MatchbyPrice")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10<=$_r_CostPrice)
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; <)
				//For ($_l_SMIIndex;1;Records in selection([CURRENT STOCK]))
				//$_l_CurrentStockID:=[CURRENT STOCK]XREC_ID
				//QUERY([STOCK ITEMS];[STOCK ITEMS]xAddtoCurrentStockID=$_l_CurrentStockID)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
				$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				For ($_l_SMIINdex2; 1; $_l_CountStockMoveItemsy)
					USE NAMED SELECTION:C332("$SortedSelection")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIINdex2)
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
					If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_r_CostPriceOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
						
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						$_l_SMIINdex2:=$_l_CountStockMoveItemsy
						$_l_SMIIndex:=Records in selection:C76([CURRENT_STOCK:62])
						//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
						//If (Records in selection([STOCK ITEMS])>0)
						//TRACE
						//End if
					Else 
						
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
				
				If ($_l_CopyFromID=0)
					USE SET:C118("MatchbyPrice")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>$_r_CostPrice)
					ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; >)
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
					$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					For ($_l_SMIINdex2; 1; $_l_CountStockMoveItemsy)
						USE NAMED SELECTION:C332("$SortedSelection")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIINdex2)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						
						If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity)<=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							
							$_r_CostPriceOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
							$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Quantity
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							$_l_SMIINdex2:=$_l_CountStockMoveItemsy
							$_l_SMIIndex:=Records in selection:C76([CURRENT_STOCK:62])
							//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
							//If (Records in selection([STOCK ITEMS])>0)`
							//TRACE
							//End if
						Else 
							
						End if 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					
				End if 
				//NEXT RECORD([CURRENT STOCK])
				
				//End for
				If ($_l_CopyFromID>0)
					USE NAMED SELECTION:C332("ALL")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
					$_l_TakenFromCSIDOLD:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopyFromID
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_TakenFromCSID
					[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=$_r_CostPriceOnPrevious
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
					If ($_l_TakenFromCSIDOLD>0)
						
						ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_TakenFromCSIDOLD)
					End if 
					ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_TakenFromCSID)
					If ($_l_CopyFromID>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					End if 
					If ($_l_TakenFromCSID>0)
					End if 
					
				Else 
					USE SET:C118("MatchbyPrice")
					$_r_TotalAvailable:=0
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SortedSelection")
					$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					For ($_l_SMIIndex; 1; $_l_CountStockMoveItemsy)
						USE NAMED SELECTION:C332("$SortedSelection")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIINdex2)
						
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						
						If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							$_r_TotalAvailable:=$_r_TotalAvailable+([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
						End if 
						//NEXT RECORD([STOCK ITEMS])
					End for 
					If ($_r_TotalAvailable>0)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						ARRAY LONGINT:C221($_al_PrevousIDS; 0)
						ARRAY REAL:C219($_ar_PrevousCallOff; 0)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						$_r_TotalSelected:=0
						$_l_CountStockMoveItemsy:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$XY")
						For ($_l_SMIIndex; 1; $_l_CountStockMoveItemsy)
							USE SET:C118("$XY")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
							STK_UpdateCalledOffQuantity
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							If (([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)<Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								$_r_Available:=(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
								If (($_r_TotalSelected+$_r_Available)>$_r_Quantity)
									$_r_Available:=$_r_Quantity-$_r_TotalSelected
								End if 
								If ($_r_Available>0)
									APPEND TO ARRAY:C911($_al_PrevousIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									APPEND TO ARRAY:C911($_ar_PrevousCallOff; $_r_Available)
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18+$_r_Available
									
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									$_r_TotalSelected:=$_r_TotalSelected+$_ar_PrevousCallOff{Size of array:C274($_ar_PrevousCallOff)}
									//QUERY BY FORMULA([STOCK ITEMS];[STOCK ITEMS]CalledOffQuantity>Abs([STOCK ITEMS]Quantity))
									//If (Records in selection([STOCK ITEMS])>0)
									//TRACE
									//End if
								End if 
							End if 
							If ($_r_TotalSelected=$_r_Quantity)
								$_l_SMIIndex:=$_l_CountStockMoveItemsy
							End if 
							//NEXT RECORD([STOCK ITEMS])
						End for 
						If (Size of array:C274($_al_PrevousIDS)>0)
							For ($_l_SMIIndex; 1; Size of array:C274($_al_PrevousIDS))
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								If ($_l_SMIIndex=1) & ($_r_TotalSelected=$_r_Quantity)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								Else 
									STK_ItemDuplicate
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PrevousIDS{$_l_SMIIndex}
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PrevousCallOff{$_l_SMIIndex}
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_PrevousIDS{$_l_SMIIndex})
									STK_UpdateCalledOffQuantity
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								End if 
							End for 
							If ($_r_TotalSelected<$_r_Quantity)
								$_r_Remainder:=$_r_Quantity-$_r_TotalSelected
								USE NAMED SELECTION:C332("ALL")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remainder
								STK_UpdateCalledOffQuantity
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								$_l_Index:=$_l_Index-1
								$_bo_NoMinus:=True:C214
							End if 
							
							
						Else 
							USE NAMED SELECTION:C332("ALL")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
							
						End if 
					Else 
						USE NAMED SELECTION:C332("ALL")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
						
						//TRACE
					End if 
					
				End if 
				USE NAMED SELECTION:C332("ALL")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & (Not:C34($_bo_NoMinus))
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_TakeFromStockType)
					If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
						USE NAMED SELECTION:C332("ALL")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
						//then this is a problem because there is nothing to take the stock from which
						$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=-Abs:C99([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
						STK_UpdateCalledOffQuantity
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						
						If ($_l_TakenFromCSID>0)
							
							ProcessServices_CreateRecord(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "StockUpdateCurrentStock"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_l_TakenFromCSID)
						End if 
						
						
					End if 
				Else 
					//[STOCK ITEMS]X_CopiedFromID:=-901 `This will be used for items coming fr
				End if 
				//There is no point in calculating this in the current stock
				//These ones are probably not a proble
			End if 
		End if 
		
	End for 
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
	//QUERY SELECTION([STOCK ITEMS];[STOCK ITEMS]Product Code="PRE-AMP")
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ASSIGNED")
	$_l_CountStockItemsI:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	If (False:C215)
		For ($_l_Index; 1; $_l_CountStockItemsI)
			
			USE NAMED SELECTION:C332("$ASSIGNED")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			MESSAGE:C88("un-Linking invalid items  "+String:C10($_l_Index)+" of "+String:C10($_l_CountStockItemsI))
			
			//$_r_Quantity:=Abs([STOCK ITEMS]Quantity
			$_l_TakenFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
			$_l_CopiedFromSMIID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromSMIID)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#$_l_TakenFromCSID)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					$_bo_Reset:=True:C214
				Else 
					$_bo_Reset:=False:C215
				End if 
				$_l_ChangeTakenFromToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
				
				USE NAMED SELECTION:C332("$ASSIGNED")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_ChangeTakenFromToCSID
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) | ($_bo_Reset)
					
					//TRACE
					STK_l_PreviousStockItemNumber:=0
					STK_l_PreviousMovementID:=0
					STK_t_PreviousStockLocation:=""
					STK_t_PreviousStockSerial:=""
					ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
					ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
					
					STK_bo_PreviousSet:=False:C215
					$_l_Process:=New process:C317("STK_GetPreviousStockMovement"; 128000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					While (STK_bo_PreviousSet=False:C215)
						DelayTicks(2)
					End while 
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_PreviousMovementID
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
					[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=STK_t_PreviousStockLocation
					[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=(STK_t_PreviousStockSerial#"")
					STK_UpdateCalledOffQuantity
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					If (Size of array:C274(STK_al_PreviousMovementIDS)>0)
						//this item needs to be split
						//TRACE
					End if 
					
					
					
				End if 
				
				STK_UpdateCalledOffQuantity
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				
			End if 
			
		End for 
	End if 
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	QUERY BY FORMULA:C48([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockProblemIDS)
	For ($_l_Index; 1; Size of array:C274($_al_StockProblemIDS))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
		$_r_Max:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
		$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
		$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
		$_t_HeaderLayer:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
		$_t_Currency:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
		$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$CopiedFrom")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
		$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		USE SET:C118("$copiedFrom")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
		$_r_Sum:=$_r_Sum+(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		If ($_r_Sum#$_r_CalledOffQuantity)
			//TRACE
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
		Else 
			//First check all these are the correct product code
			$_bo_Changed:=False:C215
			USE SET:C118("$copiedFrom")
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_productCode)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				$_bo_Changed:=True:C214
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
			End if 
			USE SET:C118("$copiedFrom")
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_TakeFromStockType)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				$_bo_Changed:=True:C214
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
			End if 
			USE SET:C118("$copiedFrom")
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
			If (<>StockAnal)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#$_t_AnalysisCode)
			End if 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				$_bo_Changed:=True:C214
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
			End if 
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
			
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#$_t_HeaderLayer)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				$_bo_Changed:=True:C214
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
			End if 
			$_bo_StillWrong:=True:C214
			
			If ($_bo_Changed)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$CopiedFrom")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				USE SET:C118("$copiedFrom")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				$_r_Sum:=$_r_Sum+(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If ($_r_Sum#$_r_CalledOffQuantity)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
					
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					
				End if 
			Else 
				USE SET:C118("$copiedFrom")
				$_l_CountStockMoveItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_Currency)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<$_l_CountStockMoveItems)
					//the ones with a different cost and currency should go first
					$_r_OverCount:=$_r_CalledOffQuantity-$_r_Max
					//TRACE
					USE SET:C118("$copiedFrom")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#$_t_Currency)
					$_bo_Resolved:=False:C215
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$over")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
						$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						USE SET:C118("$over")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
						$_r_Sum:=$_r_Sum+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						If ($_r_Sum=$_r_OverCount)
							USE SET:C118("$over")
							APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18-$_r_OverCount
							$_bo_Resolved:=True:C214
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						End if 
						
					End if 
					If (Not:C34($_bo_Resolved))
						USE SET:C118("$copiedFrom")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#$_r_CostPrice)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$over")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
							$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							USE SET:C118("$over")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
							$_r_Sum:=$_r_Sum+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							If ($_r_Sum=$_r_OverCount)
								USE SET:C118("$over")
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18-$_r_OverCount
								$_bo_Resolved:=True:C214
								
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							End if 
							
						End if 
					End if 
					If (Not:C34($_bo_Resolved))
						//TRACE
						USE SET:C118("$copiedFrom")
						$_l_CountStockMoveItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_Currency)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice)
						ARRAY LONGINT:C221($_al_StockItemsToKeep; 0)
						ARRAY REAL:C219($_ar_StockItemQuanties; 0)
						$_r_Total:=0
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+$_r_Total)<=$_r_Max)
								APPEND TO ARRAY:C911($_al_StockItemsToKeep; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								APPEND TO ARRAY:C911($_ar_StockItemQuanties; Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								
								$_r_Total:=$_r_Total+Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						USE SET:C118("$copiedFrom")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#$_t_Currency)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+$_r_Total)<=$_r_Max)
								APPEND TO ARRAY:C911($_al_StockItemsToKeep; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								APPEND TO ARRAY:C911($_ar_StockItemQuanties; Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								
								$_r_Total:=$_r_Total+Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						USE SET:C118("$copiedFrom")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#$_r_CostPrice)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+$_r_Total)<=$_r_Max)
								APPEND TO ARRAY:C911($_al_StockItemsToKeep; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								APPEND TO ARRAY:C911($_ar_StockItemQuanties; Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
								
								$_r_Total:=$_r_Total+Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						If ($_r_Total=$_r_Max)
							QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
							DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
							USE SET:C118("$_al_SMIToLoseIDS")
							APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
						Else 
							//TRACE
							QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
							DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
							$_r_Difference:=$_r_Max-$_r_Total
							USE SET:C118("$_al_SMIToLoseIDS")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_Difference)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								//TRACE
								$_bo_Resolved:=False:C215
								ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								For ($_l_Ex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_r_FindQuantity:=$_r_Quantity-$_r_Difference
									$_l_QuantitiesRow:=Find in array:C230($_ar_StockItemQuanties; $_r_FindQuantity)
									If ($_l_QuantitiesRow>0)
										$_r_Total:=$_r_Total-$_ar_StockItemQuanties{$_l_QuantitiesRow}
										$_ar_StockItemQuanties{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_al_StockItemsToKeep{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										$_l_Ex:=9999999
										$_bo_Resolved:=True:C214
									End if 
								End for 
								If ($_bo_Resolved) & ($_r_Total=$_r_Max)
									
									QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
									DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
									USE SET:C118("$_al_SMIToLoseIDS")
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								Else 
									USE SET:C118("$_al_SMIToLoseIDS")
									ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									For ($_l_Ex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_r_FindQuantity:=$_r_Quantity-$_r_Difference
										
										
										For ($_l_Ex2; 1; Size of array:C274($_ar_StockItemQuanties))
											If ($_ar_StockItemQuanties{$_l_Ex2}>=$_r_FindQuantity)
												$_l_QuantitiesRow:=$_l_Ex2
												$_l_Ex2:=Size of array:C274($_ar_StockItemQuanties)
											End if 
										End for 
										If ($_l_QuantitiesRow>0)
											$_r_Total:=$_r_Total-$_ar_StockItemQuanties{$_l_QuantitiesRow}
											$_ar_StockItemQuanties{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											$_al_StockItemsToKeep{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
											$_l_Ex:=9999999
											$_bo_Resolved:=True:C214
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										
									End for 
									If ($_bo_Resolved) & ($_r_Total<=$_r_Max)
										
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
										CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
										DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
										USE SET:C118("$_al_SMIToLoseIDS")
										APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									Else 
										//TRACE
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
										APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									End if 
								End if 
							Else 
								//need to take out something from
								USE SET:C118("$_al_SMIToLoseIDS")
								ARRAY LONGINT:C221($_al_SMIToLoseIDS; 0)
								ARRAY REAL:C219($_ar_ToLoseQuantity; 0)
								For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									APPEND TO ARRAY:C911($_al_SMIToLoseIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									APPEND TO ARRAY:C911($_ar_ToLoseQuantity; Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								SORT ARRAY:C229($_ar_ToLoseQuantity; $_al_SMIToLoseIDS)
								//$0
								
							End if 
							
							
						End if 
						
						
						//we know this will be less than the max
						
					End if 
					
				Else 
					ARRAY LONGINT:C221($_al_StockItemsToKeep; 0)
					ARRAY REAL:C219($_ar_StockItemQuanties; 0)
					$_r_Total:=0
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						If ((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+$_r_Total)<=$_r_Max)
							APPEND TO ARRAY:C911($_al_StockItemsToKeep; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							APPEND TO ARRAY:C911($_ar_StockItemQuanties; Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							
							$_r_Total:=$_r_Total+Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						End if 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					If ($_r_Total=$_r_Max)
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
						DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
						USE SET:C118("$_al_SMIToLoseIDS")
						APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
						[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
						
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						
					Else 
						//TRACE
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
						DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
						$_r_Difference:=$_r_Max-$_r_Total
						USE SET:C118("$_al_SMIToLoseIDS")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_Difference)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							//TRACE
							$_bo_Resolved:=False:C215
							ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							For ($_l_Ex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								$_r_FindQuantity:=$_r_Quantity-$_r_Difference
								$_l_QuantitiesRow:=Find in array:C230($_ar_StockItemQuanties; $_r_FindQuantity)
								If ($_l_QuantitiesRow>0)
									$_r_Total:=$_r_Total-$_ar_StockItemQuanties{$_l_QuantitiesRow}
									$_ar_StockItemQuanties{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_al_StockItemsToKeep{$_l_QuantitiesRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									$_l_Ex:=9999999
									$_bo_Resolved:=True:C214
								End if 
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							If ($_bo_Resolved) & ($_r_Total=$_r_Max)
								
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
								DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
								USE SET:C118("$_al_SMIToLoseIDS")
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
								
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							Else 
								
								USE SET:C118("$_al_SMIToLoseIDS")
								ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								For ($_l_Ex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_r_FindQuantity:=$_r_Quantity-$_r_Difference
									
									
									For ($_l_Ex2; 1; Size of array:C274($_ar_StockItemQuanties))
										If ($_ar_StockItemQuanties{$_l_Ex2}>=$_r_FindQuantity)
											$_r_QuantityRow:=$_l_Ex2
											$_l_Ex2:=Size of array:C274($_ar_StockItemQuanties)
										End if 
									End for 
									If ($_r_QuantityRow>0)
										$_r_Total:=$_r_Total-$_ar_StockItemQuanties{$_l_QuantitiesRow}
										$_ar_StockItemQuanties{$_r_QuantityRow}:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_al_StockItemsToKeep{$_r_QuantityRow}:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										$_l_Ex:=9999999
										$_bo_Resolved:=True:C214
									End if 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									
								End for 
								If ($_bo_Resolved) & ($_r_Total<=$_r_Max)
									
									QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsToKeep)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$toKeep")
									DIFFERENCE:C122("$copiedFrom"; "$ToKeep"; "$_al_SMIToLoseIDS")
									USE SET:C118("$_al_SMIToLoseIDS")
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Total
									
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								Else 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								End if 
							End if 
						Else 
							//need to take out something from
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockProblemIDS{$_l_Index})
							APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockProblemIDS{$_l_Index})
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
							
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							//$0
							
						End if 
						
						
					End if 
				End if 
				
			End if 
		End if 
		
	End for 
	
	
	
	//TRACE
	//now we can valiDate_Properly the current stock and stock levels as there should be no
	READ WRITE:C146([CURRENT_STOCK:62])
	
	//QUERY([STOCK LEVELS]; & ;[STOCK LEVELS]Free Level<0;*)
	//QUERY([STOCK LEVELS]; | ;[STOCK LEVELS]Allocated Level<0)
	//QUERY SELECTION([STOCK LEVELS];[STOCK LEVELS]Stock Type="P")
	//SELECTION TO ARRAY([STOCK LEVELS]Product Code;$_at_ProductCodes)
	
	CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "NotCalled")
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4<0; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P")
	//QUERY WITH ARRAY([CURRENT STOCK]Product Code;$_at_ProductCodes)
	//QUERY([CURRENT STOCK]; & ;[CURRENT STOCK]Stock Type="P")
	
	ALL RECORDS:C47([CURRENT_STOCK:62])
	READ WRITE:C146([STOCK_LEVELS:58])
	COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "ALLCS")
	$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("ALLCS")
		GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_Index)
		While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
			
			DelayTicks(60)
		End while 
		LOAD RECORD:C52([CURRENT_STOCK:62])
		MESSAGE:C88("Checking Current stock for redundant records"+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([CURRENT_STOCK:62])))
		
		$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$add")
		
		$_l_CountStockMoveItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
		$_r_Sum:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		USE SET:C118("$add")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
		$_r_Sum:=$_r_Sum+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
		$_t_TakeFromStockType:=[CURRENT_STOCK:62]Stock_Type:3
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#$_t_TakeFromStockType; *)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			//TRACE
		End if 
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CurrentStockID)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$add")
		$_l_CountStockMoveItems:=$_l_CountStockMoveItems+Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
		$_r_Sum2:=Abs:C99(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		USE SET:C118("$add")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
		
		$_r_Sum2:=$_r_Sum2+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_TakeFromStockType; *)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			//TRACE
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CurrentStockID)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_TakeFromStockType)
			APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0)
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CurrentStockID)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
			APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0)
			
		End if 
		If ($_r_Sum<0)
			$_r_netQuantity:=$_r_Sum2-$_r_Sum
		Else 
			$_r_netQuantity:=$_r_Sum-$_r_Sum2
		End if 
		
		If ($_r_netQuantity#[CURRENT_STOCK:62]Quantity:4)
			If ([CURRENT_STOCK:62]Quantity:4=0)
				[CURRENT_STOCK:62]Quantity:4:=$_r_netQuantity
				//STK_UpdateCurrentStock2011
				SAVE RECORD:C53([CURRENT_STOCK:62])
				
				
			Else 
				[CURRENT_STOCK:62]Quantity:4:=$_r_netQuantity
				//STK_UpdateCurrentStock2011
				SAVE RECORD:C53([CURRENT_STOCK:62])
			End if 
		End if 
		If ($_l_CountStockMoveItems=0)
			ADD TO SET:C119([CURRENT_STOCK:62]; "NotCalled")
		End if 
		//````
		$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
		$_t_TakeFromStockType:=[CURRENT_STOCK:62]Stock_Type:3
		$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
		$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
		$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
		$_t_UniqueStockReference:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10)
		While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
			
			DelayTicks(2)
		End while 
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=$_t_UniqueStockReference)
		While (Not:C34(Check_Locked(->[STOCK_LEVELS:58]; 1)))
			DelayTicks(2)
		End while 
		If (Records in selection:C76([STOCK_LEVELS:58])=0)
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_productCode+"@"; *)
			If (<>StockAnal)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_TakeFromStockType; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
			Else 
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_TakeFromStockType)
			End if 
			$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
			
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
				
				If ($_l_CountStockLevels>0)
					If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
						If ($_l_CountStockLevels=1)
							If (([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode) & ([STOCK_LEVELS:58]Currency_Code:8#""))
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
							QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
						End if 
					Else 
						If ($_l_CountStockLevels=1)
							If ([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode)
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
						End if 
					End if 
					$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
				End if 
			End if 
			$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
				
				If ($_l_CountStockLevels>0)
					If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
						If ($_l_CountStockLevels=1)
							If (([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode) & ([STOCK_LEVELS:58]Layer_Code:9#""))
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
							QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
						End if 
					Else 
						If ($_l_CountStockLevels=1)
							If ([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode)
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
						End if 
					End if 
					$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
				End if 
			End if 
		End if 
		$_l_StockLevelID:=0
		Case of 
			: (Records in selection:C76([STOCK_LEVELS:58])=0)
				
				CREATE RECORD:C68([STOCK_LEVELS:58])
				[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
				[STOCK_LEVELS:58]Stock_Type:2:=$_t_TakeFromStockType
				If (<>StockAnal)
					[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
				End if 
				[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
				[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
				[STOCK_LEVELS:58]Free_Level:3:=0
				[STOCK_LEVELS:58]Free_Cost:5:=0
				[STOCK_LEVELS:58]Allocated_Level:4:=0
				[STOCK_LEVELS:58]Allocated_Cost:6:=0
				STK_ValidateLevel
				If ([STOCK_LEVELS:58]X_ID:10=0)
					[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
				End if 
				$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
				SAVE RECORD:C53([STOCK_LEVELS:58])
				
				AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
				
			: (Records in selection:C76([STOCK_LEVELS:58])>1)
				DELETE SELECTION:C66([STOCK_LEVELS:58])
				CREATE RECORD:C68([STOCK_LEVELS:58])
				[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
				[STOCK_LEVELS:58]Stock_Type:2:=$_t_TakeFromStockType
				If (<>StockAnal)
					[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
				End if 
				[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
				[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
				[STOCK_LEVELS:58]Free_Level:3:=0
				[STOCK_LEVELS:58]Free_Cost:5:=0
				[STOCK_LEVELS:58]Allocated_Level:4:=0
				[STOCK_LEVELS:58]Allocated_Cost:6:=0
				STK_ValidateLevel
				If ([STOCK_LEVELS:58]X_ID:10=0)
					[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
				End if 
				SAVE RECORD:C53([STOCK_LEVELS:58])
				$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
				AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
				
			Else 
				$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
				STK_ValidateLevel
				SAVE RECORD:C53([STOCK_LEVELS:58])
		End case 
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		
		CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
		
		//```
		USE NAMED SELECTION:C332("ALLCS")
		GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_Index)
		[CURRENT_STOCK:62]x_Stock_Level_ID:15:=$_l_StockLevelID
		//STK_UpdateCurrentStock2011
		SAVE RECORD:C53([CURRENT_STOCK:62])
		
		
		NEXT RECORD:C51([CURRENT_STOCK:62])
	End for 
	USE SET:C118("NotCalled")
	DELETE SELECTION:C66([CURRENT_STOCK:62])
	
End if 
ERR_MethodTrackerReturn("STK2010_StockItemsUpdate"; $_t_oldMethodName)
