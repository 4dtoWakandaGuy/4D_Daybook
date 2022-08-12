//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch Delete
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
	C_REAL:C285($_r_TotalDue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch Delete")
//Purch Delete
$_r_TotalDue:=[PURCHASE_INVOICES:37]Total_Due:9
If ([PURCHASE_INVOICES:37]State:24=0) | ([PURCHASE_INVOICES:37]State:24=1)
	//unposted so behave as if nothing is due
	$_r_TotalDue:=0
End if 
If ($_r_TotalDue=0)
	Are_You_SureM(" that you want to Delete this Purchase Ledger record permanently")
	If (OK=1)
		CREATE SET:C116([PURCHASE_INVOICES:37]; "Master")
		DB_SaveRecord(->[PURCHASE_INVOICES:37])
		DELETE RECORD:C58([PURCHASE_INVOICES:37])
		CANCEL:C270
		USE SET:C118("Master")
		Gen_InNoF(->[PURCHASE_INVOICES:37])
	End if 
Else 
	Gen_Alert("You cannot delete a Purchase Ledger record until its Total Due is zero."; "Cancel")
End if 
ERR_MethodTrackerReturn("Purch Delete"; $_t_oldMethodName)
