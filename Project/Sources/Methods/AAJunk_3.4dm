//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJunk_3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_Allocations;0)
	//ARRAY LONGINT(ORD_al_StockNo;0)
	//ARRAY REAL(ORDI_ar_StockPrice;0)
	//ARRAY REAL(ORDI_ar_StockQty;0)
	//ARRAY TEXT(OI_at_OrderItemsSubTypes;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORD_at_SerialNo;0)
	//ARRAY TEXT(ORDI_at_StockTypes;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>TermInv; <>TermST; $_bo_ShowSerial; ORDI_bo_FurtherFieldsLoaded)
	C_DATE:C307($2)
	C_LONGINT:C283($_l_FurtherFieldsExist; $_l_Index; $_l_NewLeft; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProductEntryClass; $_l_TabRow; $_l_TextLength; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; $4; ALOa_l_BUT1; ALOa_l_BUT2; ALOa_l_BUT3; ALOa_l_BUT5; ALOa_l_BUT6; ALOa_l_BUT7)
	C_LONGINT:C283(ALOa_l_BUT8; ALOa_l_BUT9; ALODa_l_BUT4; OI_l_OrderItemClass; ORDI_at_ViewTabsLabelsOLD; ORDI_l_FurtherFieldsMod; ORDI_l_Textlength)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; oAloc_COL1; oAloc_COL2; oAloc_COL3; oAloc_COL4; oAloc_COL5; oAloc_COL6)
	C_TEXT:C284(oAloc_COL7; oAloc_COL8; oAloc_COL9; oAloc_HED1; oAloc_HED2; oAloc_HED3; oAloc_HED4; oAloc_HED5; oAloc_HED6; oAloc_HED7; oAloc_HED8)
	C_TEXT:C284(oAloc_HED9; SYS_t_AccessType; vButtDisOI; vCompNameA; vTelA; vTitle3; vVATTitleF)
	C_TIME:C306($0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_InLPB")
//OrderI_InLPB
ARRAY TEXT:C222(ORDI_at_StockTypes; 0)
ARRAY REAL:C219(ORDI_ar_StockQty; 0)
ARRAY REAL:C219(ORDI_ar_StockPrice; 0)
ARRAY LONGINT:C221(ORD_al_StockNo; 0)
ARRAY TEXT:C222(ORD_at_SerialNo; 0)
If (SYS_t_AccessType#"Q") | (True:C214)
	RELATE ONE:C42([ORDER_ITEMS:25]Supplier_Code:20)
	vCompNameA:=[COMPANIES:2]Company_Name:2
	vTelA:=[COMPANIES:2]Telephone:9
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[ORDER_ITEMS:25]Item_Number:27)
	SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; ORDI_at_StockTypes; [CURRENT_STOCK:62]Quantity:4; ORDI_ar_StockQty; [CURRENT_STOCK:62]Cost_Price:6; ORDI_ar_StockPrice; [CURRENT_STOCK:62]Stock_Number:7; ORD_al_StockNo; [CURRENT_STOCK:62]Serial_Number:2; ORD_at_SerialNo)
	
