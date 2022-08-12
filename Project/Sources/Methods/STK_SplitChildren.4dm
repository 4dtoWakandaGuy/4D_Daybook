//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SplitChildren
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/07/2011 17:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ForceRecalc; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID2; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentIDS; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentIDS2; 0)
	ARRAY LONGINT:C221($_al_UpdateCalledOff; 0)
	ARRAY REAL:C219($_ar_SplitQuantities; 0)
	ARRAY REAL:C219($_ar_SplitQuantity2; 0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CameFromAllocation; $_bo_CameFromUnallocation; $_bo_IsUNallocation; $_bo_New; $_bo_NoSplit; $_bo_SplitChildren)
	C_LONGINT:C283($_l_CopiedFromRow; $_l_CopyFromID; $_l_CurrentID; $_l_CurrentRecord; $_l_Index; $_l_RecordsinSelection; $_l_Retries; $_l_SplitChildrenof; $_l_SplitChildrenof2; $_l_SplitCSelectedRecord; $_l_SplitElement)
	C_LONGINT:C283($_l_SplitSetID; $_l_StockItemRecord; $_l_TakeFromCSID; $1; STK_l_SplitID; STK_l_TransactionID)
	C_POINTER:C301($2; $3; $4)
	C_REAL:C285($_r_Quantity; $_r_ReduceUnallocationQuantity; $_r_RemainingOnElement; $_r_Sum)
	C_TEXT:C284($_t_oldMethodName; $_t_SplitSet)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SplitChildren")

