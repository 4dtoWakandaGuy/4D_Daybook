//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_CheckPref
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 10:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $2)
	C_TEXT:C284($_t_oldMethodName; $1; $s)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_CheckPref")
//Accounts_CheckPref - Check Prefs & return false if not allowed
//See also Accounts_InLPA
$0:=False:C215
If ($1="")
	$0:=True:C214
Else 
	$s:=""
	Case of 
		: (($1=DB_GetSalesLedgerBankFrom) | ($1=DB_GetSalesLedgerBankTo))
			$s:="Bank"
		: (($1=DB_GetLedgerCashFromACC) | ($1=DB_GetLedgerCashToACC))
			$s:="Cash"
		: (($1=DB_GetLedgerVatInputACC) | ($1=DB_GetLedgerVatoutputACC) | ($1=DB_GetLedgerECcreditor) | ($1=DB_GetLedgerCashvatACC))
			$s:="VAT"
		: (($1=DB_GetLedgerExchangeControlACC) | ($1=DB_GetLedgerExchangeACC))
			$s:="Currency"
		: (($1=DB_GetLedgerProfitACC) | ($1=DB_GetLedgerBroughtforwardACC) | ($1=DB_GetLedgerProfitAdjACC))
			$s:="Profit"
	End case 
	If ($s="")
		$0:=True:C214
	Else 
		If ($2)
			Gen_Confirm("That Account is defined in the Preferences as a "+$s+" Account."+Char:C90(13)+Char:C90(13)+"Do you want to change it both here and in Preferences?"; "Both"; "Neither")
			$0:=(OK=1)
		Else 
			$0:=False:C215
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Accounts_CheckPref"; $_t_oldMethodName)
