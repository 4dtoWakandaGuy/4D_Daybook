//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPAr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/09/2011 19:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_TaxRate)
	C_TEXT:C284($_t_oldMethodName; $_t_TaxName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPAr")
$_r_TaxRate:=[INVOICES:39]Tax_Rate:28

$_t_TaxName:=Term_VATWT("VAT")
If ($_t_TaxName#"VAT")  //<> ◊TermST had a dual usage-setting the wordings to 'sales tax' AND applying a 'local tax' rule
	//this in my opinion is wrong because the wording or use of TVA VAT etc is not the same as applying a local tax by company area.
	//By default the company Default TAX CODE is set by Country
	//With the area tax rule that should be applied by area within the country/??
	If ([INVOICES:39]Delivery_Company:30#"")
		RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
		[INVOICES:39]Area_Code:29:=[COMPANIES:2]Area:11
		RELATE ONE:C42([INVOICES:39]Area_Code:29)
		[INVOICES:39]Tax_Rate:28:=[AREAS:3]Tax_Rate:4
	Else 
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		[INVOICES:39]Area_Code:29:=[COMPANIES:2]Area:11
		RELATE ONE:C42([INVOICES:39]Area_Code:29)
		[INVOICES:39]Tax_Rate:28:=[AREAS:3]Tax_Rate:4
	End if 
End if 
If ([INVOICES:39]Invoice_Number:1#"")
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
Else 
	REDUCE SELECTION:C351([INVOICES_ITEMS:161]; 0)
End if 

If (($_r_TaxRate#[INVOICES:39]Tax_Rate:28) & (Records in selection:C76([INVOICES_ITEMS:161])>0))
	Invoices_InLPA2
End if 
ERR_MethodTrackerReturn("Invoices_InLPAr"; $_t_oldMethodName)