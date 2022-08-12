//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vPu)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_Mod")
Start_Process
If (StockLev_File)
	While (vPu=1)
		StockLev_Sel
		Gen_ModMidAster(Term_StoWT("View Stock Levels"); "Master"; ->[STOCK_LEVELS:58]; ->vPu; Term_StoWT("Stock Levels"); "NoPlus")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("StockLev_Mod"; $_t_oldMethodName)