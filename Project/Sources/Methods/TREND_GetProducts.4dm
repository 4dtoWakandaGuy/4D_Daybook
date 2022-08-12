//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_GetProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_RecordSeen; 0)
	//ARRAY LONGINT(PRD_al_AllocQTY;0)
	//ARRAY LONGINT(PRD_al_BOQty;0)
	//ARRAY LONGINT(PRD_al_PhyiscalQTY;0)
	//ARRAY REAL(PRD_ar_AvSalesValue;0)
	//ARRAY REAL(PRD_ar_BufferWeeks;0)
	//ARRAY REAL(PRD_ar_CurrentCost;0)
	//ARRAY REAL(PRD_ar_LeadTime;0)
	//ARRAY REAL(PRD_ar_M10Usage;0)
	//ARRAY REAL(PRD_ar_M11Usage;0)
	//ARRAY REAL(PRD_ar_M12Usage;0)
	//ARRAY REAL(PRD_ar_M1Usage;0)
	//ARRAY REAL(PRD_ar_M2Usage;0)
	//ARRAY REAL(PRD_ar_M3Usage;0)
	//ARRAY REAL(PRD_ar_M4Usage;0)
	//ARRAY REAL(PRD_ar_M5Usage;0)
	//ARRAY REAL(PRD_ar_M6Usage;0)
	//ARRAY REAL(PRD_ar_M7Usage;0)
	//ARRAY REAL(PRD_ar_M8Usage;0)
	//ARRAY REAL(PRD_ar_M9Usage;0)
	//ARRAY REAL(PRD_ar_MinOrdQ;0)
	//ARRAY REAL(PRD_ar_OnOrderQTY;0)
	//ARRAY REAL(PRD_ar_ProdWeight;0)
	//ARRAY REAL(PRD_ar_ShelfLife;0)
	//ARRAY REAL(PRD_ar_StdCode;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(aS_dodW;0)
	//ARRAY TEXT(PRD_ar_ListPrice;0)
	//ARRAY TEXT(PRD_at_AbcCat;0)
	//ARRAY TEXT(PRD_at_Analysis_A;0)
	//ARRAY TEXT(PRD_at_Barcode;0)
	//ARRAY TEXT(PRD_at_BufferWeeks;0)
	//ARRAY TEXT(PRD_at_Discount;0)
	//ARRAY TEXT(PRD_at_LaunchYear;0)
	//ARRAY TEXT(PRD_at_Location;0)
	//ARRAY TEXT(PRD_at_MakeOrBy;0)
	//ARRAY TEXT(PRD_at_NettWeight;0)
	//ARRAY TEXT(PRD_at_Packaging;0)
	//ARRAY TEXT(PRD_at_PackType;0)
	//ARRAY TEXT(PRD_at_ProductCode;0)
	//ARRAY TEXT(PRD_at_ProductDescription;0)
	//ARRAY TEXT(PRD_at_ProductGroup;0)
	//ARRAY TEXT(PRD_at_Status;0)
	//ARRAY TEXT(PRD_at_SubGroup;0)
	//ARRAY TEXT(PRD_at_Supplier;0)
	//ARRAY TEXT(PRD_at_UnitLength;0)
	//ARRAY TEXT(PRD_at_VAt;0)
	//ARRAY TEXT(PRD_at_Warehouse;0)
	//ARRAY TEXT(RD_at_ProductGroup;0)
	C_BOOLEAN:C305($_bo_RecordModified; $_bo_SUpplierModified)
	C_LONGINT:C283($_l_BaseNumber; $_l_CheckRecords; $_l_Current; $_l_Output; $_l_RangeNumber; $_l_Ref; I; PRD_l_AllocQTY; PRD_l_AvailableQTY; PRD_l_BOQty; PRD_l_PhyiscalQTY)
	C_OBJECT:C1216($_obj_NoReplacements)
	C_REAL:C285($_r_Discount; $_r_NettWeight; PRD_r_AvSalesValue; PRD_r_MonthUsage; PRD_r_OnOrderQTY; PRD_r_ShelfLife)
	C_TEXT:C284($_t_FullProductCode; $_t_Month; $_t_oldMethodName; $_t_SQL; $_t_Tab; $_t_VatType; PRD_t_ABCCat; PRD_t_MB; PRD_t_NewFlag; PRD_t_PackType; PRD_t_PackType2)
	C_TEXT:C284(PRD_t_PackType3; PRD_t_ProductStatus)
	C_TIME:C306($_ti_Output)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_GetProducts")