$_l_SplitChildrenof:=$1
ARRAY REAL:C219($_ar_SplitQuantities; 0)
ARRAY LONGINT:C221($_al_SplitChildrenParentIDS; 0)
ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
COPY ARRAY:C226($2->; $_ar_SplitQuantities)
COPY ARRAY:C226($3->; $_al_SplitChildrenParentIDS)
COPY ARRAY:C226($4->; $_al_SplitChildrenFromCSID)
ARRAY REAL:C219($_ar_SplitQuantity2; 0)
$_l_SplitSetID:=AA_GetNextID(->STK_l_SplitID)
$_t_SplitSet:=String:C10($_l_SplitSetID)
ARRAY LONGINT:C221($_al_SplitChildrenParentIDS2; 0)
ARRAY LONGINT:C221($_al_SplitChildrenFromCSID2; 0)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SplitChildrenof)
CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; $_t_SplitSet)
$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
$_l_SplitElement:=1
//QUERY([STOCK ITEMS];[STOCK ITEMS]x_ID=$_al_SplitChildrenParentIDS{$_l_SplitElement})
$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
$_r_RemainingOnElement:=$_ar_SplitQuantities{1}
ARRAY LONGINT:C221($_al_UpdateCalledOff; 0)
$_bo_New:=False:C215
ARRAY LONGINT:C221($_al_ForceRecalc; 0)
For ($_l_SplitCSelectedRecord; 1; $_l_RecordsinSelection)
	$_bo_New:=False:C215
	USE SET:C118($_t_SplitSet)
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SplitCSelectedRecord)
	$_l_Retries:=0
	While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(60*$_l_Retries)
	End while 
	
	ARRAY REAL:C219($_ar_SplitQuantity2; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentIDS2; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID2; 0)
	$_bo_SplitChildren:=False:C215
	$_bo_NoSplit:=True:C214
	If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0)
		$_bo_SplitChildren:=True:C214
		$_l_SplitChildrenof2:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
	End if 
	
	$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	ARRAY LONGINT:C221($_al_ForceRecalc; 0)
	
	Repeat 
		If ($_r_Quantity>$_r_RemainingOnElement)
			If ($_r_RemainingOnElement>0)
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_RemainingOnElement
			Else 
				If ($_r_RemainingOnElement=0) & ($_l_SplitElement>Size of array:C274($_al_SplitChildrenParentIDS))
					//TRACE
				End if 
			End if 
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Quantity
		End if 
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
		
		$_r_ReduceUnallocationQuantity:=0
		$_bo_IsUNallocation:=([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0)
		$_r_Quantity:=$_r_Quantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
			$_l_CopiedFromRow:=Find in array:C230($_al_UpdateCalledOff; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			If ($_l_CopiedFromRow<0)
				APPEND TO ARRAY:C911($_al_UpdateCalledOff; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			End if 
		End if 
		If ($_l_SplitElement<=Size of array:C274($_ar_SplitQuantities))
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_SplitChildrenParentIDS{$_l_SplitElement}
		Else 
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
			$_l_CopiedFromRow:=Find in array:C230($_al_UpdateCalledOff; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			If ($_l_CopiedFromRow<0)
				APPEND TO ARRAY:C911($_al_UpdateCalledOff; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			End if 
		End if 
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
			$_bo_New:=True:C214
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		End if 
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		If ($_bo_New)
			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			$_bo_New:=False:C215
		Else 
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		End if 
		
		If ($_l_SplitElement<=Size of array:C274($_ar_SplitQuantities))
			//[STOCK ITEMS]xAddtoCurrentStockID:=$_al_SplitChildrenFromCSID{$_l_SplitElement}
		Else 
			//[STOCK ITEMS]xAddtoCurrentStockID:=0
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#0) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
			If ([CURRENT_STOCK:62]Item_Number:5#[STOCK_MOVEMENT_ITEMS:27]Item_Number:8) & ([CURRENT_STOCK:62]Item_Number:5#0)
				//TRACE
			End if 
		End if 
		Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0) & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
			//TRACE
		End if 
		If ($_bo_SplitChildren)
			APPEND TO ARRAY:C911($_ar_SplitQuantity2; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			APPEND TO ARRAY:C911($_al_SplitChildrenParentIDS2; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID2; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
			
		End if 
		//````
		$_r_RemainingOnElement:=$_r_RemainingOnElement-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		If ($_r_RemainingOnElement<=0)
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
				$_l_CurrentRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
				$_l_CurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CopyFromID)
				$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_CopyFromID))
				
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
				$_bo_CameFromAllocation:=([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
				$_bo_CameFromUnallocation:=([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0)
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(60*$_l_Retries)
				End while 
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
				If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
					If ($_bo_CameFromAllocation) & ($_bo_IsUNallocation)
						$_r_ReduceUnallocationQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
						//TRACE
					End if 
					If ($_bo_CameFromUnallocation) & ($_bo_IsUNallocation)
					End if 
					
				End if 
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				//DB_SaveRecord (->[STOCK ITEMS])
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CurrentID)
				
				$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
				While (Semaphore:C143("HoldsInUse"))
					DelayTicks(2)
				End while 
				QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3=$_l_CurrentID)
				If (STK_l_TransactionID>0) & (In transaction:C397)
					QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2#STK_l_TransactionID)
				End if 
				$_r_Sum:=$_r_Sum+Sum:C1([STK_TransactionHolds:192]xCalledOffQty:4)
				CLEAR SEMAPHORE:C144("HoldsInUse")
				GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentRecord)
				If ($_r_ReduceUnallocationQuantity>0)
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ReduceUnallocationQuantity
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				End if 
				If ($_bo_CameFromUnallocation) & ($_bo_IsUNallocation)
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=0
					
				End if 
				$_r_ReduceUnallocationQuantity:=0
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
				If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
					
					//TRACE
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				
			End if 
			$_l_StockItemRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
			//QUERY([STOCK ITEMS];[STOCK ITEMS]x_ID=$_al_SplitChildrenParentIDS{$_l_SplitElement})
			//$_l_TakeFromCSID:=[STOCK ITEMS]xAddtoCurrentStockID
			//GOTO RECORD([STOCK ITEMS];$_l_StockItemRecord)
			$_l_SplitElement:=$_l_SplitElement+1
			If ($_l_SplitElement<=Size of array:C274($_ar_SplitQuantities))
				$_r_RemainingOnElement:=$_ar_SplitQuantities{$_l_SplitElement}
			Else 
				$_r_RemainingOnElement:=0
			End if 
		End if 
		
		If ($_r_Quantity>0)
			$_bo_New:=True:C214
			$_bo_NoSplit:=False:C215
			STK_ItemDuplicate
			APPEND TO ARRAY:C911($_al_ForceRecalc; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			$_bo_SplitChildren:=False:C215
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		End if 
	Until ($_r_Quantity<=0)
	[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
		$_l_CurrentRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
		$_l_CurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		$_l_CopyFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CopyFromID)
		$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_CopyFromID))
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopyFromID)
		$_bo_CameFromAllocation:=([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
		$_bo_CameFromUnallocation:=([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25#0)
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(60*$_l_Retries)
		End while 
		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
		//TRACE
		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
		If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
			If ($_bo_CameFromAllocation) & ($_bo_IsUNallocation)
				$_r_ReduceUnallocationQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				//TRACE
			End if 
			
		End if 
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
		//DB_SaveRecord (->[STOCK ITEMS])
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CurrentID)
		$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_CurrentID))
		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentRecord)
		If ($_r_ReduceUnallocationQuantity>0)
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ReduceUnallocationQuantity
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		End if 
		If ($_bo_CameFromUnallocation) & ($_bo_IsUNallocation)
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=0
			
		End if 
		$_r_ReduceUnallocationQuantity:=0
		
		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
		//TRACE
		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
		
		If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
			//TRACE
		End if 
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
		
	End if 
	If ($_bo_SplitChildren) & (Not:C34($_bo_NoSplit))
		If ($_l_SplitChildrenof2#$1)
			STK_SplitChildren($_l_SplitChildrenof2; ->$_ar_SplitQuantity2; ->$_al_SplitChildrenParentIDS2; ->$_al_SplitChildrenFromCSID2)
		End if 
	End if 
	
	
	
End for 
If (Size of array:C274($_al_ForceRecalc)>0)
	For ($_l_Index; 1; Size of array:C274($_al_ForceRecalc))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ForceRecalc{$_l_Index})
		STK_UpdateCalledOffQuantity
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	End for 
End if 
If (Size of array:C274($_al_UpdateCalledOff)>0)
	For ($_l_Index; 1; Size of array:C274($_al_UpdateCalledOff))
		If ($_al_UpdateCalledOff{$_l_Index}>0)
			STK_UpdateCalledOffQuantity(-$_al_UpdateCalledOff{$_l_Index})
			
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("STK_SplitChildren"; $_t_oldMethodName)
