//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases SubTa
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases SubTa")
RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
If (([COMPANIES:2]Default_TAX:41="") | ([COMPANIES:2]Default_TAX:41=DB_GetLedgerDefaultSalesTax))
	[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=DB_GetLedgerDefaultPurchaseTax
Else 
	[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=[COMPANIES:2]Default_TAX:41
End if 
ERR_MethodTrackerReturn("Purchases SubTa"; $_t_oldMethodName)