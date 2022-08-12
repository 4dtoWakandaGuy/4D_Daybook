If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_In.oLocationNameSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_DeliveryLocCodes;0)
	//ARRAY TEXT(STK_at_DeliveryLocNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; STK_t_DeliveryLocationNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oLocationNameSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		STK_t_DeliveryLocationNAME:=STK_at_DeliveryLocNames{STK_at_DeliveryLocNames}
		[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=STK_at_DeliveryLocCodes{STK_at_DeliveryLocNames}
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oLocationNameSelector"; $_t_oldMethodName)
