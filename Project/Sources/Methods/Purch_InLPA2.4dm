//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InLPA2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 14:48
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

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPA2")
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)

While (Not:C34(End selection:C36([PURCHASE_INVOICE_ITEMS:158])))
	RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
	If ([TAX_CODES:35]Use_Areas:4)
		[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4*([PURCHASE_INVOICES:37]Tax_Rate:20/100)); 2; 5)
	End if 
	NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
End while 
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
ERR_MethodTrackerReturn("Purch_InLPA2"; $_t_oldMethodName)