//%attributes = {}
If (False:C215)
	//Project Method Name:      Inv_AcceptCNChk
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

$_t_oldMethodName:=ERR_MethodTracker("Inv_AcceptCNChk")
Gen_Confirm("You chose 'Credit Note' from the menu, but have entered an Invoice"+Char:C90(13)+Char:C90(13)+"Do you want to reverse the figures to make a Credit Note?"; "Credit Note"; "Invoice")
If (OK=1)
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	
	FIRST RECORD:C50([INVOICES_ITEMS:161])
	While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
		[INVOICES_ITEMS:161]Sales_Price:4:=Round:C94((0-[INVOICES_ITEMS:161]Sales_Price:4); 2)
		[INVOICES_ITEMS:161]Amount:5:=Round:C94((0-[INVOICES_ITEMS:161]Amount:5); 2)
		[INVOICES_ITEMS:161]Tax_Amount:7:=Round:C94((0-[INVOICES_ITEMS:161]Tax_Amount:7); 2)
		[INVOICES_ITEMS:161]Total_Amount:8:=Round:C94((0-[INVOICES_ITEMS:161]Total_Amount:8); 2)
		[INVOICES_ITEMS:161]Cost_Amount:15:=Round:C94((0-[INVOICES_ITEMS:161]Cost_Amount:15); 2)
		DB_SaveRecord(->[INVOICES_ITEMS:161])
		
		NEXT RECORD:C51([INVOICES_ITEMS:161])
	End while 
	[INVOICES:39]Total_Invoiced:5:=Round:C94((0-[INVOICES:39]Total_Invoiced:5); 2)
	[INVOICES:39]Total_Paid:6:=Round:C94((0-[INVOICES:39]Total_Paid:6); 2)
	[INVOICES:39]Total_Due:7:=Round:C94((0-[INVOICES:39]Total_Due:7); 2)
	[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Round:C94((0-[INVOICES:39]Total_Invoiced_Excluding_Tax:26); 2)
	[INVOICES:39]Total_Tax:35:=Round:C94((0-[INVOICES:39]Total_Tax:35); 2)
	[INVOICES:39]Cash_TAX_Due:40:=Round:C94((0-[INVOICES:39]Cash_TAX_Due:40); 2)
	Invoices_InLPTi
	Invoices_InLPß("S1")
End if 
ERR_MethodTrackerReturn("Inv_AcceptCNChk"; $_t_oldMethodName)