//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SubLPRet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>Mod_l_MaxModules)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPRet")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
If (DB_t_CurrentFormUsage#"None")
	Check_Sec(->[ORDER_ITEMS:25]Retail_Price:38; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
End if 

If (OK=1)
	If ([ORDER_ITEMS:25]Sales_Price:4=0)
		If ([ORDER_ITEMS:25]Discount:37#0)
			[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[ORDER_ITEMS:25]Discount:37)/100)); 2; 1)
		Else 
			[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
		End if 
		Calc_Item
	Else 
		[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
		If ([ORDER_ITEMS:25]Retail_Price:38=0)
			[ORDER_ITEMS:25]Discount:37:=0
		Else 
			[ORDER_ITEMS:25]Discount:37:=Gen_Round(((100-(([ORDER_ITEMS:25]Sales_Price:4/[ORDER_ITEMS:25]Retail_Price:38)*100))); 1; 3)
		End if 
	End if 
	If ([ORDER_ITEMS:25]Product_Code:2#"")
		If (((DB_GetModuleSettingByNUM(Module_Products))#3) & (<>PER_bo_ProdUpdateAccess))
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			If ([PRODUCTS:9]Price_Updates:25)
				If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)  //Ng Modified Jan 15 2009
					//this will only do the product price update if the currency code is the same
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
					$_t_ProductCurrency:=[CURRENCIES:71]Currency_Code:1
				Else 
					$_t_ProductCurrency:=[ORDERS:24]Currency_Code:32
				End if 
				
				If (([ORDER_ITEMS:25]Retail_Price:38>0) & ((([ORDER_ITEMS:25]Retail_Price:38#[PRODUCTS:9]Sales_Price:9) & ($_t_ProductCurrency=[ORDERS:24]Currency_Code:32) & ([ORDERS:24]Offer_Price:20=False:C215))))
					If (DB_t_CurrentFormUsage#"None")
						//NG the additional new options only apply to the supplier not the price
						Gen_Confirm("Do you want to update the Product's Retail Price?"; "Yes"; "No")
						If (OK=1)
							READ WRITE:C146([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
							[PRODUCTS:9]Sales_Price:9:=[ORDER_ITEMS:25]Retail_Price:38
							[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
							DB_SaveRecord(->[PRODUCTS:9])
							AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
							READ ONLY:C145([PRODUCTS:9])
							UNLOAD RECORD:C212([PRODUCTS:9])
						End if 
					End if 
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubLPRet"; $_t_oldMethodName)