ARRAY TEXT:C222(PRD_at_PackType; 0)
ARRAY TEXT:C222(PRD_at_Warehouse; 0)
ARRAY TEXT:C222(PRD_at_ProductCode; 0)
ARRAY TEXT:C222(PRD_at_ProductDescription; 0)
ARRAY TEXT:C222(PRD_at_ProductGroup; 0)
ARRAY TEXT:C222(PRD_at_Barcode; 0)
ARRAY REAL:C219(PRD_ar_ListPrice; 0)
ARRAY TEXT:C222(PRD_at_Discount; 0)
ARRAY TEXT:C222(PRD_at_Status; 0)
ARRAY TEXT:C222(PRD_at_VAt; 0)
ARRAY TEXT:C222(PRD_at_LaunchYear; 0)
ARRAY TEXT:C222(PRD_at_UnitLength; 0)
//
ARRAY REAL:C219(PRD_ar_AvSalesValue; 0)
ARRAY REAL:C219(PRD_ar_ProdWeight; 0)
ARRAY TEXT:C222(PRD_at_NettWeight; 0)
ARRAY TEXT:C222(PRD_at_Packaging; 0)
ARRAY TEXT:C222(PRD_at_Location; 0)
ARRAY LONGINT:C221(PRD_al_PhyiscalQTY; 0)
ARRAY LONGINT:C221(PRD_al_AllocQTY; 0)
ARRAY LONGINT:C221(PRD_al_BOQty; 0)
ARRAY REAL:C219(PRD_ar_CurrentCost; 0)
ARRAY REAL:C219(PRD_ar_StdCode; 0)
ARRAY REAL:C219(PRD_ar_BufferWeeks; 0)
ARRAY REAL:C219(PRD_ar_LeadTime; 0)
ARRAY REAL:C219(PRD_ar_ShelfLife; 0)
ARRAY REAL:C219(PRD_ar_MinOrdQ; 0)
ARRAY TEXT:C222(PRD_at_MakeOrBy; 0)
ARRAY REAL:C219(PRD_ar_OnOrderQTY; 0)
ARRAY TEXT:C222(PRD_at_Supplier; 0)
ARRAY REAL:C219(PRD_ar_M1Usage; 0)
ARRAY REAL:C219(PRD_ar_M2Usage; 0)
ARRAY REAL:C219(PRD_ar_M3Usage; 0)
ARRAY REAL:C219(PRD_ar_M4Usage; 0)
ARRAY REAL:C219(PRD_ar_M5Usage; 0)
ARRAY REAL:C219(PRD_ar_M6Usage; 0)
ARRAY REAL:C219(PRD_ar_M7Usage; 0)
ARRAY REAL:C219(PRD_ar_M8Usage; 0)
ARRAY REAL:C219(PRD_ar_M9Usage; 0)
ARRAY REAL:C219(PRD_ar_M10Usage; 0)
ARRAY REAL:C219(PRD_ar_M11Usage; 0)
ARRAY REAL:C219(PRD_ar_M12Usage; 0)
ARRAY TEXT:C222(PRD_at_SubGroup; 0)
ARRAY TEXT:C222(PRD_at_ABCCat; 0)


///PRD_at_PackType;->PRD_at_Warehouse;->PRD_at_ProductCode;->PRD_at_ProductDescription;->PRD_at_ProductGroup;->PRD_at_Barcode;->PRD_ar_ListPrice;->PRD_at_Discount;->PRD_at_Status;-PRD_at_VAt
$_t_SQL:="select "
$_t_SQL:=$_t_SQL+"despatch_units,"  //PRD_at_PackType//[Products]Label(Pack type)
$_t_SQL:=$_t_SQL+"warehouse,"  //;PRD_at_Warehouse//[Products]Warehouse
$_t_SQL:=$_t_SQL+"product,"  //;PRD_at_ProductCode//[Products]Part_No
//TREND_SQL_GetDataToArrays ("StockUpdate";$_obj_NoReplacements;->PRD_at_PackType;->PRD_at_Warehouse;->PRD_at_ProductCode;->PRD_at_ProductDescription;->PRD_at_ProductGroup;->PRD_at_Barcode;->PRD_ar_ListPrice;->PRD_at_Discount;->PRD_at_Status;->PRD_at_VAt;->PRD_at_LaunchYear;->PRD_at_UnitLength;->PRD_ar_AvSalesValue;->PRD_ar_ProdWeight;->PRD_at_NettWeight;->PRD_at_Packaging;->PRD_at_Location;->PRD_al_PhyiscalQTY;->PRD_al_AllocQTY;->PRD_al_BOQty;->PRD_ar_CurrentCost;->PRD_ar_StdCode;->PRD_ar_BufferWeeks;->PRD_ar_LeadTime;->PRD_ar_ShelfLife;->PRD_ar_MinOrdQ;->PRD_at_MakeOrBy;->PRD_ar_OnOrderQTY;->PRD_at_Supplier;->PRD_ar_M1Usage;->PRD_ar_M2Usage;->PRD_ar_M3Usage;->PRD_ar_M4Usage;->PRD_ar_M5Usage;->PRD_ar_M6Usage;->PRD_ar_M7Usage;->PRD_ar_M8Usage;->PRD_ar_M9Usage;->PRD_ar_M10Usage;->PRD_ar_M11Usage;->PRD_ar_M12Usage;->PRD_at_SubGroup;->PRD_at_ABCCat)


//$_t_SQL:=$_t_SQL+"warehouse,"  //;PRD_at_Warehouse//[Products]Warehouse
//$_t_SQL:=$_t_SQL+"product,"  //;PRD_at_ProductCode//[Products]Part_No
$_t_SQL:=$_t_SQL+"long_description,"  //PRD_at_ProductDescription//[Products]Description
$_t_SQL:=$_t_SQL+"analysis_a,"  //;PRD_at_ProductGroup//[Products]Group
$_t_SQL:=$_t_SQL+"description,"  //;PRD_at_Barcode//[Products]Barcode
$_t_SQL:=$_t_SQL+"price,"  //;PRD_ar_ListPrice////[Products]List_Price
$_t_SQL:=$_t_SQL+"discount,"  //;PRD_at_Discount//[Products]Discount
$_t_SQL:=$_t_SQL+"unit_height,"  //;PRD_at_Status//[Products]Status
$_t_SQL:=$_t_SQL+"stock_vat_type,"  //;PRD_at_VAt//[Products]VAT

$_t_SQL:=$_t_SQL+"drawing_number,"  //;PRD_at_LaunchYear//[Products]LaunchYear

