//%attributes = {}
If (False:C215)
	//Project Method Name:      TransT_ChPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 17:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $2)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; $1; $s)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransT_ChPrefs")
//TransT_ChPrefs - Check Prefs & return false if not allowed
//See also TransT_InLPA
$0:=False:C215
If ($1="")
	$0:=True:C214
Else 
	$s:=""
	Case of 
		: ($1=DB_GetLedgerTRANSINVpost)
			$s:="Sales Invoice"
		: ($1=DB_GetLedgerTRANSRECpost)
			$s:="Invoice Receipt"
		: ($1=DB_GetLedgerTRANSDeposit)
			$s:="Sales Deposit"
		: ($1=DB_GetLedgerTransDepositRec)
			$s:="Deposit Reconciliation"
		: ($1=DB_GetLedgerTRANSPURpost)
			$s:="Purchase Invoice"
		: ($1=DB_GetLedgerTRANSPurINVPay)
			$s:="Purchase Payment"
		: ($1=DB_GetLedgerTRANSPURPrePay)
			$s:="Purchase Pre-Payment"
		: ($1=DB_GetLedgerTRANSPREpost)
			$s:="Pre-Payment Reconciliation"
		: ($1=<>WIP_t_TRPTrans)
			$s:="WIP Time Recording"
		: ($1=<>WIP_t_CIPTRANS)
			$s:="WIP Cost Items"
		: ($1=<>WIP_t_TRWTrans)
			$s:="WIP TR Write Off"
		: ($1=<>WIP_t_CIWTrans)
			$s:="WIP CI Write Off"
	End case 
	If ($s="")
		$0:=True:C214
	Else 
		If ($2)
			Gen_Confirm("That Transaction Type is defined in the Preferences as used for "+$s+" postings."+Char:C90(13)+Char:C90(13)+"Do you want to change it both here and in Preferences?"; "Both"; "Neither")
			$0:=(OK=1)
		Else 
			$0:=False:C215
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("TransT_ChPrefs"; $_t_oldMethodName)