//%attributes = {}
If (False:C215)
	//Project Method Name:      Inv_ItemCalcV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:13
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

$_t_oldMethodName:=ERR_MethodTracker("Inv_ItemCalcV")
If ([TAX_CODES:35]Tax_Code:1#[INVOICES_ITEMS:161]Tax_Code:6)
	RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
End if 
If ([TAX_CODES:35]Use_Areas:4)
	[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Amount:5*([INVOICES:39]Tax_Rate:28/100)); 2; 5)
Else 
	[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Amount:5*([TAX_CODES:35]Tax_Rate:3/100)); 2; 5)
End if 
ERR_MethodTrackerReturn("Inv_ItemCalcV"; $_t_oldMethodName)