//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_ItemsTax
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 14:49
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

$_t_oldMethodName:=ERR_MethodTracker("Purch_ItemsTax")
//Purch_ItemsTax - recalcs the Tax Amts
If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])>0)
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
	While (Not:C34(End selection:C36([PURCHASE_INVOICE_ITEMS:158])))
		Purch_ItemCalc
		NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	End while 
	[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
	[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
	Purch_InLPß("S1")
End if 
ERR_MethodTrackerReturn("Purch_ItemsTax"; $_t_oldMethodName)