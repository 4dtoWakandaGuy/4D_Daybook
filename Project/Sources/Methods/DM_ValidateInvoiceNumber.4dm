//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateInvoiceNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName; $0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateInvoiceNumber")
$0:=$3
ERR_MethodTrackerReturn("DM_ValidateInvoiceNumber"; $_t_oldMethodName)