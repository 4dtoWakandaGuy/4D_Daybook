//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv Cancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 09:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(INV_bo_newInvoice)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv Cancel")
If ((vAdd=1) & ([INVOICES:39]State:10>0))
	If ((DB_GetLedgerINVAllowCancel) | ([INVOICES:39]State:10=3))
		Gen_Confirm("Cancelling will lose the Invoice & postings?"; "Keep it"; "Cancel")
		If (OK=0)
			CANCEL:C270
		End if 
	Else 
		Gen_Alert("You may not Cancel Invoices that have been posted"; "")
	End if 
	
Else 
	If (INV_bo_newInvoice)
		Gen_Alert("A printed invoice may not be cancelled")
		
	Else 
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("Inv Cancel"; $_t_oldMethodName)