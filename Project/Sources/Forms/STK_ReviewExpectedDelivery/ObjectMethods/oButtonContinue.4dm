If (False:C215)
	//object Name: Object Name:      STK_ReviewExpectedDelivery.oButtonContinue
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_ReviewExpectedDelivery.oButtonContinue"; Form event code:C388)
STK_bo_ReviewSave:=True:C214
STK_bo_ReviewCancel:=False:C215
CANCEL:C270
ERR_MethodTrackerReturn("OBJ STK_ReviewExpectedDelivery.oButtonContinue"; $_t_oldMethodName)