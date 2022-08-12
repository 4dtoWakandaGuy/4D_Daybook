//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdI_GetDeliveryDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DeliveryDates; 0)
	ARRAY TEXT:C222($_at_DeliveryTypeMovements; 0)
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdI_GetDeliveryDate")

$0:=!00-00-00!
If ([ORDER_ITEMS:25]Delivered:51>0)
	If ([ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryTypeMovements)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryTypeMovements)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_DeliveryDates)
			If (Size of array:C274($_ad_DeliveryDates)>1)
				$0:=!00-00-00!
			Else 
				$0:=$_ad_DeliveryDates{1}
			End if 
		Else 
			$0:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
			
		End if 
	Else 
		$0:=[ORDER_ITEMS:25]Delivery_Date:11
	End if 
Else 
	$0:=!00-00-00!
End if 
ERR_MethodTrackerReturn("OrdI_GetDeliveryDate"; $_t_oldMethodName)
