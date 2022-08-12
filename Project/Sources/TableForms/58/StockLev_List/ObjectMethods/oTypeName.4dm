If (False:C215)
	//object Name: [STOCK_LEVELS]StockLev_List.oTypeName
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].StockLev_List.oTypeName"; Form event code:C388)
RELATE ONE:C42([STOCK_LEVELS:58]Stock_Type:2)
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].StockLev_List.oTypeName"; $_t_oldMethodName)
