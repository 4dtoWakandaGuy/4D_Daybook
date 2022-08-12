If (False:C215)
	//object Name: Object Name:      STK_ReviewExpectedDelivery.oButtonCancel
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
	C_BOOLEAN:C305(STK_bo_ReviewCancel; STK_bo_ReviewSave)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_ReviewExpectedDelivery.oButtonCancel"; Form event code:C388)
STK_bo_ReviewSave:=False:C215
STK_bo_ReviewCancel:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ STK_ReviewExpectedDelivery.oButtonCancel"; $_t_oldMethodName)