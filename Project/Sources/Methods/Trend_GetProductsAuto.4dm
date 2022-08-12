//%attributes = {}

If (False:C215)
	//Project Method Name:      Trend_GetProductsAuto
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_Services; 0; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	C_OBJECT:C1216($_obj_BackOrders; $_obj_NoReplacements; $_obj_ProductsFromSage; $_obj_Services)
	C_TEXT:C284($_t_SQL)
End if 
//Code Starts Here
//this method is to test a task getting the current products from Sage.
//Repeat 

ARRAY TEXT:C222($_at_Replacements; 0)
ARRAY TEXT:C222($_at_WhattoReplace; 0)
ARRAY TEXT:C222($_at_Services; 0; 0)
///This is how we inject the SQL query we want into this
//we look for the corresponding script(macro)-this contains the text of the SQL query
//we extract that to..
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



$_obj_ProductsFromSage:=New object:C1471
$_obj_ProductsFromSage.queryname:="StockUpdate"
//$_obj_BackOrders.Replacements:=SQL_buildReplacements ("("+Char(Quote)+"1"+Char(Quote)+","+Char(Quote)+"2"+Char(Quote)+","+Char(Quote)+"3"+Char(Quote)+","+Char(Quote)+"4"+Char(Quote)+","+Char(Quote)+"5"+Char(Quote)+")";"TOPSSQL_ARRAY")

//SQL_GetDataToObject ("StockUpdate")


//Until 
