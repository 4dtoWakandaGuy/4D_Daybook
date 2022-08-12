//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices PostTx
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
	C_TEXT:C284($_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices PostTx")
If ([INVOICES:39]State:10=-1)
	vText:="Proforma"
Else 
	If ([INVOICES:39]Total_Invoiced:5<0)
		vText:="Credit Note"
	Else 
		vText:="Invoice"
	End if 
End if 
ERR_MethodTrackerReturn("Invoices PostTx"; $_t_oldMethodName)