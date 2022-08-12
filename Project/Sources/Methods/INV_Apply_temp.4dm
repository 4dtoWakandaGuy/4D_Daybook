//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_Apply_temp
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

$_t_oldMethodName:=ERR_MethodTracker("INV_Apply_temp")
READ WRITE:C146([INVOICES:39])
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1="*D@")
APPLY TO SELECTION:C70([INVOICES:39]; INV_CheckRemainder)
ERR_MethodTrackerReturn("INV_Apply_temp"; $_t_oldMethodName)