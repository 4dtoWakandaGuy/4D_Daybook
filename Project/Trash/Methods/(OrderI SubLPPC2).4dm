//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubLPPC2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_StandardPrice)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_oldMethodName; $_t_SalesCurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PRD_t_FurtherApplicable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPPC2")
//OrderI_SubLPPC2
If ([PRODUCTS:9]Product_Code:1#"")
	If ([PRODUCTS:9]Product_Name:2#"")
		[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
	End if 
	If ([PRODUCTS:9]Description:6#"")
		[ORDER_ITEMS:25]Description:44:=[PRODUCTS:9]Description:6
	End if 
	If (([ORDER_ITEMS:25]Tax_Code:12=DB_GetLedgerDefaultSalesTax) & ([PRODUCTS:9]Default_Tax:23#""))
		[ORDER_ITEMS:25]Tax_Code:12:=[PRODUCTS:9]Default_Tax:23
	End if 
	If (([PRODUCTS:9]Price_Per:40>0) & (DB_GetModuleSettingByNUM(1)#5))
		[ORDER_ITEMS:25]Price_Per:50:=[PRODUCTS:9]Price_Per:40
	End if 
	$_bo_StandardPrice:=False:C215
	If ([PRODUCTS:9]Sales_Price:9#0)
		If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
			
			[ORDER_ITEMS:25]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
			[ORDER_ITEMS:25]Retail_Price:38:=[PRODUCTS:9]Sales_Price:9
			If ([PRODUCTS:9]Standard_Price:16#0)
				[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
				$_bo_StandardPrice:=True:C214
			End if 
		Else 
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
			$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
			If ([ORDERS:24]Currency_Code:32="")
				$_t_SalesCurrencyCode:=<>SYS_t_BaseCurrency
			Else 
				$_t_SalesCurrencyCode:=[ORDERS:24]Currency_Code:32
			End if 
			If ($_t_SalesCurrencyCode=$_t_CurrencyCode)
				[ORDER_ITEMS:25]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
				[ORDER_ITEMS:25]Retail_Price:38:=[PRODUCTS:9]Sales_Price:9
				If ([PRODUCTS:9]Standard_Price:16#0)
					[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
					$_bo_StandardPrice:=True:C214
				End if 
			Else 
				[ORDER_ITEMS:25]Sales_Price:4:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; $_t_SalesCurrencyCode; Current date:C33(*))
				[ORDER_ITEMS:25]Retail_Price:38:=[ORDER_ITEMS:25]Sales_Price:4
				If ([PRODUCTS:9]Standard_Price:16#0)
					[ORDER_ITEMS:25]Standard_Price:39:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; $_t_CurrencyCode; $_t_SalesCurrencyCode; Current date:C33(*))
					$_bo_StandardPrice:=True:C214
				End if 
				
			End if 
			
		End if 
	End if 
	If ([PRODUCTS:9]Standard_Price:16#0) & (Not:C34($_bo_StandardPrice))
		If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
			
			[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
		Else 
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
			$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
			If ([ORDERS:24]Currency_Code:32="")
				$_t_SalesCurrencyCode:=<>SYS_t_BaseCurrency
			Else 
				$_t_SalesCurrencyCode:=[ORDERS:24]Currency_Code:32
			End if 
			If ($_t_SalesCurrencyCode=$_t_CurrencyCode)
				[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
			Else 
				[ORDER_ITEMS:25]Standard_Price:39:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; $_t_CurrencyCode; $_t_SalesCurrencyCode; Current date:C33(*))
				
			End if 
		End if 
	End if 
	If ([ORDER_ITEMS:25]Product_Code:2#"")
		If ([ORDER_ITEMS:25]Price_Code:36#"")
			PriceT_Check
		Else 
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
			If (PRD_t_FurtherApplicable#"")
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
			End if 
			
			PriceT_FilterDates
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9>0)
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				If ([ORDER_ITEMS:25]Price_Code:36#"")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[ORDER_ITEMS:25]Price_Code:36)
				End if 
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					PriceT_SearchC2([ORDERS:24]Company_Code:1)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
						SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							PriceT_SearchQt
							PriceT_CheckCo2([ORDERS:24]Company_Code:1)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								If ([PRICE_TABLE:28]Price_Code:2#[PRICE_GROUPS:18]Price_Code:1)
									RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
								End if 
								If ([PRICE_GROUPS:18]Automatic:5)
									OrderI_SubPTA
									[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
								End if 
							Else 
								If (([ORDER_ITEMS:25]Price_Code:36#"") | ([ORDER_ITEMS:25]Discount:37#0))  //has to be here cos you may be reducing
									[ORDER_ITEMS:25]Price_Code:36:=""  //the qty such that there is no discount
									[ORDER_ITEMS:25]Discount:37:=0
									[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
		PriceT_CheckCo
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
		PriceT_CheckCur
		// HIDE PROCESS(Current process)
		//SHOW PROCESS(Current process)
		//BRING TO FRONT(Current process)
	End if 
	
	If (DB_t_CurrentFormUsage="Purch")
		[ORDER_ITEMS:25]Supplier_Code:20:=[PURCHASE_ORDERS:57]Company_Code:1
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		
		QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[ORDER_ITEMS:25]Supplier_Code:20)
		If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
			OrderI_SubCostI
			[ORDER_ITEMS:25]Supply_by_Date:31:=<>DB_d_CurrentDate+[PRODUCTS_SUPPLIERS:148]Lead_Days:6
		End if 
	Else 
		OrderI_SubLPPC3
	End if 
	Calc_Item
	If ([PRODUCTS:9]Enclosures:20#"")
		$_l_CharacterPosition:=Position:C15([PRODUCTS:9]Enclosures:20; [ORDERS:24]Enclosures:21)
		If ($_l_CharacterPosition=0)
			If ([ORDERS:24]Enclosures:21#"")
				[ORDERS:24]Enclosures:21:=[ORDERS:24]Enclosures:21+Char:C90(13)+[PRODUCTS:9]Enclosures:20
			Else 
				[ORDERS:24]Enclosures:21:=[PRODUCTS:9]Enclosures:20
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("OrderI_SubLPPC2"; $_t_oldMethodName)
