//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJunk_5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_at_POAds;0)
	//ARRAY TEXT(STK_at_POMovement;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305($_bo_IncludeInOrder; $2; STK_bo_AllocTypesKnown)
	C_LONGINT:C283($_l_MovementRow; $_l_OrderItemNumber; $1)
	C_REAL:C285($_r_TotalQuantity; $_r_TotalQuantity2; $0)
	C_TEXT:C284($_t_MovementType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDERI_GetAllocated")
If (Count parameters:C259>=1)
	$_l_OrderItemNumber:=$1
Else 
	$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
End if 
If (Count parameters:C259>=2)
	$_bo_IncludeInOrder:=$2
Else 
	$_bo_IncludeInOrder:=True:C214
End if 
If (Not:C34(STK_bo_AllocTypesKnown))
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_POAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_POMovement)
	
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
	
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
	
	STK_bo_AllocTypesKnown:=True:C214
End if 
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_OrderItemNumber)
If (Size of array:C274(STK_at_AllocationAds)>1)
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
Else 
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_AllocationAds{1})
End if 
DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
If (Size of array:C274($_at_StockMovementTypes)>=1)
	$_l_MovementRow:=Find in array:C230($_at_StockMovementTypes; STK_at_allocationMovement{1})
	If ($_l_MovementRow<0)
		$_t_MovementType:=$_at_StockMovementTypes{1}
	Else 
		$_t_MovementType:=$_at_StockMovementTypes{$_l_MovementRow}
	End if 
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_MovementType)
End if 
$_r_TotalQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
If ($_bo_IncludeInOrder)
	If (Size of array:C274(STK_at_POMovement)>0)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_OrderItemNumber)
		If (Size of array:C274(STK_at_POMovement)>1)
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_POAds)
		Else 
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_POAds{1})
		End if 
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
		If (Size of array:C274($_at_StockMovementTypes)>=1)
			$_l_MovementRow:=Find in array:C230($_at_StockMovementTypes; STK_at_POMovement{1})
			If ($_l_MovementRow<0)
				$_t_MovementType:=$_at_StockMovementTypes{1}
			Else 
				$_t_MovementType:=$_at_StockMovementTypes{$_l_MovementRow}
			End if 
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_MovementType)
		End if 
		$_r_TotalQuantity:=$_r_TotalQuantity+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	End if 
End if 


QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=$_l_OrderItemNumber; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
If (Size of array:C274(STK_at_unallocationMovement)=1)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_unallocationMovement{1})
Else 
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_unallocationMovement)
End if 
If (Size of array:C274(STK_at_unAllocationAds)>1)
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; STK_at_unAllocationAds)
Else 
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32=STK_at_unAllocationAds{1})
End if 
$_r_TotalQuantity2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
$0:=$_r_TotalQuantity-$_r_TotalQuantity2
ERR_MethodTrackerReturn("ORDERI_GetAllocated"; $_t_oldMethodName)