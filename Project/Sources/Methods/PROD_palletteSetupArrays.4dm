//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_palletteSetupArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PROD_palletteSetupArrays
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY INTEGER(PROD_ai_PricePer;0)
	ARRAY LONGINT:C221($_al_CurrencyCodeIDS; 0)
	ARRAY LONGINT:C221($_al_DefaultWidths; 0)
	ARRAY LONGINT:C221($_al_NormalCurrencyIDS; 0)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	ARRAY LONGINT:C221($_al_ProductIDS; 0)
	//ARRAY LONGINT(CAT_al_UserWidths;0;0)
	//ARRAY PICTURE(STK_apic_SalesHistory;0)
	ARRAY REAL:C219($_ar_NormalPrice; 0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	//ARRAY REAL(PROD_ar_CurrentFreeStock;0)
	//ARRAY REAL(PROD_ar_NormalSalesPrice;0)
	//ARRAY REAL(PROD_ar_StockOnOrder;0)
	//ARRAY REAL(STK_ar_FreeStock;0)
	//ARRAY REAL(STK_ar_OnOrderStock;0)
	ARRAY TEXT:C222($_at_BrandCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_GroupCodes; 0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_UserID;0)
	//ARRAY TEXT(PROD_at_CurrencyCode;0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	//ARRAY TEXT(PROD_at_ProductName;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_CostPrices; CAT_bo_ArraywidthsSet; PROD_bo_Arraysetup)
	C_LONGINT:C283($_l_BlobSize; $_l_CatReference; $_l_CountElements; $_l_CurrencyPeriodref; $_l_CurrentProductID; $_l_ItemID; $_l_offset; $_l_PeriodsIndex; $_l_ProductIndex; $_l_UserCatalogue; $_l_WidthsIndex)
	C_LONGINT:C283(CAT_l_BUT1; CAT_l_BUT10; CAT_l_BUT11; CAT_l_BUT2; CAT_l_BUT3; CAT_l_BUT4; CAT_l_BUT5; CAT_l_BUT6; CAT_l_BUT7; CAT_l_BUT8; CAT_l_BUT9)
	C_LONGINT:C283(CUR_l_CurrencyPeriod; PROD_l_DisplayedCatalogue)
	C_PICTURE:C286($_pic_Picture)
	C_REAL:C285($_r_CurrencyRate; $_r_Discount; Prod_R_SalesPrice)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_BaseCurrency; $_t_NormallyCurrencyCode; $_t_oldMethodName; $_t_PairString; CAT_t_CatViewCurrency; oCAT_COL1; oCAT_COL10; oCAT_COL11; oCAT_COL2; oCAT_COL3)
	C_TEXT:C284(oCAT_COL4; oCAT_COL5; oCAT_COL6; oCAT_COL7; oCAT_COL8; oCAT_COL9; oCAT_HED1; oCAT_HED10; oCAT_HED11; oCAT_HED2; oCAT_HED3)
	C_TEXT:C284(oCAT_HED4; oCAT_HED5; oCAT_HED6; oCAT_HED7; oCAT_HED8; oCAT_HED9; PROD_t_CallingCoCode; PROD_t_CallingPriceCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_palletteSetupArrays")
ARRAY TEXT:C222(PROD_at_ProductCodes; 0)
ARRAY TEXT:C222(PROD_at_ProductName; 0)
ARRAY TEXT:C222(PROD_at_CurrencyCode; 0)
ARRAY REAL:C219(PROD_ar_NormalSalesPrice; 0)
ARRAY REAL:C219(PROD_ar_ActualSalesPrice; 0)
ARRAY REAL:C219(PROD_ar_ActualQty; 0)
ARRAY INTEGER:C220(PROD_ai_PricePer; 0)
ARRAY LONGINT:C221($_al_CurrencyCodeIDS; 0)
ARRAY TEXT:C222($_at_CurrencyCodes; 0)
SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PROD_at_ProductCodes; [PRODUCTS:9]Price_Per:40; PROD_ai_PricePer; [PRODUCTS:9]Product_Name:2; PROD_at_ProductName; [PRODUCTS:9]Sales_Price:9; $_ar_NormalPrice; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_NormalCurrencyIDS; [PRODUCTS:9]Group_Code:3; $_at_GroupCodes; [PRODUCTS:9]Brand_Code:4; $_at_BrandCodes; [PRODUCTS:9]X_ID:43; $_al_ProductIDS)
ARRAY TEXT:C222(PROD_at_CurrencyCode; Size of array:C274(PROD_at_ProductCodes))
ARRAY REAL:C219(PROD_ar_NormalSalesPrice; Size of array:C274(PROD_at_ProductCodes))
ARRAY REAL:C219(PROD_ar_ActualSalesPrice; Size of array:C274(PROD_at_ProductCodes))
ARRAY REAL:C219(PROD_ar_ActualQty; Size of array:C274(PROD_at_ProductCodes))
ARRAY REAL:C219(PROD_ar_CurrentFreeStock; Size of array:C274(PROD_at_ProductCodes))
ARRAY REAL:C219(PROD_ar_StockOnOrder; Size of array:C274(PROD_at_ProductCodes))
If (<>DB_bo_NewStockActive)
	STK_ProductsArray(->PROD_at_ProductCodes; "Free"; "On order")
	
