//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_CheckCoP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckCoP")
//PriceT_Check_Company for Purchase Orders
If ([PURCHASE_ORDERS:57]Company_Code:1#[COMPANIES:2]Company_Code:1)
	RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
End if 
If (([PRODUCTS:9]Product_Code:1#"") & ([COMPANIES:2]Company_Code:1#""))
	If ([COMPANIES:2]PO_Price_Group:54#"")
		RELATE ONE:C42([COMPANIES:2]PO_Price_Group:54)
		If ([PRICE_GROUPS:18]Cost_Prices:4)
			PriceT_SearchCo([COMPANIES:2]PO_Price_Group:54; [COMPANIES:2]Company_Code:1)
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				PriceT_CheckCo2([COMPANIES:2]Company_Code:1)
				PriceT_LoadP
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_CheckCoP"; $_t_oldMethodName)