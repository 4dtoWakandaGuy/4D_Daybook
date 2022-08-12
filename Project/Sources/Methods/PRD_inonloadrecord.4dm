//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_inonloadrecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>RemNotProd)
	//C_UNKNOWN(r6)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(s2)
	//C_UNKNOWN(s3)
	//C_UNKNOWN(Vadd)
	//C_UNKNOWN(vButtDisPro)
	//C_UNKNOWN(vPAccount)
	//C_UNKNOWN(vSAccount)
	//C_UNKNOWN(vTitle3)
	//C_UNKNOWN(vTitle4)
	_O_C_STRING:C293(80; WS_S80_aAssMessage)
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY BOOLEAN(PRD_lb_PublicationDates2;0)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	//ARRAY BOOLEAN(PROD_lb_SubsBillings;0)
	//ARRAY BOOLEAN(PROD_lb_SubsMailings;0)
	//ARRAY BOOLEAN(STK_lb_SalesStats;0)
	ARRAY DATE:C224($_ad_DateForFilter; 0)
	ARRAY DATE:C224($_ad_IssueDates; 0)
	//ARRAY DATE(STK_ad_Date;0)
	//ARRAY INTEGER(PRD_ai_SubsRenwalStart;0)
	//ARRAY INTEGER(PRD_al_SubsBillingstart;0)
	//ARRAY INTEGER(PRD_at_SubsBillingFrequency;0)
	ARRAY LONGINT:C221($_al_SortOrder; 0)
	//ARRAY LONGINT(PRD_al_CodeFormatIDs;0)
	//ARRAY LONGINT(PRD_al_CodeFormatsSections;0)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PRD_al_ProductTypes;0)
	//ARRAY LONGINT(PRD_al_SubsBillingID;0)
	//ARRAY LONGINT(PRD_al_SubsRenewalID;0)
	//ARRAY LONGINT(PRD_al_SubsRenewalStart;0)
	//ARRAY REAL(PRD_ar_SubsBilingAmount;0)
	//ARRAY REAL(STK_ar_Quantity;0)
	ARRAY TEXT:C222($_at_BrandCodes; 0)
	ARRAY TEXT:C222($_at_GroupCodes; 0)
	ARRAY TEXT:C222($_at_Groupodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(PRD_at_CodeFormats;0)
	//ARRAY TEXT(PRD_at_FilterDates;0)
	//ARRAY TEXT(PRD_at_FiltersSubsCodes;0)
	//ARRAY TEXT(PRD_at_FilterSubs;0)
	//ARRAY TEXT(Prd_at_Note;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ProductTypes;0)
	//ARRAY TEXT(PRD_at_subsBillingFrType;0)
	//ARRAY TEXT(PRD_at_SubsBillingType;0)
	//ARRAY TEXT(PRD_at_SubsRenwalLetterCode;0)
	//ARRAY TEXT(PRD_at_UrlLinks;0)
	//ARRAY TEXT(PRD_at_WebLinks;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	//ARRAY TEXT(PROD_at_FurtherCodeDEL;0)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	//ARRAY TEXT(STK_at_DatesRange;0)
	//ARRAY TEXT(STK_at_DetailTypes;0)
	//ARRAY TEXT(STK_at_FilterBy;0)
	//ARRAY TEXT(STK_at_HistoryTypes;0)
	C_BOOLEAN:C305(<>RemNotProd; $_bo_BrandFound; $_bo_Exit; $_bo_GroupFound; $_bo_OptionSet; $_bo_Visible; PRD_bo_FurtherFieldsLoaded; PRD_bo_NLA; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem; <>ProdGrpBrd)
	C_BOOLEAN:C305($_bo_BrandFound; $_bo_Exit; $_bo_GroupFound; $_bo_OptionSet; $_bo_Visible; PRD_bo_FurtherFieldsLoaded; PRD_bo_NLA; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem)
	C_DATE:C307($_d_LastIssueDate; $_D_NextIssueDate; STK_d_FilterDateEnd; STK_d_FilterDateStart; $_d_FirstIssueDate; $_d_LastIssueDate; $_D_NextIssueDate; STK_d_FilterDateEnd; STK_d_FilterDateStart)
	C_LONGINT:C283($_l_CustomFieldsExist; $_l_Dayof; $_l_Dayof2; $_l_EditBottom; $_l_EditLeft; $_l_EditRight; $_l_editTop; $_l_FindBrand; $_l_FindGroup; $_l_GroupBottom; $_l_GroupRight)
	C_LONGINT:C283($_l_GroupTop; $_l_Index; $_l_IterationsPosition; $_l_NumberofIssues; $_l_Page6Position; $_l_PCBottom; $_l_PCLeft; $_l_PCRight; $_l_PCTop; $_l_SubscriptionsPosition; $_l_UnitCount)
	C_LONGINT:C283($_l_YearOfDate; bPROD_l_FurthDelete; bPROD_l_Furthmodify; DF_l_ListedOnly; DF_l_SupplierOption; PRD_l_BuildProductPrice; PRD_l_SelectedURLRef; PRO_l_BUT1; PRO_l_BUT3; PRO_l_BUT4; PRO_l_BUT5)
	C_LONGINT:C283(PRO_l_BUT6; PRO_l_BUT7; PRO_l_BUT8; PRO_l_BUT9; PROD_l_CurrentFurtherStatus; Prod_l_ListedOnly; r6; s1; s2; s3; SBB_l_BUT1)
	C_LONGINT:C283(SBB_l_But2; SBB_l_BUT3; SBB_l_BUT4; SBB_l_BUT5; SBB_l_BUT6; SBB_l_BUT7; SBB_l_BUT9; SBR_l_BUT1; SBR_l_But2; SBR_l_BUT3; SBR_l_BUT4)
	C_LONGINT:C283(SBR_l_BUT5; SBR_l_BUT6; SBR_l_BUT7; SBR_l_BUT8; SBR_l_BUT9; STK_l_BUT2; STK_l_BUT3; STK_l_BUT4; STK_l_BUT5; STK_l_BUT7; STK_l_BUT8)
	C_LONGINT:C283(STK_l_BUT9; STK_L6; Vadd; $_l_BuildFormatPosition; $_l_CustomFieldsExist; $_l_Dayof; $_l_Dayof2; $_l_EditBottom; $_l_EditLeft; $_l_EditRight; $_l_editTop)
	C_LONGINT:C283($_l_FindBrand; $_l_FindGroup; $_l_GroupBottom; $_l_GroupLeft; $_l_GroupRight; $_l_GroupTop; $_l_Index; $_l_IterationsPosition; $_l_NumberofIssues; $_l_Page6Position; $_l_PCBottom)
	C_LONGINT:C283($_l_PCLeft; $_l_PCRight; $_l_PCTop; $_l_SplitYear; $_l_SubscriptionsPosition; $_l_UnitCount; $_l_YearOfDate; bPROD_l_FurthDelete; bPROD_l_Furthmodify; DF_l_SupplierOption; PRD_l_BuildProductPrice)
	C_LONGINT:C283(PRD_l_FurtherFieldsMod; PRD_l_SelectedURLRef; PRO_l_But2; PROD_l_CurrentFurtherStatus; Prod_l_ListedOnly; r7; SBB_l_BUT8; STK_l_BUT1)
	C_POINTER:C301(PROD_P_ItemProdCodeField)
	C_REAL:C285(PRD_R_TotalQuantitySold; PROD_R_SupplierPrice; PRD_R_CurrentStockdays; PRD_R_TotalQuantitySold; PROD_R_SupplierPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_Methodname; oFurthers_COL1; oFurthers_COL2; oFurthers_COL3; oFurthers_COL4; oFurthers_COL5; oFurthers_COL6; oFurthers_COL8)
	C_TEXT:C284(oFurthers_COL9; oFurthers_HED1; oFurthers_HED2; oFurthers_HED3; oFurthers_HED4; oFurthers_HED5; oFurthers_HED6; oFurthers_HED7; oFurthers_HED8; PRD_t_Title3a; PRD_t_Title3B)
	C_TEXT:C284(PROD_T_CompanyName; PROD_t_curFurtherAnalNM; PROD_t_CurFurtherCode; PROD_t_Currency; PROD_t_SupplierCode; PROD_t_SupplierOption; SBB_t_COL1; SBB_t_COL2; SBB_t_COL4; SBB_t_COL5; SBB_t_COL6)
	C_TEXT:C284(SBB_t_COL7; SBB_t_COL8; SBB_t_COL9; SBB_t_HED1; SBB_t_HED2; SBB_t_HED3; SBB_t_HED4; SBB_t_HED6; SBB_t_HED7; SBB_t_HED8; SBB_t_HED9)
	C_TEXT:C284(SBR_t_COL1; SBR_t_COL2; SBR_t_COL3; SBR_t_COL4; SBR_t_COL5; SBR_t_COL6; SBR_t_COL8; SBR_t_COL9; SBR_t_HED1; SBR_t_HED2; SBR_t_HED3)
	C_TEXT:C284(SBR_t_HED4; SBR_t_HED5; SBR_t_HED6; SBR_t_HED7; SBR_t_HED8; Stock_COL1; Stock_COL2; Stock_COL3; Stock_COL4; Stock_COL5; Stock_COL6)
	C_TEXT:C284(Stock_COL7; Stock_COL8; Stock_COL9; Stock_HED1; Stock_HED3; Stock_HED4; Stock_HED5; Stock_HED6; Stock_HED7; Stock_HED8; Stock_HED9)
	C_TEXT:C284(vButtDisPro; vPAccount; vSAccount; vTitle3; vTitle4; WS_S80_aAssMessage; <>ProdCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_Methodname)
	C_TEXT:C284(oFurthers_COL7; oFurthers_HED9; PRD_t_Title3a; PRD_t_Title3B; PROD_T_CompanyName; PROD_t_curFurtherAnalNM; PROD_t_CurFurtherCode; PROD_t_Currency; PROD_t_SupplierCode; PROD_t_SupplierOption; SBB_t_COL3)
	C_TEXT:C284(SBB_t_HED5; SBR_t_COL7; SBR_t_HED9; Stock_HED2; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_inonloadrecord")

ARRAY TEXT:C222(PRD_at_FilterDates; 0)
DB_t_Methodname:=Current method name:C684
If (Vadd=1)  //We are adding a record
	$_bo_Visible:=False:C215
	If ([PRODUCTS:9]Product_Code:1="")  // & (DB_t_CurrentFormUsage="order@") & (Records in selection([ORDER ITEMS])=1)
		
		If (PROD_bo_GetCodeFromItem)
			[PRODUCTS:9]Product_Code:1:=Uppercase:C13(PROD_P_ItemProdCodeField->)
			[PRODUCTS:9]Model_Code:5:=Uppercase:C13(PROD_P_ItemProdCodeField->)
			
			Case of 
				: (DB_GetProductGroupBrand)
					If (Length:C16([PRODUCTS:9]Model_Code:5)>=3)
						//see if the first part of the new product code matches and group codes....if so cut it off from front of model code and move it into group code....otherwise ensure group code is currently empty (which it should be anyway)
						QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=(Substring:C12([PRODUCTS:9]Model_Code:5; 1; 3))+"@")
						SELECTION TO ARRAY:C260([PRODUCT_GROUPS:10]Group_Code:1; $_at_GroupCodes)
						ARRAY LONGINT:C221($_al_SortOrder; 0)
						
						ARRAY LONGINT:C221($_al_SortOrder; Size of array:C274($_at_GroupCodes))
						
						For ($_l_FindGroup; 1; Size of array:C274($_at_Groupodes))
							$_al_SortOrder{$_l_FindGroup}:=Length:C16($_at_GroupCodes{$_l_FindGroup})
							
						End for 
						$_bo_GroupFound:=False:C215
						SORT ARRAY:C229($_al_SortOrder; $_at_GroupCodes; <)  //longest first
						For ($_l_FindGroup; 1; Size of array:C274($_at_GroupCodes))
							If ([PRODUCTS:9]Model_Code:5=($_at_GroupCodes{$_l_FindGroup})+"@")
								[PRODUCTS:9]Group_Code:3:=$_at_GroupCodes{$_l_FindGroup}
								[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Model_Code:5; Length:C16([PRODUCTS:9]Group_Code:3)+1)
								$_bo_GroupFound:=True:C214
							End if 
						End for 
						If (Not:C34($_bo_GroupFound))
							[PRODUCTS:9]Group_Code:3:=""
						End if 
						
						If (Records in selection:C76([PRODUCT_GROUPS:10])=1)
							//[PRODUCTS]Group_Code:=Substring([PRODUCTS]Model_Code;1;3)
							//[PRODUCTS]Model_Code:=Substring([PRODUCTS]Model_Code;4)
						Else 
							//[PRODUCTS]Group_Code:=""
						End if 
					End if 
					If (Length:C16([PRODUCTS:9]Model_Code:5)>=3)
						//see if the first part of the new product code (or if we already found a match on the group code then this will be checking the second part of the new code) matches and brand codes....if so cut it off from front of model code and move it into group code....otherwise ensure group code is currently empty (which it should be anyway)
						QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=(Substring:C12([PRODUCTS:9]Model_Code:5; 1; 3))+"@")
						SELECTION TO ARRAY:C260([PRODUCT_BRANDS:8]Brand_Code:1; $_at_BrandCodes)
						ARRAY LONGINT:C221($_al_SortOrder; 0)
						
						ARRAY LONGINT:C221($_al_SortOrder; Size of array:C274($_at_BrandCodes))
						
						For ($_l_FindBrand; 1; Size of array:C274($_at_BrandCodes))
							$_al_SortOrder{$_l_FindBrand}:=Length:C16($_at_BrandCodes{$_l_FindBrand})
							
						End for 
						$_bo_BrandFound:=False:C215
						SORT ARRAY:C229($_al_SortOrder; $_at_BrandCodes; <)  //longest first
						For ($_l_FindBrand; 1; Size of array:C274($_at_BrandCodes))
							If ([PRODUCTS:9]Model_Code:5=($_at_BrandCodes{$_l_FindBrand})+"@")
								[PRODUCTS:9]Brand_Code:4:=$_at_BrandCodes{$_l_FindBrand}
								[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Model_Code:5; Length:C16([PRODUCTS:9]Brand_Code:4)+1)
								$_bo_BrandFound:=True:C214
							End if 
						End for 
						If (Not:C34($_bo_BrandFound))
							[PRODUCTS:9]Brand_Code:4:=""
						End if 
						If (Records in selection:C76([PRODUCT_BRANDS:8])=1)
							//[PRODUCTS]Brand_Code:=Substring([PRODUCTS]Model_Code;1;3)
							//[PRODUCTS]Model_Code:=Substring([PRODUCTS]Model_Code;4)
						Else 
							//[PRODUCTS]Brand_Code:=""
						End if 
					End if 
					
					[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
				: (DB_Get_ProductBrandPref)
					
					QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=(Substring:C12([PRODUCTS:9]Model_Code:5; 1; 3))+"@")
					SELECTION TO ARRAY:C260([PRODUCT_BRANDS:8]Brand_Code:1; $_at_BrandCodes)
					ARRAY LONGINT:C221($_al_SortOrder; Size of array:C274($_at_BrandCodes))
					
					For ($_l_FindBrand; 1; Size of array:C274($_at_BrandCodes))
						$_al_SortOrder{$_l_FindBrand}:=Length:C16($_at_BrandCodes{$_l_FindBrand})
						
					End for 
					$_bo_BrandFound:=False:C215
					SORT ARRAY:C229($_al_SortOrder; $_at_BrandCodes; <)  //longest first
					For ($_l_FindBrand; 1; Size of array:C274($_at_BrandCodes))
						If ([PRODUCTS:9]Model_Code:5=($_at_BrandCodes{$_l_FindBrand})+"@")
							[PRODUCTS:9]Brand_Code:4:=$_at_BrandCodes{$_l_FindBrand}
							[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Model_Code:5; Length:C16([PRODUCTS:9]Brand_Code:4)+1)
							$_bo_BrandFound:=True:C214
						End if 
					End for 
					If (Not:C34($_bo_BrandFound))
						[PRODUCTS:9]Brand_Code:4:=""
					End if 
					
					[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
					
				Else 
					[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Model_Code:5
			End case 
		End if 
		//changed from asking question here to doing so previously (via an earlier call to PROD_CheckIfDefault which sets PROD_bo_GetValuesFromItem), 03/09/08 -kmw
		//Gen_Confirm ("Base new Product on details from Order Item? ("+[ORDER ITEMS]Product Name+")")
		If (PROD_bo_GetValuesFromItem)
			If (GenValidatePointer(PROD_P_ItemProdCodeField))
				
				
				Case of 
					: (Field:C253(PROD_P_ItemProdCodeField)=Field:C253(->[ORDER_ITEMS:25]Product_Code:2))
						//default product model code to be entire order item product code (ie the default is that the user didn't specify model and brand code in the new product code)
						[PRODUCTS:9]Product_Name:2:=[ORDER_ITEMS:25]Product_Name:13
						[PRODUCTS:9]Description:6:=[ORDER_ITEMS:25]Description:44
						[PRODUCTS:9]Default_Tax:23:=[ORDER_ITEMS:25]Tax_Code:12
						[PRODUCTS:9]Price_Per:40:=[ORDER_ITEMS:25]Price_Per:50
						If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
							If ([ORDERS:24]Currency_Code:32#"")
								QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[ORDERS:24]Currency_Code:32)
								[PRODUCTS:9]Default_Price_Currency_ID:45:=[CURRENCIES:71]X_ID:3
							End if 
						End if 
						
						If ([ORDER_ITEMS:25]Sales_Price:4#0)
							[PRODUCTS:9]Sales_Price:9:=[ORDER_ITEMS:25]Sales_Price:4
						Else 
							[PRODUCTS:9]Sales_Price:9:=[ORDER_ITEMS:25]Retail_Price:38
						End if 
						[PRODUCTS:9]Standard_Price:16:=[ORDER_ITEMS:25]Standard_Price:39
						//kmw 10/08/08 NOTE: Havn't done it yet as may leead to problems but I am tempted to add "|([ORDER ITEMS]Cost Price#0)" to the following line because currently can save a product supplier with no supplier code which may or may not in itself be correct
						If ([ORDER_ITEMS:25]Supplier_Code:20#"")
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
							[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
							
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[ORDER_ITEMS:25]Supplier_Code:20
							[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[ORDERS:24]Currency_Code:32
							If ([ORDER_ITEMS:25]Cost_Price:5#0)
								[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[ORDER_ITEMS:25]Cost_Price:5
							End if 
							DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
							
							//******************************************** `added -kmw 10/10/08 v631b120 ********************************************
							//(Set these values in case simplified product entry screen is used...no harm if not...fixes issue where although product supplier subrecord added it wasn't shown on simplified screen)
							PROD_t_SupplierCode:=[PRODUCTS_SUPPLIERS:148]Company_Code:1
							If ([COMPANIES:2]Company_Code:1#PROD_t_SupplierCode)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=PROD_t_SupplierCode)
							End if 
							PROD_T_CompanyName:=[COMPANIES:2]Company_Name:2
							PROD_R_SupplierPrice:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
							//*****************************************************************************************************************************
						End if 
					: (Field:C253(PROD_P_ItemProdCodeField)=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
						[PRODUCTS:9]Product_Name:2:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
						[PRODUCTS:9]Description:6:=[PURCHASE_ORDERS_ITEMS:169]Description:13
						[PRODUCTS:9]Price_Per:40:=[PURCHASE_ORDERS_ITEMS:169]Price_Per:12
						[PRODUCTS:9]Default_Tax:23:=[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7
						If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
							If ([PURCHASE_ORDERS:57]Currency_Code:16#"")
								QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[PURCHASE_ORDERS:57]Currency_Code:16)
								[PRODUCTS:9]Default_Price_Currency_ID:45:=[CURRENCIES:71]X_ID:3
							End if 
						End if 
						
						//kmw 10/08/08 NOTE: Havn't done it yet as may lead to problems but I am tempted to add "|([PURCHASE ORDERS]ITEMS'Cost Price#0)" to the following line because currently can save a product supplier with no supplier code which may or may not in itself be correct
						If ([PURCHASE_ORDERS:57]Company_Code:1#"")
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_ORDERS:57]Company_Code:1
							[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[PURCHASE_ORDERS:57]Currency_Code:16
							If ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11#0)
								[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
							Else 
								[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
							End if 
							DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
							
							//******************************************** `added -kmw 10/10/08 v631b120 ********************************************
							//(Set these values in case simplified product entry screen is used...no harm if not...fixes issue where although product supplier subrecord added it wasn't shown on simplified screen)
							PROD_t_SupplierCode:=[PRODUCTS_SUPPLIERS:148]Company_Code:1
							If ([COMPANIES:2]Company_Code:1#PROD_t_SupplierCode)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=PROD_t_SupplierCode)
							End if 
							PROD_T_CompanyName:=[COMPANIES:2]Company_Name:2
							PROD_R_SupplierPrice:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
							//*****************************************************************************************************************************
						End if 
						
					Else 
						
				End case 
			End if 
		End if 
	End if 
	
	GOTO OBJECT:C206([PRODUCTS:9]Group_Code:3)
Else 
	OBJECT SET ENTERABLE:C238([PRODUCTS:9]Product_Code:1; False:C215)
	OBJECT SET ENTERABLE:C238([PRODUCTS:9]Short_Code:19; False:C215)
	
	$_bo_Visible:=True:C214
	If ([PRODUCTS:9]Product_Code:1#"")
		If (DB_t_CurrentFormUsage#"None")
			GOTO OBJECT:C206([PRODUCTS:9]Product_Name:2)
		End if 
		HIGHLIGHT TEXT:C210([PRODUCTS:9]Product_Name:2; 80; 80)
	End if 
	
End if 
Case of 
	: (DB_GetProductGroupBrand)
		PRD_t_Title3a:="Group"
		PRD_t_Title3B:="/Brand/"
		OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
		OBJECT SET VISIBLE:C603(*; "oCBEditModel"; $_bo_Visible)
		OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
		OBJECT SET VISIBLE:C603(*; "oGroupField"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oModelLabel"; Not:C34($_bo_Visible))
	: (DB_Get_ProductBrandPref)
		PRD_t_Title3a:="Group"
		If (Not:C34($_bo_Visible))
			PRD_t_Title3B:="/Brand/"
		Else 
			PRD_t_Title3B:="/"
		End if 
		OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
		OBJECT SET VISIBLE:C603(*; "oCBEditModel"; $_bo_Visible)
		OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oGroupField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
		OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oModelLabel"; Not:C34($_bo_Visible))
		If (($_bo_Visible))
			OBJECT GET COORDINATES:C663(*; "oGroupField"; $_l_GroupLeft; $_l_GroupTop; $_l_GroupRight; $_l_GroupBottom)
			OBJECT GET COORDINATES:C663(*; "oCBEditModel"; $_l_EditLeft; $_l_editTop; $_l_EditRight; $_l_EditBottom)
			OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_PCLeft; $_l_PCTop; $_l_PCRight; $_l_PCBottom)
			OBJECT SET COORDINATES:C1248(*; "oProductCode"; ($_l_GroupRight+3); $_l_PCTop; $_l_EditLeft-3; $_l_PCBottom)
			//oCBEditModel
		End if 
		
	Else 
		OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCBEditModel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oGroupField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oBrandField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oModelField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oModelLabel"; True:C214)
End case 
//``````````
PRD_bo_NLA:=([PRODUCTS:9]x_Product_No_longer_Available:54<0)

If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
	READ ONLY:C145([CURRENCIES:71])
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
	PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
Else 
	PROD_t_Currency:=<>SYS_t_BaseCurrency
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
		OBJECT SET ENTERABLE:C238(PROD_t_Currency; False:C215)
	End if 
End if 
//```
If ([PRODUCTS:9]Product_Code:1="")
	If (([PRODUCTS:9]Export:22="") & (<>RemNotProd))
		[PRODUCTS:9]Export:22:="No"
	End if 
Else 
	[PRODUCTS:9]Product_Code:1:=Uppercase:C13([PRODUCTS:9]Product_Code:1)
End if 
<>ProdCode:=[PRODUCTS:9]Product_Code:1

//`````
If ([PRODUCTS:9]Sales_Account:7#"")
	RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
	vSAccount:=[ACCOUNTS:32]Account_Name:3
Else 
	vSAccount:=""
End if 
//````
If ([PRODUCTS:9]Purchase_Account:13#"")
	RELATE ONE:C42([PRODUCTS:9]Purchase_Account:13)
	vPAccount:=[ACCOUNTS:32]Account_Name:3
Else 
	vPAccount:=""
End if 
//````
ARRAY LONGINT:C221(PRD_al_CodeFormatsSections; 0)
ARRAY LONGINT:C221(PRD_al_CodeFormatIDs; 0)
ARRAY TEXT:C222(PRD_at_CodeFormats; 0)
OBJECT SET VISIBLE:C603(*; "oBuildFormats@"; False:C215)
PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
Case of 
	: (PRD_at_ProductTypes=1)  //Standard class product([PRODUCTS]xProductEntryClass=0)
		ARRAY TEXT:C222(PRD_at_ProductsTab; 4)
		
		
		OBJECT SET VISIBLE:C603(PRD_l_BuildProductPrice; False:C215)
		OBJECT SET VISIBLE:C603(*; "oIterations@"; False:C215)
	: (PRD_at_ProductTypes=3)  //([PRODUCTS]xProductEntryClass=2)
		OBJECT SET VISIBLE:C603(*; "oBuildFormats@"; True:C214)
		If (PRD_l_BuildProductPrice=0)
			OBJECT SET ENTERABLE:C238(PROD_t_Currency; False:C215)
			OBJECT SET ENTERABLE:C238([PRODUCTS:9]Sales_Price:9; False:C215)
			OBJECT SET ENTERABLE:C238([PRODUCTS:9]Standard_Price:16; False:C215)
			//DISABLE BUTTON([PRODUCTS]Price Updates)
			OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
			OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; False:C215)
			OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; False:C215)
			OBJECT SET VISIBLE:C603(PRD_l_BuildProductPrice; True:C214)
		End if 
		ALL RECORDS:C47([PRODUCT_BUILT_CODE_FORMAT:189])
		ARRAY LONGINT:C221(PRD_al_CodeFormatsSections; 0)
		ARRAY LONGINT:C221(PRD_al_CodeFormatIDs; 0)
		ARRAY TEXT:C222(PRD_at_CodeFormats; 0)
		SELECTION TO ARRAY:C260([PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_NAME:2; PRD_at_CodeFormats; [PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1; PRD_al_CodeFormatIDs; [PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3; PRD_al_CodeFormatsSections)
		SORT ARRAY:C229(PRD_at_CodeFormats; PRD_al_CodeFormatIDs; PRD_al_CodeFormatsSections)
		$_l_BuildFormatPosition:=Find in array:C230(PRD_al_CodeFormatIDs; [PRODUCTS:9]Product_Build_Format_ID:57)
		APPEND TO ARRAY:C911(PRD_at_CodeFormats; "-")
		APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; 0)
		APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
		APPEND TO ARRAY:C911(PRD_at_CodeFormats; "Create New Format")
		APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; -1)
		APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
		If ($_l_BuildFormatPosition>0)
			PRD_at_CodeFormats:=$_l_BuildFormatPosition
		Else 
			PRD_at_CodeFormats:=0
		End if 
	: (PRD_at_ProductTypes=2)  //([PRODUCTS]xProductEntryClass=1)
		$_l_IterationsPosition:=Find in array:C230(PRD_at_ProductsTab; "Iterations")
		If ($_l_IterationsPosition<0)
			APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Iterations")
			APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 5)
		End if 
		
		OBJECT SET VISIBLE:C603(*; "oIterations@"; True:C214)
		ARRAY TEXT:C222(Prd_at_Note; 4)
		Prd_at_Note{1}:="Day(s)"
		Prd_at_Note{2}:="Week(s)"
		Prd_at_Note{3}:="Month(s)"
		Prd_at_Note{4}:="Year(s)"
		Case of 
			: ([PRODUCTS:9]Unit_Number:29=7)
				Prd_at_Note:=2
			: ([PRODUCTS:9]Unit_Number:29=1)
				Prd_at_Note:=1
			: ([PRODUCTS:9]Unit_Number:29=31)
				Prd_at_Note:=3
			: ([PRODUCTS:9]Unit_Number:29=365)
				Prd_at_Note:=4
		End case 
		SD2_CheckDefaultAction("PDT")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
		QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
		ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
		SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DateForFilter)
		$_l_SplitYear:=Year of:C25(!2001-01-01!)
		For ($_l_Index; 1; Size of array:C274($_ad_DateForFilter))
			$_l_YearOfDate:=Year of:C25($_ad_DateForFilter{$_l_Index})
			If ($_l_YearOfDate#$_l_SplitYear)
				APPEND TO ARRAY:C911(PRD_at_FilterDates; "After "+String:C10($_l_YearOfDate-1))
				$_l_SplitYear:=$_l_YearOfDate
			End if 
		End for 
		APPEND TO ARRAY:C911(PRD_at_FilterDates; "Future Dates")
		APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Month")
		APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Year")
		PRD_at_FilterDates:=0
		If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0) & ([PRODUCTS:9]First_Issue_Date:32#!00-00-00!) & ([PRODUCTS:9]Issues_Number:27#0) & ([PRODUCTS:9]Product_Code:1#"")
			ARRAY DATE:C224($_ad_IssueDates; 0)
			//TRACE
			$_d_FirstIssueDate:=[PRODUCTS:9]First_Issue_Date:32
			$_l_NumberofIssues:=[PRODUCTS:9]Issues_Number:27
			Case of 
				: ([PRODUCTS:9]Unit_Number:29=7)  // years
					$_d_LastIssueDate:=Current date:C33(*)-7
					If ($_d_FirstIssueDate<$_d_LastIssueDate)
						Repeat 
							$_d_FirstIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_FirstIssueDate>=$_d_LastIssueDate)
					End if 
					
				: ([PRODUCTS:9]Unit_Number:29=1)  //days
					$_d_LastIssueDate:=Current date:C33(*)-1
					If ($_d_FirstIssueDate<$_d_LastIssueDate)
						Repeat 
							$_d_FirstIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_FirstIssueDate>=$_d_LastIssueDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=31)  //month
					$_d_LastIssueDate:=Current date:C33(*)-31
					If ($_d_FirstIssueDate<$_d_LastIssueDate)
						Repeat 
							$_d_FirstIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_FirstIssueDate>=$_d_LastIssueDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=365)
					$_d_LastIssueDate:=Current date:C33(*)-365
					If ($_d_FirstIssueDate<$_d_LastIssueDate)
						Repeat 
							$_d_FirstIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_FirstIssueDate>=$_d_LastIssueDate)
					End if 
			End case 
			//we are not going to check or create the existence of past issues
			SD2_CheckDefaultAction("PDT")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_FirstIssueDate)
			If (Records in selection:C76([DIARY:12])=0)
				APPEND TO ARRAY:C911($_ad_IssueDates; $_d_FirstIssueDate)
			End if 
			$_bo_Exit:=False:C215
			$_l_UnitCount:=0
			Repeat 
				Case of 
					: ([PRODUCTS:9]Unit_Number:29=31)  //month
						If ($_d_FirstIssueDate>!00-00-00!)
							$_l_Dayof:=Day of:C23($_d_FirstIssueDate)
						Else 
							$_l_Dayof:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
						End if 
						$_D_NextIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						$_l_Dayof2:=Day of:C23($_D_NextIssueDate)
						If ($_l_Dayof2>$_l_Dayof)
							For ($_l_Index; $_l_Dayof2; 1; -1)
								$_D_NextIssueDate:=$_D_NextIssueDate-1
								If (Day of:C23($_D_NextIssueDate)=$_l_Dayof)
									$_l_Index:=1
								End if 
							End for 
						Else 
							For ($_l_Index; $_l_Dayof2; 31)
								$_D_NextIssueDate:=$_D_NextIssueDate+1
								If (Day of:C23($_D_NextIssueDate)=$_l_Dayof)
									$_l_Index:=32
								End if 
							End for 
						End if 
						$_d_FirstIssueDate:=$_D_NextIssueDate
						
					Else 
						$_d_FirstIssueDate:=$_d_FirstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
				End case 
				$_l_UnitCount:=$_l_UnitCount+1
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_FirstIssueDate)
				If (Records in selection:C76([DIARY:12])=0)
					APPEND TO ARRAY:C911($_ad_IssueDates; $_d_FirstIssueDate)
				End if 
			Until ($_l_UnitCount>=$_l_NumberofIssues)
			If (Size of array:C274($_ad_IssueDates)>0)
				//there are some issue records to be created
				For ($_l_Index; 1; Size of array:C274($_ad_IssueDates))
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_ad_IssueDates{$_l_Index})
					If (Records in selection:C76([DIARY:12])=0)
						CREATE RECORD:C68([DIARY:12])
						DiarySetCode
						[DIARY:12]Action_Code:9:="PDT"
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Time_Do_From:6:=?00:00:01?
						[DIARY:12]Time_Do_To:35:=?23:59:59?
						[DIARY:12]Product_Code:13:=[PRODUCTS:9]Product_Code:1
						[DIARY:12]Action_Details:10:=[PRODUCTS:9]Product_Name:2+" Publication Date"
						DB_SaveRecord(->[DIARY:12])
					End if 
				End for 
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			
		End if 
	: (PRD_at_ProductTypes=4)  //Component only product
	: (PRD_at_ProductTypes=5)  //([PRODUCTS]xProductEntryClass=4)
		OBJECT SET VISIBLE:C603(*; "oIterations@"; True:C214)
		$_l_SubscriptionsPosition:=Find in array:C230(PRD_at_ProductsTab; "Subscription Setup")
		If ($_l_SubscriptionsPosition<0)
			APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscription Setup")
			APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 6)
			APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscriptions")
			APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 8)
			ARRAY TEXT:C222(PRD_at_FilterSubs; 0)
			ARRAY TEXT:C222(PRD_at_FiltersSubsCodes; 0)
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Issues")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "ISS")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Billings")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "B+")
			//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - Invoice but No Payment")
			//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BIN")
			//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice but Payment")
			//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNP")
			//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice & No Payment"
			//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNN")
			
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Renewal Letter")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "REN")
			
			ARRAY INTEGER:C220(PRD_al_SubsBillingstart; 0)  //time after or before first issue to get bill
			ARRAY REAL:C219(PRD_ar_SubsBilingAmount; 0)  //amount of bill xtax
			ARRAY TEXT:C222(PRD_at_SubsBillingType; 0)  //billing type
			ARRAY INTEGER:C220(PRD_at_SubsBillingFrequency; 0)  // recurring billling
			ARRAY TEXT:C222(PRD_at_subsBillingFrType; 0)
			ARRAY LONGINT:C221(PRD_al_SubsBillingID; 0)
			
			ARRAY LONGINT:C221(PRD_al_SubsRenewalStart; 0)  // time after of before LAST issue to get renewal reminder
			ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
			ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
		End if 
		//SUBS BILLING
		If ([PRODUCTS:9]Product_Code:1#"")
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@"; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsBillingID)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; PRD_ar_SubsBilingAmount)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Subscription_Type:12; PRD_at_SubsBillingType)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_al_SubsBillingstart)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Unit_Number:6; PRD_at_SubsBillingFrequency)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Units_Type:13; PRD_at_subsBillingFrType)
			
		Else 
			REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
		End if 
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		LB_SetupListbox(->PROD_lb_SubsBillings; "SBB_t"; "SBB_L"; 1; ->PRD_at_SubsBillingType; ->PRD_al_SubsBillingstart; ->PRD_ar_SubsBilingAmount; ->PRD_at_SubsBillingFrequency; ->PRD_at_subsBillingFrType; ->PRD_al_SubsBillingID)
		
		LB_SetColumnHeaders(->PROD_lb_SubsBillings; "SBB_L"; 1; "Type"; "First Billing"; "Bill Amount"; "Rebill TImes"; "Rebill Frequency"; "ID")
		LB_SetColumnWidths(->PROD_lb_SubsBillings; "SBB_t"; 1; 90; 40; 60; 50; 60; 0)
		LB_SetEnterable(->PROD_lb_SubsBillings; False:C215; 0)
		LB_SetScroll(->PROD_lb_SubsBillings; -3; -2)
		LB_StyleSettings(->PROD_lb_SubsBillings; "Black"; 9; "SBB_t"; ->[PRODUCTS:9])
		
		//```
		ARRAY INTEGER:C220(PRD_ai_SubsRenwalStart; 0)  // time after of before LAST issue to get renewal reminder
		ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
		ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
		//SUBS Renewals
		If ([PRODUCTS:9]Product_Code:1#"")
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN"; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsRenewalID)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_ai_SubsRenwalStart)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Renewals_Document_Reference:15; PRD_at_SubsRenwalLetterCode)
			
			
			
		Else 
			REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
		End if 
		SORT ARRAY:C229(PRD_ai_SubsRenwalStart; PRD_al_SubsRenewalID; PRD_at_SubsRenwalLetterCode)
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		LB_SetupListbox(->PROD_lb_SubsMailings; "SBR_t"; "SBR_L"; 1; ->PRD_ai_SubsRenwalStart; ->PRD_at_SubsRenwalLetterCode; ->PRD_al_SubsRenewalID)
		LB_SetColumnHeaders(->PROD_lb_SubsMailings; "SBR_L"; 1; "After Issue"; "Document"; "Renewals ID")
		
		LB_SetColumnWidths(->PROD_lb_SubsMailings; "SBR_t"; 1; 90; 180; 0)
		
		LB_SetEnterable(->PROD_lb_SubsMailings; False:C215; 0)
		LB_SetScroll(->PROD_lb_SubsMailings; -3; -2)
		LB_StyleSettings(->PROD_lb_SubsMailings; "Black"; 9; "SBR_t"; ->[PRODUCTS:9])
		
		PROD_LoadComponents(True:C214; [PRODUCTS:9]Product_Code:1; True:C214)
		If (Size of array:C274(PROD_at_ComponentsCode)>0)
			ARRAY TEXT:C222(PRD_at_FilterDates; 0)
			
			QUERY WITH ARRAY:C644([DIARY:12]Product_Code:13; PROD_at_ComponentsCode)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9="PDT")
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DateForFilter)
			$_l_SplitYear:=Year of:C25(!2001-01-01!)
			For ($_l_Index; 1; Size of array:C274($_ad_DateForFilter))
				$_l_YearOfDate:=Year of:C25($_ad_DateForFilter{$_l_Index})
				If ($_l_YearOfDate#$_l_SplitYear)
					APPEND TO ARRAY:C911(PRD_at_FilterDates; "After "+String:C10($_l_YearOfDate-1))
					$_l_SplitYear:=$_l_YearOfDate
				End if 
			End for 
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "Future Dates")
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Month")
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Year")
			PRD_at_FilterDates:=0
			
		Else 
			ARRAY TEXT:C222(PRD_at_FilterDates; 0)
			REDUCE SELECTION:C351([DIARY:12]; 0)
			
		End if 
		LB_StyleSettings(->PRD_lb_PublicationDates2; "Black"; 9; "SBB_t"; ->[PRODUCTS:9])
		
		
		//``
		FORM GOTO PAGE:C247(6)
		$_l_Page6Position:=Find in array:C230(PRD_al_ProductsTabPage; 6)
		If ($_l_Page6Position>0)
			PRD_at_ProductsTab:=$_l_Page6Position
		End if 
		
		
		
		
	: (PRD_at_ProductTypes=6)  //([PRODUCTS]xProductEntryClass=5)
		
		
		
		
		
		
		
End case 


If ([PRODUCTS:9]Price_Updates:25)
	OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; True:C214)
	If (Not:C34(Read only state:C362([PRODUCTS:9])))  //if read write
		
		OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
	End if 
	If ([PRODUCTS:9]x_Supplier_Update_Option:47#0)
		For ($_l_Index; 1; Size of array:C274(Prod_at_SupplierOption))
			$_bo_OptionSet:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
			If ($_bo_OptionSet)
				PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_Index}
				$_l_Index:=Size of array:C274(Prod_at_SupplierOption)
			End if 
		End for 
		Prod_l_ListedOnly:=Num:C11([PRODUCTS:9]x_Supplier_Update_Option:47 ?? 4)  //Only allow list suppliers on order
	Else 
		DF_LoadProdPriceSettings
		//Get Default
		If (DF_l_SupplierOption>0)
			[PRODUCTS:9]x_Supplier_Update_Option:47:=DF_l_SupplierOption
			For ($_l_Index; 1; Size of array:C274(Prod_at_SupplierOption))
				$_bo_OptionSet:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
				If ($_bo_OptionSet)
					PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_Index}
					$_l_Index:=Size of array:C274(Prod_at_SupplierOption)
				End if 
			End for 
			//Note that in the pref this is stored as a seperate value
			Prod_l_ListedOnly:=DF_l_ListedOnly  //Only allow list suppliers on order
		End if 
		
	End if 
Else 
	[PRODUCTS:9]x_Supplier_Update_Option:47:=0
	OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; False:C215)
	OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
	OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; False:C215)
End if 
//``
If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)
	
	r6:=Num:C11([PRODUCTS:9]Maintain_Stock:14)
	r7:=Num:C11([PRODUCTS:9]Serial_Numbered:17)
	OBJECT SET VISIBLE:C603(r6; True:C214)
	OBJECT SET VISIBLE:C603(r7; True:C214)
	
	$_bo_Visible:=(r6=1)
	OBJECT SET VISIBLE:C603(*; "oStockAccountLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMinStockLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMinStockField"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMaxStockField"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMaxStockLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(STK_lb_SalesStats; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockTurnsGroupBox"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcType"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockTurnstypeLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockDetailLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcDetail"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OreportPeriodLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcPeriod"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFilterDate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFilterDateEnd"; False:C215)
	
	//``
	ARRAY TEXT:C222(STK_at_HistoryTypes; 3)
	
	STK_at_HistoryTypes{1}:="None"
	STK_at_HistoryTypes{2}:="Quantities Sold"
	STK_at_HistoryTypes{3}:="Average Quantities"
	STK_at_HistoryTypes:=0
	ARRAY TEXT:C222(STK_at_DetailTypes; 0)
	ARRAY TEXT:C222(STK_at_FilterBy; 0)
	
	ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
	ARRAY TEXT:C222(STK_at_DatesRange; 0)
	ARRAY REAL:C219(STK_ar_Quantity; 0)
	STK_d_FilterDateStart:=!00-00-00!
	STK_d_FilterDateEnd:=!00-00-00!
	
	LB_SetupListbox(->STK_lb_SalesStats; "Stock"; "STK_L"; 1; ->STK_at_DatesRange; ->STK_ar_Quantity; ->STK_ad_Date)
	
	
	LB_SetColumnHeaders(->STK_lb_SalesStats; "STK_L"; 1; "Dates"; "Quantity"; "")
	
	LB_SetColumnWidths(->STK_lb_SalesStats; "Stock"; 1; 95; 45; 0)
	
	
	LB_SetScroll(->STK_lb_SalesStats; -2; -3)
	
	LB_StyleSettings(->STK_lb_SalesStats; "blue"; 9; "Stock"; ->[PRODUCTS:9])
	LB_SetScroll(->STK_lb_SalesStats; -2; -2)
	LB_SetEnterable(->STK_lb_SalesStats; False:C215; 0)
	LB_SetFormat(->STK_lb_SalesStats; 2; "#######0.000;-#######0.000;"; 2; 2; Align center:K42:3)
	//````
	If ([PRODUCTS:9]Product_Code:1#"")
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#"")
		CREATE SET:C116([ORDER_ITEMS:25]; "ProductSales")
		PRD_R_TotalQuantitySold:=Sum:C1([ORDER_ITEMS:25]Quantity:3)
		PRD_R_CurrentStockdays:=0
		USE SET:C118("ProductSales")
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
		CREATE SET:C116([ORDERS:24]; "ProductSalesOrders")
		
		
	Else 
		CREATE EMPTY SET:C140([ORDERS:24]; "ProductSalesOrders")
		CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "ProductSales")
		REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
		REDUCE SELECTION:C351([ORDERS:24]; 0)
	End if 
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET TITLE:C194(r6; Term_StoWT("Maintain Stock"))
		OBJECT SET TITLE:C194(r7; Term_StoWT("Serial No Stock"))
		DB_MenuAction("View"; "Current Stock"; 1; Term_StoWT("Current Stock"))
		DB_MenuAction("View"; "Stock Levels"; 1; Term_StoWT("Stock Levels"))
		
	End if 
	
Else 
	//dont change the value of maintain stock-just hide the fields
	$_bo_Visible:=False:C215
	OBJECT SET VISIBLE:C603(r6; False:C215)
	OBJECT SET VISIBLE:C603(r7; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStockAccountLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMinStockLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMinStockField"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMaxStockField"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oMaxStockLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(STK_lb_SalesStats; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockTurnsGroupBox"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcType"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockTurnstypeLabel"; $_bo_Visible)
	OBJECT SET VISIBLE:C603(*; "oStockDetailLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcDetail"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OreportPeriodLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesCalcPeriod"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFilterDate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFilterDateEnd"; False:C215)
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Current Stock"; 3; "")
		DB_MenuAction("View"; "Stock Levels"; 3; "")
	End if 
	
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)<2))
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Sales_Account:7; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Purchase_Account:13; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Analysis_Code:18; False:C215)
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
	
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Serial_Numbered:17; False:C215)
		OBJECT SET ENABLED:C1123(r7; False:C215)
	End if 
	
