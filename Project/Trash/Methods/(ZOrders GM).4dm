//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZOrders_GM
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

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_GM")
ZProc("Orders_GM"; DB_ProcessMemoryinit(2); "Gross Margin Report")
ERR_MethodTrackerReturn("ZOrders_GM"; $_t_oldMethodName)