End if 
$_bo_ShowSerial:=False:C215
For ($_l_Index; 1; Size of array:C274(ORD_at_SerialNo))
	If (ORD_at_SerialNo{$_l_Index}#"")
		$_bo_ShowSerial:=True:C214
	End if 
End for 

LB_SetupListbox(->ORD_lb_Allocations; "oAloc"; "ORDa_L"; 1; ->ORD_at_SerialNo; ->ORDI_at_StockTypes; ->ORDI_ar_StockQty; ->ORDI_ar_StockPrice; ->ORD_al_StockNo)

LB_SetColumnHeaders(->ORD_lb_Allocations; "ORDa_L"; 1; "Seral Nos"; "Type"; "Quantity"; "Price"; "Stock No")
If ($_bo_ShowSerial)
	LB_SetColumnWidths(->ORD_lb_Allocations; "oAloc"; 1; 128; 40; 66; 66; 73)
	
Else 
	LB_SetColumnWidths(->ORD_lb_Allocations; "oAloc"; 1; 0; 40; 66; 66; 73)
	
End if 
LB_SetEnterable(->ORD_lb_Allocations; False:C215; 0)

LB_SetScroll(->ORD_lb_Allocations; -3; -2)

LB_StyleSettings(->ORD_lb_Allocations; "Light Grey "; 9; "oAuths"; ->[ORDERS:24])
If ([ORDER_ITEMS:25]Order_Code:1#[ORDERS:24]Order_Code:3)
	If (([ORDERS:24]Order_Code:3#"") & ([ORDER_ITEMS:25]Order_Code:1=""))
		//  [ORDER ITEMS]Order Code:=[ORDERS]Order Code
	Else 
		RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		States_CUArr(->[ORDERS:24]State:15)
	End if 
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[ORDER_ITEMS:25])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")
ORDI_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
ORDI_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!

ORDERITEM_Contexts
OI_l_OrderItemClass:=0
$_l_ProductEntryClass:=0
If ([ORDER_ITEMS:25]Product_Code:2#"")
	If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
		$_l_ProductEntryClass:=[PRODUCTS:9]x_Product_Entry_Class:55
	End if 
End if 
ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 0)

Case of 
	: ($_l_ProductEntryClass=4)
		OI_l_OrderItemClass:=1
		ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 3)
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
		
	: ($_l_ProductEntryClass=5)
	: ([ORDER_ITEMS:25]Invoice_Number:17="SUBS")
		OI_l_OrderItemClass:=1
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
	: ([PRODUCTS:9]Issues_Number:27>0)
		OI_l_OrderItemClass:=1
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
		
End case 




If (ORDI_at_ViewTabsLabelsOLD>0)
	ORDI_at_ViewTabsLabels:=ORDI_at_ViewTabsLabelsOLD
End if 
If (ORDI_at_ViewTabsLabels=0)
	ORDI_at_ViewTabsLabels:=1
	ORDI_at_ViewTabsLabelsOLD:=0
End if 

//On this form the tabs will be included at the top..
//So....reset this first because otherwize it will get bigger and bigger!!!
OI_at_OrderItemTabs{1}:="Pricing  "
OI_at_OrderItemTabs{2}:="Delivery "
OI_at_OrderItemTabs:=1
$_l_TextLength:=Length:C16("Pricing")
$_l_TextLength:=$_l_TextLength+Length:C16("Delivery")
For ($_l_Index; 1; Size of array:C274(ORDI_at_ViewTabsLabels))
	$_l_TabRow:=Find in array:C230(OI_at_OrderItemTabs; ORDI_at_ViewTabsLabels{$_l_Index})
	$_l_TextLength:=$_l_TextLength+Length:C16(ORDI_at_ViewTabsLabels{$_l_Index})
	If ($_l_TabRow<0)
		
		APPEND TO ARRAY:C911(OI_at_OrderItemTabs; ORDI_at_ViewTabsLabels{$_l_Index})
	Else 
	End if 
End for 
ORDI_l_Textlength:=$_l_TextLength
//so here is why we gather the length
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
OBJECT GET COORDINATES:C663(*; "oOrderItemsTab"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_NewLeft:=Int:C8($_l_WindowWidth-($_l_TextLength*8.5))

//MOVE OBJECT(*;"oOrderItemsTab";$_l_NewLeft;$_l_ObjectTop;($_l_WindowWidth);$_l_ObjectBottom;*)



If (<>TermST)
	vVATTitleF:=Term_VATWT("VAT")
Else 
	vVATTitleF:="VAT"
End if 
If (DB_t_CurrentFormUsage#"None")
	vButtDisOI:="II  MO  FSSSRCADT"
	Input_Buttons(->[ORDER_ITEMS:25]; ->vButtDisOI)
	
End if 
If (<>TermInv)
	vTitle3:=Term_StoWT("Stock Allocations ...")
	DB_MenuAction("Functions"; "Stock Allocation"; 1; Term_StoWT("Stock Allocation"))
	DB_MenuAction("Functions"; "Stock Levels"; 1; Term_StoWT("Stock Levels"))
	// SET MENU ITEM(2049;1;Term_StoWT ("Stock Allocation"))
	//  SET MENU ITEM(2049;2;Term_StoWT ("Stock Levels"))
	
Else 
	vTitle3:="Stock Allocations ..."
End if 
If (DB_t_CurrentFormUsage#"None")
	If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
		DB_MenuAction("Functions"; "Stock Levels"; 3; "")
		DB_MenuAction("Functions"; "Stock Allocation"; 3; "")
		//  DISABLE MENU ITEM(2049;1)
		//DISABLE MENU ITEM(2049;2)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
		DB_MenuAction("Functions"; "Trial Assembly - Display"; 3; "")
		// DISABLE MENU ITEM(2049;3)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Component_Level:47; False:C215)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Level_Up_Item_Number:48; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)
		DB_MenuAction("Functions"; "Subscription Details"; 3; "")
		// DISABLE MENU ITEM(2049;5)
	End if 
	If ((DB_GetModuleSettingByNUM(1))=5)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Price_Per:50; False:C215)
	End if 
	GOTO OBJECT:C206([ORDER_ITEMS:25]Product_Name:13)
	QV_UpdateQualsPallette(1; Table:C252(->[ORDER_ITEMS:25]); [ORDER_ITEMS:25]x_ID:58)
	ORDI_LoadSubArea
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[ORDER_ITEMS:25])))


//HIGHLIGHT TEXT([ORDER ITEMS]Product Name;32000;32000)
ERR_MethodTrackerReturn("OrderI_InLPB"; $_t_oldMethodName)