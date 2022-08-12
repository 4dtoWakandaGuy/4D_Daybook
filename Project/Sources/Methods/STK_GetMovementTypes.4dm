//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetMovementTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:54`Method: STK_GetMovementTypes
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetMovementTypes")

//$0:=0
$0:=""

If (<>DB_bo_NewStockActive)
	
End if 
ERR_MethodTrackerReturn("STK_GetMovementTypes"; $_t_oldMethodName)
