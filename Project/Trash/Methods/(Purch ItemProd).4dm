//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch ItemProd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess)
	C_LONGINT:C283(<>Mod_l_MaxModules)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_r_CostPrice; $_t_CostPrice; $_t_CostPriceNow; $_t_oldMethodName; $_t_SalesPrice)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch ItemProd")
//Purch ItemProd
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
If ((DB_GetModuleSettingByNUM(Module_Companies)#3) & (<>PER_bo_ProdUpdateAccess) & ([PURCHASE_INVOICES:37]Company_Code:2#<>SYS_t_StockOrderCompany))
	READ WRITE:C146([PRODUCTS:9])
	RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
	If ([PRODUCTS:9]Price_Updates:25)
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
		If (([PURCHASE_INVOICE_ITEMS:158]Product_Code:1#"") & ([PURCHASE_INVOICE_ITEMS:158]Cost_Price:3#[PRODUCTS_SUPPLIERS:148]Cost_Price:2) & ([PURCHASE_INVOICE_ITEMS:158]Price_Per:10>0))
			Gen_Confirm("Do you want to update the Product's Cost Price?"; "Yes"; "No")
			If (OK=1)
				$_t_CostPriceNow:=String:C10([PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
				$_t_CostPrice:=String:C10([PRODUCTS_SUPPLIERS:148]Cost_Price:2)
				$_t_SalesPrice:=String:C10([PRODUCTS:9]Sales_Price:9)
				$_r_SalesPrice:=Num:C11(Gen_Request("Did cost "+$_t_CostPrice+", now "+$_t_CostPriceNow+". New Sales Price?"; $_t_SalesPrice))
				If (OK=1)
					[PRODUCTS:9]Sales_Price:9:=$_r_SalesPrice
				End if 
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
					CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
					[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
					[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
					[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_INVOICES:37]Company_Code:2
				End if 
				[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3
				If ([PRODUCTS:9]Sales_Price:9#0)
					[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
				Else 
					[PRODUCTS_SUPPLIERS:148]Margin:3:=0
				End if 
				DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
				
				DB_SaveRecord(->[PRODUCTS:9])
				AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
			End if 
		End if 
	End if 
	READ ONLY:C145([PRODUCTS:9])
	UNLOAD RECORD:C212([PRODUCTS:9])
End if 
ERR_MethodTrackerReturn("Purch ItemProd"; $_t_oldMethodName)
