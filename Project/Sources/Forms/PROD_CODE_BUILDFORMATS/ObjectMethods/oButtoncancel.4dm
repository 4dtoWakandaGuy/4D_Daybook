If (False:C215)
	//object Name: Object Name:      PROD_CODE_BUILDFORMATS.oButtoncancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2010 19:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_CancelEdits)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROD_CODE_BUILDFORMATS.oButtoncancel"; Form event code:C388)

PC_bo_CancelEdits:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ PROD_CODE_BUILDFORMATS.oButtoncancel"; $_t_oldMethodName)