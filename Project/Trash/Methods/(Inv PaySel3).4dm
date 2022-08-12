//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv PaySel3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DS_l_BATCHITEMRef)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv PaySel3")
[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
	[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
End if 
[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
	[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
End if 
If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
	[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
End if 
ERR_MethodTrackerReturn("Inv PaySel3"; $_t_oldMethodName)