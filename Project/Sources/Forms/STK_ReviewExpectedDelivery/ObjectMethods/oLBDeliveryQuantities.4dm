If (False:C215)
	//object Name: Object Name:      STK_ReviewExpectedDelivery.oLBDeliveryQuantities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2012 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_ReviewExpectedDelivery.oLBDeliveryQuantities"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ STK_ReviewExpectedDelivery.oLBDeliveryQuantities"; $_t_oldMethodName)