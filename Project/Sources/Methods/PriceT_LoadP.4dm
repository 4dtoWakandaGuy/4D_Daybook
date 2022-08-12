//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_LoadP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:09
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

$_t_oldMethodName:=ERR_MethodTracker("PriceT_LoadP")
//PriceT_LoadP - Purchase Orders
[PURCHASE_ORDERS_ITEMS:169]Price_Code:9:=[PRICE_TABLE:28]Price_Code:2
If ((([PRICE_TABLE:28]Quantity_To:10#0) | ([PRICE_TABLE:28]Quantity_From:9#0)) & (Records in selection:C76([PRICE_TABLE:28])>1))
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[PURCHASE_ORDERS_ITEMS:169]Quantity:3; *)
	QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>=[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
	If (Records in selection:C76([PRICE_TABLE:28])>0)
		If ([PRICE_GROUPS:18]Price_Code:1#[PRICE_TABLE:28]Price_Code:2)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
		End if 
		PurchOrd_SubPTA
	Else 
		[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
		[PURCHASE_ORDERS_ITEMS:169]Discount:10:=0
	End if 
Else 
	If ([PRICE_GROUPS:18]Price_Code:1#[PRICE_TABLE:28]Price_Code:2)
		RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
	End if 
	PurchOrd_SubPTA
End if 
ERR_MethodTrackerReturn("PriceT_LoadP"; $_t_oldMethodName)