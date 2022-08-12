//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI SubCost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess)
	C_LONGINT:C283(<>Mod_l_MaxModules)
	C_REAL:C285($_r_SuppliersCostPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_StockOrderCompany; $_t_CostPriceCurrencyCode; $_t_oldMethodName; $_t_OrdersCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI SubCost")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
If (([ORDER_ITEMS:25]Product_Code:2#"") & (DB_GetModuleSettingByNUM(Module_Companies)#3) & (<>PER_bo_ProdUpdateAccess) & ([ORDER_ITEMS:25]Supplier_Code:20#<>SYS_t_StockOrderCompany))
	If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
	End if 
	If ([PRODUCTS:9]Price_Updates:25)
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		
		QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[ORDER_ITEMS:25]Supplier_Code:20)
		$_r_SuppliersCostPrice:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
		$_t_OrdersCurrency:=[ORDERS:24]Currency_Code:32
		If ($_t_OrdersCurrency="")
			$_t_OrdersCurrency:=<>SYS_t_BaseCurrency
		End if 
		If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
			$_t_CostPriceCurrencyCode:=$_t_OrdersCurrency
		Else 
			$_t_CostPriceCurrencyCode:=[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9
		End if 
		If ($_t_CostPriceCurrencyCode#"")
			If ($_t_CostPriceCurrencyCode#$_t_OrdersCurrency)
				$_r_SuppliersCostPrice:=Cat_ConvertValue($_r_SuppliersCostPrice; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_t_OrdersCurrency; Current date:C33(*))
			End if 
		End if 
		If (($_r_SuppliersCostPrice#[ORDER_ITEMS:25]Cost_Price:5) & ([ORDER_ITEMS:25]Cost_Price:5>0))
			If (DB_t_CurrentFormUsage#"None")
				//NG the additional new options only apply to the supplier not the price
				Gen_Confirm_WithHideOption(302; "Do you want to update the Product's Cost Price?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([PRODUCTS:9])
					LOAD RECORD:C52([PRODUCTS:9])
					QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
					
					QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[ORDER_ITEMS:25]Supplier_Code:20)
					If (([ORDERS:24]Offer_Price:20=False:C215) | ([PRODUCTS_SUPPLIERS:148]Cost_Price:2=0))
						If ($_t_CostPriceCurrencyCode#$_t_OrdersCurrency)
							[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=Cat_ConvertValue([ORDER_ITEMS:25]Cost_Price:5; $_t_OrdersCurrency; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
							
						Else 
							[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[ORDER_ITEMS:25]Cost_Price:5
							[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[ORDERS:24]Currency_Code:32
						End if 
						If ([PRODUCTS:9]Sales_Price:9=0)
							[PRODUCTS_SUPPLIERS:148]Margin:3:=0
						Else 
							//   [PRODUCTS]SUPPLIERS'Margin:=Gen_Round (((([PRODUCTS]Sales Price-
							//[PRODUCTS]SUPPLIERS'Cost Price)/[PRODUCTS]Sales Price)*100);2;4)
							[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
						End if 
					Else 
						If ($_t_CostPriceCurrencyCode#$_t_OrdersCurrency)
							[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=Cat_ConvertValue([PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_t_OrdersCurrency; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
							
						Else 
							[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[ORDERS:24]Currency_Code:32
							[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=[ORDER_ITEMS:25]Cost_Price:5
						End if 
						If ([PRODUCTS:9]Sales_Price:9=0)
							[PRODUCTS_SUPPLIERS:148]Margin:3:=0
						Else 
							
							[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Standard_Cost:5); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
						End if 
					End if 
					DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
					DB_SaveRecord(->[PRODUCTS:9])
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
					READ ONLY:C145([PRODUCTS:9])
					UNLOAD RECORD:C212([PRODUCTS:9])
				End if 
			End if 
			
		End if 
		AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		//  End if
	End if 
End if 
OrderI_BunCost(1)
ERR_MethodTrackerReturn("OrderI SubCost"; $_t_oldMethodName)
