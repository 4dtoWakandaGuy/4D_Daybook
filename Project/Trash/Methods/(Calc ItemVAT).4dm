//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calc_ItemVAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
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

$_t_oldMethodName:=ERR_MethodTracker("Calc_ItemVAT")
If ([ORDER_ITEMS:25]Tax_Code:12#[TAX_CODES:35]Tax_Code:1)
	RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
End if 
If ([TAX_CODES:35]Use_Areas:4)
	[ORDER_ITEMS:25]TAX_Amount:8:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7*([ORDERS:24]Tax_Rate:34/100)); 2; 5)
Else 
	[ORDER_ITEMS:25]TAX_Amount:8:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7*([TAX_CODES:35]Tax_Rate:3/100)); 2; 5)
End if 
ERR_MethodTrackerReturn("Calc_ItemVAT"; $_t_oldMethodName)