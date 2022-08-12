//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_InLPB_new
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      28/11/2010 21:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	//ARRAY TEXT(PROD_at_FurtherCodeDEL;0)
	C_BOOLEAN:C305(<>RemNotProd)
	C_LONGINT:C283($_l_Index; bPROD_l_FurthDelete; bPROD_l_Furthmodify; PROD_l_CurrentFurtherStatus; r6; r7; s1; s2; s3; vPT; vStockLevel)
	C_LONGINT:C283(vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284(<>ProdCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PRD_t_Title3a; PROD_t_curFurtherAnalNM; PROD_t_CurFurtherCode; PROD_t_Currency; vButtDisPro)
	C_TEXT:C284(vPAccount; vSAccount; vTitle2; vTitle3; vTitle4; WS_S80_aAssMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPB_new")
//Products_InLPB
If ([PRODUCTS:9]Product_Code:1="")
	If (([PRODUCTS:9]Export:22="") & (<>RemNotProd))
		[PRODUCTS:9]Export:22:="No"
	End if 
Else 
	[PRODUCTS:9]Product_Code:1:=Uppercase:C13([PRODUCTS:9]Product_Code:1)
End if 
<>ProdCode:=[PRODUCTS:9]Product_Code:1
If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
	READ ONLY:C145([CURRENCIES:71])
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
	PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
Else 
	PROD_t_Currency:=<>SYS_t_BaseCurrency
	
End if 

PROD_LoadCats([PRODUCTS:9]X_ID:43)
PROD_LoadFormPrefs
PROD_LoadPriceMatrix([PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Group_Code:3; [PRODUCTS:9]Brand_Code:4)
PROD_LoadCurrentStock([PRODUCTS:9]X_ID:43; [PRODUCTS:9]Product_Code:1)
Prod_LoadGraphic([PRODUCTS:9]X_ID:43; 0)




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
	If (DB_t_CurrentFormUsage#"None")
		OBJECT SET ENABLED:C1123(r6; False:C215)
		OBJECT SET ENABLED:C1123(r7; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Minimum:11; False:C215)
		OBJECT SET ENTERABLE:C238([PRODUCTS:9]Maximum:12; False:C215)
		DB_MenuAction("View"; "Current Stock"; 3; "")
		DB_MenuAction("View"; "Stock Levels"; 3; "")
		
	End if 
	
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
		// HIGHLIGHT TEXT([PRODUCTS]Product Name;80;80)
	End if 
	
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

ARRAY TEXT:C222(PROD_at_ComponentUnique; 0)
ARRAY LONGINT:C221(PROD_al_ComponentID; 0)
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
	DB_MenuAction("View"; "Subscriptions Setup"; 3; "")
	//DISABLE MENU ITEM(2049;8)
End if 
If (([PRODUCTS:9]Price_Per:40<1) & (DB_GetModuleSettingByNUM(1)#5))
	[PRODUCTS:9]Price_Per:40:=1
End if 
r6:=Num:C11([PRODUCTS:9]Maintain_Stock:14)
r7:=Num:C11([PRODUCTS:9]Serial_Numbered:17)
vTitle2:=Term VATWT("Default VAT Code")
vTitle3:="Model"
PRD_t_Title3a:="Group"

If (([PRODUCTS:9]Model_Code:5=[PRODUCTS:9]Product_Code:1) & ([PRODUCTS:9]Product_Code:1#""))
	OBJECT SET FONT STYLE:C166(vTitle3; 4)
Else 
	OBJECT SET FONT STYLE:C166(vTitle3; 1)  //Rollo 15/7/2004 - make it bold
End if 
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

vButtDisPro:="I    O   SSSRCADT"
If (DB_t_CurrentFormUsage#"None")
	Input_Buttons(->[PRODUCTS:9]; ->vButtDisPro)
End if 


Macro_AccType("Load "+String:C10(Table:C252(->[PRODUCTS:9])))
ERR_MethodTrackerReturn("Products_InLPB_new"; $_t_oldMethodName)
