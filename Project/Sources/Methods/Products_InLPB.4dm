//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products_InLPB`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	ARRAY LONGINT:C221($_al_SortOrder; 0)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	ARRAY TEXT:C222($_at_BrandCodes; 0)
	ARRAY TEXT:C222($_at_GroupCodes; 0)
	ARRAY TEXT:C222($_at_Groupodes; 0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	//ARRAY TEXT(PROD_at_FurtherCodeDEL;0)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_BOOLEAN:C305(<>RemNotProd; $_bo_BrandFound; $_bo_GroupFound; $_bo_ProductGraphicLoaded; $_bo_UpdateOption; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem)
	C_LONGINT:C283($_l_FindBrand; $_l_FindGroup; $_l_Index; $_l_PicMonitorProc; $_l_UpdateOption; bPROD_l_FurthDelete; bPROD_l_Furthmodify; DF_l_ListedOnly; DF_l_SupplierOption; PRO_l_BUT1; PRO_l_But2)
	C_LONGINT:C283(PRO_l_BUT3; PRO_l_BUT4; PRO_l_BUT5; PRO_l_BUT6; PRO_l_BUT7; PRO_l_BUT8; PRO_l_BUT9; PROD_l_CurrentFurtherStatus; Prod_l_ListedOnly; r6; r7)
	C_LONGINT:C283(s1; s2; s3; vPT; vStockLevel; vStockUA)
	C_PICTURE:C286($_pic_Nul; PRD_Pic_Graphic)
	C_POINTER:C301(PROD_P_ItemProdCodeField)
	C_REAL:C285(PROD_R_SupplierPrice; vStockVal; vStockValUA)
	C_TEXT:C284(<>ProdCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_Methodname; oFurthers_COL1; oFurthers_COL2; oFurthers_COL3; oFurthers_COL4)
	C_TEXT:C284(oFurthers_COL5; oFurthers_COL6; oFurthers_COL7; oFurthers_COL8; oFurthers_COL9; oFurthers_HED1; oFurthers_HED2; oFurthers_HED3; oFurthers_HED4; oFurthers_HED5; oFurthers_HED6)
	C_TEXT:C284(oFurthers_HED7; oFurthers_HED8; oFurthers_HED9; PRD_t_Title3a; PROD_T_CompanyName; PROD_t_curFurtherAnalNM; PROD_t_CurFurtherCode; PROD_t_Currency; PROD_t_SupplierCode; PROD_t_SupplierOption; vButtDisPro)
	C_TEXT:C284(vPAccount; vSAccount; vTitle2; vTitle3; vTitle4; WS_S80_aAssMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPB")
DB_t_Methodname:=Current method name:C684
//Products_InLPB
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
If ([PRODUCTS:9]Product_Code:1="")
	If (([PRODUCTS:9]Export:22="") & (<>RemNotProd))
		[PRODUCTS:9]Export:22:="No"
	End if 
Else 
	[PRODUCTS:9]Product_Code:1:=Uppercase:C13([PRODUCTS:9]Product_Code:1)
	If ([PRODUCTS:9]Model_Code:5="")
		[PRODUCTS:9]Model_Code:5:=[PRODUCTS:9]Product_Code:1
	End if 
End if 
<>ProdCode:=[PRODUCTS:9]Product_Code:1
If ([PRODUCTS:9]Sales_Account:7#"")
	RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
	vSAccount:=[ACCOUNTS:32]Account_Name:3
Else 
	vSAccount:=""
End if 
If ([PRODUCTS:9]Purchase_Account:13#"")
	RELATE ONE:C42([PRODUCTS:9]Purchase_Account:13)
	vPAccount:=[ACCOUNTS:32]Account_Name:3
Else 
	vPAccount:=""
End if 
ARRAY TEXT:C222(Prod_at_SupplierOption; 3)
Prod_at_SupplierOption{1}:="Auto add suppliers to list"
Prod_at_SupplierOption{2}:="Ask to add suppliers to list"
Prod_at_SupplierOption{3}:="Do not add suppliers to list"
If ([PRODUCTS:9]Price_Updates:25)
	OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; True:C214)
	If (Not:C34(Read only state:C362([PRODUCTS:9])))  //if read write
		
		OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
	End if 
	If ([PRODUCTS:9]x_Supplier_Update_Option:47#0)
		For ($_l_Index; 1; Size of array:C274(Prod_at_SupplierOption))
			$_bo_UpdateOption:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
			If ($_bo_UpdateOption)
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
				$_bo_UpdateOption:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
				If ($_bo_UpdateOption)
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

//If ([PRODUCTS]Analysis Code#"")
// RELATE ONE([PRODUCTS]Analysis Code)
//  vAnalysis:=[ANALYSES]Analysis Name
//Else
// vAnalysis:=""
//End if
vPT:=1
If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)
	
	//  Stock_Calc
Else 
	OBJECT SET ENABLED:C1123(r6; False:C215)
	OBJECT SET ENABLED:C1123(r7; False:C215)
	OBJECT SET ENTERABLE:C238([PRODUCTS:9]Minimum:11; False:C215)
	OBJECT SET ENTERABLE:C238([PRODUCTS:9]Maximum:12; False:C215)
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Current Stock"; 3; "")
		DB_MenuAction("View"; "Stock Levels"; 3; "")
	End if 
	//DISABLE MENU ITEM(2049;4)
	//DISABLE MENU ITEM(2049;5)
	vStockLevel:=0
	vStockUA:=0
	vStockVal:=0
	vStockValUA:=0
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)<2))
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Sales_Account:7; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Purchase_Account:13; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Analysis_Code:18; False:C215)
	End if 
