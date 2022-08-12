//%attributes = {}
If (False:C215)
	//Project Method Name:      PI_GetStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/05/2010 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PI_GetStatus")
If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
	Case of 
		: ([PURCHASE_INVOICES:37]State:24=-3)
			$_t_Status:="Payment"
		: ([PURCHASE_INVOICES:37]State:24=-2)
			$_t_Status:="Pre-Payment"
		: ([PURCHASE_INVOICES:37]State:24=-1)
			$_t_Status:=""
		: ([PURCHASE_INVOICES:37]State:24=0)
			$_t_Status:="Not Posted"
		: ([PURCHASE_INVOICES:37]State:24=1)
			$_t_Status:="Batched"
		: ([PURCHASE_INVOICES:37]State:24=2)
			$_t_Status:="Posted"
		: ([PURCHASE_INVOICES:37]State:24=3)
			$_t_Status:="PL Only"
	End case 
	$0:=$_t_Status
	
Else 
	
	$0:=$_t_Status
	
	
End if 
ERR_MethodTrackerReturn("PI_GetStatus"; $_t_oldMethodName)
