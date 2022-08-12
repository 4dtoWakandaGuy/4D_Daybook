If (False:C215)
	//Project Form Method Name: dInvoiceItems_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:56
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
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/dInvoiceItems_Sel/{formMethod}"; Form event code:C388)
ERR_MethodTrackerReturn("FM dInvoiceItems_Sel"; $_t_oldMethodName)