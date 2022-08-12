//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_BuildGetComponentPrice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/07/2010 17:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_Discounts; 0)
	ARRAY REAL:C219($_ar_Prices; 0)
	C_BOOLEAN:C305($_bo_Convert; $_bo_PriceChanged)
	C_DATE:C307($4)
	C_LONGINT:C283($_l_ComponentPriceClass; $_l_Index; $_l_productCurrency)
	C_POINTER:C301($5; $6)
	C_REAL:C285($_r_ComponentPrice; $_r_Discount; $2)
	C_TEXT:C284(<>GenPrice; <>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ProductCurrency; $1; $3; PRD_t_productCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_BuildGetComponentPrice")
If (Count parameters:C259>=5)
	If ([PRODUCTS:9]Product_Code:1#$1)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
	End if 
	//$3=currency code for the product
	
	If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
		$_l_productCurrency:=[PRODUCTS:9]Default_Price_Currency_ID:45
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=PRD_t_productCurrency)
		$_t_ProductCurrency:=[CURRENCIES:71]Currency_Code:1
	Else 
		$_l_productCurrency:=0
		$_t_ProductCurrency:=<>SYS_t_BaseCurrency
	End if 
	$_l_ComponentPriceClass:=0
	$_r_ComponentPrice:=[PRODUCTS:9]Sales_Price:9
	$5->:=False:C215
	$6->:=$_r_ComponentPrice
	If ($3#$_t_ProductCurrency)  //the resulting product currency code($3) is not the same as the currency of this product so will need to convert it
		$_bo_Convert:=True:C214
	End if 
	//Look for pricing for the currrency at  $3
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
	QUERY:C277([PRICE_TABLE:28];  & [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8="")
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$3)
	If (Records in selection:C76([PRICE_TABLE:28])>0)
		//There are price table entries in the currency we want
		If ($4=!00-00-00!)  //input a date for the first booking if you know it
			PriceT_FilterDates
		Else 
			PriceT_FilterDates($4)
		End if 
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			CREATE SET:C116([PRICE_TABLE:28]; "Touse")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
			QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
			//These are flat prices or discounts.
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				//Break these into prices and discounts(really we should not have multiple price table entries unles for the same quantity
				ARRAY REAL:C219($_ar_Prices; 0)
				ARRAY REAL:C219($_ar_Discounts; 0)
				For ($_l_Index; 1; Records in selection:C76([PRICE_TABLE:28]))
					RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
					If ([PRICE_TABLE:28]Pricing_Basis:17=0)
						If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
							APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
						Else 
							APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
						End if 
					Else 
						Case of 
							: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
								APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
							: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
								APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
						End case 
					End if 
					NEXT RECORD:C51([PRICE_TABLE:28])
					
				End for 
				//we will take the FIRST price and the FIRST discount
				If (Size of array:C274($_ar_Prices)>0)
					$_r_ComponentPrice:=$_ar_Prices{1}
					$_bo_PriceChanged:=True:C214
				End if 
				If (Size of array:C274($_ar_Discounts)>0)
					$_bo_PriceChanged:=True:C214
					If ($_r_ComponentPrice#0)
						$_r_ComponentPrice:=Gen_Round(($_r_ComponentPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
					Else 
						$_r_Discount:=$_ar_Discounts{1}
						$_l_ComponentPriceClass:=2
					End if 
					
				End if 
			End if 
			//Now see if there is a price for quantity to over-ride it or a discount to apply for quantity
			USE SET:C118("Touse")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$2; *)
			QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
			QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>$2)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				USE SET:C118("Touse")
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$2; *)
				QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
				QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					USE SET:C118("Touse")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
					QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>$2)
				End if 
			End if 
			If (Records in selection:C76([PRICE_TABLE:28])>0)  //There is quantity based pricing or disocunts
				ARRAY REAL:C219($_ar_Prices; 0)
				ARRAY REAL:C219($_ar_Discounts; 0)
				For ($_l_Index; 1; Records in selection:C76([PRICE_TABLE:28]))
					RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
					If ([PRICE_TABLE:28]Pricing_Basis:17=0)
						If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
							APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
						Else 
							APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
						End if 
					Else 
						Case of 
							: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
								APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
							: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
								APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
						End case 
					End if 
					NEXT RECORD:C51([PRICE_TABLE:28])
					
				End for 
				//we will take the FIRST price and the FIRST discount
				If (Size of array:C274($_ar_Prices)>0)
					$_r_ComponentPrice:=$_ar_Prices{1}
					$_bo_PriceChanged:=True:C214
				End if 
				If (Size of array:C274($_ar_Discounts)>0)
					$_bo_PriceChanged:=True:C214
					If ($_r_ComponentPrice#0)
						$_r_ComponentPrice:=Gen_Round(($_r_ComponentPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
					Else 
						$_r_Discount:=$_ar_Discounts{1}
						$_l_ComponentPriceClass:=2
					End if 
				End if 
				
			End if 
		End if 
		If ($_l_ComponentPriceClass=2)
			$5->:=True:C214
			$6->:=$_r_Discount
		Else 
			$5->:=False:C215
			$6->:=$_r_ComponentPrice
		End if 
	Else 
		If ($3#$_t_ProductCurrency)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
			QUERY:C277([PRICE_TABLE:28];  & [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8="")
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$_t_ProductCurrency)
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				If ($4=!00-00-00!)  //input a date for the first booking if you know it
					PriceT_FilterDates
				Else 
					PriceT_FilterDates($4)
				End if 
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					CREATE SET:C116([PRICE_TABLE:28]; "Touse")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
					QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
					//These are flat prices or discounts.
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						//Break these into prices and discounts(really we should not have multiple price table entries unles for the same quantity
						ARRAY REAL:C219($_ar_Prices; 0)
						ARRAY REAL:C219($_ar_Discounts; 0)
						For ($_l_Index; 1; Records in selection:C76([PRICE_TABLE:28]))
							RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
							If ([PRICE_TABLE:28]Pricing_Basis:17=0)
								If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
									APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
								Else 
									APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
								End if 
							Else 
								Case of 
									: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
										APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
									: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
										APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
								End case 
							End if 
							NEXT RECORD:C51([PRICE_TABLE:28])
							
						End for 
						//we will take the FIRST price and the FIRST discount
						If (Size of array:C274($_ar_Prices)>0)
							$_r_ComponentPrice:=$_ar_Prices{1}
							$_bo_PriceChanged:=True:C214
						End if 
						If (Size of array:C274($_ar_Discounts)>0)
							$_bo_PriceChanged:=True:C214
							If ($_r_ComponentPrice#0)
								$_r_ComponentPrice:=Gen_Round(($_r_ComponentPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
							Else 
								$_r_Discount:=$_ar_Discounts{1}
								$_l_ComponentPriceClass:=2
							End if 
							
						End if 
					End if 
					//Now see if there is a price for quantity to over-ride it or a discount to apply for quantity
					USE SET:C118("Touse")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$2; *)
					QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
					QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>$2)
					If (Records in selection:C76([PRICE_TABLE:28])=0)
						USE SET:C118("Touse")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$2; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
						If (Records in selection:C76([PRICE_TABLE:28])=0)
							USE SET:C118("Touse")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
							QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>$2)
						End if 
					End if 
					If (Records in selection:C76([PRICE_TABLE:28])>0)  //There is quantity based pricing or disocunts
						ARRAY REAL:C219($_ar_Prices; 0)
						ARRAY REAL:C219($_ar_Discounts; 0)
						For ($_l_Index; 1; Records in selection:C76([PRICE_TABLE:28]))
							RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
							If ([PRICE_TABLE:28]Pricing_Basis:17=0)
								If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
									APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
								Else 
									APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
								End if 
							Else 
								Case of 
									: ([PRICE_TABLE:28]Pricing_Basis:17=1)  //Price based
										APPEND TO ARRAY:C911($_ar_Prices; [PRICE_TABLE:28]Price_Discount:3)
									: ([PRICE_TABLE:28]Pricing_Basis:17=3)  //Discount baed
										APPEND TO ARRAY:C911($_ar_Discounts; [PRICE_TABLE:28]Price_Discount:3)
								End case 
							End if 
							NEXT RECORD:C51([PRICE_TABLE:28])
							
						End for 
						//we will take the FIRST price and the FIRST discount
						If (Size of array:C274($_ar_Prices)>0)
							$_r_ComponentPrice:=$_ar_Prices{1}
							$_bo_PriceChanged:=True:C214
						End if 
						If (Size of array:C274($_ar_Discounts)>0)
							$_bo_PriceChanged:=True:C214
							If ($_r_ComponentPrice#0)
								$_r_ComponentPrice:=Gen_Round(($_r_ComponentPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
							Else 
								$_r_Discount:=$_ar_Discounts{1}
								$_l_ComponentPriceClass:=2
							End if 
						End if 
						
					End if 
				End if 
				//The price then needs to be converted to the output currency
			End if 
			If ($_l_ComponentPriceClass=2)
				$5->:=True:C214
				$6->:=$_r_Discount
			Else 
				$5->:=False:C215
				$_r_ComponentPrice:=Cat_ConvertValue($_r_ComponentPrice; PRD_t_productCurrency; $3; Current date:C33(*))
				$6->:=$_r_ComponentPrice
			End if 
			
		End if 
		//none relating to the output currency..any relating to the current product currency
	End if 
	
End if 
ERR_MethodTrackerReturn("PRD_BuildGetComponentPrice"; $_t_oldMethodName)
