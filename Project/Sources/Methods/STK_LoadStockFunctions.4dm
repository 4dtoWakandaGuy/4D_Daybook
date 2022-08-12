//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_LoadStockFunctions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_MovementUsages;0)
	//ARRAY TEXT(STK_at_MovementUsages;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_LoadStockFunctions")

ARRAY TEXT:C222(STK_at_MovementUsages; 0)
ARRAY LONGINT:C221(STK_al_MovementUsages; 0)

If (<>DB_bo_NewStockActive)
End if 
ERR_MethodTrackerReturn("STK_LoadStockFunctions"; $_t_oldMethodName)