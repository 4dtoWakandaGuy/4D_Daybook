//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_Hist
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: StockI_Hist
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

$_t_oldMethodName:=ERR_MethodTracker("StockI_Hist")
DBI_MenuDisplayRecords("Stock ItemsHistory")
ERR_MethodTrackerReturn("StockI_Hist"; $_t_oldMethodName)