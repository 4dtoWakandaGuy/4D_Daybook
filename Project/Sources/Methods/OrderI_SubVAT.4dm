//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SubVAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:08
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

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubVAT")
If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
	RELATE ONE:C42([ORDERS:24]Company_Code:1)
End if 
If ([COMPANIES:2]Default_TAX:41="")
	[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
Else 
	[ORDER_ITEMS:25]Tax_Code:12:=[COMPANIES:2]Default_TAX:41
End if 
ERR_MethodTrackerReturn("OrderI_SubVAT"; $_t_oldMethodName)