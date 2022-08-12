//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ProductsViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    11/03/2011 17:07 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTables; $_bo_OpenInNewWindow; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_SelectedMenu; $_l_TableNumber; $_l_TabNumber; $_l_TabNumberWas; vCT)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ProductsViewsTab")

$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_TabNumberWas:=0
	$_bo_IgnoreTables:=False:C215
	$_bo_OpenViews:=True:C214
	$_l_TabNumber:=Num:C11($_t_MenuItemParameter)
	If ($_l_TabNumber>1)
		If ($_l_TabNumber>0)
			$_l_TabNumberWas:=PRD_at_ViewTabsLabels
			PRD_at_ViewTabsLabels:=$_l_TabNumber-1
		End if 
	Else 
		$_bo_IgnoreTables:=True:C214
		$_bo_OpenInNewWindow:=True:C214
	End if 
	If (Not:C34($_bo_IgnoreTables))
		If ($_bo_OpenViews)
			$_bo_OpenInNewWindow:=DB_bo_ViewsOption
		Else 
			$_bo_OpenInNewWindow:=False:C215
		End if 
	End if 
	If ($_bo_OpenInNewWindow)
		$_l_SelectedMenu:=0
		If ($_bo_IgnoreTables)
			$_l_TableNumber:=Table:C252(->[COMPONENTS:86])
		Else 
			$_l_TableNumber:=PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}
		End if 
		//params are
		Case of 
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				FurthFld_Func2(->[PRODUCTS:9])
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				//Products_PT
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PRICE_TABLE:28]))); Module_SalesOrders; ""; ->[PRICE_TABLE:28]Product_Code:1; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
			: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
				//Prod_Components
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPONENTS:86]))); Module_SalesOrders; ""; ->[COMPONENTS:86]Product_Code:1; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				//Prod_StockCurr
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CURRENT_STOCK:62]))); Module_StockControl; ""; ->[CURRENT_STOCK:62]Product_Code:1; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				Prod_StockLev
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDERS:24]))); Module_SalesOrders; ""; ->[ORDER_ITEMS:25]Product_Code:2; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
				
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); Module_PurchaseOrders; ""; ->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))); Module_PurchaseLedger; ""; ->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1; [PRODUCTS:9]Product_Code:1)  //yes this is correct-handled in the display records method
				
				
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				$_l_SelectedMenu:=12
				//: ($_l_TableNumber=Table(->[BOOKINGS]))
				
		End case 
		
		If ($_l_TabNumberWas>0)
			PRD_at_ViewTabsLabels:=$_l_TabNumberWas
		End if 
		
		
		//2=products
		//3price table
		//4=diary
		//etc in the following orders
		//documents
		//enquiries
		//sales orders
		//purchase orders
		//sales ledger
		//purchase leger
		//service calls
		//jobs
		//bookings
		//contracts
		
		
		
	Else 
		
		Case of 
				
			: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
				If ([PRICE_TABLE:28]Table_Code:12#"")
					DB_SaveRecord(->[PRICE_TABLE:28])
					
				End if 
		End case 
		vCT:=0
		
		LBi_RemoveAll(->PRD_aPtr_RelatedConfiguration)
		ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
		PRD_inonloadrelated("P1")
	End if 
End if 
ERR_MethodTrackerReturn("DB_ProductsViewsTab"; $_t_oldMethodName)