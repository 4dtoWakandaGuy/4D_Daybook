If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cNAA)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(SRCH_CurrentTable)
	//C_UNKNOWN(SRCH_CurrentTableName)
	//C_UNKNOWN(VBrand)
	//C_UNKNOWN(vButtDisO)
	//C_UNKNOWN(vGroup)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vSelPrev)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_SelectedCatalogues;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY LONGINT(WS_al_CachedSelection;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(PROD_at_CatalogueNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; PROD_bo_UnfilteredSetKnown; WIN_bo_Resize; $_bo_RefreshSelection; DB_bo_NoLoad; INT_bo_DetailOpen; PROD_bo_UnfilteredSetKnown; WIN_bo_Resize)
	C_LONGINT:C283($_l_CatalogueCurrencyRow; $_l_DefaultCatalogueRow; $_l_defaultparams; $_l_event; cNAA; cNAL; DB_l_ButtonClickedFunction; PROD_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDRight)
	C_LONGINT:C283(SIZ_l_OLDTop; SM_l_MonitorCall; SRCH_CurrentTable; vNo; <>PER_l_CurrentUserID; $_l_CatalogueCurrencyRow; $_l_DefaultCatalogueRow; $_l_defaultparams; $_l_event; DB_l_ButtonClickedFunction; PROD_l_SetID)
	C_LONGINT:C283(PROD_l_SettingsCalled; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP; SM_l_MonitorCall)
	C_REAL:C285(Prod_R_SalesPrice; Prod_R_StdPrice; SRCH_r_Timer; SRCH_r_TimerOLD; $_r_Discount; Prod_R_SalesPrice; Prod_R_StdPrice; SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_FormReferene; $_t_oldMethodName; CAT_t_CatViewCurrency; Prod_t_DisplayCurrency; PROD_t_DisplayedCatalogue; PROD_t_SelectedCatalogues; SD2_T_SearchValue; SRCH_CurrentTableName; SRCH_t_SearchValue; SRCH_t_SearchValueOLD; VBrand)
	C_TEXT:C284(vButtDisO; vGroup; vSelPrev; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; <>SYS_t_BaseCurrency; $_t_FormReferene; $_t_oldMethodName; CAT_t_CatViewCurrency; Prod_t_DisplayCurrency; PROD_t_DisplayedCatalogue)
	C_TEXT:C284(PROD_t_SelectedCatalogues; SD2_T_SearchValue; SRCH_t_SearchValue; SRCH_t_SearchValueOLD; vAnalysis; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (PROD_l_SettingsCalled=0)
			
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentOutputform)
			PROD_l_SettingsCalled:=1
		Else 
			PROD_l_SettingsCalled:=0
		End if 
		
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		cNAL:=0
		cNAA:=0
		vAnalysis:=""
		VBrand:=""
		vGroup:=""
		PROD_t_SelectedCatalogues:=PROD_t_DisplayedCatalogue
		
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_Out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		
		SRCH_CurrentTable:=Table:C252(->[PRODUCTS:9])
		SRCH_CurrentTableName:="Products"
		SD2_SetDiaryPopup
		SRCH_loadSearchFilters(Table:C252(->[PRODUCTS:9]))
		SM_LoadSearchParameterNames(Table:C252(->[PRODUCTS:9]); 1; 2)  //the filters will be offset by 255..
		SRCH_LoadSearchParameters(->[PRODUCTS:9])
		
		PROD_bo_UnfilteredSetKnown:=False:C215
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[PRODUCTS:9]); <>PER_l_CurrentUserID; 0; 2)
		//Note that the CATALOGUE is not part of the filer..its like a second level of filter
		If ($_l_defaultparams>0)
			SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; $_l_defaultparams)
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			SM_LoadSearchParameters($_l_defaultparams)
			SRCH_Applyfilterstoselection(->[PRODUCTS:9])
			vNo:=Records in selection:C76([PRODUCTS:9])
		End if 
		SD2_T_SearchValue:=""
		GOTO OBJECT:C206(SD2_T_SearchValue)
		If (Size of array:C274(CAT_al_CatalogueID)=0)
			OBJECT SET VISIBLE:C603(*; "oProdCatLabel"; False:C215)
			OBJECT SET VISIBLE:C603(PROD_t_SelectedCatalogues; False:C215)
			OBJECT SET VISIBLE:C603(PROD_at_CatalogueNames; False:C215)
			
		End if 
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_Out")
		vButtDisO:="O              DT"
		Out_Buttons
		SD2_SetDiaryPopup
		SRCH_CurrentTable:=Table:C252(->[PRODUCTS:9])
		SRCH_CurrentTableName:="Products"
	: ($_l_event=On Outside Call:K2:11)
		$_bo_RefreshSelection:=False:C215
		If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Delete")) | (SM_l_MonitorCall>0) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Select")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("QVSearch")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Find"))
			$_bo_RefreshSelection:=True:C214
		End if 
		
		Out_ButtCall(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; ->[PRODUCTS:9]Product_Name:2; "Products"; "DB_MenuNewRecord"; "Prod_Sel"; "Products_OutDel"; "Master"; "Products"; "Products_OutCou"; 0; 0)
		If ($_bo_RefreshSelection)
			If (PROD_bo_UnfilteredSetKnown)
				CLEAR SET:C117("ProdSelection"+String:C10(PROD_l_SetID))
			End if 
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			SRCH_Applyfilterstoselection(->[PRODUCTS:9])
			
		End if 
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReferene:=Table name:C256(->[PRODUCTS:9])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReferene)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
		SRCH_CurrentTable:=Table:C252(->[PRODUCTS:9])
		SRCH_CurrentTableName:="Products"
	: ($_l_event=On Display Detail:K2:22)
		//Here set the price according the rules for the current catalogue..
		OBJECT SET FORMAT:C236(Prod_R_SalesPrice; Prod_t_DisplayCurrency+"#,###,##0.00")
		OBJECT SET FORMAT:C236(Prod_R_StdPrice; Prod_t_DisplayCurrency+"#,###,##0.00")
		If (Size of array:C274(PROD_al_SelectedCatalogues)>0)
			$_l_DefaultCatalogueRow:=Find in array:C230(PROD_al_SelectedCatalogues; 1)
			If ($_l_DefaultCatalogueRow>0)
				$_l_CatalogueCurrencyRow:=Find in array:C230(CAT_at_PriceCurrencyCode; Prod_t_DisplayCurrency)  //loaded in the form method
				If ($_l_CatalogueCurrencyRow>0)
					If (CAT_ai_PricePlus{$_l_CatalogueCurrencyRow}=1)
						//inverse discount
						$_r_Discount:=-(CAT_ar_PriceDiscount{$_l_CatalogueCurrencyRow})
					Else 
						$_r_Discount:=(CAT_ar_PriceDiscount{$_l_CatalogueCurrencyRow})
					End if 
					
				Else 
					$_r_Discount:=0
				End if 
				Prod_R_SalesPrice:=CAT_GetProductPrice(CAT_t_CatViewCurrency; [PRODUCTS:9]X_ID:43; CAT_al_CatalogueID{$_l_DefaultCatalogueRow}; $_r_Discount)
				If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
					If ([PRODUCTS:9]Default_Price_Currency_ID:45#[CURRENCIES:71]X_ID:3)
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
					End if 
					Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; [CURRENCIES:71]Currency_Code:1; Prod_t_DisplayCurrency)
				Else 
					Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; <>SYS_t_BaseCurrency; Prod_t_DisplayCurrency)
				End if 
			Else 
				If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
					If ([PRODUCTS:9]Default_Price_Currency_ID:45#[CURRENCIES:71]X_ID:3)
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
					End if 
					Prod_R_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; [CURRENCIES:71]Currency_Code:1; Prod_t_DisplayCurrency)
					Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; [CURRENCIES:71]Currency_Code:1; Prod_t_DisplayCurrency)
					
				Else 
					If (Prod_t_DisplayCurrency#<>SYS_t_BaseCurrency)
						
						Prod_R_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; <>SYS_t_BaseCurrency; Prod_t_DisplayCurrency)
						Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; <>SYS_t_BaseCurrency; Prod_t_DisplayCurrency)
						
					Else 
						Prod_R_SalesPrice:=[PRODUCTS:9]Sales_Price:9
						Prod_R_StdPrice:=[PRODUCTS:9]Standard_Price:16
					End if 
					
				End if 
			End if 
		Else 
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
				If ([PRODUCTS:9]Default_Price_Currency_ID:45#[CURRENCIES:71]X_ID:3)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				End if 
				Prod_R_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; [CURRENCIES:71]Currency_Code:1; Prod_t_DisplayCurrency)
				Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; [CURRENCIES:71]Currency_Code:1; Prod_t_DisplayCurrency)
				
				
			Else 
				If (Prod_t_DisplayCurrency#<>SYS_t_BaseCurrency)
					Prod_R_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; <>SYS_t_BaseCurrency; Prod_t_DisplayCurrency)
					Prod_R_StdPrice:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; <>SYS_t_BaseCurrency; Prod_t_DisplayCurrency)
					
				Else 
					Prod_R_SalesPrice:=[PRODUCTS:9]Sales_Price:9
					Prod_R_StdPrice:=[PRODUCTS:9]Standard_Price:16
				End if 
			End if 
		End if 
	: ($_l_event=On Timer:K2:25)
		SRCH_r_Timer:=((Current time:C178*1)*60)
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				If (SRCH_t_SearchValue#"")
					If (SRCH_t_SearchValue="*ALL")
						SRCH_t_SearchValue:=""
						SD2_T_SearchValue:=""
						ALL RECORDS:C47([PRODUCTS:9])
						SRCH_StandardSearch(Table:C252(->[PRODUCTS:9]); "")
					Else 
						SRCH_StandardSearch(Table:C252(->[PRODUCTS:9]); SRCH_t_SearchValue)
					End if 
					
					If (Records in selection:C76([PRODUCTS:9])>0)
						Cache_Update(-(Table:C252(->[PRODUCTS:9])))
						
					End if 
					Srch_resetUnfilteredSelection(->[PRODUCTS:9])
					SRCH_Applyfilterstoselection(->[PRODUCTS:9])
					
				Else 
					If (PROD_bo_UnfilteredSetKnown) & (False:C215)
						USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
					Else 
						If (Size of array:C274(WS_al_CachedSelection)>1)
							//) it should be
							SEL_PreviousSelection(Table:C252(->[PRODUCTS:9]))
							
						Else 
							ALL RECORDS:C47([PRODUCTS:9])
							vSelPrev:=""
							Prod_Sel2("")
							Cache_Update
						End if 
						PROD_l_SetID:=0
						PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
						CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
						PROD_bo_UnfilteredSetKnown:=True:C214
					End if 
					
					SRCH_Applyfilterstoselection(->[PRODUCTS:9])
					
					//reload the selection by filter
					
				End if 
				
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].Products_Out"; $_t_oldMethodName)
