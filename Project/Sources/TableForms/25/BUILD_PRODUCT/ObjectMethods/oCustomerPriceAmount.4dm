If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oCustomerPriceAmount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2010 06:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(OI_bo_CustomerPriceSet)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oCustomerPriceAmount"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		OI_bo_CustomerPriceSet:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oCustomerPriceAmount"; $_t_oldMethodName)
