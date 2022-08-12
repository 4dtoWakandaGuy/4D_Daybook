//%attributes = {}
If (False:C215)
	//Project Method Name:      ZProd_Price_PL
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZProd_Price_PL")
ZProc("Prod_Price_PL"; DB_ProcessMemoryinit(1); "Price List")
ERR_MethodTrackerReturn("ZProd_Price_PL"; $_t_oldMethodName)
