//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InLPSt
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
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPSt")
//See Also Invoices Out
Case of 
	: ([INVOICES:39]State:10=-3)
		vStatus:="Receipt"
	: ([INVOICES:39]State:10=-2)
		vStatus:="Deposit"
	: ([INVOICES:39]State:10=-1)
		vStatus:="Proforma"
	: ([INVOICES:39]State:10=0)
		vStatus:="Not Posted"
	: ([INVOICES:39]State:10=1)
		vStatus:="Batched"
	: ([INVOICES:39]State:10=2)
		vStatus:="Posted"
	: ([INVOICES:39]State:10=3)
		vStatus:="SL Only"
End case 
ERR_MethodTrackerReturn("Invoices_InLPSt"; $_t_oldMethodName)