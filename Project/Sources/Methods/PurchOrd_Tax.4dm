//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_Tax
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

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_Tax")
If ([COMPANIES:2]Company_Code:1#[PURCHASE_ORDERS:57]Company_Code:1)
	RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
End if 
If (([COMPANIES:2]Default_TAX:41="") | ([COMPANIES:2]Default_TAX:41=DB_GetLedgerDefaultSalesTax))
	[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7:=DB_GetLedgerDefaultPurchaseTax
Else 
	[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7:=[COMPANIES:2]Default_TAX:41
End if 
ERR_MethodTrackerReturn("PurchOrd_Tax"; $_t_oldMethodName)