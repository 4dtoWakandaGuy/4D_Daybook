//%attributes = {}
If (False:C215)
	//Project Method Name:      Inv_Delete
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

$_t_oldMethodName:=ERR_MethodTracker("Inv_Delete")
//Invoices xDelete
//Case of
// ([INVOICES]State=-3)
//vStatus:="Receipt"
// ([INVOICES]State=-2)
//vStatus:="Deposit"
// ([INVOICES]State=-1)
//vStatus:="Proforma"
// ([INVOICES]State=0)
//vStatus:="Not Posted"
// ([INVOICES]State=1)
//vStatus:="Batched"
// ([INVOICES]State=2)
//vStatus:="Posted"
// ([INVOICES]State=3)
//vStatus:="SL Only"
//End case
If (([INVOICES:39]Total_Due:7#0) | (([INVOICES:39]State:10#0) & ([INVOICES:39]State:10#-1)))
	Gen_Alert("You may delete only Posted Sales Ledger records with Total Due zero or are not po"+"sted."; "Cancel")
Else 
	Are_You_SureM(" that you want to delete this Sales Ledger record permanently")
	If (OK=1)
		CREATE SET:C116([INVOICES:39]; "IMaster")
		DB_DeletionControl(->[INVOICES:39])
		
		DELETE RECORD:C58([INVOICES:39])
		CANCEL:C270
		USE SET:C118("IMaster")
		Gen_InNoF(->[INVOICES:39])
	End if 
End if 
ERR_MethodTrackerReturn("Inv_Delete"; $_t_oldMethodName)