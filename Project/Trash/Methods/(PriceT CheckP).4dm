//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_CheckP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 15:22
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

$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckP")
//PriceT_CheckP - Purchase Orders
If ([PURCHASE_ORDERS_ITEMS:169]Price_Code:9#"")
	If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#[PRODUCTS:9]Product_Code:1)
		RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
	End if 
	If ([PRODUCTS:9]Product_Code:1#"")
		If ([PURCHASE_ORDERS:57]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
		End if 
		PriceT_SearchCo([PURCHASE_ORDERS_ITEMS:169]Price_Code:9; [COMPANIES:2]Company_Code:1)
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			PriceT_CheckCo2([COMPANIES:2]Company_Code:1)
			PriceT_LoadP
		Else 
			Gen_Alert("That Price Group has not been used for this Product or Company"; "Try again")
			[PURCHASE_ORDERS_ITEMS:169]Price_Code:9:=""
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_CheckP"; $_t_oldMethodName)