$_t_SQL:=$_t_SQL+"unit_length,"  //;PRD_at_UnitLength// this is not stored anywhere
$_t_SQL:=$_t_SQL+"average_sales_valu,"  //;PRD_ar_AvSalesValue//[Products]4AU


$_t_SQL:=$_t_SQL+"weight,"  //;PRD_ar_ProdWeight//[Products]Weight
$_t_SQL:=$_t_SQL+"catalogue_number,"  //;PRD_at_NettWeight//[Products]NettWeight-we convert the string to. number(PRD_ar_NettWeight)
$_t_SQL:=$_t_SQL+"analysis_b,"  //;PRD_at_Packaging//[Products]Packaging
$_t_SQL:=$_t_SQL+"analysis_c,"  //;PRD_at_Location//[Products]Bin_Number
$_t_SQL:=$_t_SQL+"physical_qty,"  //;PRD_al_PhyiscalQTY//[Products]Physical
$_t_SQL:=$_t_SQL+"allocated_qty,"  //;PRD_al_AllocQTY//[Products]Alllocated
$_t_SQL:=$_t_SQL+"back_order_qty,"  //;PRD_al_BOQty//[Products]Back_Order
$_t_SQL:=$_t_SQL+"current_cost,"  //--PRD_ar_CurrentCost we use this to calculate aR_dodT and store that in [Products]Total_Value

$_t_SQL:=$_t_SQL+"standard_cost,"  //--PRD_ar_StdCode..[Products]CS3_Cost_Standard
$_t_SQL:=$_t_SQL+"min_stock_level,"  //PRD_ar_BufferWeeks//[Products]BufferWeeks
$_t_SQL:=$_t_SQL+"lead_time,"  //;PRD_ar_LeadTime//[Products]LeadWeeks
$_t_SQL:=$_t_SQL+"shelf_life,"  //;PRD_ar_ShelfLife//[Products]ShelfLife
$_t_SQL:=$_t_SQL+"economic_reorder_q,"  //;PRD_ar_MinOrdQ//[Products]Minimum_Order_Qty
$_t_SQL:=$_t_SQL+"make_or_buy,"  //;PRD_at_MakeOrBy//[Products]Make_or_Buy
$_t_SQL:=$_t_SQL+"on_order_qty,"  //;PRD_ar_OnOrderQTY//[Products]On_Po
$_t_SQL:=$_t_SQL+"supplier,"  //;PRD_at_Supplier//[Products]Supplier
$_t_SQL:=$_t_SQL+"period_issue_qty01,"  //;PRD_ar_M1Usage//[Products]Month_Use_1
$_t_SQL:=$_t_SQL+"period_issue_qty02,"  //;PRD_ar_M2Usage//[Products]U2
$_t_SQL:=$_t_SQL+"period_issue_qty03,"  //;PRD_ar_M3Usage//[Products]U3
$_t_SQL:=$_t_SQL+"period_issue_qty04,"  //PRD_ar_M4Usage//[Products]U4
$_t_SQL:=$_t_SQL+"period_issue_qty05,"  //;PRD_ar_M5Usage//[Products]U5
$_t_SQL:=$_t_SQL+"period_issue_qty06,"  //;PRD_ar_M6Usage//[Products]U6
$_t_SQL:=$_t_SQL+"period_issue_qty07,"  //;PRD_ar_M7Usage[Products]U7
$_t_SQL:=$_t_SQL+"period_issue_qty08,"  //;PRD_ar_M8Usage[Products]U8
$_t_SQL:=$_t_SQL+"period_issue_qty09,"  //;PRD_ar_M9Usage//[Products]U9
$_t_SQL:=$_t_SQL+"period_issue_qty10,"  //;PRD_ar_M10Usage[Products]U10
$_t_SQL:=$_t_SQL+"period_issue_qty11,"  //;PRD_ar_M11Usage//[Products]U11
$_t_SQL:=$_t_SQL+"period_issue_qty12,"  //;PRD_ar_M12Usage//[Products]U12
$_t_SQL:=$_t_SQL+"alpha,"  //  //;PRD_at_SubGroup;//[Products]SubGroup3
$_t_SQL:=$_t_SQL+"abc_category"  // PRD_at_ABCCat///[Products]ABC_Category
$_t_SQL:=$_t_SQL+" FROM scheme.stockm"
OB SET:C1220($_obj_NoReplacements; "SQLTEXT"; $_t_SQL)

TREND_SQL_GetDataToArrays("StockUpdate"; $_obj_NoReplacements; ->PRD_at_PackType; ->PRD_at_Warehouse; ->PRD_at_ProductCode; ->PRD_at_ProductDescription; ->PRD_at_ProductGroup; ->PRD_at_Barcode; ->PRD_ar_ListPrice; ->PRD_at_Discount; ->PRD_at_Status; ->PRD_at_VAt; ->PRD_at_LaunchYear; ->PRD_at_UnitLength; ->PRD_ar_AvSalesValue; ->PRD_ar_ProdWeight; ->PRD_at_NettWeight; ->PRD_at_Packaging; ->PRD_at_Location; ->PRD_al_PhyiscalQTY; ->PRD_al_AllocQTY; ->PRD_al_BOQty; ->PRD_ar_CurrentCost; ->PRD_ar_StdCode; ->PRD_ar_BufferWeeks; ->PRD_ar_LeadTime; ->PRD_ar_ShelfLife; ->PRD_ar_MinOrdQ; ->PRD_at_MakeOrBy; ->PRD_ar_OnOrderQTY; ->PRD_at_Supplier; ->PRD_ar_M1Usage; ->PRD_ar_M2Usage; ->PRD_ar_M3Usage; ->PRD_ar_M4Usage; ->PRD_ar_M5Usage; ->PRD_ar_M6Usage; ->PRD_ar_M7Usage; ->PRD_ar_M8Usage; ->PRD_ar_M9Usage; ->PRD_ar_M10Usage; ->PRD_ar_M11Usage; ->PRD_ar_M12Usage; ->PRD_at_SubGroup; ->PRD_at_ABCCat)


