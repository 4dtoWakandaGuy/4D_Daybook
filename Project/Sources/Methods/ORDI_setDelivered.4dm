//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDI_setDelivered
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/06/2012 00:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DeliveryAds; 0)
	ARRAY TEXT:C222($_at_DeliveryMovement; 0)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_setDelivered")

QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_DeliveryAds; [MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovement)
If (Size of array:C274($_at_DeliveryMovement)>0)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
	If (Size of array:C274($_at_DeliveryMovement)>1)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovement)
	Else 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_at_DeliveryMovement{1})
	End if 
	$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	If ($_r_Sum>[ORDER_ITEMS:25]Quantity:3)
		[ORDER_ITEMS:25]Delivered:51:=[ORDER_ITEMS:25]Quantity:3
	Else 
		[ORDER_ITEMS:25]Delivered:51:=$_r_Sum
	End if 
End if 
ERR_MethodTrackerReturn("ORDI_setDelivered"; $_t_oldMethodName)
