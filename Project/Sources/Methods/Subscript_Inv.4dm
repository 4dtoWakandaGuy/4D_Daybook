//%attributes = {}
If (False:C215)
	//Project Method Name:      Subscript_Inv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:46
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

$_t_oldMethodName:=ERR_MethodTracker("Subscript_Inv")
DBI_MenuDisplayRecords("SubscriptionsInvoice")
ERR_MethodTrackerReturn("Subscript_Inv"; $_t_oldMethodName)