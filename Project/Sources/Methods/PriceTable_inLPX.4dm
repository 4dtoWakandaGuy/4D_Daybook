//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceTable_inLPX
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
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_FocusObject; $1)
	C_REAL:C285(PG_l_PricingClass)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; ACC_t_CurrencyCode; vText; vTitle; vTitle5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceTable_inLPX")

If (Count parameters:C259>=1)
	$_ptr_FocusObject:=$1
	
Else 
	$_ptr_FocusObject:=Focus object:C278
	
End if 
RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

Case of 
	: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
		Case of 
				
				
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Price_Code:2))
				Check_Minor(->[PRICE_TABLE:28]Price_Code:2; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "PriceG In"; "Price Group")
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
								//Need to create a pop-up in the list box area
								//SET VISIBLE(*;"oPricingBasis";True)
								//SET VISIBLE(*;"oPricingBasisLabel";False)
								
								If ([PRICE_GROUPS:18]Cost_Prices:4)
									//PT_at_PricingBasis{1}:="Cost Price"
								Else 
									//`PT_at_PricingBasis{1}:="Sales Price"
								End if 
								//PT_at_PricingBasis{2}:="Discount %"
								//its not set
						End case 
				End case 
				If (False:C215)
					If ([PRICE_TABLE:28]Price_Code:2#"")
						If ([PRICE_GROUPS:18]Cost_Prices:4)
							vTitle5:="Cost Prices (PO only)"
						Else 
							vTitle5:="Sales Prices (SO only)"
						End if 
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
				End if 
				If (([PRICE_GROUPS:18]Price_Code:1#"") & ([PRICE_TABLE:28]Currency_Code:13=""))
					[PRICE_TABLE:28]Currency_Code:13:=[PRICE_GROUPS:18]Currency_Code:8
					RELATE ONE:C42([PRICE_TABLE:28]Currency_Code:13)
					ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
				End if 
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Price_Code:2)
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Group_Code:6))
				Check_MinorNC(->[PRICE_TABLE:28]Group_Code:6; "Group"; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Group_Code:6)
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Brand_Code:7))
				Check_MinorNC(->[PRICE_TABLE:28]Brand_Code:7; "Brand"; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Brand_Code:7)
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Company_Code:8))
				Check_MinorNC(->[PRICE_TABLE:28]Company_Code:8; "Company"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Company_Code:8)
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Product_Code:1))
				If (([PRICE_TABLE:28]Product_Code:1="*Job") | ([PRICE_TABLE:28]Product_Code:1="*Job Stage @"))
					[PRICE_TABLE:28]Product_Code:1:=Uppers2([PRICE_TABLE:28]Product_Code:1)
					vText:=""
				Else 
					Check_ProductNC(->[PRICE_TABLE:28]Product_Code:1; "Product")
					PriceT_InLPProd
				End if 
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Product_Code:1)
			: ($_l_FieldNumber=Field:C253(->[PRICE_TABLE:28]Currency_Code:13))
				Check_MinorNC(->[PRICE_TABLE:28]Currency_Code:13; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Currency_Code:13)
		End case 
End case 
ERR_MethodTrackerReturn("PriceTable_inLPX"; $_t_oldMethodName)