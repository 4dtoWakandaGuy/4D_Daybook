//%attributes = {}
If (False:C215)
	//Project Method Name:      Term_NLWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermGL)
	C_TEXT:C284($_t_BatchTableName; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term_NLWT")
//$0:=$1
$0:=$1
$_t_BatchTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); $_t_BatchTableName)

If (False:C215)
	$0:=Replace string:C233($1; "Nominal"; "General")
	If (<>TermGL)
		$0:=Replace string:C233($0; "Profit & Loss"; "Account Income")
		$0:=Replace string:C233($0; "Profit/Loss"; "Account Income")
		$0:=Replace string:C233($0; "P/L"; "Income")
		$0:=Replace string:C233($0; "P&L"; "Income")
	End if 
End if 
ERR_MethodTrackerReturn("Term_NLWT"; $_t_oldMethodName)
