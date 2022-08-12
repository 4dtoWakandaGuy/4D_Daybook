//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_SubPTA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:41
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

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_SubPTA")
//PurchOrd_SubPTA
If ([PRICE_GROUPS:18]Price_Based:3=True:C214)
	[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PRICE_TABLE:28]Price_Discount:3
Else 
	If ([PRICE_GROUPS:18]PriceGroupClass:9=0) | ([PRICE_GROUPS:18]PriceGroupClass:9=3)
		[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
		[PURCHASE_ORDERS_ITEMS:169]Discount:10:=[PRICE_TABLE:28]Price_Discount:3
	Else   //mixed price or discount..treat as price if PT not set!!
		Case of 
			: ([PRICE_TABLE:28]Pricing_Basis:17<3)  //Price bases
				[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PRICE_TABLE:28]Price_Discount:3
			: ([PRICE_TABLE:28]Pricing_Basis:17=3)
				[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
				[PURCHASE_ORDERS_ITEMS:169]Discount:10:=[PRICE_TABLE:28]Price_Discount:3
		End case 
	End if 
End if 
PurchOrd_SubCal
ERR_MethodTrackerReturn("PurchOrd_SubPTA"; $_t_oldMethodName)