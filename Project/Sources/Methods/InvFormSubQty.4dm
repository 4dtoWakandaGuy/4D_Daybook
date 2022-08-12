//%attributes = {}
If (False:C215)
	//Project Method Name:      InvFormSubQty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvFormSubQty")
If ([INVOICES_ITEMS:161]Quantity:3#0)
	
	$0:=String:C10([INVOICES_ITEMS:161]Quantity:3)
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("InvFormSubQty"; $_t_oldMethodName)