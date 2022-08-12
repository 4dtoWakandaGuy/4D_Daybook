//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_CheckGen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284(<>GenPrice; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckGen")
//PriceT_CheckGen

If (<>GenPrice#"")
	If (Count parameters:C259=0)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=[COMPANIES:2]Company_Code:1)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
			If ([PRICE_TABLE:28]Pricing_Basis:17=0)
				If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
					[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
					[ORDER_ITEMS:25]Price_Code:36:=<>GenPrice
					Calc_Item
				End if 
			Else 
				Case of 
					: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
						
					: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
						[ORDER_ITEMS:25]Price_Code:36:=<>GenPrice
						Calc_Item
				End case 
			End if 
		End if 
	Else 
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=$2)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
			If ([PRICE_TABLE:28]Pricing_Basis:17=0)
				If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
					$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					Calc_Item
				End if 
			Else 
				Case of 
					: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
						
					: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
						$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						Calc_Item
				End case 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_CheckGen"; $_t_oldMethodName)