End if 
If ([PRODUCTS:9]Product_Code:1#"")
	If (DB_t_CurrentFormUsage#"None")
		GOTO OBJECT:C206([PRODUCTS:9]Product_Name:2)
	End if 
	// HIGHLIGHT TEXT([PRODUCTS]Product Name;80;80)
End if 
If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Serial_Numbered:17; False:C215)
	End if 
	
End if 

If (DB_t_CurrentFormUsage#"None")
	OBJECT SET TITLE:C194(r6; Term_StoWT("Maintain Stock"))
	OBJECT SET TITLE:C194(r7; Term_StoWT("Serial No Stock"))
	DB_MenuAction("View"; "Current Stock"; 1; Term_StoWT("Current Stock"))
	DB_MenuAction("View"; "Stock Levels"; 1; Term_StoWT("Stock Levels"))
End if 

If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
	
	If (DB_t_CurrentFormUsage#"None")
		DB_MenuAction("View"; "Price Table"; 3; "")
	End if 
	//DISABLE MENU ITEM(2049;1)
End if 
ARRAY LONGINT:C221(PROD_al_ComponentID; 0)
ARRAY TEXT:C222(PROD_at_ComponentUnique; 0)

If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
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
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))=1)  //
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
r6:=Num:C11([PRODUCTS:9]Maintain_Stock:14)
r7:=Num:C11([PRODUCTS:9]Serial_Numbered:17)
vTitle2:=Term_VATWT("Default VAT Code")
vTitle3:="Model"
PRD_t_Title3a:="Group"
If (([PRODUCTS:9]Model_Code:5=[PRODUCTS:9]Product_Code:1) & ([PRODUCTS:9]Product_Code:1#""))
	OBJECT SET FONT STYLE:C166(vTitle3; 4)
Else 
	OBJECT SET FONT STYLE:C166(vTitle3; 1)  //Rollo 15/7/2004 – make it bold
End if   //NG April 2004 Removed ◊Screen
READ ONLY:C145([CONTRACT_RECORD_ANALYSIS:88])  //NG added May 2004
If ((DB_GetModuleSettingByNUM(1))#5)
	QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1)
Else 
	REDUCE SELECTION:C351([CONTRACT_RECORD_ANALYSIS:88]; 0)
End if 
//NG May 2004 New code to load further analyses to arrays
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
//````````


vButtDisPro:="I    O   SSSRCADT"
If (DB_t_CurrentFormUsage#"None")
	Input_Buttons(->[PRODUCTS:9]; ->vButtDisPro; "Product"; "Supplier")
End if 
FORM GOTO PAGE:C247(PRD_al_ProductsTabPage{PRD_at_ProductsTab})  //note in the CATALOGUE version this would differ
CAT_LoadPrefs
PROD_LoadCats([PRODUCTS:9]X_ID:43)
If ([PRODUCTS:9]x_Picture_Exists:53>=0)
	$_bo_ProductGraphicLoaded:=Prod_LoadGraphic([PRODUCTS:9]X_ID:43; 0)
	If (Not:C34($_bo_ProductGraphicLoaded))
		[PRODUCTS:9]x_Picture_Exists:53:=-1
	End if 
Else 
	$_l_PicMonitorProc:=New process:C317("PIC_l_PictureMonitor"; 128000; "CheckForNewPictures"; *)
	PRD_Pic_Graphic:=$_pic_Nul
End if 

Macro_AccType("Load "+String:C10(Table:C252(->[PRODUCTS:9])))

//**************************************** added 02/09/08 -kmw ****************************************
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
					
					If (Length:C16([PRODUCTS:9]Model_Code:5)>=3)
						//see if the first part of the new product code (or if we already found a match on the group code then this will be checking the second part of the new code) matches and brand codes....if so cut it off from front of model code and move it into group code....otherwise ensure group code is currently empty (which it should be anyway)
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
						
					End if 
					[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
				End if 
			: (DB_Get_ProductBrandPref)
				
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
						
						If ([ORDER_ITEMS:25]Cost_Price:5#0)
							[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[ORDER_ITEMS:25]Cost_Price:5
						End if 
						DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
						//******************************************** `added -kmw 10/10/08 v631b120 ********************************************
						//(Set these values in case simplified product entryscreen is used...no harm if not...fixes issue where although product supplier subrecord added it wasn't shown on simplified screen)
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
						[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
						[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
						[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_ORDERS:57]Company_Code:1
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
//********************************************************************************************************
ERR_MethodTrackerReturn("Products_InLPB"; $_t_oldMethodName)
