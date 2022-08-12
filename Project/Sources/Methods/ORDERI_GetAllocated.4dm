//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDERI_GetAllocated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2012 00:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AllocationIDS; 0)
	ARRAY LONGINT:C221($_al_CopiedFromIDS; 0)
	ARRAY LONGINT:C221($_al_Investigate; 0)
	ARRAY REAL:C219($_ar_MovedQuantites; 0)
	ARRAY REAL:C219($_ar_Residuals; 0)
	ARRAY TEXT:C222($_at_DeliveryAdstotypes; 0)
	ARRAY TEXT:C222($_at_DeliveryMovementTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_at_DeliveryAds;0)
	//ARRAY TEXT(STK_at_DeliveryMovement;0)
	//ARRAY TEXT(STK_at_POAds;0)
	//ARRAY TEXT(STK_at_POMovement;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305($_bo_IncludeinOrder; $2; STK_bo_AllocTypesKnown)
	C_LONGINT:C283($_l_AllocationRow; $_l_Index; $_l_MovementTypeRow; $_l_MoveTypeIndex; $_l_OrderItemNumber; $1)
	C_REAL:C285($_r_DIscount; $_r_Sum; $_r_Sum2; $0)
	C_TEXT:C284($_t_MovementType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDERI_GetAllocated")

If (Count parameters:C259>=1)
	$_l_OrderItemNumber:=$1
Else 
	$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
End if 
$0:=0
If ($_l_OrderItemNumber>0)
	
	If (Count parameters:C259>=2)
		$_bo_IncludeinOrder:=$2
	Else 
		$_bo_IncludeinOrder:=True:C214
	End if 
	If (Not:C34(STK_bo_AllocTypesKnown))
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_POAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_POMovement)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_DeliveryAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_DeliveryMovement)
		For ($_l_MoveTypeIndex; Size of array:C274(STK_at_DeliveryMovement); 1; -1)
			$_l_MovementTypeRow:=Find in array:C230(STK_at_allocationMovement; STK_at_DeliveryMovement{$_l_MoveTypeIndex})
			If ($_l_MovementTypeRow>0)
				DELETE FROM ARRAY:C228(STK_at_DeliveryMovement; $_l_MoveTypeIndex)
				DELETE FROM ARRAY:C228(STK_at_DeliveryAds; $_l_MoveTypeIndex)
			End if 
		End for 
		STK_bo_AllocTypesKnown:=True:C214
	End if 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_OrderItemNumber)
	If (Size of array:C274(STK_at_allocationMovement)>0)
		If (Size of array:C274(STK_at_AllocationAds)>1)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s1")
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_allocationMovement)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)  // only if there are no ALO records look for ISO records
				USE SET:C118("$s1")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
			End if 
			If (Size of array:C274(STK_at_DeliveryMovement)>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$sa")
				If (Size of array:C274(STK_at_DeliveryMovement)>1)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_DeliveryMovement)
				Else 
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_DeliveryMovement{1})
				End if 
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$sa2")
					DIFFERENCE:C122("$sa"; "$sa2"; "$sa")
					USE SET:C118("$sa")
					CLEAR SET:C117("$sa2")
				Else 
					USE SET:C118("$sa")
				End if 
			End if 
		Else 
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s1")
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_allocationMovement{1})
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)  // only if there are no ALO records look for ISO records
				USE SET:C118("$s1")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_AllocationAds{1})
			End if 
			If (Size of array:C274(STK_at_DeliveryMovement)>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$sa")
				If (Size of array:C274(STK_at_DeliveryMovement)>1)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_DeliveryMovement)
				Else 
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_DeliveryMovement{1})
				End if 
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$sa2")
					DIFFERENCE:C122("$sa"; "$sa2"; "$sa")
					USE SET:C118("$sa")
					CLEAR SET:C117("$sa2")
				Else 
					USE SET:C118("$sa")
				End if 
			End if 
		End if 
	Else 
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
	End if 
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
	If (Size of array:C274($_at_StockMovementTypes)>=1)
		$_l_MovementTypeRow:=Find in array:C230($_at_StockMovementTypes; STK_at_allocationMovement{1})
		If ($_l_MovementTypeRow<0)
			$_t_MovementType:=$_at_StockMovementTypes{1}
		Else 
			$_t_MovementType:=$_at_StockMovementTypes{$_l_MovementTypeRow}
		End if 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_MovementType)
	Else 
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
	End if 
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AllocationIDS; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; $_ar_MovedQuantites; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_Residuals)
	
	$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	If ($_bo_IncludeinOrder)
		If (Size of array:C274(STK_at_POMovement)>0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_OrderItemNumber)
			If (Size of array:C274(STK_at_POMovement)>1)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_POAds)
			Else 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_POAds{1})
			End if 
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
			If (Size of array:C274($_at_StockMovementTypes)>=1)
				$_l_MovementtypeRow:=Find in array:C230($_at_StockMovementTypes; STK_at_POMovement{1})
				If ($_l_MovementtypeRow<0)
					$_t_MovementType:=$_at_StockMovementTypes{1}
				Else 
					$_t_MovementType:=$_at_StockMovementTypes{$_l_MovementtypeRow}
				End if 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_MovementType)
			End if 
			$_r_Sum:=$_r_Sum+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
		End if 
	End if 
	
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=$_l_OrderItemNumber; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
	If (Size of array:C274(STK_at_unallocationMovement)>0)
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
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_CopiedFromIDS)
		
	Else 
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		ARRAY LONGINT:C221($_al_CopiedFromIDS; 0)
	End if 
	$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	$0:=$_r_Sum-$_r_Sum2
	ARRAY LONGINT:C221($_al_Investigate; 0)
	For ($_l_Index; 1; Size of array:C274($_al_AllocationIDS))
		If ($_ar_Residuals{$_l_Index}<$_ar_MovedQuantites{$_l_Index})
			$_l_AllocationRow:=Find in array:C230($_al_CopiedFromIDS; $_al_AllocationIDS{$_l_Index})
			If ($_l_AllocationRow<0)
				APPEND TO ARRAY:C911($_al_Investigate; $_al_AllocationIDS{$_l_Index})
				
			End if 
		End if 
	End for 
	If (Size of array:C274($_al_Investigate)>0)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_DeliveryAdstotypes; [MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
		$_r_DIscount:=0
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_Investigate)
		For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			If (Find in array:C230($_at_DeliveryMovementTypes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)<0)
				$_r_DIscount:=$_r_DIscount+Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			End if 
		End for 
		$0:=$0-$_r_DIscount
		
	End if 
	
Else 
	$0:=[ORDER_ITEMS:25]Allocated:28
End if 
ERR_MethodTrackerReturn("ORDERI_GetAllocated"; $_t_oldMethodName)
