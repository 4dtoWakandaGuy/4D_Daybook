//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_SubPC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2010 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PO_bo_ProductFound)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_SubPC")
//PurchOrd_SubPC
PO_bo_ProductFound:=False:C215

Check_Product(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1; ""; ->PO_bo_ProductFound)
If (PO_bo_ProductFound)
	If ([PRODUCTS:9]Product_Code:1#"")
		//If ([PURCHASE ORDERS_ITEMS]Product Name="")
		[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=[PRODUCTS:9]Product_Name:2
		//End if
		If ([PRODUCTS:9]Description:6#"")
			[PURCHASE_ORDERS_ITEMS:169]Description:13:=[PRODUCTS:9]Description:6
		End if 
		If (([PRODUCTS:9]Price_Per:40>0) & (DB_GetModuleSettingByNUM(1)#5))
			[PURCHASE_ORDERS_ITEMS:169]Price_Per:12:=[PRODUCTS:9]Price_Per:40
		End if 
		If (([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7=DB_GetLedgerDefaultPurchaseTax) & ([PRODUCTS:9]Default_Tax:23#"") & ([PRODUCTS:9]Default_Tax:23#DB_GetLedgerDefaultSalesTax))
			[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7:=[PRODUCTS:9]Default_Tax:23
		End if 
		If ([PURCHASE_ORDERS:57]Company_Code:1#<>SYS_t_StockOrderCompany)
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
			If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
				CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
				[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
				[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
				
				[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_ORDERS:57]Company_Code:1
				DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
				DB_SaveRecord(->[PRODUCTS:9])
				AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
			End if 
			//If ([PURCHASE ORDERS_ITEMS]Original Cost=0)
			[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
			[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
			PurchOrd_SubCal
			//End if
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
				PriceT_CheckCoP
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PurchOrd_SubPC"; $_t_oldMethodName)
