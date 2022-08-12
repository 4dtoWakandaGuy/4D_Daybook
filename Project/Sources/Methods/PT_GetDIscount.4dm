//%attributes = {}
If (False:C215)
	//Project Method Name:      PT_GetDIscount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 22:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DiscountBasedGroups; 0)
	C_BOOLEAN:C305($_bo_PurchasePrice; $9)
	C_LONGINT:C283($_l_Index)
	C_REAL:C285($_r_CurrentPrice; $1; $2; $3; $5; $6; $7; $8)
	C_TEXT:C284($_t_CompanyCode; $_t_CompanyPriceGroup; $_t_oldMethodName; $_t_ProductBrandCode; $_t_productCode; $_t_ProductGroupCode; $4; PRD_t_FurtherApplicable)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_GetDIscount")
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
//we want price discount structure first

$_r_CurrentPrice:=$6
If ($5>0)
	If (Count parameters:C259>=9)
		$_bo_PurchasePrice:=$9
	End if 
	If ([COMPANIES:2]x_ID:63#$5)
		//get the company record
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$5)
	End if 
	If (Records in selection:C76([COMPANIES:2])=1)  //it should do
		ARRAY TEXT:C222($_at_DiscountBasedGroups; 0)
		QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Based:3=False:C215)
		SELECTION TO ARRAY:C260([PRICE_GROUPS:18]Price_Code:1; $_at_DiscountBasedGroups)
		$_t_CompanyPriceGroup:=[COMPANIES:2]SO_Price_Group:44
		If ([COMPANIES:2]SO_Price_Group:44="")
			RELATE ONE:C42([COMPANIES:2]Company_Type:13)
			If ([TYPES:5]SO_Price_Group:4#"")
				$_t_CompanyPriceGroup:=[TYPES:5]SO_Price_Group:4
			End if 
		End if 
		
		$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
		If ($_t_CompanyPriceGroup#"")
			QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_CompanyPriceGroup)
			If (Not:C34([PRICE_GROUPS:18]Price_Based:3))
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_t_CompanyPriceGroup)
				//this gives us all the discount table entries for this group
				CREATE SET:C116([PRICE_TABLE:28]; "GroupEntries")
			Else 
				//this is a Price so ignore at this point
				CREATE EMPTY SET:C140([PRICE_TABLE:28]; "GroupEntries")
			End if 
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$_t_CompanyCode)
			//we are only interested in ones that are discount
			CREATE SET:C116([PRICE_TABLE:28]; "Company entries2")
			CREATE EMPTY SET:C140([PRICE_TABLE:28]; "Company entries")
			For ($_l_Index; 1; Size of array:C274($_at_DiscountBasedGroups))
				USE SET:C118("Company entries2")
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_at_DiscountBasedGroups{$_l_Index})
				CREATE SET:C116([PRICE_TABLE:28]; "Temp")
				UNION:C120("Temp"; "Company entries"; "Company entries")
			End for 
			CLEAR SET:C117("Temp")
			CLEAR SET:C117("Companyentries2")
			USE SET:C118("CompanyEntries")
			If (Records in selection:C76([PRICE_TABLE:28])>0)  // all the discount entries for this company
				//there are company entries
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
				If (PRD_t_FurtherApplicable#"")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
				End if 
				
				PT_GetPO($_bo_PurchasePrice)
				PT_GetQty($8)
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
					USE SET:C118("GroupEntries")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
					PT_GetPO($_bo_PurchasePrice)
					
					PT_GetQty($8)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
						If ([PRICE_GROUPS:18]Override:6)
							$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
						End if 
					End if 
					
				Else 
					//no product price for the company
					USE SET:C118("GroupEntries")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$_t_productCode)
					PT_GetPO($_bo_PurchasePrice)
					PT_GetQty($8)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
						
					Else 
						//no product price entries for the price group
						//check for a brand entry for the company
						USE SET:C118("CompanyEntries")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
						PT_GetPO($_bo_PurchasePrice)
						
						PT_GetQty($8)
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
							USE SET:C118("GroupEntries")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
							PT_GetPO($_bo_PurchasePrice)
							PT_GetQty($8)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
								If ([PRICE_GROUPS:18]Override:6)
									$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
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
								$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
								
							Else 
								//no price table entries for this brand for the group(Not suprised)
								USE SET:C118("CompanyEntries")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroupCode)
								PT_GetPO($_bo_PurchasePrice)
								PT_GetQty($8)
								//this would be even less likely!!
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
									USE SET:C118("GroupEntries")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroupCode)
									PT_GetPO($_bo_PurchasePrice)
									PT_GetQty($8)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
										If ([PRICE_GROUPS:18]Override:6)
											$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
										End if 
									End if 
									
								Else 
									USE SET:C118("GroupEntries")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroupCode)
									PT_GetPO($_bo_PurchasePrice)
									PT_GetQty($8)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
										
										
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
					PT_GetPO($_bo_PurchasePrice)
					PT_GetQty($8)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
					Else 
						USE SET:C118("GroupEntries")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$_t_ProductBrandCode)
						PT_GetPO($_bo_PurchasePrice)
						PT_GetQty($8)
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
						Else 
							USE SET:C118("GroupEntries")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6=$_t_ProductGroupCode)
							PT_GetPO($_bo_PurchasePrice)
							PT_GetQty($8)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								$_r_CurrentPrice:=$_r_CurrentPrice-($_r_CurrentPrice*([PRICE_TABLE:28]Price_Discount:3/100))
							End if 
						End if 
					End if 
				End if   //no group entries
			End if 
		End if 
	End if   //company did not exist~~~~~~~~~~~
End if   //no company selected so no special prices
ERR_MethodTrackerReturn("PT_GetDIscount"; $_t_oldMethodName)