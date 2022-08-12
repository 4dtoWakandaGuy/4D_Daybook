//%attributes = {}
If (False:C215)
	//Project Method Name:      Term_SLPLWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermRP)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseTableName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term_SLPLWT")
$_t_PurchaseTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[PURCHASE_INVOICES:37]); $_t_PurchaseTableName)

If (False:C215)
	If (<>TermRP)
		$0:=Replace string:C233($1; "Sales Ledger"; "Accounts Receivable")
		//$0:=Replace string($0;"Sales";"Receivables")
		$0:=Replace string:C233($0; "Credit Note"; "Credit Memo")
		$0:=Replace string:C233($0; "Adhoc CNs"; "Adhoc CMs")
		$0:=Replace string:C233($0; "Debtor"; "Receivable")
		$0:=Replace string:C233($0; "SL "; "AR ")
		
		$0:=Replace string:C233($0; "Purchase Ledger"; "Accounts Payable")
		$0:=Replace string:C233($0; "Purchase Inv"; "Inv")
		$0:=Replace string:C233($0; "Purchase Credit"; "Credit")
		$0:=Replace string:C233($0; "Purchase Pay"; "Pay")
		$0:=Replace string:C233($0; "Purchase Pre"; "Pre")
		$0:=Replace string:C233($0; "Purchase CNs"; "Credit Memos")
		$0:=Replace string:C233($0; "Purchases"; "Payables")
		$0:=Replace string:C233($0; "Creditor"; "Payable")
		$0:=Replace string:C233($0; "PL "; "AP ")
		$0:=Replace string:C233($0; "Cheque"; "Check")
	Else 
		$0:=$1
	End if 
End if 
ERR_MethodTrackerReturn("Term_SLPLWT"; $_t_oldMethodName)
