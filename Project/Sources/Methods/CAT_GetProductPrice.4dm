//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_GetProductPrice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 12:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ClassID; $2; $3)
	C_REAL:C285($_r_ConvertedValue; $_r_Discount; $_r_DiscountAmount; $0; $4)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_oldMethodName; $_t_ProductCurrency; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_GetProductPrice")
If ($1="")
	$_t_CurrencyCode:="£"
Else 
	$_t_CurrencyCode:=$1
End if 
If ([PRODUCTS:9]X_ID:43#$2)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$2)
End if 

If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
	If ([PRODUCTS:9]Default_Price_Currency_ID:45#[CURRENCIES:71]X_ID:3)
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
	End if 
	$_t_ProductCurrency:=[CURRENCIES:71]Currency_Code:1
Else 
	$_t_ProductCurrency:=<>SYS_t_BaseCurrency
End if 
If (Count parameters:C259>=4)
	$_r_Discount:=$4
Else 
	$_r_Discount:=0
End if 


If ($3>0)
	//there is a price table record
	$_l_ClassID:=Catalogue sales Pricing
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_CatalogueID:14=$3; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$_t_CurrencyCode; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_TableClassID:16=$_l_ClassID)
	PriceT_FilterDates
	
	$0:=[PRICE_TABLE:28]Price_Discount:3
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		//no entry for this product
		$_l_ClassID:=Catalogue sales Pricing
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_CatalogueID:14=$3; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=<>SYS_t_BaseCurrency; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_TableClassID:16=$_l_ClassID)
		PriceT_FilterDates
		//convert to output currency at current rate
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			
			$0:=Cat_ConvertValue([PRICE_TABLE:28]Price_Discount:3; <>SYS_t_BaseCurrency; $_t_CurrencyCode)
		Else 
			//no entry for this product
			$_l_ClassID:=Standard Pricing
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_CatalogueID:14=0; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Price_Code:2=""; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$_t_CurrencyCode; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_TableClassID:16=$_l_ClassID)
			PriceT_FilterDates
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				$_r_DiscountAmount:=Round:C94(([PRICE_TABLE:28]Price_Discount:3/100)*$_r_Discount; 2)
				$0:=[PRICE_TABLE:28]Price_Discount:3-$_r_DiscountAmount
			Else 
				//no entry for this product
				$_l_ClassID:=Standard Pricing
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_CatalogueID:14=0; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$_t_ProductCurrency; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_TableClassID:16=$_l_ClassID)
				PriceT_FilterDates
				
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					$_r_ConvertedValue:=Cat_ConvertValue([PRICE_TABLE:28]Price_Discount:3; $_t_ProductCurrency; $_t_CurrencyCode)
					$_r_DiscountAmount:=Round:C94(($_r_ConvertedValue/100)*$_r_Discount; 2)
					$0:=$_r_ConvertedValue-$_r_DiscountAmount
					//convert to the required currency
				Else 
					//No price table entry
					//so use the product price
					If ($_t_ProductCurrency#$_t_CurrencyCode)
						//convert to output currency at current rate
						Case of 
							: ([CATALOGUE:108]xPriceModel:7=9)
								$_r_ConvertedValue:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_ProductCurrency; $_t_CurrencyCode)
							Else 
								$_r_ConvertedValue:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; $_t_ProductCurrency; $_t_CurrencyCode)
						End case 
					Else 
						Case of 
							: ([CATALOGUE:108]xPriceModel:7=9)
								$_r_ConvertedValue:=[PRODUCTS:9]Sales_Price:9
							Else 
								$_r_ConvertedValue:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; $_t_ProductCurrency; $_t_CurrencyCode)
						End case 
						
					End if 
					$_r_DiscountAmount:=Round:C94(($_r_ConvertedValue/100)*$_r_Discount; 2)
					$0:=$_r_ConvertedValue-$_r_DiscountAmount
				End if 
			End if 
			
		End if 
	End if 
Else 
	//no catalogue id
	$0:=[PRODUCTS:9]Standard_Price:16
	
End if 
ERR_MethodTrackerReturn("CAT_GetProductPrice"; $_t_oldMethodName)