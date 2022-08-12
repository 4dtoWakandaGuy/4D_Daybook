//%attributes = {}
If (False:C215)
	//Project Method Name:      Term_VATWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 21:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermST)
	C_TEXT:C284($_t_AccountsTableName; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term_VATWT")
$0:=$1

$_t_AccountsTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[ACCOUNTS:32]); $_t_AccountsTableName)

If (False:C215)
	If (<>TermST)
		
		//$0:=Replace string($0;"Default VAT";"Default Tax")
		//$0:=Replace string($0;"Def VAT";"Def Tax")
		$0:=Replace string:C233($0; "VAT Codes"; "Sales & Use Tax Codes")
		//  $0:=Replace string($0;"Amount/VAT";"Amount/Tax")
		// $0:=Replace string($0;"VAT %";"Tax %")
		//$0:=Replace string($0;"VAT/Total";"Tax/Total")
		// $0:=Replace string($0;"excl VAT";"excl Tax")
		//$0:=Replace string($0;"VAT/";"Tax/")
		$0:=Replace string:C233($0; " Reg No"; "Resale No")
		$0:=Replace string:C233($0; "EC Vat Reg No"; "Resale No")
		$0:=Replace string:C233($0; "VAT"; "Tax")
		$0:=Replace string:C233($0; Get localized string:C991("Input"); Get localized string:C991("AccountStringSales"))
		$0:=Replace string:C233($0; Get localized string:C991("Output"); Get localized string:C991("Purchases"))
		$0:=Replace string:C233($0; "Listing"; "---")
		$0:=Replace string:C233($0; "In"; "Sales")
		$0:=Replace string:C233($0; "Out"; "Purch")
		$0:=Replace string:C233($0; "I/O"; "S/P")
		$0:=Replace string:C233($0; "---"; "Listing")
		
	End if 
End if 
ERR_MethodTrackerReturn("Term_VATWT"; $_t_oldMethodName)
