If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Variable2"; Form event code:C388)
READ WRITE:C146([XInvoiceAllocation:126])

INV_GetAllocations([INVOICES:39]Invoice_Number:1)
DELETE SELECTION:C66([XInvoiceAllocation:126])

INV_DisplayAllocations
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.Variable2"; $_t_oldMethodName)