End if 
If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
	
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Price Table"; 3; "")
	End if 
	//DISABLE MENU ITEM(2049;1)
End if 

ARRAY TEXT:C222(PROD_at_ComponentUnique; 0)

If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1) | (True:C214)
	//NG MAy 2004
	//Code relating to components moved into new method as part of form update
	
	PROD_LoadComponents(True:C214; [PRODUCTS:9]Product_Code:1)
	
	If (DB_t_CurrentFormUsage#"None")
		If ([PRODUCTS:9]Bundle_Assembly:36)
			OBJECT SET TITLE:C194(s1; "Under each product")
			OBJECT SET TITLE:C194(s2; "At the base")
			OBJECT SET ENABLED:C1123(s3; True:C214)
			vTitle4:="Show on SR Forms"
		Else 
			OBJECT SET TITLE:C194(s1; "Assembled item")
			OBJECT SET TITLE:C194(s2; "Components")
			vTitle4:="Purchase Order"
			OBJECT SET ENABLED:C1123(s3; False:C215)
			If ([PRODUCTS:9]Bundle_Show:37=0)
				[PRODUCTS:9]Bundle_Show:37:=1
			End if 
		End if 
		
	End if 
	Case of 
		: ([PRODUCTS:9]Bundle_Show:37=1)
			s1:=1
			s2:=0
			s3:=0
		: ([PRODUCTS:9]Bundle_Show:37=2)
			s1:=0
			s2:=2
			s3:=0
		Else 
			s1:=0
			s2:=0
			s3:=1
	End case 
	WS_S80_aAssMessage:=""
Else 
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))=1) | (True:C214)  //"
		//this is to avoid confusion
		WS_S80_aAssMessage:="Assemblies are available, to gain access you need set up personnel"
	End if 
	
	//NG MAy 2004
	//Code relating to components moved into new method as part of form update
	PROD_LoadComponents(False:C215; [PRODUCTS:9]Product_Code:1)
	
	ARRAY TEXT:C222(PRD_at_ProductsTab; 2)
	
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Components"; 3; "")
		DB_MenuAction("Functions"; "Calc Prices from Components"; 3; "")
		DB_MenuAction("View"; "Trial Assembly - Display"; 3; "")
	End if 
	// DISABLE MENU ITEM(2049;2)
	//  DISABLE MENU ITEM(2050;1)
	// DISABLE MENU ITEM(2049;6)
