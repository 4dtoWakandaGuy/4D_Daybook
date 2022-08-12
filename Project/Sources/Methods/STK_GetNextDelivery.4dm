//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetNextDelivery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PoItemIDS; 0)
	ARRAY TEXT:C222($_at_PoMovementTypes; 0)
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetNextDelivery")

$0:=!00-00-00!
//TRACE

If ([ORDER_ITEMS:25]Item_Number:27#0) & ([ORDER_ITEMS:25]Delivered:51<[ORDER_ITEMS:25]Quantity:3)
	If ([ORDER_ITEMS:25]Purchase_Order_Number:18#"")
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6=[ORDER_ITEMS:25]Item_Number:27)
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>=1)
			SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_PoItemIDS)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PoMovementTypes)
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_PoItemIDS)
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PoMovementTypes)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44>!00-00-00!)
			
			
			ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; >)
			$0:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetNextDelivery"; $_t_oldMethodName)
