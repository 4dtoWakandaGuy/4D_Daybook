//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LoadPriceMatrix
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PROD_LoadPriceMatrix`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Prod_lb_PriceBox;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_aQfrom;0)
	//ARRAY LONGINT(PROD_al_aQto;0)
	//ARRAY LONGINT(PROD_al_ProductCatalogueID;0)
	//ARRAY REAL(PROD_ar_DiscountPrices;0)
	//ARRAY TEXT(PRD_at_CatalogueNames;0)
	//ARRAY TEXT(PROD_at_CurrencyCodes;0)
	//ARRAY TEXT(PROD_at_DiscountType;0)
	//ARRAY TEXT(PROD_at_PriceCodes;0)
	//ARRAY TEXT(PROD_at_PriceGroupCode;0)
	//ARRAY TEXT(PROD_at_PriceName;0)
	//ARRAY TEXT(PROD_at_ProductBrandCode;0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	//ARRAY TEXT(PROD_at_ProductPriceID;0)
	//ARRAY TEXT(PROD_at_PriceCompanyCode;0)
	C_BOOLEAN:C305($_bo_noCurrency)
	C_LONGINT:C283($_l_CatalogueIndex; $_l_CatalogueIndex2; $_l_CatalogueRow; $_l_Element; $_l_Index; $_l_SizeofArray; Price_l_BUT1; Price_l_BUT10; Price_l_BUT2; Price_l_BUT3; Price_l_BUT4)
	C_LONGINT:C283(Price_l_BUT5; Price_l_BUT6; Price_l_BUT7; Price_l_BUT8; Price_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; oPrice_COL1; oPrice_COL10; oPrice_COL2; oPrice_COL3; oPrice_COL4; oPrice_COL5; oPrice_COL6)
	C_TEXT:C284(oPrice_COL7; oPrice_COL8; oPrice_COL9; oPrice_HED1; oPrice_HED10; oPrice_HED2; oPrice_HED3; oPrice_HED4; oPrice_HED5; oPrice_HED6; oPrice_HED7)
	C_TEXT:C284(oPrice_HED8; oPrice_HED9; PROD_t_Currency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadPriceMatrix")
//this method will load the price matrix for a given product
QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$1; *)
QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Group_Code:6=$2; *)
QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=$3)

ARRAY TEXT:C222(PROD_at_PriceGroupCode; 0)
ARRAY TEXT:C222(PROD_at_PriceCompanyCode; 0)
ARRAY TEXT:C222(PROD_at_ProductPriceID; 0)
ARRAY TEXT:C222(PROD_at_CurrencyCodes; 0)
ARRAY TEXT:C222(PROD_at_PriceCodes; 0)
ARRAY TEXT:C222(PROD_at_ProductBrandCode; 0)
ARRAY TEXT:C222(PROD_at_ProductCodes; 0)

SELECTION TO ARRAY:C260([PRICE_TABLE:28]Table_Code:12; PROD_at_ProductPriceID; [PRICE_TABLE:28]Price_Code:2; PROD_at_PriceCodes; [PRICE_TABLE:28]Product_Code:1; PROD_at_ProductCodes; [PRICE_TABLE:28]Group_Code:6; PROD_at_PriceGroupCode; [PRICE_TABLE:28]Brand_Code:7; PROD_at_ProductBrandCode; [PRICE_TABLE:28]Company_Code:8; PROD_at_PriceCompanyCode; [PRICE_TABLE:28]Quantity_From:9; PROD_al_aQfrom; [PRICE_TABLE:28]Quantity_To:10; PROD_al_aQto)
SELECTION TO ARRAY:C260([PRICE_TABLE:28]Price_Discount:3; PROD_ar_DiscountPrices; [PRICE_TABLE:28]Currency_Code:13; PROD_at_CurrencyCodes; [PRICE_TABLE:28]x_CatalogueID:14; PROD_al_ProductCatalogueID)
ARRAY TEXT:C222(PROD_at_DiscountType; Size of array:C274(PROD_at_PriceCodes))
ARRAY TEXT:C222(PROD_at_PriceName; Size of array:C274(PROD_at_PriceCodes))
For ($_l_Index; 1; Size of array:C274(PROD_at_ProductPriceID))
	If (PROD_at_PriceCodes{$_l_Index}#"")
		QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=PROD_at_PriceCodes{$_l_Index})
		PROD_at_PriceName{$_l_Index}:=[PRICE_GROUPS:18]Price_Name:2
		If ([PRICE_GROUPS:18]Cost_Prices:4)
			PROD_at_DiscountType{$_l_Index}:="Cost Prices (PO only)"
		Else 
			PROD_at_DiscountType{$_l_Index}:="Sales Prices (SO only)"
		End if 
		If ([PRICE_GROUPS:18]Price_Based:3)
			If ([PRICE_GROUPS:18]Cost_Prices:4)
				PROD_at_DiscountType{$_l_Index}:="Cost Price"
			Else 
				PROD_at_DiscountType{$_l_Index}:="Sales Price"
			End if 
		Else 
			If (PROD_al_ProductCatalogueID{$_l_Index}=0)
				PROD_at_DiscountType{$_l_Index}:="Discount %"
			Else 
				PROD_at_DiscountType{$_l_Index}:="Sales Price"
			End if 
			
		End if 
	Else 
		If (PROD_al_ProductCatalogueID{$_l_Index}=0)
			PROD_at_DiscountType{$_l_Index}:="Discount %"
		Else 
			PROD_at_DiscountType{$_l_Index}:="Sales Price"
		End if 
	End if 
	If (PROD_at_PriceCompanyCode{$_l_Index}#"")
		//Query([companies];[COmpanies]Com
		//dont want to move the current pointer on companies
		
	End if 
	
End for 
//if there are any set up the price table
//will have the PRODUCT CODE and the CATALOGUE ID
//here we are going to put in any extra pricing for the catalogues.
//any extra ones will have a PRICE not a discount.
If (Size of array:C274(PROD_al_ProductCatalogueID)>0)
	$_l_SizeofArray:=Size of array:C274(PROD_at_ProductPriceID)+1
	$_l_SizeofArray:=Size of array:C274(PROD_al_ProductCatalogueID)
	INSERT IN ARRAY:C227(PROD_at_ProductPriceID; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_PriceCodes; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_ProductCodes; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_PriceGroupCode; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_ProductBrandCode; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_PriceCompanyCode; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_al_aQfrom; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_al_aQto; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_ar_DiscountPrices; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_CurrencyCodes; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_DiscountType; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_at_PriceName; $_l_SizeofArray; $_l_SizeofArray)
	INSERT IN ARRAY:C227(PROD_al_ProductCatalogueID; $_l_SizeofArray; $_l_SizeofArray)
	
	$_l_Element:=$_l_SizeofArray-1
	For ($_l_CatalogueIndex; 1; Size of array:C274(CAT_al_CatalogueID))
		$_l_CatalogueRow:=Find in array:C230(PROD_al_ProductCatalogueID; CAT_al_CatalogueID{$_l_CatalogueIndex})
		If ($_l_CatalogueRow<0)
			$_l_Element:=$_l_Element+1  //create a pseudo entry
			PROD_at_ProductPriceID{$_l_Element}:="-"+String:C10($_l_Element)
			PROD_at_PriceCodes{$_l_Element}:=PRD_at_CatalogueNames{$_l_CatalogueIndex}
			PROD_at_ProductCodes{$_l_Element}:=[PRODUCTS:9]Product_Code:1
			PROD_at_CurrencyCodes{$_l_Element}:=PROD_t_Currency
			PROD_at_DiscountType{$_l_Element}:="Sales Price"
			PROD_ar_DiscountPrices{$_l_Element}:=[PRODUCTS:9]Sales_Price:9
			PROD_al_ProductCatalogueID{$_l_Element}:=CAT_al_CatalogueID{$_l_CatalogueIndex}
		Else 
			//check currency
			$_bo_noCurrency:=True:C214
			For ($_l_CatalogueIndex2; $_l_CatalogueRow; Size of array:C274(PROD_al_ProductCatalogueID))
				If (PROD_al_ProductCatalogueID{$_l_CatalogueIndex2}=PROD_al_ProductCatalogueID{$_l_CatalogueIndex})
					If (PROD_at_CurrencyCodes{$_l_CatalogueIndex2}=PROD_t_Currency)
						$_bo_noCurrency:=False:C215
						$_l_CatalogueIndex:=99999
						$_l_CatalogueIndex2:=99999
					End if 
				Else 
					$_l_CatalogueIndex:=99999
				End if 
			End for 
			If ($_bo_noCurrency)
				//there is no listing for the default currency
			End if 
			
			
		End if 
	End for 
	
End if 


//now put this into a listbox area
//this is not editable-button for add record.
LB_SetupListbox(->Prod_lb_PriceBox; "oprice"; "price_L"; 1; ->PROD_at_PriceName; ->PROD_at_ProductCodes; ->PROD_at_PriceGroupCode; ->PROD_at_ProductBrandCode; ->PROD_at_PriceCompanyCode; ->PROD_al_aQfrom; ->PROD_al_aQto; ->PROD_at_CurrencyCodes; ->PROD_at_DiscountType; ->PROD_ar_DiscountPrices)

LB_SetColumnHeaders(->Prod_lb_PriceBox; "price_L"; 1; "Price Group"; "Product"; "Group"; "Brand"; "Company"; "Qty From"; "Qty To"; "Currency"; "Price Type"; "Price/Discount")

LB_SetColumnWidths(->Prod_lb_PriceBox; "oprice"; 1; 151; 188; 40; 50; 50; 50; 50; 100; 100; 80)  // dont need to worry about the invisible ones

LB_SetScroll(->Prod_lb_PriceBox; -2; -2)
OBJECT SET FORMAT:C236(PROD_al_aQfrom; "######0")
OBJECT SET FORMAT:C236(PROD_al_aQto; "######0")
OBJECT SET FORMAT:C236(PROD_ar_DiscountPrices; "######0")
LB_StyleSettings(->Prod_lb_PriceBox; "Black"; 9; "price"; ->[PREFERENCES:116])
ERR_MethodTrackerReturn("PROD_LoadPriceMatrix"; $_t_oldMethodName)
