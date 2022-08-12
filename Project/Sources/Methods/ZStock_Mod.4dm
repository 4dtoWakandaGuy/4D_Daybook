//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStock_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 15:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZStock_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))

//ZProc ("Stock_Mod";◊K2;Term_StoWT ("View Stock Items"))
ERR_MethodTrackerReturn("ZStock_Mod"; $_t_oldMethodName)