End if 
If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Subscriptions Setup"; 3; "")
	End if 
	//DISABLE MENU ITEM(2049;8)
End if 

If (([PRODUCTS:9]Price_Per:40<1) & (DB_GetModuleSettingByNUM(1)#5))
	[PRODUCTS:9]Price_Per:40:=1
End if 
vTitle2:=Term_VATWT("Default VAT Code")
vTitle3:="Model"
If (([PRODUCTS:9]Model_Code:5=[PRODUCTS:9]Product_Code:1) & ([PRODUCTS:9]Product_Code:1#""))
	OBJECT SET FONT STYLE:C166(vTitle3; 4)
Else 
	OBJECT SET FONT STYLE:C166(vTitle3; 1)  //Rollo 15/7/2004 – make it bold
End if 

READ ONLY:C145([CONTRACT_RECORD_ANALYSIS:88])  //NG added May 2004
If ((DB_GetModuleSettingByNUM(1))#5)
	QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1)
Else 
	REDUCE SELECTION:C351([CONTRACT_RECORD_ANALYSIS:88]; 0)
End if 

ARRAY TEXT:C222(PROD_at_FurtherCode; 0)
ARRAY TEXT:C222(PROD_at_FurtherAnalysis; 0)
ARRAY BOOLEAN:C223(PROD_abo_FurtherModified; 0)
ARRAY TEXT:C222(PROD_at_FurtherCodeDEL; 0)  //To track any deleted
OBJECT SET VISIBLE:C603(bPROD_l_Furthmodify; True:C214)
OBJECT SET TITLE:C194(bPROD_l_Furthmodify; "Add")
OBJECT SET VISIBLE:C603(bPROD_l_FurthDelete; False:C215)
PROD_l_CurrentFurtherStatus:=0
OBJECT SET VISIBLE:C603(PROD_t_CurFurtherCode; False:C215)
OBJECT SET VISIBLE:C603(PROD_t_curFurtherAnalNM; False:C215)
READ ONLY:C145([CONTRACT_RECORD_ANALYSIS:88])

SELECTION TO ARRAY:C260([CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2; PROD_at_FurtherCode)
ARRAY TEXT:C222(PROD_at_FurtherAnalysis; Size of array:C274(PROD_at_FurtherCode))
ARRAY BOOLEAN:C223(PROD_abo_FurtherModified; Size of array:C274(PROD_at_FurtherCode))
For ($_l_Index; 1; Size of array:C274(PROD_at_FurtherCode))
	QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=PROD_at_FurtherCode{$_l_Index})
	PROD_at_FurtherAnalysis{$_l_Index}:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
End for 
PROD_at_FurtherCode{0}:=""
PROD_at_FurtherAnalysis{0}:=""
PROD_at_FurtherAnalysis:=0
PROD_at_FurtherCode:=0
LB_SetupListbox(->PRD_lb_ProdFurths; "oFurthers"; "PRO_L"; 1; ->PROD_at_FurtherCode; ->PROD_at_FurtherAnalysis; ->PROD_abo_FurtherModified)
OBJECT SET ENTERABLE:C238(PROD_at_FurtherCode; True:C214)
OBJECT SET ENTERABLE:C238(PROD_at_FurtherAnalysis; False:C215)

LB_SetColumnHeaders(->PRD_lb_ProdFurths; "PRO_L"; 1; "Code"; "Name"; "Modified")
//LB_SetColumnWidths (->PRD_lb_ProdFurths;"PRO_l_HED";1;101;80;80)
LB_SetColumnWidths(->PRD_lb_ProdFurths; "oFurthers"; 1; 95; 162; 0)
LB_SetScroll(->PRD_lb_ProdFurths; -3; -2)
LB_StyleSettings(->PRD_lb_ProdFurths; "Black"; 9; "oFurthers"; ->[PRODUCTS:9])
LBI_Scrollonresize(->PRD_lb_ProdFurths)
vButtDisPro:="I    O   SSSRCADT"
If (DB_t_CurrentFormUsage#"None")
	Input_Buttons(->[PRODUCTS:9]; ->vButtDisPro; "Product"; "Supplier")
End if 
CAT_LoadPrefs
PROD_LoadCats([PRODUCTS:9]X_ID:43)

Prod_LoadGraphic([PRODUCTS:9]X_ID:43; 0)
ARRAY TEXT:C222(PRD_at_WebLinks; 0)
ARRAY TEXT:C222(CO_at_SearchOptions; 0)
ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
CO_LoadWebsearchPrefs(True:C214; Table:C252(->[PRODUCTS:9]))
If ([PRODUCTS:9]Product_Code:1#"")
	QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
	QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1)
Else 
	REDUCE SELECTION:C351([X_URL_LInks:101]; 0)
End if 
SELECTION TO ARRAY:C260([X_URL_LInks:101]URL:3; PRD_at_UrlLinks)
For ($_l_Index; 1; Size of array:C274(CO_at_SearchOptions))
	APPEND TO ARRAY:C911(PRD_at_WebLinks; CO_at_SearchOptions{$_l_Index})
End for 
If (Size of array:C274(PRD_at_UrlLinks)>0)
	APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
	For ($_l_Index; 1; Size of array:C274(PRD_at_UrlLinks))
		APPEND TO ARRAY:C911(PRD_at_WebLinks; PRD_at_UrlLinks{$_l_Index})
	End for 
End if 
PRD_l_SelectedURLRef:=0
APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
APPEND TO ARRAY:C911(PRD_at_WebLinks; "Open Selected URL")
APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Selected URL")
APPEND TO ARRAY:C911(PRD_at_WebLinks; "Add URL")
APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Websearch Settings")

Macro_AccType("Load "+String:C10(Table:C252(->[PRODUCTS:9])))
$_l_CustomFieldsExist:=FUR_FIELDSLOAD(->[PRODUCTS:9])
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "PRD_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "PRD_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")  //
PRD_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
PRD_bo_FurtherFieldsLoaded:=($_l_CustomFieldsExist=0)

PRD_Contexts([PRODUCTS:9]Maintain_Stock:14)
ERR_MethodTrackerReturn("PRD_inonloadrecord"; $_t_oldMethodName)
