//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_GetAllocations
	//------------------ Method Notes ------------------
	//this method returns allocations relating to an invoice(or receipt etc)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_State; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_GetAllocations")
//invoices_state
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
If (Count parameters:C259>=2)
	$_l_State:=$2
Else 
	$_l_State:=-4
End if 
If (Count parameters:C259>=1)
	If ($1#"")  //just in case
		
		Case of 
			: ($1="*@") | ($1="C@")
				Case of 
					: ($1="*C@") | ($1="C@") | ($_l_State=-2)
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$1)
					: ($1="*R@") | ($_l_State=-3)
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$1)
					: ($1="*D@") | ($_l_State=-2)
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$1; *)
						QUERY:C277([XInvoiceAllocation:126];  | ; [XInvoiceAllocation:126]xNegativeDepositNumber:10=$1)
				End case 
				
			Else 
				
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$1; *)
				
				//If (Records in selection([XInvoiceAllocation])=0)
				QUERY:C277([XInvoiceAllocation:126];  | ; [XInvoiceAllocation:126]xCreditNumber:3=$1)
				
				
				//End if
				
				
		End case 
	Else 
		REDUCE SELECTION:C351([XInvoiceAllocation:126]; 0)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("INV_GetAllocations"; $_t_oldMethodName)