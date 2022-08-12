//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_OutDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:36
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_OutDe")
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([PURCHASE_INVOICES:37]; "Master")
	USE SET:C118("Userset")
	QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9=0)
	If (Records in set:C195("Userset")#Records in selection:C76([PURCHASE_INVOICES:37]))
		Gen_Alert("Please select only Purchases with a Total Due of zero"; "Cancel")
		USE SET:C118("Master")
		vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
	Else 
		Are_You_SureM(" that you want to Delete these Purchase Ledger record(s) permanently")
		If (OK=1)
			DELETE SELECTION:C66([PURCHASE_INVOICES:37])
		End if 
		USE SET:C118("Master")
		Gen_OutNo(->[PURCHASE_INVOICES:37])
	End if 
End if 
ERR_MethodTrackerReturn("Purchases_OutDe"; $_t_oldMethodName)