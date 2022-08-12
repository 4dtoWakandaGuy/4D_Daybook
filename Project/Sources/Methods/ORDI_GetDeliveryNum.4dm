//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDI_GetDeliveryNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DeliveryReferences; 0)
	ARRAY TEXT:C222($_at_DeliveryTypeMovements; 0)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_GetDeliveryNum")
If ([ORDER_ITEMS:25]Delivered:51>0)
	If ([ORDER_ITEMS:25]Delivery_Number:49="")
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryTypeMovements)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryTypeMovements)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; $_at_DeliveryReferences)
			If (Size of array:C274($_at_DeliveryReferences)>1)
				$0:=[ORDER_ITEMS:25]Order_Code:1+"/"+"M"
			Else 
				$0:=$_at_DeliveryReferences{1}
			End if 
		Else 
			$0:=[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45
			
		End if 
	Else 
		$0:=[ORDER_ITEMS:25]Delivery_Number:49
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("ORDI_GetDeliveryNum"; $_t_oldMethodName)
