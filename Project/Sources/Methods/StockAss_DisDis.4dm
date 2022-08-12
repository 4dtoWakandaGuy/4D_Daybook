//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_DisDis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/10/2010 15:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_DisDis")

Menu_Record("StockAss_DisDis"; "Trial Assembly - Display")
DB_t_CurrentFormUsage2:="Display"
StockAss_DisIte
If (OK=1)
	Open_Pro_Window("Trial Disassembly - Display"; 0; 3; ->[STOCK_MOVEMENT_ITEMS:27]; "dStockAss_Dis")
	DIALOG:C40([STOCK_MOVEMENT_ITEMS:27]; "dStockAss_Dis")
	Close_ProWin
End if 
ERR_MethodTrackerReturn("StockAss_DisDis"; $_t_oldMethodName)