$_t_Tab:=Char:C90(9)
If (False:C215)  //just for verification if we need it
	$_ti_Output:=Create document:C266(""; "TEXT")
	For ($_l_Output; 1; Size of array:C274(PRD_at_PackType))
		SEND PACKET:C103($_ti_Output; PRD_at_PackType{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Warehouse{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		
		SEND PACKET:C103($_ti_Output; PRD_at_ProductCode{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_ProductDescription{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_ProductGroup{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Barcode{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_ListPrice{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Discount{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Status{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_VAt{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_LaunchYear{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_UnitLength{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_AvSalesValue{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_ProdWeight{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_NettWeight{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Packaging{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Location{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_al_PhyiscalQTY{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_al_AllocQTY{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_al_BOQty{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_CurrentCost{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_StdCode{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_BufferWeeks{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_LeadTime{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_ShelfLife{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_MinOrdQ{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_MakeOrBy{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_OnOrderQTY{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_Supplier{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M1Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M2Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M3Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M4Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M5Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M6Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M7Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M8Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M9Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M10Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M11Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; String:C10(PRD_ar_M12Usage{$_l_Output}))
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_SubGroup{$_l_Output})
		SEND PACKET:C103($_ti_Output; $_t_Tab)
		SEND PACKET:C103($_ti_Output; PRD_at_ABCCat{$_l_Output})
		SEND PACKET:C103($_ti_Output; Char:C90(13))
		
		
	End for 
	CLOSE DOCUMENT:C267($_ti_Output)
End if 

ALL RECORDS:C47([PRODUCTS:9])
SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
ARRAY BOOLEAN:C223($_aBo_RecordSeen; 0)
ARRAY BOOLEAN:C223($_aBo_RecordSeen; Size of array:C274($_at_ProductCodes))

For ($_l_CheckRecords; 1; Size of array:C274(PRD_at_ProductCode))
	$_t_FullProductCode:=PRD_at_Warehouse{$_l_CheckRecords}+PRD_at_ProductCode{$_l_CheckRecords}
	MESSAGE:C88(String:C10($_l_CheckRecords)+" "+$_t_FullProductCode)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_FullProductCode)
	If (Records in selection:C76([PRODUCTS:9])>0)
		$_l_Ref:=Find in array:C230($_at_ProductCodes; $_t_FullProductCode)
		If ($_l_Ref>0)
			$_aBo_RecordSeen{$_l_Ref}:=True:C214
		Else 
			
		End if 
		
	Else 
		CREATE RECORD:C68([PRODUCTS:9])
		[PRODUCTS:9]Group_Code:3:=PRD_at_ProductGroup{$_l_CheckRecords}
		[PRODUCTS:9]Brand_Code:4:=PRD_at_Warehouse{$_l_CheckRecords}
		[PRODUCTS:9]Model_Code:5:=PRD_at_ProductCode{$_l_CheckRecords}
		[PRODUCTS:9]Product_Code:1:=$_t_FullProductCode
		[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
		
		$_bo_RecordModified:=True:C214
	End if 
	[PRODUCTS:9]Short_Code:19:=[PRODUCTS:9]Model_Code:5
	
	If (PRD_at_Warehouse{$_l_CheckRecords}#"")
		QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=PRD_at_Warehouse{$_l_CheckRecords})
		If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
			CREATE RECORD:C68([PRODUCT_BRANDS:8])
			[PRODUCT_BRANDS:8]Brand_Code:1:=PRD_at_Warehouse{$_l_CheckRecords}
			[PRODUCT_BRANDS:8]Brand_Name:2:=[PRODUCT_BRANDS:8]Brand_Code:1
			[PRODUCT_BRANDS:8]X_ID:4:=AA_GetNextID(->[PRODUCT_BRANDS:8]X_ID:4)
			DB_SaveRecord(->[PRODUCT_BRANDS:8])
		End if 
	Else 
		
	End if 
	If (PRD_at_ProductGroup{$_l_CheckRecords}#"")
		QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=PRD_at_ProductGroup{$_l_CheckRecords})
		If (Records in selection:C76([PRODUCT_GROUPS:10])=0)
			CREATE RECORD:C68([PRODUCT_GROUPS:10])
			[PRODUCT_GROUPS:10]Group_Code:1:=PRD_at_ProductGroup{$_l_CheckRecords}
			[PRODUCT_GROUPS:10]Group_Name:2:=[PRODUCT_GROUPS:10]Group_Name:2
			DB_SaveRecord(->[PRODUCT_GROUPS:10])
			PRD_at_ProductGroup{$_l_CheckRecords}:=[PRODUCT_GROUPS:10]Group_Code:1
		Else 
			PRD_at_ProductGroup{$_l_CheckRecords}:=[PRODUCT_GROUPS:10]Group_Code:1
		End if 
	Else 
		
	End if 
	
	PRD_t_PackType:=FurthFld_Get("Products"; "Packaging Type")
	If (PRD_at_PackType{$_l_CheckRecords}#PRD_t_PackType)
		FurthFld_Set("Products"; "Packaging Type"; PRD_at_PackType{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	//PRD_at_Packaging
	PRD_t_PackType2:=FurthFld_Get("Products"; "Packaging SubGroup 2")
	If (PRD_at_Packaging{$_l_CheckRecords}#PRD_t_PackType2)
		FurthFld_Set("Products"; "Packaging SubGroup 2"; PRD_at_Packaging{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	//PRD_at_SubGroup
	PRD_t_PackType3:=FurthFld_Get("Products"; "Packaging SubGroup 3")
	If (PRD_at_SubGroup{$_l_CheckRecords}#PRD_t_PackType3)
		FurthFld_Set("Products"; "Packaging SubGroup 3"; PRD_at_SubGroup{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Product_Name:2#PRD_at_ProductDescription{$_l_CheckRecords})
		[PRODUCTS:9]Product_Name:2:=PRD_at_ProductDescription{$_l_CheckRecords}
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Product_Barcode:60#PRD_at_Barcode{$_l_CheckRecords})
		[PRODUCTS:9]Product_Barcode:60:=PRD_at_Barcode{$_l_CheckRecords}
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Sales_Price:9#PRD_ar_ListPrice{$_l_CheckRecords})
		[PRODUCTS:9]Sales_Price:9:=PRD_ar_ListPrice{$_l_CheckRecords}
		$_bo_RecordModified:=True:C214
	End if 
	//So on tops we store the discount group for the product. I am note sure how that then gets applied but these are the amounts
	//This is only used to calculate margins based on that discount/
	//does that mean when the product has that group that the product automatically get that disccount
	If (PRD_at_Discount{$_l_CheckRecords}#"")
		Case of 
			: (PRD_at_Discount{$_l_CheckRecords}="SPEC@")
				$_l_BaseNumber:=55
				
			: (PRD_at_Discount{$_l_CheckRecords}="CSB@")
				$_l_BaseNumber:=60
				
			: (PRD_at_Discount{$_l_CheckRecords}="IT@")
				$_l_BaseNumber:=30
				
			: (PRD_at_Discount{$_l_CheckRecords}="25@")
				$_l_BaseNumber:=30
				
			: (PRD_at_Discount{$_l_CheckRecords}="WIND@")
				$_l_BaseNumber:=55
				
			: (PRD_at_Discount{$_l_CheckRecords}="SNAP@")
				$_l_BaseNumber:=35
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 60@")
				$_l_BaseNumber:=60
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 40@")
				$_l_BaseNumber:=40
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 30@")
				$_l_BaseNumber:=30
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 35@")
				$_l_BaseNumber:=35
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 100@")
				$_l_BaseNumber:=100
				
				
				
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 20@")
				$_l_BaseNumber:=20
				
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 15@")
				$_l_BaseNumber:=15
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 25@")
				$_l_BaseNumber:=25
				
			: (PRD_at_Discount{$_l_CheckRecords}="LESS 0@")
				$_l_BaseNumber:=0
				
				
			Else 
				If (Position:C15("%"; PRD_at_Discount{$_l_CheckRecords})>0)
					$_l_BaseNumber:=Num:C11(PRD_at_Discount{$_l_CheckRecords})
				Else 
					If (PRD_at_Discount{$_l_CheckRecords}#"LESS 55A") & (PRD_at_Discount{$_l_CheckRecords}#"LESS 40A") & (PRD_at_Discount{$_l_CheckRecords}#"LESS 50A") & (PRD_at_Discount{$_l_CheckRecords}#"LESS 40M") & (PRD_at_Discount{$_l_CheckRecords}#"LES 375A") & (PRD_at_Discount{$_l_CheckRecords}#"LESS60MJ") & (PRD_at_Discount{$_l_CheckRecords}#"LESS 425A") & (PRD_at_Discount{$_l_CheckRecords}#"LES 425A")
						
						
					End if 
					$_l_BaseNumber:=30
				End if 
		End case 
		
		QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=PRD_at_Discount{$_l_CheckRecords})
		If (Records in selection:C76([PRICE_GROUPS:18])=0)
			CREATE RECORD:C68([PRICE_GROUPS:18])
			[PRICE_GROUPS:18]Price_Code:1:=PRD_at_Discount{$_l_CheckRecords}
			[PRICE_GROUPS:18]Price_Name:2:=PRD_at_Discount{$_l_CheckRecords}
			[PRICE_GROUPS:18]Automatic:5:=True:C214  //i think
			[PRICE_GROUPS:18]Price_Based:3:=False:C215  //these are discount groups
			[PRICE_GROUPS:18]Override:6:=True:C214
			[PRICE_GROUPS:18]PriceGroupClass:9:=3
			DB_SaveRecord(->[PRICE_GROUPS:18])
			
		End if 
		READ WRITE:C146([PRICE_TABLE:28])
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=PRD_at_Discount{$_l_CheckRecords}; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1)
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			CREATE RECORD:C68([PRICE_TABLE:28])
			[PRICE_TABLE:28]Product_Code:1:=[PRODUCTS:9]Product_Code:1
			[PRICE_TABLE:28]Price_Code:2:=PRD_at_Discount{$_l_CheckRecords}
			[PRICE_TABLE:28]Price_Discount:3:=$_l_BaseNumber
			DB_SaveRecord(->[PRICE_TABLE:28])
		Else 
			If ([PRICE_TABLE:28]Price_Discount:3#$_l_BaseNumber)
				[PRICE_TABLE:28]Price_Discount:3:=$_l_BaseNumber
				DB_SaveRecord(->[PRICE_TABLE:28])
			End if 
		End if 
	End if 
	PRD_t_ProductStatus:=FurthFld_Get("Products"; "Stocked Line")
	If (PRD_at_Status{$_l_CheckRecords}#PRD_t_ProductStatus)
		FurthFld_Set("Products"; "Stocked Line"; PRD_at_Status{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	$_t_VatType:=PRD_at_VAt{$_l_CheckRecords}
	If ($_t_VatType="VAT")
		$_t_VatType:="S"
	End if 
	If ($_t_VatType="ZERO")
		$_t_VatType:="Z"
	End if 
	If ([PRODUCTS:9]Default_Tax:23#$_t_VatType)
		[PRODUCTS:9]Default_Tax:23:=$_t_VatType
		$_bo_RecordModified:=True:C214
	End if 
	PRD_t_NewFlag:=FurthFld_Get("Products"; "New Flag")
	If (PRD_at_LaunchYear{$_l_CheckRecords}#PRD_t_NewFlag)
		FurthFld_Set("Products"; "New Flag"; PRD_at_LaunchYear{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Weight:26#PRD_ar_ProdWeight{$_l_CheckRecords})
		[PRODUCTS:9]Weight:26:=PRD_ar_ProdWeight{$_l_CheckRecords}
		$_bo_RecordModified:=True:C214
	End if 
	$_r_NettWeight:=Num:C11(PRD_at_NettWeight{$_l_CheckRecords})
	If ([PRODUCTS:9]Unpackaged_Weight:61#$_r_NettWeight)
		[PRODUCTS:9]Unpackaged_Weight:61:=$_r_NettWeight
		$_bo_RecordModified:=True:C214
	End if 
	If (PRD_at_Location{$_l_CheckRecords}#"")
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Code:1=PRD_at_Location{$_l_CheckRecords})
		If (Records in selection:C76([LOCATIONS:61])=0)
			CREATE RECORD:C68([LOCATIONS:61])
			[LOCATIONS:61]Location_Code:1:=PRD_at_Location{$_l_CheckRecords}
			[LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
			DB_SaveRecord(->[LOCATIONS:61])
			UNLOAD RECORD:C212([LOCATIONS:61])
		End if 
		READ WRITE:C146([x_ProductLocations:185])
		//QUERY([x_ProductLocations];[x_ProductLocations]x_LocationCode=PRD_at_Location{$_l_CheckRecords})
		QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=[PRODUCTS:9]X_ID:43)
		If (Records in selection:C76([x_ProductLocations:185])=0)
			CREATE RECORD:C68([x_ProductLocations:185])
			[x_ProductLocations:185]x_LocationCode:2:=PRD_at_Location{$_l_CheckRecords}
			//[x_ProductLocations]Primary_location:=True
			[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
			DB_SaveRecord(->[x_ProductLocations:185])
			UNLOAD RECORD:C212([x_ProductLocations:185])
		Else 
			QUERY SELECTION:C341([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=PRD_at_Location{$_l_CheckRecords})
			If (Records in selection:C76([x_ProductLocations:185])=0)
				QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=[PRODUCTS:9]X_ID:43)
				[x_ProductLocations:185]x_LocationCode:2:=PRD_at_Location{$_l_CheckRecords}
				[x_ProductLocations:185]Primary_location:5:=True:C214
				DB_SaveRecord(->[x_ProductLocations:185])
			End if 
		End if 
		
	End if 
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1; *)
	QUERY:C277([PRODUCTS_SUPPLIERS:148];  & ; [PRODUCTS_SUPPLIERS:148]Company_Code:1=PRD_at_Supplier{$_l_CheckRecords})
	If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
		CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
		[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
		[PRODUCTS_SUPPLIERS:148]Company_Code:1:=PRD_at_Supplier{$_l_CheckRecords}
		[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=PRD_ar_StdCode{$_l_CheckRecords}
		[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:="£"
		[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
		DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
	End if 
	$_bo_SUpplierModified:=False:C215
	If ([PRODUCTS_SUPPLIERS:148]Standard_Cost:5#PRD_ar_StdCode{$_l_CheckRecords})
		[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=PRD_ar_StdCode{$_l_CheckRecords}
		$_bo_SUpplierModified:=True:C214
	End if 
	If ([PRODUCTS_SUPPLIERS:148]Cost_Price:2#PRD_ar_CurrentCost{$_l_CheckRecords})
		[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=PRD_ar_CurrentCost{$_l_CheckRecords}
		$_bo_SUpplierModified:=True:C214
	End if 
	If ([PRODUCTS_SUPPLIERS:148]Lead_Days:6#PRD_ar_LeadTime{$_l_CheckRecords})
		[PRODUCTS_SUPPLIERS:148]Lead_Days:6:=PRD_ar_LeadTime{$_l_CheckRecords}
		$_bo_SUpplierModified:=True:C214
	End if 
	
	If ([PRODUCTS_SUPPLIERS:148]MinOrderQuantity:11#PRD_ar_MinOrdQ{$_l_CheckRecords})
		[PRODUCTS_SUPPLIERS:148]MinOrderQuantity:11:=PRD_ar_MinOrdQ{$_l_CheckRecords}
		$_bo_SUpplierModified:=True:C214
	End if 
	If ($_bo_SUpplierModified)
		DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
	End if 
	//PRD_at_ABCCat
	PRD_t_ABCCat:=FurthFld_Get("Products"; "ABC Catagory")
	If (PRD_at_ABCCat{$_l_CheckRecords}#PRD_t_ABCCat)
		FurthFld_Set("Products"; "ABC Catagory"; PRD_at_ABCCat{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Minimum:11#PRD_ar_BufferWeeks{$_l_CheckRecords})
		[PRODUCTS:9]Minimum:11:=PRD_ar_BufferWeeks{$_l_CheckRecords}
		$_bo_RecordModified:=True:C214
	End if 
	PRD_t_MB:=FurthFld_Get("Products"; "Make or Buy")
	If (PRD_at_MakeOrBy{$_l_CheckRecords}#PRD_t_MB)
		FurthFld_Set("Products"; "Make or Buy"; PRD_at_MakeOrBy{$_l_CheckRecords})
		$_bo_RecordModified:=True:C214
	End if 
	$_l_Current:=Year of:C25(Current date:C33)
	$_t_Month:=MonthName(Current date:C33; 1)
	
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M1Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M1Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 2)
	
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M2Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M2Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 3)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M3Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M3Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 4)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M4Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M4Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 5)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M5Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M5Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 6)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M6Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M6Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 7)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M7Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M7Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 8)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M8Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M8Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 9)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M9Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M9Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 10)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M10Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M10Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 11)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M11Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M11Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	$_t_Month:=MonthName(Current date:C33; 12)
	PRD_r_MonthUsage:=Num:C11(FurthFld_Get("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); ""; "N"))
	If (PRD_ar_M12Usage{$_l_CheckRecords}#PRD_r_MonthUsage)
		FurthFld_Set("Products"; "Usage "+$_t_Month+" "+String:C10($_l_Current); String:C10(PRD_ar_M12Usage{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	
	
	PRD_r_AvSalesValue:=Num:C11(FurthFld_Get("Products"; "Average Sales Value"; ""; "N"))
	
	If (PRD_ar_AvSalesValue{$_l_CheckRecords}#PRD_r_AvSalesValue)
		FurthFld_Set("Products"; "Average Sales Value"; String:C10(PRD_ar_AvSalesValue{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	
	PRD_l_PhyiscalQTY:=Num:C11(FurthFld_Get("Products"; "Physical Quantity"; ""; "N"))
	
	If (PRD_al_PhyiscalQTY{$_l_CheckRecords}#PRD_l_PhyiscalQTY)
		FurthFld_Set("Products"; "Physical Quantity"; String:C10(PRD_al_PhyiscalQTY{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	PRD_l_AllocQTY:=Num:C11(FurthFld_Get("Products"; "Allocated Quantity"; ""; "N"))
	
	If (PRD_al_AllocQTY{$_l_CheckRecords}#PRD_al_AllocQTY)
		FurthFld_Set("Products"; "Allocated Quantity"; String:C10(PRD_al_AllocQTY{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	PRD_l_AvailableQTY:=Num:C11(FurthFld_Get("Products"; "Available Quantity"; ""; "N"))
	
	If ((PRD_al_PhyiscalQTY{$_l_CheckRecords}-PRD_al_AllocQTY{$_l_CheckRecords})#PRD_al_AllocQTY{$_l_CheckRecords})
		FurthFld_Set("Products"; "Available Quantity"; String:C10((PRD_al_PhyiscalQTY{$_l_CheckRecords}-PRD_al_AllocQTY{$_l_CheckRecords})))
		$_bo_RecordModified:=True:C214
	End if 
	PRD_r_OnOrderQTY:=Num:C11(FurthFld_Get("Products"; "On Order Quantity"; ""; "N"))
	
	If (PRD_al_AllocQTY{$_l_CheckRecords}#PRD_r_OnOrderQTY)
		FurthFld_Set("Products"; "On Order Quantity"; String:C10(PRD_ar_OnOrderQTY{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	PRD_l_BOQty:=Num:C11(FurthFld_Get("Products"; "Back Order Quantity"; ""; "N"))
	
	If (PRD_al_BOQty{$_l_CheckRecords}#PRD_l_BOQty)
		FurthFld_Set("Products"; "Back Order Quantity"; String:C10(PRD_al_BOQty{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	
	PRD_r_ShelfLife:=Num:C11(FurthFld_Get("Products"; "Shelf Life"; ""; "N"))
	
	
	If (PRD_ar_ShelfLife{$_l_CheckRecords}#PRD_r_ShelfLife)
		FurthFld_Set("Products"; "Shelf Life"; String:C10(PRD_ar_ShelfLife{$_l_CheckRecords}))
		$_bo_RecordModified:=True:C214
	End if 
	If ([PRODUCTS:9]Group_Code:3="DISCONT")
		PRD_l_AvailableQTY:=Num:C11(FurthFld_Get("Products"; "Available Quantity"; ""; "N"))
		
		If (PRD_l_AvailableQTY=0)
			If ([PRODUCTS:9]x_Product_No_longer_Available:54>=0)
				[PRODUCTS:9]x_Product_No_longer_Available:54:=-1
				$_bo_RecordModified:=True:C214
			End if 
		End if 
	End if 
	If ($_bo_RecordModified)
		DB_SaveRecord(->[PRODUCTS:9])
	End if 
	$_bo_RecordModified:=False:C215
End for 
//$_t_SQL:=$_t_SQL+"average_sales_valu,"  //;PRD_ar_AvSalesValue//[Products]4AU
//$_t_SQL:=$_t_SQL+"physical_qty,"  //;PRD_al_PhyiscalQTY//[Products]Physical
//$_t_SQL:=$_t_SQL+"allocated_qty,"  //;PRD_al_AllocQTY//[Products]Alllocated
//$_t_SQL:=$_t_SQL+"back_order_qty,"  //;PRD_al_BOQty//[Products]Back_Order
//$_t_SQL:=$_t_SQL+"on_order_qty,"  //;PRD_ar_OnOrderQTY//[Products]On_Po
//$_t_SQL:=$_t_SQL+"shelf_life,"  //;PRD_ar_ShelfLife//[Products]ShelfLife
//²$_t_SQL:=$_t_SQL+"despatch_units,"  //PRD_at_PackType//[Products]Label(Pack type)
//²$_t_SQL:=$_t_SQL+"analysis_b,"  //;PRD_at_Packaging//[Products]Packaging
//$_t_SQL:=$_t_SQL+"alpha,"  //  //;PRD_at_SubGroup;//[Products]SubGroup3

//²$_t_SQL:=$_t_SQL+"warehouse,"  //;PRD_at_Warehouse//[Products]Warehouse
//²$_t_SQL:=$_t_SQL+"product,"  //;PRD_at_ProductCode//[Products]Part_No
//² $_t_SQL:=$_t_SQL+"long_description,"  //PRD_at_ProductDescription//[Products]Description
//²$_bo_RecordModified:=True$_t_SQL:=$_t_SQL+"analysis_a,"  //;PRD_at_ProductGroup//[Products]Group
//²$_t_SQL:=$_t_SQL+"description,"  //;PRD_at_Barcode//[Products]Barcode
//²$_t_SQL:=$_t_SQL+"price,"  //;PRD_ar_ListPrice////[Products]List_Price
//²$_t_SQL:=$_t_SQL+"discount,"  //;PRD_at_Discount//[Products]Discount
//²$_t_SQL:=$_t_SQL+"unit_height,"  //;PRD_at_Status//[Products]Status
//²$_t_SQL:=$_t_SQL+"stock_vat_type,"  //;PRD_at_VAt//[Products]VAT

//²$_t_SQL:=$_t_SQL+"drawing_number,"  //;PRD_at_LaunchYear//[Products]LaunchYear

//$_t_SQL:=$_t_SQL+"unit_length,"  //;PRD_at_UnitLength// this is not stored anywhere


//²$_t_SQL:=$_t_SQL+"weight,"  //;PRD_ar_ProdWeight//[Products]Weight
//²$_t_SQL:=$_t_SQL+"catalogue_number,"  //;PRD_at_NettWeight//[Products]NettWeight-we convert the string to. number(PRD_ar_NettWeight)
//$_t_SQL:=$_t_SQL+"analysis_c,"  //;PRD_at_Location//[Products]Bin_Number
//$_t_SQL:=$_t_SQL+"standard_cost,"  //--PRD_ar_StdCode..[Products]CS3_Cost_Standard
//$_t_SQL:=$_t_SQL+"lead_time,"  //;PRD_ar_LeadTime//[Products]LeadWeeks
//$_t_SQL:=$_t_SQL+"supplier,"  //;PRD_at_Supplier//[Products]Supplier
//$_t_SQL:=$_t_SQL+"current_cost,"  //--PRD_ar_CurrentCost we use this to calculate aR_dodT and store that in [Products]Total_Value
//$_t_SQL:=$_t_SQL+"economic_reorder_q,"  //;PRD_ar_MinOrdQ//[Products]Minimum_Order_Qty
//$_t_SQL:=$_t_SQL+"min_stock_level,"  //PRD_ar_BufferWeeks//[Products]BufferWeeks
//$_t_SQL:=$_t_SQL+"abc_category"  // PRD_at_ABCCat///[Products]ABC_Category
//$_t_SQL:=$_t_SQL+"make_or_buy,"  //;PRD_at_MakeOrBy//[Products]Make_or_Buy
//$_t_SQL:=$_t_SQL+"period_issue_qty01,"  //;PRD_ar_M1Usage//[Products]Month_Use_1
//$_t_SQL:=$_t_SQL+"period_issue_qty02,"  //;PRD_ar_M2Usage//[Products]U2
//$_t_SQL:=$_t_SQL+"period_issue_qty03,"  //;PRD_ar_M3Usage//[Products]U3
//$_t_SQL:=$_t_SQL+"period_issue_qty04,"  //PRD_ar_M4Usage//[Products]U4
//$_t_SQL:=$_t_SQL+"period_issue_qty05,"  //;PRD_ar_M5Usage//[Products]U5
//$_t_SQL:=$_t_SQL+"period_issue_qty06,"  //;PRD_ar_M6Usage//[Products]U6
//$_t_SQL:=$_t_SQL+"period_issue_qty07,"  //;PRD_ar_M7Usage[Products]U7
//$_t_SQL:=$_t_SQL+"period_issue_qty08,"  //;PRD_ar_M8Usage[Products]U8
//$_t_SQL:=$_t_SQL+"period_issue_qty09,"  //;PRD_ar_M9Usage//[Products]U9
//$_t_SQL:=$_t_SQL+"period_issue_qty10,"  //;PRD_ar_M10Usage[Products]U10
//$_t_SQL:=$_t_SQL+"period_issue_qty11,"  //;PRD_ar_M11Usage//[Products]U11
//$_t_SQL:=$_t_SQL+"period_issue_qty12,"  //;PRD_ar_M12Usage//[Products]U12
ERR_MethodTrackerReturn("TREND_GetProducts"; $_t_oldMethodName)
