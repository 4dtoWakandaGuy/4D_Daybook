//%attributes = {}
If (False:C215)
	//Project Method Name:      PT_GetPrice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 22:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PriceBasedGroups; 0)
	C_BOOLEAN:C305($_bo_Proceed; $_bo_PurchasePrice; $9)
	C_LONGINT:C283($_l_index)
	C_REAL:C285($_r_OutputPrice; $_r_SalesPrice; $1; $2; $3; $5; $6; $7; $8)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CompanyCode; $_t_CompanyPriceGroup; $_t_CurrencyCode; $_t_oldMethodName; $_t_ProductBrandCode; $_t_productCode; $_t_ProductCurrencyCode; $_t_ProductGroup; $4; PRD_t_FurtherApplicable)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_GetPrice")
//pass this method
//THE FOLLOWING PARAMETERS
//$1=The catalogue ID
//$2=The Sales Currency ID
//$3=The product ID
//$4=The product code
//**pass The product ID or Code or both
//$5 `The Company ID
//$6=the current sales price
//$7=the RETAIL price
//$8=the quantity

$_r_OutputPrice:=0
If (Count parameters:C259>=8)  //A
	If (Count parameters:C259>=9)
		$_bo_PurchasePrice:=$9
	Else 
		$_bo_PurchasePrice:=False:C215
	End if 
	
	If ($2=0)  //B
		$_t_CurrencyCode:=<>SYS_t_BaseCurrency
	Else   // B
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$2)
		$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
	End if   //END B
	
	$_bo_Proceed:=True:C214
	$_t_productCode:=$4
	If ($4="")  //C
		If ($3>0)  //D
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$3)
			$_t_productCode:=$4
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)  //E
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				$_t_ProductCurrencyCode:=[CURRENCIES:71]Currency_Code:1
			Else   //E
				$_t_ProductCurrencyCode:=<>SYS_t_BaseCurrency
			End if   //E
		Else   //D  `
			$_bo_Proceed:=False:C215
		End if   //D
	End if   //C
	If ($_bo_Proceed)  //1
		If ($1>0)  //this is in a catalogue`2
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_CatalogueID:14=$1; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				//Create a record for the price table
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1="CAT")
				If (Records in selection:C76([PRICE_GROUPS:18])=0)
					READ WRITE:C146([PRICE_GROUPS:18])
					CREATE RECORD:C68([PRICE_GROUPS:18])
					
					[PRICE_GROUPS:18]Price_Code:1:="CAT"
					[PRICE_GROUPS:18]Price_Name:2:="Catalogue Price Table"
					[PRICE_GROUPS:18]Price_Based:3:=True:C214
					[PRICE_GROUPS:18]PriceGroupClass:9:=1
					[PRICE_GROUPS:18]Cost_Prices:4:=False:C215
					[PRICE_GROUPS:18]Automatic:5:=False:C215
					[PRICE_GROUPS:18]Override:6:=False:C215
					[PRICE_GROUPS:18]Export:7:=""
					[PRICE_GROUPS:18]Currency_Code:8:=""
					DB_SaveRecord(->[PRICE_GROUPS:18])
					UNLOAD RECORD:C212([PRICE_GROUPS:18])
					READ ONLY:C145([PRICE_GROUPS:18])
				End if 
				
				READ WRITE:C146([PRICE_TABLE:28])
				CREATE RECORD:C68([PRICE_TABLE:28])
				[PRICE_TABLE:28]Product_Code:1:=$_t_productCode
				[PRICE_TABLE:28]Price_Code:2:="CAT"
				[PRICE_TABLE:28]Price_Discount:3:=[PRODUCTS:9]Sales_Price:9
				[PRICE_TABLE:28]Field_Value_F:4:=""
				[PRICE_TABLE:28]Field_Value_T:5:=""
				[PRICE_TABLE:28]Group_Code:6:=""
				[PRICE_TABLE:28]Brand_Code:7:=""
				[PRICE_TABLE:28]Company_Code:8:=""
				[PRICE_TABLE:28]Quantity_From:9:=0
				[PRICE_TABLE:28]Quantity_To:10:=0
				[PRICE_TABLE:28]Export:11:=""
				[PRICE_TABLE:28]Pricing_Basis:17:=1
				[PRICE_TABLE:28]Table_Code:12:=Gen_CodePref(21; ->[PRICE_TABLE:28]Table_Code:12)
				If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
					[PRICE_TABLE:28]Currency_Code:13:=[CURRENCIES:71]Currency_Code:1
					$_t_ProductCurrencyCode:=[CURRENCIES:71]Currency_Code:1
				Else 
					[PRICE_TABLE:28]Currency_Code:13:=<>SYS_t_BaseCurrency
					$_t_ProductCurrencyCode:=<>SYS_t_BaseCurrency
				End if 
				[PRICE_TABLE:28]x_CatalogueID:14:=$1
				DB_SaveRecord(->[PRICE_TABLE:28])
				UNLOAD RECORD:C212([PRICE_TABLE:28])
				READ ONLY:C145([PRICE_TABLE:28])
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_CatalogueID:14=$1; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
			End if   //2
			//we now have at least one price table record
			If (Records in selection:C76([PRICE_TABLE:28])>1)
				CREATE SET:C116([PRICE_TABLE:28]; "MatchCatalogue")
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Currency_Code:13=$_t_CurrencyCode)
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					//there is no price table for the sales currency
					//so use the product currency
					USE SET:C118("MatchCatalogue")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Currency_Code:13=$_t_ProductCurrencyCode)
					//this has to exist and is therefore the one to use
					PT_GetPO($_bo_PurchasePrice)
					PT_GetQty($8)
					
					
					CLEAR SET:C117("MatchCatalogue")
				End if 
			Else 
				PT_GetPO($_bo_PurchasePrice)
				PT_GetQty($8)
				
			End if 
			If ([PRICE_TABLE:28]Currency_Code:13#$_t_CurrencyCode)
				//this needs to be converted at the current conversion rate
				$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
				//        convert
			Else 
				//this is the sales price
				$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
			End if 
		Else   //2
			//not in a catalogue($1=0)
			
			
			If ($_t_ProductCurrencyCode#$_t_CurrencyCode)
				$_r_SalesPrice:=[PRODUCTS:9]Sales_Price:9
				// convert
			Else 
				$_r_SalesPrice:=[PRODUCTS:9]Sales_Price:9
			End if 
			
		End if   //if catalogue
		//we now have set a basic price for this item
		//now we check for special prices for this company of price group
		If ($5>0)
			If ([COMPANIES:2]x_ID:63#$5)
				//get the company record
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$5)
				
			End if 
			If (Records in selection:C76([COMPANIES:2])=1)  //it should do
				ARRAY TEXT:C222($_at_PriceBasedGroups; 0)
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Based:3=True:C214)
				SELECTION TO ARRAY:C260([PRICE_GROUPS:18]Price_Code:1; $_at_PriceBasedGroups)
				$_t_CompanyPriceGroup:=[COMPANIES:2]SO_Price_Group:44
				If ([COMPANIES:2]SO_Price_Group:44="")
					RELATE ONE:C42([COMPANIES:2]Company_Type:13)
					If ([TYPES:5]SO_Price_Group:4#"")
						$_t_CompanyPriceGroup:=[TYPES:5]SO_Price_Group:4
					End if 
					
					$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
					If ($_t_CompanyPriceGroup#"")
						QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_CompanyPriceGroup)
						If ([PRICE_GROUPS:18]Price_Based:3)
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_t_CompanyPriceGroup)
							//this gives us all the price table entries for this group
							CREATE SET:C116([PRICE_TABLE:28]; "GroupEntries")
						Else 
							//this is a discount structure so ignore at this point
							CREATE EMPTY SET:C140([PRICE_TABLE:28]; "GroupEntries")
						End if 
						QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$_t_CompanyCode)
						//we are only interested in ones that are price based
						CREATE SET:C116([PRICE_TABLE:28]; "Company entries2")
						CREATE EMPTY SET:C140([PRICE_TABLE:28]; "Company entries")
						For ($_l_index; 1; Size of array:C274($_at_PriceBasedGroups))
							USE SET:C118("Company entries2")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_at_PriceBasedGroups{$_l_index})
							CREATE SET:C116([PRICE_TABLE:28]; "Temp")
							UNION:C120("Temp"; "Company entries"; "Company entries")
						End for 
						CLEAR SET:C117("Temp")
						CLEAR SET:C117("Companyentries2")
						USE SET:C118("CompanyEntries")
						If (Records in selection:C76([PRICE_TABLE:28])>0)  // all the price entries for this company
							//there are company entries
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
							
							If (PRD_t_FurtherApplicable#"")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
							End if 
							
							PT_GetPO($_bo_PurchasePrice)
							PT_GetQty($8)
							
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
								//need to check the  price group price does not override
								USE SET:C118("GroupEntries")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
								
								If (PRD_t_FurtherApplicable#"")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
								End if 
								
								PT_GetPO($_bo_PurchasePrice)
								PT_GetQty($8)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
									If ([PRICE_GROUPS:18]Override:6)
										$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
									End if 
								End if 
								
							Else 
								//no product price for the company
								USE SET:C118("GroupEntries")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
								If (PRD_t_FurtherApplicable#"")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
								End if 
								
								PT_GetPO($_bo_PurchasePrice)
								PT_GetQty($8)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
								Else 
									//no product price entries for the price group
									//check for a brand entry for the company
									USE SET:C118("CompanyEntries")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
									PT_GetPO($_bo_PurchasePrice)
									PT_GetQty($8)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
										USE SET:C118("GroupEntries")
										QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
										PT_GetPO($_bo_PurchasePrice)
										PT_GetQty($8)
										If (Records in selection:C76([PRICE_TABLE:28])>0)
											QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
											If ([PRICE_GROUPS:18]Override:6)
												$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
											End if 
										End if 
										
									Else 
										//no price table entries for this company for this brand
										//actually i think it would be wierd to charge people the same price for everythin
										//in the same brand but there you go
										USE SET:C118("GroupEntries")
										QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
										PT_GetPO($_bo_PurchasePrice)
										PT_GetQty($8)
										If (Records in selection:C76([PRICE_TABLE:28])>0)
											$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
											
										Else 
											//no price table entries for this brand for the group(Not suprised)
											USE SET:C118("CompanyEntries")
											QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroup)
											PT_GetPO($_bo_PurchasePrice)
											PT_GetQty($8)
											//this would be even less likely!!
											If (Records in selection:C76([PRICE_TABLE:28])>0)
												$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
												USE SET:C118("GroupEntries")
												QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroup)
												PT_GetPO($_bo_PurchasePrice)
												PT_GetQty($8)
												If (Records in selection:C76([PRICE_TABLE:28])>0)
													QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
													If ([PRICE_GROUPS:18]Override:6)
														$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
													End if 
												End if 
												
											Else 
												USE SET:C118("GroupEntries")
												QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroup)
												PT_GetPO($_bo_PurchasePrice)
												
												PT_GetQty($8)
												If (Records in selection:C76([PRICE_TABLE:28])>0)
													$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
													
												End if 
												
											End if 
											
											
											
											
										End if 
									End if 
								End if 
							End if 
							
							
							
						Else 
							//no company entries
							USE SET:C118("GroupEntries")
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
								If (PRD_t_FurtherApplicable#"")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
								End if 
								
								PT_GetPO($_bo_PurchasePrice)
								PT_GetQty($8)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
								Else 
									USE SET:C118("GroupEntries")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
									PT_GetPO($_bo_PurchasePrice)
									PT_GetQty($8)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
									Else 
										USE SET:C118("GroupEntries")
										QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroup)
										PT_GetPO($_bo_PurchasePrice)
										
										PT_GetQty($8)
										If (Records in selection:C76([PRICE_TABLE:28])>0)
											$_r_SalesPrice:=[PRICE_TABLE:28]Price_Discount:3
										End if 
									End if 
								End if 
							End if   //no group entries
						End if 
					End if 
				End if   //company did not exist~~~~~~~~~~~
			End if   //no company selected so no special prices
		End if   //2
		//we now have the price for this product/brand etc
		//for this company
		//for this catalogue
		//now can check for discount
		//i am breaking out into another routine
		//or we get to big and complicated
		PT_GetDIscount($1; $2; $3; $4; $5; $6; $7; $8; $_bo_PurchasePrice)
		
		
		
		
		
		
		
		
		
	End if   //1 no proceed
End if   //A
ERR_MethodTrackerReturn("PT_GetPrice"; $_t_oldMethodName)