End if 
For ($_l_ProductIndex; 1; Size of array:C274(PROD_at_ProductCodes))
	If (<>DB_bo_NewStockActive)
		PROD_ar_CurrentFreeStock{$_l_ProductIndex}:=STK_ar_FreeStock{$_l_ProductIndex}
		PROD_ar_StockOnOrder{$_l_ProductIndex}:=STK_ar_OnOrderStock{$_l_ProductIndex}
	End if 
	$_l_CurrentProductID:=$_al_ProductIDS{$_l_ProductIndex}
	PROD_ar_ActualQty{$_l_ProductIndex}:=0  //PROD
	If ($_al_NormalCurrencyIDS{$_l_ProductIndex}=0)
		$_t_NormallyCurrencyCode:=<>SYS_t_BaseCurrency
	Else 
		If (Find in array:C230($_al_CurrencyCodeIDS; $_al_NormalCurrencyIDS{$_l_ProductIndex})<0)
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$_al_NormalCurrencyIDS{$_l_ProductIndex})
			INSERT IN ARRAY:C227($_al_CurrencyCodeIDS; Size of array:C274($_al_CurrencyCodeIDS)+1; 1)
			INSERT IN ARRAY:C227($_at_CurrencyCodes; Size of array:C274($_at_CurrencyCodes)+1; 1)
			$_at_CurrencyCodes{Size of array:C274($_at_CurrencyCodes)}:=[CURRENCIES:71]Currency_Code:1
			$_al_CurrencyCodeIDS{Size of array:C274($_al_CurrencyCodeIDS)}:=[CURRENCIES:71]X_ID:3
			$_t_NormallyCurrencyCode:=[CURRENCIES:71]Currency_Code:1
		Else 
			$_t_NormallyCurrencyCode:=$_at_CurrencyCodes{Find in array:C230($_al_CurrencyCodeIDS; $_al_NormalCurrencyIDS{$_l_ProductIndex})}
		End if 
	End if 
	If ($_t_NormallyCurrencyCode#CAT_t_CatViewCurrency)
		//convert to sales price
		CUR_CheckRate($_t_NormallyCurrencyCode; CAT_t_CatViewCurrency)
		CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_NormallyCurrencyCode; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=CAT_t_CatViewCurrency; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=Current date:C33(*))
		If (Records in selection:C76([CURRENCY_RATES:72])=0)
			//no rate for the period `try back wards
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
			SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
			For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
				$_l_CurrencyPeriodref:=$_al_PeriodIDS{$_l_PeriodsIndex}
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_NormallyCurrencyCode; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=CAT_t_CatViewCurrency; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriodref)
				If (Records in selection:C76([CURRENCY_RATES:72])>0)
					$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
				End if 
			End for 
			If (Records in selection:C76([CURRENCY_RATES:72])=0)
				//still nothing!!
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Current date:C33(*))
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
				SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
				For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
					$_l_CurrencyPeriodref:=$_al_PeriodIDS{$_l_PeriodsIndex}
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_NormallyCurrencyCode; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=PROD_at_CurrencyCode{$_l_ProductIndex}; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriodref)
					If (Records in selection:C76([CURRENCY_RATES:72])>0)
						$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
					End if 
				End for 
			End if 
		End if 
		//currency rate
		Prod_R_SalesPrice:=$_ar_NormalPrice{$_l_ProductIndex}
		PriceT_Check(PROD_at_ProductCodes{$_l_ProductIndex}; PROD_t_CallingPriceCode; PROD_t_CallingCoCode; $_at_BrandCodes{$_l_ProductIndex}; $_at_GroupCodes{$_l_ProductIndex})
		PROD_ar_ActualSalesPrice{$_l_ProductIndex}:=Prod_R_SalesPrice
		
		If (Records in selection:C76([CURRENCY_RATES:72])>0)
			ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
			//the first record will be the correct one
			PROD_at_CurrencyCode{$_l_ProductIndex}:=CAT_t_CatViewCurrency
			$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
			PROD_ar_NormalSalesPrice{$_l_ProductIndex}:=Gen_Round(((($_ar_NormalPrice{$_l_ProductIndex})*$_r_CurrencyRate)); 2; 2)
			PROD_ar_ActualSalesPrice{$_l_ProductIndex}:=Gen_Round((((PROD_ar_ActualSalesPrice{$_l_ProductIndex})*$_r_CurrencyRate)); 2; 2)
		Else 
			PROD_at_CurrencyCode{$_l_ProductIndex}:=$_t_NormallyCurrencyCode
			PROD_ar_NormalSalesPrice{$_l_ProductIndex}:=$_ar_NormalPrice{$_l_ProductIndex}
			//here check if a catalogue price
			
			
		End if 
		
	Else 
		PROD_at_CurrencyCode{$_l_ProductIndex}:=$_t_NormallyCurrencyCode
		PROD_ar_NormalSalesPrice{$_l_ProductIndex}:=$_ar_NormalPrice{$_l_ProductIndex}
		Prod_R_SalesPrice:=$_ar_NormalPrice{$_l_ProductIndex}
		PriceT_Check(PROD_at_ProductCodes{$_l_ProductIndex}; PROD_t_CallingPriceCode; PROD_t_CallingCoCode; $_at_BrandCodes{$_l_ProductIndex}; $_at_GroupCodes{$_l_ProductIndex})
		PROD_ar_ActualSalesPrice{$_l_ProductIndex}:=Prod_R_SalesPrice
		//here check if a catalogue price
	End if 
	//check if special price in catalogue(other than price table)
	If (PROD_ar_ActualSalesPrice{$_l_ProductIndex}=PROD_ar_NormalSalesPrice{$_l_ProductIndex})
		If (PROD_l_DisplayedCatalogue>0) & ($_al_ProductIDS{$_l_ProductIndex}>0)
			$_l_CatReference:=Find in array:C230(CAT_at_PriceCurrencyCode; CAT_t_CatViewCurrency)  //loaded in the form method
			If ($_l_CatReference>0)
				If (CAT_ai_PricePlus{$_l_CatReference}=1)
					//inverse discount
					$_r_Discount:=-(CAT_ar_PriceDiscount{$_l_CatReference})
				Else 
					$_r_Discount:=(CAT_ar_PriceDiscount{$_l_CatReference})
				End if 
				
			Else 
				$_r_Discount:=0
			End if 
			$_bo_CostPrices:=False:C215  //wont be true until we do PO
			
			If (Not:C34($_bo_CostPrices))
				PROD_ar_ActualSalesPrice{$_l_ProductIndex}:=CAT_GetProductPrice(CAT_t_CatViewCurrency; $_al_ProductIDS{$_l_ProductIndex}; PROD_l_DisplayedCatalogue; $_r_Discount)
			End if 
		End if 
		
	End if 
	
