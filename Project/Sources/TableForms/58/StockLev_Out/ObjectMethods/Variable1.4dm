If (False:C215)
	//object Name: [STOCK_LEVELS]StockLev Out.Variable1
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].StockLev Out.Variable1"; Form event code:C388)
StockLev_OutTyp
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].StockLev Out.Variable1"; $_t_oldMethodName)
