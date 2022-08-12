If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]dStockAss_Dis
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


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].dStockAss_Dis"; Form event code:C388)
StockAss_dInLP
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].dStockAss_Dis"; $_t_oldMethodName)
