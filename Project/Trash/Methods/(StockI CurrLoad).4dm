//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI CurrLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 16:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ItemNumbers; 0)
	ARRAY LONGINT:C221($_al_StockIDS; 0)
	ARRAY LONGINT:C221($_al_StockNos; 0)
	ARRAY LONGINT:C221($_al_TaskFromCSIDS; 0)
	ARRAY REAL:C219($_ar_CostPrices; 0)
	ARRAY REAL:C219($_ar_StockItemQuantities; 0)
	ARRAY TEXT:C222($_at_LocationCodes; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	C_LONGINT:C283($_l_StockItemID; $_l_StockItemIndex)
	C_REAL:C285($_r_MaxQuantity; $_r_MaxQuantity2; $_r_QuantityCopied)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI CurrLoad")
//StockI CurrLoad
MESSAGES OFF:C175
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
$_r_MaxQuantity:=[CURRENT_STOCK:62]Quantity:4
MESSAGES ON:C181

QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
$_r_MaxQuantity2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
If ($_r_MaxQuantity2>$_r_MaxQuantity)
	$_r_MaxQuantity2:=$_r_MaxQuantity
End if 
SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockIDS; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_CostPrices; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationCodes; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_StockItemQuantities; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9; $_al_StockNos; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_TaskFromCSIDS)

//FIRST RECORD([CURRENT STOCK])
$_r_QuantityCopied:=0
For ($_l_StockItemIndex; 1; Size of array:C274($_al_StockIDS))
	If ($_r_QuantityCopied<$_r_MaxQuantity2)
		
		CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
		[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_CostPrices{$_l_StockItemIndex}
		[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
		[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_at_SerialNumbers{$_l_StockItemIndex}
		[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_LocationCodes{$_l_StockItemIndex}
		If ((($_ar_StockItemQuantities{$_l_StockItemIndex})+$_r_QuantityCopied)<$_r_MaxQuantity2)
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_StockItemQuantities{$_l_StockItemIndex}
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_MaxQuantity2-$_r_QuantityCopied
		End if 
		$_r_QuantityCopied:=$_r_QuantityCopied+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
		[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=$_al_StockNos{$_l_StockItemIndex}
		[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_ItemNumbers{$_l_StockItemIndex}
		If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
			[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
			[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
		Else 
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
			[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
			[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
		End if 
		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_TaskFromCSIDS{$_l_StockItemIndex}
		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockIDS{$_l_StockItemIndex}
		$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockIDS{$_l_StockItemIndex})
		//STK_UpdateCalledOffQuantity
		//STK_UpdateCurrentStock2011
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID)
		
		
		AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		If ($_r_QuantityCopied>=$_r_MaxQuantity2)
			$_l_StockItemIndex:=Size of array:C274($_al_StockIDS)
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("StockI CurrLoad"; $_t_oldMethodName)
