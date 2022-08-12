//%attributes = {}
If (False:C215)
	//Project Method Name:      ZOrders_InvB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 13:26
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

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_InvB")
DBI_MenuDisplayRecords("OrdersInvoice")
ERR_MethodTrackerReturn("ZOrders_InvB"; $_t_oldMethodName)