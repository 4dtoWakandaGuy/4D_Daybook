If (False:C215)
	//Table Form Method Name: Object Name:      [CATALOGUE].Catalogue_Input
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_PriceChange;0)
	//ARRAY BOOLEAN(CAT_lb_Pricing;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY LONGINT(CAT_al_FamilyName1;0)
	//ARRAY LONGINT(CAT_al_ImageSources;0)
	//ARRAY LONGINT(CAT_al_PriceDiscounts;0)
	//ARRAY LONGINT(CAT_al_PriceModelID;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY REAL(CAT_ar_PriceChange;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY TEXT(CAT_at_aPriceCurrency;0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	//ARRAY TEXT(CAT_at_CurrencyCodes;0)
	//ARRAY TEXT(CAT_at_Currencynames;0)
	//ARRAY TEXT(CAT_at_CurrencyNames2;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME1;0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	//ARRAY TEXT(CAT_at_PlusMinus;0)
	//ARRAY TEXT(CAT_at_PriceChange;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCodeOLD;0)
	//ARRAY TEXT(CAT_at_PriceModel;0)
	//ARRAY TEXT(CAT_at_PriceProduct;0)
	//ARRAY TEXT(CAT_at_PriceText;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_BOOLEAN:C305(<>EcommerceInstalled; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_Index; $_l_ListID; $_l_ModuleRow; $_l_offset; B_ModPath; Badd_CatProd; BDel_CatProd; CAT_bo_L2; CAT_bo_L3)
	C_LONGINT:C283(CAT_bo_L4; CAT_bo_L5; CAT_bo_L6; CAT_bo_L7; CAT_bo_L8; CAT_bo_L9; CAT_l_BUT1; CAT_l_BUT2; CAT_l_BUT3; CAT_l_BUT4; CAT_l_BUT5)
	C_LONGINT:C283(CAT_l_BUT6; CAT_l_BUT7; CAT_l_BUT8; CAT_l_BUT9; CAT_l_L1; CAT_l_PictureSource; CAT_l_PricePlus; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_FirstRecord)
	C_LONGINT:C283(PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord; WS_l_SELECTEDPRODUCT)
	C_REAL:C285(CAT_R_PriceDiscount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; CAT_a _COL1; CAT_a _COL2; CAT_a _COL3; CAT_a _COL5; CAT_a _COL6; CAT_a _COL7; CAT_a _COL8)
	C_TEXT:C284(CAT_a _COL9; CAT_a _COLL4; CAT_a _HED1; CAT_a _HED2; CAT_a _HED3; CAT_a _HED4; CAT_a _HED5; CAT_a _HED6; CAT_a _HED7; CAT_a _HED8; CAT_a _HED9)
	C_TEXT:C284(CAT_t_CatalogueType; CAT_t_CatViewCurrency; CAT_t_Currencynames; Cat_t_DiscountGroup; CAT_t_FamilyName; CAT_t_PictureNaming; CAT_T_PicturePath; CAT_t_PriceCurrencyCode; CAT_t_PriceModel; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; DM_t_BKModelName; PAL_BUTTON; vButtDis; vButtDisCAT; WS_t_CatImagenaming; WS_t_CatImageSource)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CATALOGUE].Catalogue_Input"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		ARRAY TEXT:C222(CAT_at_CurrencyCodes; 0)
		EW_LoadPrefs
		CAT_LoadPrefs
		OBJECT SET FORMAT:C236(CAT_l_PricePlus; "+;;-")
		ARRAY INTEGER:C220(CAT_ai_PricePlus; 0)
		OBJECT SET FORMAT:C236(CAT_ai_PricePlus; "+;;-")
		ARRAY TEXT:C222(CAT_at_PriceChange; 0)
		ARRAY REAL:C219(CAT_ar_PriceChange; 0)
		ARRAY TEXT:C222(CAT_at_PriceModel; 2)
		ARRAY LONGINT:C221(CAT_al_PriceModelID; 2)
		ARRAY TEXT:C222(CAT_at_aPriceCurrency; 0)
		ARRAY TEXT:C222(CAT_at_PriceProduct; 0)
		
		Cat_t_DiscountGroup:=""
		CAT_l_PricePlus:=0
		CAT_at_PriceModel{1}:="Sales Price"
		CAT_at_PriceModel{2}:="Standard Price"
		CAT_al_PriceModelID{1}:=9  //thats the field number
		CAT_al_PriceModelID{2}:=16  // thats the field number
		CAT_at_PriceModel:=0
		//price model options
		//[PRODUCTS]Sales Price
		//[PRODUCTS]Standard Price
		//[PRODUCTS]SUPPLIERS'Cost Price
		//  [PRODUCTS]SUPPLIERS'Standard Cost
		Case of 
			: ([CATALOGUE:108]xPriceModel:7=9)
				CAT_t_PriceModel:="Sales Price"
				ARRAY TEXT:C222(CAT_at_PriceModel; 0)
				ARRAY LONGINT:C221(CAT_al_PriceModelID; 0)
			: ([CATALOGUE:108]xPriceModel:7=16)
				CAT_t_PriceModel:="Standard Price"
				ARRAY TEXT:C222(CAT_at_PriceModel; 0)
				ARRAY LONGINT:C221(CAT_al_PriceModelID; 0)
			Else 
				//set it
				[CATALOGUE:108]xPriceModel:7:=9
				CAT_t_PriceModel:="Sales Price"
		End case 
		
		
		OBJECT SET VISIBLE:C603(*; "oRulesReview"; ([CATALOGUE:108]xCatalogueClass:9=1))
		OBJECT SET VISIBLE:C603(*; "oButtonAddProduct"; Not:C34(([CATALOGUE:108]xCatalogueClass:9=1)))
		OBJECT SET VISIBLE:C603(*; "oButtonRemoveFromCatalogue"; Not:C34(([CATALOGUE:108]xCatalogueClass:9=1)))
		
		<>EcommerceInstalled:=USR_bo_EWEnabled
		WS_AutoscreenSize(2; 490; 700)
		INT_SetInput(Table:C252(->[CATALOGUE:108]); "Brands_In")
		If ([CATALOGUE:108]x_ID:1=0)
			[CATALOGUE:108]x_ID:1:=AA_GetNextIDinMethod(->[CATALOGUE:108]x_ID:1)
			// new catalogue
			
			//NG March 2004 new lines here. Inherit default image settings.
			
			ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
			CAT_at_ImageNameConvention{1}:="Use Product Code"
			CAT_at_ImageNameConvention{2}:="Use Product Short Code"
			CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
			[CATALOGUE:108]Image_Source:3:=CAT_l_PictureSource
			[CATALOGUE:108]Image_Path:4:=CAT_T_PicturePath
			[CATALOGUE:108]Image_NamePref:5:=Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming)
			//NG end of new lines added March 2004
		End if 
		ARRAY TEXT:C222(CAT_at_FAMILYNAME1; 0)
		ARRAY LONGINT:C221(CAT_al_FamilyName1; 0)
		CAT_R_PriceDiscount:=0
		CAT_t_PriceCurrencyCode:=""
		ARRAY LONGINT:C221(CAT_al_PriceDiscounts; 0)
		ARRAY TEXT:C222(CAT_at_PriceText; 0)
		ARRAY TEXT:C222(CAT_at_PriceCurrencyCode; 0)
		ARRAY TEXT:C222(CAT_at_CurrencyNames2; 0)
		ARRAY INTEGER:C220(CAT_ai_PricePlus; 0)
		ARRAY BOOLEAN:C223(CAT_abo_PriceChange; 0)
		ARRAY INTEGER:C220(CAT_ai_PricePlus; 0)
		ARRAY BOOLEAN:C223(CAT_abo_PriceChange; 0)
		CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
		
		
		
		If ([CATALOGUE:108]x_ID:1>0)
			$_l_offset:=0
			//now get those into here
			Catalogue_Prices
			
			$_l_ModuleRow:=Find in array:C230(CAT_al_catalgoueclasses; [CATALOGUE:108]xCatalogueClass:9)
			If ($_l_ModuleRow>0)
				CAT_t_CatalogueType:=CAT_at_Catalogueclasses{$_l_ModuleRow}
			Else 
				[CATALOGUE:108]xCatalogueClass:9:=-1
				CAT_t_CatalogueType:=CAT_at_Catalogueclasses{1}
			End if 
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oCatClassesPopUp"; True:C214)
			CAT_t_CatalogueType:=""
			OBJECT SET VISIBLE:C603(CAT_t_CatalogueType; True:C214)
			CAT_at_Catalogueclasses:=0
		End if 
		//`````
		ARRAY TEXT:C222(CAT_at_PlusMinus; Size of array:C274(CAT_ai_PricePlus))
		For ($_l_Index; 1; Size of array:C274(CAT_ai_PricePlus))
			If (CAT_ai_PricePlus{$_l_Index}=1)
				CAT_at_PlusMinus{$_l_Index}:="+"
			Else 
				CAT_at_PlusMinus{$_l_Index}:="-"
			End if 
		End for 
		ARRAY TEXT:C222(CAT_at_PriceCurrencyCodeOLD; 0)
		COPY ARRAY:C226(CAT_at_PriceCurrencyCode; CAT_at_PriceCurrencyCodeOLD)
		LB_SetupListbox(->CAT_lb_Pricing; "CAT_a "; "CAT_B"; 1; ->CAT_at_PriceCurrencyCode; ->CAT_at_PlusMinus; ->CAT_ar_PriceDiscount; ->CAT_ai_PricePlus; ->CAT_abo_PriceChange; ->CAT_al_PriceDiscounts; ->CAT_at_PriceText; ->CAT_at_PriceCurrencyCodeOLD)
		
		LB_SetColumnHeaders(->CAT_lb_Pricing; "CAT_B"; 1; "Currency"; "+/-"; "Discount"; ""; "Price"; ""; ""; ""; ""; "")
		LB_SetColumnWidths(->CAT_lb_Pricing; "CAT_a"; 1; 51; 21; 51; 0; 0; 0; 0; 0)
		LB_SetScroll(->CAT_lb_Pricing; -3; -2)
		LB_StyleSettings(->CAT_lb_Pricing; "BLUE"; 9; "CAT_a"; ->[CATALOGUE:108])
		OBJECT SET FORMAT:C236(CAT_l_PricePlus; "+;;-")
		
		
		
		//````
		If ([CATALOGUE:108]xCatalogueClass:9=1)
			OBJECT SET VISIBLE:C603(*; "oRulesReview"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oRulesReview"; False:C215)
		End if 
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; CAT_at_CurrencyCodes; [CURRENCIES:71]Currency_Name:2; CAT_at_Currencynames)
		ARRAY TEXT:C222(CAT_at_CurrencyNames2; 0)
		COPY ARRAY:C226(CAT_at_Currencynames; CAT_at_CurrencyNames2)
		
		OBJECT SET VISIBLE:C603(CAT_at_PriceCurrencyCode; False:C215)
		OBJECT SET VISIBLE:C603(CAT_t_Currencynames; False:C215)
		OBJECT SET VISIBLE:C603(CAT_R_PriceDiscount; False:C215)
		OBJECT SET ENTERABLE:C238(CAT_R_PriceDiscount; False:C215)
		OBJECT SET VISIBLE:C603(CAT_l_PricePlus; False:C215)
		OBJECT SET VISIBLE:C603(*; "CAT_popuppic"; False:C215)
		
		CAT_t_FamilyName:=""
		
		If (<>EcommerceInstalled)
			//      If (Current user="Designer")
			//  AA_LoadList (->EW_Family;->CAT_at_FAMILYNAME1;->CAT_al_FamilyName1;True)
			//     Else
			$_l_ListID:=AA_LoadList(->[CATALOGUE:108]EW_Family:6; ->CAT_at_FAMILYNAME1; ->CAT_al_FamilyName1; False:C215)
			//     End if
			SORT ARRAY:C229(CAT_al_FamilyName1; CAT_at_FAMILYNAME1)  // 18/11/03 pb
			AA_Loadlistinsertnew(->CAT_al_FamilyName1; ->CAT_at_FAMILYNAME1)  // 01/12/03    pb
			
			OBJECT SET VISIBLE:C603(*; "Icon_FamilyName"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text_FamilyName"; True:C214)
			OBJECT SET VISIBLE:C603(CAT_t_FamilyName; True:C214)
			OBJECT SET VISIBLE:C603(CAT_t_FamilyName; True:C214)
			OBJECT SET VISIBLE:C603(*; "dm@"; True:C214)  // 23/09/03 pb BK data models
			If ([CATALOGUE:108]EW_Family:6>0)
				$_l_ModuleRow:=Find in array:C230(CAT_al_FamilyName1; [CATALOGUE:108]EW_Family:6)
				If ($_l_ModuleRow>0)
					CAT_t_FamilyName:=CAT_at_FAMILYNAME1{$_l_ModuleRow}
				Else 
					[CATALOGUE:108]EW_Family:6:=0
				End if 
			End if 
			If ([CATALOGUE:108]xDataModel:8>0)  // 23/09/03 pb
				$_l_ModuleRow:=Find in array:C230(DM_al_BKModelIDS; [CATALOGUE:108]xDataModel:8)
				If ($_l_ModuleRow>0)
					DM_t_BKModelName:=DM_at_BKModelNames{$_l_ModuleRow}
				Else 
					[CATALOGUE:108]EW_Family:6:=0
				End if 
				
			End if 
			
		Else 
			OBJECT SET VISIBLE:C603(*; "Icon_FamilyName"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Text_FamilyName"; False:C215)
			OBJECT SET VISIBLE:C603(CAT_t_FamilyName; False:C215)
			OBJECT SET VISIBLE:C603(CAT_t_FamilyName; False:C215)
			OBJECT SET VISIBLE:C603(*; "dm@"; False:C215)  // 23/09/03 pb BK data models
		End if 
		
		ARRAY LONGINT:C221(CAT_al_ImageSources; 3)
		ARRAY TEXT:C222(CAT_at_ImageSources; 3)
		CAT_at_ImageSources{1}:="No Images"
		CAT_at_ImageSources{2}:="On Disk"
		CAT_at_ImageSources{3}:="In Database"
		CAT_al_ImageSources{1}:=0
		CAT_al_ImageSources{2}:=1
		CAT_al_ImageSources{3}:=2
		ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
		CAT_at_ImageNameConvention{1}:="Use Product Code"
		CAT_at_ImageNameConvention{2}:="Use Product Short Code"
		CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
		If ([CATALOGUE:108]Image_NamePref:5>0)
			
			WS_t_CatImagenaming:=CAT_at_ImageNameConvention{[CATALOGUE:108]Image_NamePref:5}
		Else 
			[CATALOGUE:108]Image_NamePref:5:=1
			WS_t_CatImagenaming:=CAT_at_ImageNameConvention{[CATALOGUE:108]Image_NamePref:5}
		End if 
		
		//the default is for no images!
		$_l_ModuleRow:=Find in array:C230(CAT_al_ImageSources; [CATALOGUE:108]Image_Source:3)
		If ($_l_ModuleRow>0)
			WS_t_CatImageSource:=CAT_at_ImageSources{$_l_ModuleRow}
		Else 
			[CATALOGUE:108]Image_Source:3:=0
			WS_t_CatImageSource:="No Images"
		End if 
		OBJECT SET VISIBLE:C603(*; "oImagePathLabel"; ([CATALOGUE:108]Image_Source:3=1))
		OBJECT SET VISIBLE:C603(*; "oCatalogueImagePath"; ([CATALOGUE:108]Image_Source:3=1))
		OBJECT SET VISIBLE:C603(*; "oButtonSetPath"; ([CATALOGUE:108]Image_Source:3=1))
		OBJECT SET VISIBLE:C603(*; "oPictureLabel"; ([CATALOGUE:108]Image_Source:3=1))
		//OBJECT SET VISIBLE(*; "Library Picture3"; True)
		OBJECT SET VISIBLE:C603(CAT_at_ImageNameConvention; ([CATALOGUE:108]Image_Source:3=1))
		OBJECT SET VISIBLE:C603(*; "oCatalogueImageNameConversion"; ([CATALOGUE:108]Image_Source:3=1))
		OBJECT SET VISIBLE:C603(*; "oCatalogueImageNaming"; ([CATALOGUE:108]Image_Source:3=1))
		
		CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; True:C214; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
		WS_l_SelectedProduct:=0
		DB_t_CallOnCloseorSave:="File"
		vButtDisCAT:="A DPMONPFSSSRCADT"
		
		DB_SetnewToolBar
		Input_Buttons(->[CATALOGUE:108]; ->vButtDisCAT)
		INT_SetInput(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		
		DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		If (Records in selection:C76([CATALOGUE:108])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			
			
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisCAT)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		OpenHelp(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		
		In_ButtChkDis(->vButtDisCAT)
		
		
		DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		If (Records in selection:C76([CATALOGUE:108])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		In_ButtChkDis(->vButtDisCAT)
		DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
		If (Records in selection:C76([CATALOGUE:108])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 400; 700)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("CAT_SaveUpdates"; ""; ""; ->[CATALOGUE:108]; ->[CATALOGUE:108]Catalogue_Name:2; "Catalogue"; ""; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
		End case 
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CATALOGUE:108]); "Catalogue_Input")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [CATALOGUE].Catalogue_Input"; $_t_oldMethodName)
