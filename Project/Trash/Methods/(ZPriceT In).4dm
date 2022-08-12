//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZPriceT_in
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

$_t_oldMethodName:=ERR_MethodTracker("ZPriceT_in")
ZProc("PriceT_in"; DB_ProcessMemoryinit(2); "Enter to Price Table")
ERR_MethodTrackerReturn("ZPriceT_in"; $_t_oldMethodName)