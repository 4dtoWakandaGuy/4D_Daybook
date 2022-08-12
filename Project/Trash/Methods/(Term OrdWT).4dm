//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term OrdWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermEst; <>TermInq)
	C_TEXT:C284($_t_oldMethodName; $_t_OrdersTableName; $0; $1)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Term OrdWT")
$0:=$1

$_t_OrdersTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); $_t_OrdersTableName)
If (False:C215)
	If (<>TermInq)
		$0:=Replace string:C233($0; "Enquirer"; "Inquirer")
		$0:=Replace string:C233($0; "Enquiries"; "Inquiries")
		$0:=Replace string:C233($0; "Enquiry"; "Inquiry")
		$0:=Replace string:C233($0; "Enq"; "Inq")
	End if 
	If (<>TermEst)
		$0:=Replace string:C233($0; "Quotation"; "Estimate")
		$0:=Replace string:C233($0; "Quote"; "Est")
		$0:=Replace string:C233($0; "Qtn"; "Est")
	End if 
End if 
ERR_MethodTrackerReturn("Term OrdWT"; $_t_oldMethodName)
