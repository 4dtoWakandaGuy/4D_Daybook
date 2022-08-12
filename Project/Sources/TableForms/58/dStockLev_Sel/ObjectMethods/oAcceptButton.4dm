If (False:C215)
	//object Name: [STOCK_LEVELS]dStockLev_Sel.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable2"; Form event code:C388)
WS_bo_InsearchScreen:=False:C215
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable2"; $_t_oldMethodName)