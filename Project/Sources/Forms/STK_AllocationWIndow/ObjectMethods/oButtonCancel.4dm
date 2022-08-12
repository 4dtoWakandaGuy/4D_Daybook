If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oButtonCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(STK_bo_DoAllocate; STK_bo_unAllocate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oButtonCancel"; Form event code:C388)
STK_bo_DoAllocate:=False:C215
STK_bo_unAllocate:=False:C215

CANCEL:C270
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oButtonCancel"; $_t_oldMethodName)