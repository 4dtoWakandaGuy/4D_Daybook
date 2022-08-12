//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_BuildGetComponentCost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/07/2010 18:21
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
	C_LONGINT:C283($_l_ComponentPriceClass; $_l_PriceTableIndex)
	C_POINTER:C301($6)
	C_REAL:C285($_r_CostPrice; $_r_Discount; $_r_useSupplierCost; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_UseSupplierCurrency; $1; $2; $4; $5; PRD_t_productCurrency; USR_t_DefaultPPriceGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_BuildGetComponentCost")
PO_LoadDFPriceGroup
$_r_CostPrice:=$3
If (USR_t_DefaultPPriceGroup#"") | ($1#"")
	If ($1#"") & (False:C215)  //going to come back to this `we know the supplier so first we will look for price table entries for that supplier
		//we need to know what group the supplier is in .
	Else 
		If ($1="")  //no supplier no conversion
			$2:=$4
		End if 
		
		If ($2#$4)  //The cost price will need to be converted
			$_r_CostPrice:=Cat_ConvertValue($_r_CostPrice; $2; $4; Current date:C33(*))
		End if 
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=USR_t_DefaultPPriceGroup; *)
		QUERY:C277([PRICE_TABLE:28];  & [PRICE_TABLE:28]Product_Code:1=$5; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8="")
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$4)
		If (Records in selection:C76([PRICE_TABLE:28])>0)  //There are prices for the output currency
			//QUERY([PRICE$_bo_Convert:=False
			
			
			If (Records in selection:C76([PRICE_TABLE:28])>0)  //There are price table entries for this product
				//Filter to Date relevant
				PriceT_FilterDates
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					CREATE SET:C116([PRICE_TABLE:28]; "Touse")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
					QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
					//These are flat prices or discounts.
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						//Break these into prices and discounts(really we should not have multiple price table entries unles for the same quantity
						ARRAY REAL:C219($_ar_Prices; 0)
						ARRAY REAL:C219($_ar_Discounts; 0)
						For ($_l_PriceTableIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
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
							$_r_CostPrice:=$_ar_Prices{1}
							$_bo_PriceChanged:=True:C214
						End if 
						If (Size of array:C274($_ar_Discounts)>0)
							
							If ($_r_useSupplierCost#0)
								$_r_CostPrice:=Gen_Round(($_r_CostPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
							Else 
								$_r_Discount:=$_ar_Discounts{1}
								$_l_ComponentPriceClass:=2
							End if 
							
						End if 
						//Now see if there is a price for quantity to over-ride it or a discount to apply for quantity
						USE SET:C118("Touse")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[COMPONENTS:86]Quantity:3; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>[COMPONENTS:86]Quantity:3)
						If (Records in selection:C76([PRICE_TABLE:28])=0)
							USE SET:C118("Touse")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[COMPONENTS:86]Quantity:3; *)
							QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
							QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
							If (Records in selection:C76([PRICE_TABLE:28])=0)
								USE SET:C118("Touse")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
								QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>[COMPONENTS:86]Quantity:3)
							End if 
						End if 
						If (Records in selection:C76([PRICE_TABLE:28])>0)  //There is quantity based pricing or disocunts
							ARRAY REAL:C219($_ar_Prices; 0)
							ARRAY REAL:C219($_ar_Discounts; 0)
							For ($_l_PriceTableIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
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
								$_r_CostPrice:=$_ar_Prices{1}
								$_bo_PriceChanged:=True:C214
							End if 
							If (Size of array:C274($_ar_Discounts)>0)
								$_bo_PriceChanged:=True:C214
								If ($_r_useSupplierCost#0)
									$_r_CostPrice:=Gen_Round(($_r_CostPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
								Else 
									$_r_Discount:=$_ar_Discounts{1}
									$_l_ComponentPriceClass:=2
								End if 
							End if 
							
						End if 
					End if 
					If ($_bo_PriceChanged=False:C215)  //if we did not change the price but the currency was different-need to reset $_bo_Convert
						If (PRD_t_productCurrency#$_t_UseSupplierCurrency)
							$_bo_Convert:=True:C214
						End if 
					End if 
					
					
					If ($_l_ComponentPriceClass=2)
						Gen_Round(($_r_CostPrice*((100-($_r_Discount))/100)); 2; 1)
						//OI_ar_BuildCodeCostStd{$Ref}:=OI_ar_BuildCodeCOSTPrice{$Ref}
					Else 
						$6->:=$_r_CostPrice
						//OI_ar_BuildCodeCOSTPrice{$Ref}:=$_r_CostPrice
						//OI_ar_BuildCodeCostStd{$Ref}:=OI_ar_BuildCodeCOSTPrice{$Ref}
					End if 
				End if 
			End if 
		Else 
			$_r_CostPrice:=$3
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=USR_t_DefaultPPriceGroup; *)
			QUERY:C277([PRICE_TABLE:28];  & [PRICE_TABLE:28]Product_Code:1=$5; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8="")
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$2)
			If (Records in selection:C76([PRICE_TABLE:28])>0)  //There are prices for the product currency
				//QUERY([PRICE$_bo_Convert:=False
				
				
				If (Records in selection:C76([PRICE_TABLE:28])>0)  //There are price table entries for this product
					//Filter to Date relevant
					PriceT_FilterDates
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						CREATE SET:C116([PRICE_TABLE:28]; "Touse")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
						//These are flat prices or discounts.
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							//Break these into prices and discounts(really we should not have multiple price table entries unles for the same quantity
							ARRAY REAL:C219($_ar_Prices; 0)
							ARRAY REAL:C219($_ar_Discounts; 0)
							For ($_l_PriceTableIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
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
								$_r_CostPrice:=$_ar_Prices{1}
								$_bo_PriceChanged:=True:C214
							End if 
							If (Size of array:C274($_ar_Discounts)>0)
								
								If ($_r_useSupplierCost#0)
									$_r_CostPrice:=Gen_Round(($_r_CostPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
								Else 
									$_r_Discount:=$_ar_Discounts{1}
									$_l_ComponentPriceClass:=2
								End if 
								
							End if 
							//Now see if there is a price for quantity to over-ride it or a discount to apply for quantity
							USE SET:C118("Touse")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[COMPONENTS:86]Quantity:3; *)
							QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
							QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>[COMPONENTS:86]Quantity:3)
							If (Records in selection:C76([PRICE_TABLE:28])=0)
								USE SET:C118("Touse")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[COMPONENTS:86]Quantity:3; *)
								QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0; *)
								QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=0)
								If (Records in selection:C76([PRICE_TABLE:28])=0)
									USE SET:C118("Touse")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0; *)
									QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>[COMPONENTS:86]Quantity:3)
								End if 
							End if 
							If (Records in selection:C76([PRICE_TABLE:28])>0)  //There is quantity based pricing or disocunts
								ARRAY REAL:C219($_ar_Prices; 0)
								ARRAY REAL:C219($_ar_Discounts; 0)
								For ($_l_PriceTableIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
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
									$_r_CostPrice:=$_ar_Prices{1}
									$_bo_PriceChanged:=True:C214
								End if 
								If (Size of array:C274($_ar_Discounts)>0)
									$_bo_PriceChanged:=True:C214
									If ($_r_useSupplierCost#0)
										$_r_CostPrice:=Gen_Round(($_r_CostPrice*((100-($_ar_Discounts{1}))/100)); 2; 1)
									Else 
										$_r_Discount:=$_ar_Discounts{1}
										$_l_ComponentPriceClass:=2
									End if 
								End if 
								
							End if 
						End if 
						If ($_bo_PriceChanged=False:C215)  //if we did not change the price but the currency was different-need to reset $_bo_Convert
							If (PRD_t_productCurrency#$_t_UseSupplierCurrency)
								$_bo_Convert:=True:C214
							End if 
						End if 
						
						
						If ($_l_ComponentPriceClass=2)
							
							$_r_CostPrice:=Gen_Round(($_r_CostPrice*((100-($_r_Discount))/100)); 2; 1)
							$6->:=Cat_ConvertValue($_r_CostPrice; $2; $4; Current date:C33(*))
							//OI_ar_BuildCodeCostStd{$Ref}:=OI_ar_BuildCodeCOSTPrice{$Ref}
						Else 
							$_r_CostPrice:=Cat_ConvertValue($_r_CostPrice; $2; $4; Current date:C33(*))
							$6->:=$_r_CostPrice
							//OI_ar_BuildCodeCOSTPrice{$Ref}:=$_r_CostPrice
							//OI_ar_BuildCodeCostStd{$Ref}:=OI_ar_BuildCodeCOSTPrice{$Ref}
						End if 
					End if 
				End if 
			Else 
				//No price table at all
				$_r_CostPrice:=Cat_ConvertValue($_r_CostPrice; $2; $4; Current date:C33(*))
				$6->:=$_r_CostPrice
			End if 
			
		End if 
	End if   //
Else 
	//No default price matrix so cant look up pricing
	If ($1#"")
		If ($2#$4)
			//The cost price will need to be converted
			$6->:=Cat_ConvertValue($_r_CostPrice; $2; $4; Current date:C33(*))
			
		Else 
			$6->:=$_r_CostPrice
			
		End if 
	Else 
		$6->:=0
		//No supplier-no cost
	End if 
End if 
ERR_MethodTrackerReturn("PRD_BuildGetComponentCost"; $_t_oldMethodName)
