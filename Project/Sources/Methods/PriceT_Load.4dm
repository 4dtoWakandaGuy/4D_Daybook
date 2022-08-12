//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_Load
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
	C_LONGINT:C283(<>UserPriceAsk; $_l_Change)
	C_POINTER:C301($1)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_Load")
//PriceT_Load

<>UserPriceAsk:=1  //(1=ask 2=change)
If (Count parameters:C259=0)
	[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
End if 

If ((([PRICE_TABLE:28]Quantity_To:10#0) | ([PRICE_TABLE:28]Quantity_From:9#0)) & (Records in selection:C76([PRICE_TABLE:28])>1))
	If (Count parameters:C259=0)
		PriceT_SearchQt
	Else 
		If (Count parameters:C259<=2)
			PriceT_SearchQt(1)
		Else 
			PriceT_SearchQt($3)
		End if 
	End if 
	
	If (Records in selection:C76([PRICE_TABLE:28])>0)
		If ([PRICE_GROUPS:18]Price_Code:1#[PRICE_TABLE:28]Price_Code:2)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
		End if 
		If (Count parameters:C259=0)
			
			OrderI_SubPTA
		Else 
			OrderI_SubPTA($1; $2)
		End if 
		
	Else 
		If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
			[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
			[ORDER_ITEMS:25]Discount:37:=0
		Else 
			If (Count parameters:C259=0)
				If ([ORDER_ITEMS:25]Sales_Price:4#[ORDER_ITEMS:25]Retail_Price:38) & ([ORDER_ITEMS:25]Retail_Price:38>0) & ([ORDER_ITEMS:25]Sales_Price:4>0)
					If (<>UserPriceAsk=1) & ([ORDER_ITEMS:25]Product_Code:2=Old:C35([ORDER_ITEMS:25]Product_Code:2)) & ([ORDER_ITEMS:25]Product_Code:2#"")
						If ((Old:C35([ORDER_ITEMS:25]Sales_Price:4))=[ORDER_ITEMS:25]Sales_Price:4) & ((Old:C35([ORDER_ITEMS:25]Retail_Price:38))=[ORDER_ITEMS:25]Retail_Price:38)
							$_l_Change:=0
						Else 
							If (Old:C35([ORDER_ITEMS:25]Sales_Price:4)>0)  //was already saved with a price
								//CONFIRM("Change unit price from "+String([ORDER ITEMS]Sales Price)+" to"+String([ORDER ITEMS]Retail Price)+"?";"Yes";"No")
								//If (OK=1)
								$_l_Change:=2
								//End if
								
								
							Else 
								[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
								[ORDER_ITEMS:25]Discount:37:=0
							End if 
							
						End if 
					Else 
						$_l_Change:=<>UserPriceAsk
					End if 
					If ($_l_Change=2)
						[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
						[ORDER_ITEMS:25]Discount:37:=0
					End if 
				Else 
					[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
					[ORDER_ITEMS:25]Discount:37:=0
				End if 
			Else 
				//parameter passed so no order item
			End if 
			
		End if 
	End if 
	
Else 
	If ([PRICE_GROUPS:18]Price_Code:1#[PRICE_TABLE:28]Price_Code:2)
		RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
	End if 
	If (Count parameters:C259=0)
		OrderI_SubPTA
	Else 
		
		OrderI_SubPTA($1; $2)
	End if 
	
End if 
ERR_MethodTrackerReturn("PriceT_Load"; $_t_oldMethodName)
