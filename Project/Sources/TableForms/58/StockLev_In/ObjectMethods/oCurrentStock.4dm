If (False:C215)
	//object Name: [STOCK_LEVELS]StockLev_in.oCurrentStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2011 14:11
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].StockLev_in.oCurrentStock"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].StockLev_in.oCurrentStock"; $_t_oldMethodName)