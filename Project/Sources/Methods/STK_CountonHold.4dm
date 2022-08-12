//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CountonHold
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2015 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AlreadyCountedIDS; 0)
	ARRAY LONGINT:C221($_al_HoldsCountedIDS; 0)
	ARRAY REAL:C219($_ar_AlreadyCountedQuantities; 0)
	ARRAY REAL:C219($_ar_HoldsCountQuantities; 0)
	C_BOOLEAN:C305($_bo_FindStockMoveItems; $2)
	C_LONGINT:C283($_l_AlreadyCountedRow; $_l_HoldsIndex; $1; STK_l_TransactionID)
	C_REAL:C285($_r_Discount; $_r_Sum2; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_CountonHold")
If (Count parameters:C259>=2)
	$_bo_FindStockMoveItems:=$2
Else 
	$_bo_FindStockMoveItems:=False:C215
End if 
If ($_bo_FindStockMoveItems=True:C214)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
End if 
SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AlreadyCountedIDS; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_AlreadyCountedQuantities)
While (Semaphore:C143("HoldsInUse"))
	DelayTicks(2)
End while 
QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3=$1)
If (STK_l_TransactionID>0) & (In transaction:C397)
	QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2#STK_l_TransactionID)
End if 
SELECTION TO ARRAY:C260([STK_TransactionHolds:192]XCalledOffByMovementItemID:5; $_al_HoldsCountedIDS; [STK_TransactionHolds:192]xCalledOffQty:4; $_ar_HoldsCountQuantities)
$_r_Sum2:=0
For ($_l_HoldsIndex; 1; Size of array:C274($_ar_HoldsCountQuantities))
	//if this is added to the transactin holds but already exists the holds quantity must over-ride the stock movement item quantity
	//so we will subtract the quantity. This should only happen if we are altering the quantity on a copied stock movement item
	$_r_Discount:=0
	$_l_AlreadyCountedRow:=Find in array:C230($_al_AlreadyCountedIDS; $_al_HoldsCountedIDS{$_l_HoldsIndex})
	If ($_l_AlreadyCountedRow>0)
		$_r_Discount:=$_ar_AlreadyCountedQuantities{$_l_AlreadyCountedRow}
	End if 
	$_r_Sum2:=($_r_Sum2+$_ar_HoldsCountQuantities{$_l_HoldsIndex})-$_r_Discount
End for 
CLEAR SEMAPHORE:C144("HoldsInUse")

$0:=$_r_Sum2
ERR_MethodTrackerReturn("STK_CountonHold"; $_t_oldMethodName)
