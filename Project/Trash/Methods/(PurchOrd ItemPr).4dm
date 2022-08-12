//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd ItemPr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PurchOrd ItemPr
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess; $_bo_SetPrice)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_index; $_l_SupplierUpdateOption; DF_l_ListedOnly; DF_l_SupplierOption; Prod_l_ListedOnly)
	C_REAL:C285($_r_NewCost; $_r_SalesPrice)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_Cost; $_t_CostNow; $_t_oldMethodName; $_t_SalesPrice; PROD_t_SupplierOption)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd ItemPr")
//PurchOrd ItemPr
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 


If ((DB_GetModuleSettingByNUM(Module_Companies)#3) & (<>PER_bo_ProdUpdateAccess) & ([PURCHASE_ORDERS:57]Company_Code:1#<>SYS_t_StockOrderCompany))
	If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
		READ WRITE:C146([PRODUCTS:9])
		If ([PRODUCTS:9]Product_Code:1#[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
		End if 
		If ([PRODUCTS:9]Price_Updates:25)
			//```
			ARRAY TEXT:C222(Prod_at_SupplierOption; 3)
			Prod_at_SupplierOption{1}:="Auto add suppliers to list"
			Prod_at_SupplierOption{2}:="Ask to add suppliers to list"
			Prod_at_SupplierOption{3}:="Do not add suppliers to list"
			//The above only loaded for clarity
			Prod_l_ListedOnly:=0
			$_l_SupplierUpdateOption:=[PRODUCTS:9]x_Supplier_Update_Option:47
			If ($_l_SupplierUpdateOption=0)
				//Load the default
				DF_LoadProdPriceSettings
				If (DF_l_SupplierOption>0)
					[PRODUCTS:9]x_Supplier_Update_Option:47:=DF_l_SupplierOption
					For ($_l_index; 1; Size of array:C274(Prod_at_SupplierOption))
						$_bo_SetPrice:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_index
						If ($_bo_SetPrice)
							Prod_at_SupplierOption:=$_l_index
							PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_index}
							$_l_index:=Size of array:C274(Prod_at_SupplierOption)
						End if 
					End for 
					Prod_l_ListedOnly:=DF_l_ListedOnly  //Only allow list suppliers on order
				End if 
				
			Else 
				For ($_l_index; 1; Size of array:C274(Prod_at_SupplierOption))
					$_bo_SetPrice:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_index
					If ($_bo_SetPrice)
						Prod_at_SupplierOption:=$_l_index
						PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_index}
						$_l_index:=Size of array:C274(Prod_at_SupplierOption)
					End if 
					Prod_l_ListedOnly:=Num:C11([PRODUCTS:9]x_Supplier_Update_Option:47 ?? 4)
				End for 
				
			End if 
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
			If ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11#[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)
				If ([PRODUCTS_SUPPLIERS:148]Cost_Price:2#0)
					Gen_Confirm("Do you want to update the Product's Cost Price?"; "Yes"; "No")
					If (OK=1)
						If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9#[PURCHASE_ORDERS:57]Currency_Code:16)
							$_r_NewCost:=Cat_ConvertValue([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11; [PURCHASE_ORDERS:57]Currency_Code:16; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
							
						Else 
							$_r_NewCost:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
						End if 
						If (False:C215)  //these lines make little sense
							$_t_CostNow:=String:C10($_r_NewCost)
							$_t_Cost:=String:C10([PRODUCTS_SUPPLIERS:148]Cost_Price:2)
							$_t_SalesPrice:=String:C10([PRODUCTS:9]Sales_Price:9)
							$_r_SalesPrice:=Num:C11(Gen_Request("Did cost "+$_t_Cost+", now "+$_t_CostNow+". New Sales Price?"; $_t_SalesPrice))
							If (OK=1)
								[PRODUCTS:9]Sales_Price:9:=$_r_SalesPrice
							End if 
						End if 
						[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=$_r_NewCost
						//   [PRODUCTS]SUPPLIERS'Margin:=Gen_Round (((([PRODUCTS]Sales Price-
						//[PRODUCTS]SUPPLIERS'Cost Price)/[PRODUCTS]Sales Price)*100);2;4)
						[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
						DB_SaveRecord(->[PRODUCTS:9])
						AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
						UNLOAD RECORD:C212([PRODUCTS:9])
						READ ONLY:C145([PRODUCTS:9])
						LOAD RECORD:C52([PRODUCTS:9])
					End if 
				Else 
					//no cost price on product for this supplier so just set it
					If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9#[PURCHASE_ORDERS:57]Currency_Code:16)
						$_r_NewCost:=Cat_ConvertValue([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11; [PURCHASE_ORDERS:57]Currency_Code:16; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
						
					Else 
						$_r_NewCost:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
					End if 
					[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
					DB_SaveRecord(->[PRODUCTS:9])
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
					UNLOAD RECORD:C212([PRODUCTS:9])
					READ ONLY:C145([PRODUCTS:9])
					LOAD RECORD:C52([PRODUCTS:9])
					
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PurchOrd ItemPr"; $_t_oldMethodName)