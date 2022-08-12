//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_ItemCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_ItemCalc")
//Purch_ItemCalc
If ([PURCHASE_INVOICES:37]UK_EC:18="E")
	[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=0
Else 
	If ([TAX_CODES:35]Tax_Code:1#[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
		RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
	End if 
	//NG Feb 2007-Modified the below to use areas tax rate if it is set
	
	If ([TAX_CODES:35]Use_Areas:4)
		
		[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4*([PURCHASE_INVOICES:37]Tax_Rate:20/100)); 2; 5)
	Else 
		[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4*([TAX_CODES:35]Tax_Rate:3/100)); 2; 5)
	End if 
	
	
End if 
[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4+[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("Purch_ItemCalc"; $_t_oldMethodName)