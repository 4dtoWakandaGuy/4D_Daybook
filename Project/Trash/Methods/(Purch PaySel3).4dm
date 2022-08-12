//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_PaySel3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_PaySel3")
[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[PURCHASE_INVOICES:37]UK_EC:18
[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[PURCHASE_INVOICES:37]Currency_Code:23
If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
	[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
End if 
[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[PURCHASE_INVOICES:37]Layer_Code:28
If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
	[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
End if 
ERR_MethodTrackerReturn("Purch_PaySel3"; $_t_oldMethodName)