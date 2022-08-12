//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch AccCNChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 09:37
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

$_t_oldMethodName:=ERR_MethodTracker("Purch AccCNChk")
Gen_Confirm("You chose 'Credit Note' from the menu, but have entered an Invoice"+Char:C90(13)+Char:C90(13)+"Do you want to reverse the figures to make a Credit Note?"; "Credit Note"; "Invoice")
If (OK=1)
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
	While (Not:C34(End selection:C36([PURCHASE_INVOICE_ITEMS:158])))
		[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2)
		[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2)
		[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2)
		[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2)
		[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15); 2)
		DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
		NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	End while 
	[PURCHASE_INVOICES:37]Total_Invoiced:7:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Invoiced:7); 2)
	[PURCHASE_INVOICES:37]Total_Paid:8:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Paid:8); 2)
	[PURCHASE_INVOICES:37]Total_Due:9:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Due:9); 2)
	[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19); 2)
	[PURCHASE_INVOICES:37]Total_Tax:25:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Tax:25); 2)
	[PURCHASE_INVOICES:37]Cash_TAX_Due:32:=Round:C94((0-[PURCHASE_INVOICES:37]Cash_TAX_Due:32); 2)
	Purchases_LPSt
	Purch_InLPß("S1")
End if 
ERR_MethodTrackerReturn("Purch AccCNChk"; $_t_oldMethodName)