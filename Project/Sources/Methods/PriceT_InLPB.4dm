//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 11:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_InLPB")
If ([PRICE_TABLE:28]Table_Code:12="")
	[PRICE_TABLE:28]Table_Code:12:=Gen_CodePref(21; ->[PRICE_TABLE:28]Table_Code:12)
End if 
RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
//NG note: The price group now has a pricing class..this is 1 for Price based, 2 for mixed and 3 for discount based.
//on HERE_the price table has 2 options. 1 for price based 3 for discount based
//if the option is not set AND the price group is 2 then a pop up is displayed so it can(and must!) be set on the price table.

Case of 
	: ([PRICE_GROUPS:18]Price_Based:3)
		PG_l_PricingClass:=1
	Else 
		Case of 
			: ([PRICE_GROUPS:18]PriceGroupClass:9=2)  //Mixed
				PG_l_PricingClass:=2
			: ([PRICE_GROUPS:18]PriceGroupClass:9=3) | ([PRICE_GROUPS:18]PriceGroupClass:9=0)  //Discount=0 if never set and price based=false
				PG_l_PricingClass:=3
			Else 
				PG_l_PricingClass:=1
		End case 
End case 
vPriceName:=[PRICE_GROUPS:18]Price_Name:2
If ((vAdd=1) & (<>ProdCode#"") & ([PRICE_TABLE:28]Product_Code:1="") & ([PRICE_TABLE:28]Group_Code:6="") & ([PRICE_TABLE:28]Brand_Code:7=""))
	[PRICE_TABLE:28]Product_Code:1:=<>ProdCode
End if 
If ([PRICE_TABLE:28]Product_Code:1#[PRODUCTS:9]Product_Code:1)
	RELATE ONE:C42([PRICE_TABLE:28]Product_Code:1)
End if 
vProduct:=[PRODUCTS:9]Product_Name:2
PriceT_InLPProd
If ([PRICE_TABLE:28]Group_Code:6#[PRODUCT_GROUPS:10]Group_Code:1)
	RELATE ONE:C42([PRICE_TABLE:28]Group_Code:6)
End if 
vGroup:=[PRODUCT_GROUPS:10]Group_Name:2
If ([PRICE_TABLE:28]Brand_Code:7#[PRODUCT_BRANDS:8]Brand_Code:1)
	RELATE ONE:C42([PRICE_TABLE:28]Brand_Code:7)
End if 
vBrand:=[PRODUCT_BRANDS:8]Brand_Name:2
If ([PRICE_TABLE:28]Company_Code:8#[COMPANIES:2]Company_Code:1)
	RELATE ONE:C42([PRICE_TABLE:28]Company_Code:8)
End if 
vCompany:=[COMPANIES:2]Company_Name:2
If ([PRICE_TABLE:28]Price_Code:2#"")
	If ([PRICE_GROUPS:18]Cost_Prices:4)
		vTitle5:="Cost Prices (PO only)"
	Else 
		vTitle5:="Sales Prices (SO only)"
	End if 
	ARRAY TEXT:C222(PT_at_PricingBasis; 2)
	OBJECT SET VISIBLE:C603(*; "oPricingBasis"; False:C215)
	//TRACE
	Case of 
		: (PG_l_PricingClass=1)
			[PRICE_TABLE:28]Pricing_Basis:17:=1
			If ([PRICE_GROUPS:18]Cost_Prices:4)
				vTitle:="Cost Price"
			Else 
				vTitle:="Sales Price"
			End if 
		: (PG_l_PricingClass=2)  //Mixed
			Case of 
				: ([PRICE_TABLE:28]Pricing_Basis:17=1)
					If ([PRICE_GROUPS:18]Cost_Prices:4)
						vTitle:="Cost Price"
					Else 
						vTitle:="Sales Price"
					End if 
				: ([PRICE_TABLE:28]Pricing_Basis:17=3)
					vTitle:="Discount %"
					vTitle5:=""
				Else 
					OBJECT SET VISIBLE:C603(*; "oPricingBasis"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oPricingBasisLabel"; False:C215)
					
					If ([PRICE_GROUPS:18]Cost_Prices:4)
						PT_at_PricingBasis{1}:="Cost Price"
					Else 
						PT_at_PricingBasis{1}:="Sales Price"
					End if 
					PT_at_PricingBasis{2}:="Discount %"
					//its not set
			End case 
		: (PG_l_PricingClass=3)
			[PRICE_TABLE:28]Pricing_Basis:17:=1
			vTitle:="Discount %"
			vTitle5:=""
	End case 
	If (False:C215)
		If ([PRICE_GROUPS:18]Price_Based:3)
			If ([PRICE_GROUPS:18]Cost_Prices:4)
				vTitle:="Cost Price"
			Else 
				vTitle:="Sales Price"
			End if 
		Else 
			vTitle:="Discount %"
		End if 
	Else 
		vTitle:="Price/Disc."
		vTitle5:=""
	End if 
Else 
	ARRAY TEXT:C222(PT_at_PricingBasis; 2)
	PT_at_PricingBasis{1}:="Cost Price"
	PT_at_PricingBasis{2}:="Discount %"
	
	OBJECT SET VISIBLE:C603(*; "oPricingBasis"; True:C214)
End if 
If ([PRICE_TABLE:28]Currency_Code:13#[CURRENCIES:71]Currency_Code:1)
	RELATE ONE:C42([PRICE_TABLE:28]Currency_Code:13)
End if 
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
If (DB_GetModuleSettingByNUM(Module_MultiCurrency)<2)
	OBJECT SET ENTERABLE:C238([PRICE_TABLE:28]Currency_Code:13; False:C215)
End if 
vButtDisPriceTable:="I  PMO   SSSRCADT"
Input_Buttons(->[PRICE_TABLE:28]; ->vButtDisPriceTable)
Macro_AccType("Load "+String:C10(Table:C252(->[PRICE_TABLE:28])))
ERR_MethodTrackerReturn("PriceT_InLPB"; $_t_oldMethodName)