//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_MovementHeaderIN_LPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2011 21:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_MovementHeaderIN_LPB")


If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Layer:23#[SF_STOCKMOVEMENTS:193]Layer_Code:17)
	[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Layer:23:=[SF_STOCKMOVEMENTS:193]Layer_Code:17
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Analysis:25#[SF_STOCKMOVEMENTS:193]Layer_Code:17)
	[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Analysis:25:=[SF_STOCKMOVEMENTS:193]Layer_Code:17
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Currency:5#[SF_STOCKMOVEMENTS:193]Currency_Code:19)
	[SF_STOCKMOVEMENT_ITEMS:194]Currency:5:=[SF_STOCKMOVEMENTS:193]Currency_Code:19
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27#[SF_STOCKMOVEMENTS:193]Movement_Type:4)
	If ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4<0)
		
		[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)
		[SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28:=True:C214
	End if 
	[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27:=[SF_STOCKMOVEMENTS:193]Movement_Type:4
	If ([MOVEMENT_TYPES:60]Type_Code:1#[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
	End if 
	If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28)
		
		[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22:=[MOVEMENT_TYPES:60]Stock_Plus:3
		[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21:=[MOVEMENT_TYPES:60]Stock_Minus:4
	Else 
		
		[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21:=[MOVEMENT_TYPES:60]Stock_Plus:3
		[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22:=[MOVEMENT_TYPES:60]Stock_Minus:4
	End if 
Else 
	If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28)
		$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
		$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Plus:3
	Else 
		$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
		$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
	End if 
	If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21#$_t_MovementTypeStockAdd) | ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22#$_t_MovementTypeStockSubtract)
		If ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4<0)
			
			[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28:=True:C214
			If ([MOVEMENT_TYPES:60]Type_Code:1#[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27)
			End if 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21#[MOVEMENT_TYPES:60]Stock_Minus:4)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21:=[MOVEMENT_TYPES:60]Stock_Minus:4
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37>0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37:=0
				End if 
			End if 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22#[MOVEMENT_TYPES:60]Stock_Plus:3)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22:=[MOVEMENT_TYPES:60]Stock_Plus:3
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38:=0
				End if 
				If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32:=0
				End if 
			End if 
		Else 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21#[MOVEMENT_TYPES:60]Stock_Plus:3)
				
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21:=[MOVEMENT_TYPES:60]Stock_Plus:3
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37>0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37:=0
				End if 
			End if 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22#[MOVEMENT_TYPES:60]Stock_Minus:4)
				
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22:=[MOVEMENT_TYPES:60]Stock_Minus:4
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38:=0
				End if 
				If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32:=0
				End if 
			End if 
		End if 
	Else 
		If ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4<0)
			[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28:=True:C214
			If ([MOVEMENT_TYPES:60]Type_Code:1#[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27)
			End if 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21#[MOVEMENT_TYPES:60]Stock_Minus:4)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21:=[MOVEMENT_TYPES:60]Stock_Minus:4
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37>0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_Stock_ID:37:=0
				End if 
			End if 
			If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22#[MOVEMENT_TYPES:60]Stock_Plus:3)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22:=[MOVEMENT_TYPES:60]Stock_Plus:3
				If ([SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Current_StockIDPrevious:38:=0
				End if 
				If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32#0)
					[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_PreviousID:32:=0
				End if 
			End if 
			
		End if 
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("STK_MovementHeaderIN_LPB"; $_t_oldMethodName)