End for 
//Now all the product and pricing is in arrays for this result
If (Not:C34(PROD_bo_Arraysetup))
	//C_LONGINT(CAT_PowerviewPRODS)
	//ARRAY LONGINT(PROD_abo_PVCopied;0)
	ARRAY BOOLEAN:C223(PROD_abo_PVCopied; 0)
	//ARRAY LONGINT(PROD_abo_PVCopied;Size of array(PROD_at_ProductCodes))
	ARRAY BOOLEAN:C223(PROD_abo_PVCopied; Size of array:C274(PROD_at_ProductCodes))
	ARRAY PICTURE:C279(STK_apic_SalesHistory; 0)
	ARRAY PICTURE:C279(STK_apic_SalesHistory; Size of array:C274(PROD_at_ProductCodes))
	//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
	$_pic_Picture:=Get_Picture(418)
	For ($_l_ProductIndex; 1; Size of array:C274(STK_apic_SalesHistory))
		
		STK_apic_SalesHistory{$_l_ProductIndex}:=$_pic_Picture
	End for 
	
	LB_SetupListbox(->CAT_lb_Products; "oCat"; "CAT_L"; 1; ->STK_apic_SalesHistory; ->PROD_at_ProductCodes; ->PROD_at_ProductName; ->PROD_ar_NormalSalesPrice; ->PROD_ai_PricePer; ->PROD_ar_ActualSalesPrice; ->PROD_ar_ActualQty; ->PROD_abo_PVCopied; ->PROD_ar_CurrentFreeStock; ->PROD_ar_StockOnOrder)
	
	
	//AL_SetHeaders (CAT_PowerviewPRODS;1;7;"Product Code";"Product Name";"Normal Price";"Price Per";"Price";"Qty";"Copied")
	LB_SetColumnHeaders(->CAT_lb_Products; "CAT_L"; 1; "Information"; "Product Code"; "Product Name"; "Normal Price"; "Price Per"; "Price"; "Qty"; "Copied"; "Current Free Stock"; "On Order")
	
	If (Not:C34(CAT_bo_ArraywidthsSet))
		//``
		While (Semaphore:C143("CheckCATFormSetting"))
			DelayTicks(2)
		End while 
		
		READ ONLY:C145([PREFERENCES:116])
		
		While (Semaphore:C143("LoadingPrefsCAT"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("Catalogue Form Settings")
		ARRAY TEXT:C222(CAT_at_UserID; 0)
		ARRAY LONGINT:C221(CAT_al_UserWidths; 0; 0)
		
		CLEAR SEMAPHORE:C144("LoadingPrefsCAT")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			SAVE RECORD:C53([PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		End if 
		$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		If ($_l_BlobSize>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CAT_at_UserID; $_l_offset)
			If ($_l_BlobSize>$_l_offset)
				$_l_CountElements:=Size of array:C274(CAT_at_UserID)
				ARRAY LONGINT:C221(CAT_al_UserWidths; $_l_CountElements; 0)
				For ($_l_ProductIndex; 1; $_l_CountElements)
					If ($_l_BlobSize>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CAT_al_UserWidths{$_l_ProductIndex}; $_l_offset)
					End if 
				End for 
			Else 
				$_l_CountElements:=Size of array:C274(CAT_at_UserID)
				ARRAY LONGINT:C221(CAT_al_UserWidths; $_l_CountElements; 0)
			End if 
			$_l_UserCatalogue:=Find in array:C230(CAT_at_UserID; <>PER_t_CurrentUserInitials)
			If ($_l_UserCatalogue>0)
				//Get the custom settings
				If (Size of array:C274(CAT_al_UserWidths{$_l_UserCatalogue})<7)
					ARRAY LONGINT:C221(CAT_al_UserWidths; $_l_CountElements; 7)
				End if 
				ARRAY LONGINT:C221($_al_DefaultWidths; 7)
				$_al_DefaultWidths{1}:=80
				$_al_DefaultWidths{2}:=170
				$_al_DefaultWidths{3}:=80
				$_al_DefaultWidths{4}:=80
				$_al_DefaultWidths{5}:=50
				$_al_DefaultWidths{6}:=50
				$_al_DefaultWidths{7}:=40
				For ($_l_WidthsIndex; 1; Size of array:C274(CAT_al_UserWidths{$_l_UserCatalogue}))
					If (CAT_al_UserWidths{$_l_UserCatalogue}{$_l_WidthsIndex}=0)
						CAT_al_UserWidths{$_l_UserCatalogue}{$_l_WidthsIndex}:=$_al_DefaultWidths{$_l_WidthsIndex}
					End if 
				End for 
				If (Size of array:C274(CAT_al_UserWidths{$_l_UserCatalogue})<10)
					
					$_l_BlobSize:=Size of array:C274(CAT_al_UserWidths{$_l_UserCatalogue})
					Case of 
						: ($_l_BlobSize=9)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							
						: ($_l_BlobSize=8)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=7)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=6)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=5)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=4)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=3)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=2)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 180)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
						: ($_l_BlobSize=1)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 120)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 180)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 40)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
							APPEND TO ARRAY:C911(CAT_al_UserWidths{$_l_UserCatalogue}; 30)
					End case 
				End if 
				LB_SetColumnWidths(->CAT_lb_Products; "oCAT"; 1; (CAT_al_UserWidths{$_l_UserCatalogue}{1}); (CAT_al_UserWidths{$_l_UserCatalogue}{2}); CAT_al_UserWidths{$_l_UserCatalogue}{3}; CAT_al_UserWidths{$_l_UserCatalogue}{4}; CAT_al_UserWidths{$_l_UserCatalogue}{5}; CAT_al_UserWidths{$_l_UserCatalogue}{6}; CAT_al_UserWidths{$_l_UserCatalogue}{7}; CAT_al_UserWidths{$_l_UserCatalogue}{8}; CAT_al_UserWidths{$_l_UserCatalogue}{9}; CAT_al_UserWidths{$_l_UserCatalogue}{10})
				// dont need to worry about the invisible ones
			Else 
				
				LB_SetColumnWidths(->CAT_lb_Products; "oCAT"; 1; 20; 120; 180; 40; 30; 40; 30; 30; 30; 30)  // dont need to worry about the invisible ones
			End if 
			
		Else 
			
			LB_SetColumnWidths(->CAT_lb_Products; "oCAT"; 1; 20; 120; 180; 40; 30; 40; 30; 30; 30; 30)  // dont need to worry about the invisible ones
		End if 
		CLEAR SEMAPHORE:C144("CheckCATFormSetting")
	End if 
	
	CAT_bo_ArraywidthsSet:=True:C214
	LB_SetScroll(->CAT_lb_Products; -2; -2)
	LB_StyleSettings(->CAT_lb_Products; "Black"; 9; "CAT"; ->[PRODUCTS:9])
	
	OBJECT SET ENTERABLE:C238(PROD_ar_ActualQty; True:C214)
	
	OBJECT SET FORMAT:C236(PROD_ar_ActualQty; "###,###,###")
	OBJECT SET FORMAT:C236(PROD_abo_PVCopied; " ")  // display as check box - check that this works on both mac and win
	LB_SetEnterable(->CAT_lb_Products; True:C214; 7; "")
	
	LB_SetEnterable(->CAT_lb_Products; False:C215; 4; "")
	//normal price
	LB_SetEnterable(->CAT_lb_Products; False:C215; 3; "")
	
	LB_SetEnterable(->CAT_lb_Products; False:C215; 2; "")
	//AL_SetEnterable (CAT_PowerviewPRODS;1;0)
	LB_SetEnterable(->CAT_lb_Products; True:C214; 1; "")
	
	LB_SetEnterable(->CAT_lb_Products; False:C215; 8; "")
	$_t_PairString:="OrdProdItems"
	LBI_SetDRGPair(2; ->CAT_lb_Products; $_t_PairString)
	PROD_bo_Arraysetup:=True:C214
End if 
ERR_MethodTrackerReturn("PROD_palletteSetupArrays"; $_t_oldMethodName)
