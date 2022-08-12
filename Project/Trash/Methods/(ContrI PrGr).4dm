//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ContrI PrGr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2010 13:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ContrI PrGr")
//FAX TO STEVE GIBSON
//`from Rollo 2/4/96
If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
End if 

//ContrI PrGr
If ([CONTRACT_TYPES:19]Price_Group:7#"")
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
	PriceT_FilterDates
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3)
			PriceT_FilterDates
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
				PriceT_FilterDates
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7)
					PriceT_FilterDates
				End if 
			End if 
		End if 
	End if 
	If (Records in selection:C76([PRICE_TABLE:28])>0)
		RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
		If ([PRICE_TABLE:28]Pricing_Basis:17=0)
			If ([PRICE_GROUPS:18]Price_Based:3=True:C214)
				[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*[PRICE_TABLE:28]Price_Discount:3); 2)
			Else 
				If ([PRODUCTS:9]Sales_Price:9#0)
					[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100))); 2)
				Else 
					[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100))); 2)
				End if 
				
			End if 
		Else 
			Case of 
				: ([PRICE_TABLE:28]Pricing_Basis:17=1)
					[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*[PRICE_TABLE:28]Price_Discount:3); 2)
				: ([PRICE_TABLE:28]Pricing_Basis:17=3)
					If ([PRODUCTS:9]Sales_Price:9#0)
						[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100))); 2)
					Else 
						[ORDER_ITEMS:25]Contract_Cost:30:=Round:C94(([ORDER_ITEMS:25]Quantity:3*([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100))); 2)
					End if 
					
			End case 
		End if 
		vTot:=1
	End if 
End if 
ERR_MethodTrackerReturn("ContrI PrGr"; $_t_oldMethodName)