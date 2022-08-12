//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_POITEMS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2012 10:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_POItemIDS; 0)
	ARRAY REAL:C219($_ar_MovementItemQuantities; 0)
	ARRAY REAL:C219($_ar_POItemQuantities; 0)
	ARRAY TEXT:C222($_at_MovementCodes; 0)
	C_LONGINT:C283($_l_ItemsIndex; $_l_PoItemRow; $_l_POItemsIndex; $_l_StockItemsIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_POITEMS")
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6="PO")
DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)

QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=0; *)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
//TRACE
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Fix")
For ($_l_StockItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
	USE NAMED SELECTION:C332("$Fix")
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_StockItemsIndex)
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	If ([STOCK_MOVEMENTS:40]MovementSourceReference:18#"")
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[STOCK_MOVEMENTS:40]MovementSourceReference:18)
		[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#"")
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
		QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=0)
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
			APPLY TO SELECTION:C70([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16))
		End if 
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
		QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		
		SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDS; [PURCHASE_ORDERS_ITEMS:169]Quantity:3; $_ar_POItemQuantities)
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDS)
		ARRAY REAL:C219($_ar_MovementItemQuantities; 0)
		ARRAY REAL:C219($_ar_MovementItemQuantities; Size of array:C274($_al_POItemIDS))
		For ($_l_POItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			$_l_PoItemRow:=Find in array:C230($_al_POItemIDS; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
			If ($_l_PoItemRow>0)
				$_ar_MovementItemQuantities{$_l_PoItemRow}:=$_ar_MovementItemQuantities{$_l_PoItemRow}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		USE NAMED SELECTION:C332("$Fix")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_StockItemsIndex)
		For ($_l_ItemsIndex; 1; Size of array:C274($_ar_MovementItemQuantities))
			If ($_ar_MovementItemQuantities{$_l_ItemsIndex}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12<=$_ar_POItemQuantities{$_l_ItemsIndex})
				[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=$_al_POItemIDS{$_l_ItemsIndex}
				$_l_ItemsIndex:=9999999
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			End if 
		End for 
	End if 
	
	
End for 
ERR_MethodTrackerReturn("STK_POITEMS"; $_t_oldMethodName)
