//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InVB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:43
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

$_t_oldMethodName:=ERR_MethodTracker("Orders_InVB")
DBI_MenuDisplayRecords("OrdersInvoice")
ERR_MethodTrackerReturn("Orders_InVB"; $_t_oldMethodName)