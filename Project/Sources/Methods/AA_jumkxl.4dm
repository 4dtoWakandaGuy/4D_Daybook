//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_jumkxl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/07/2019
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_DATE:C307($_d_DateCalculateFrom; $_d_DateDoTo)
	C_LONGINT:C283($_l_ScreenNumber; $_l_TimeEndDays; $_l_TimeRemainingThisDay; $_l_TimeRequiredHours; $_l_Windowbottom; $_l_WindowID; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; xnext)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_TimeDoTo; $_ti_TimeEndFrom; $_ti_TimeStartFrom; $_ti_TimetoFrom; $_ti_WorkTimeEND; $_ti_WorkTimeStart)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_jumkxl")

If (False:C215)
	Start_Process
	$_l_ScreenNumber:=Menu bar screen:C441
	SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
	///$_l_WindowID:=Open window($_l_Windowleft+32;$_l_WindowTop+90;$_l_Windowleft+32;$_l_WindowTop+60;Plain window;;;;;DB_WindowCallBack ;)
	PROC_SetProcess(Current process:C322; $_l_WindowID)
	
	DIALOG:C40("DB_USERMODE")
	
	
	CLOSE WINDOW:C154
	Process_End
End if 
//$_l_Text:=99999999999+1
//TRACE
If (False:C215)
	$_l_TimeRequiredHours:=6
	$_ti_TimetoFrom:=Current time:C178(*)
	
	$_l_TimeEndDays:=0
	$_d_DateCalculateFrom:=Current date:C33(*)
	$_ti_TimeEndFrom:=$_ti_TimetoFrom+(60*60*$_l_TimeRequiredHours)
	$_ti_TimeStartFrom:=$_ti_TimetoFrom
	If ($_ti_WorkTimeEND=?00:00:00?)
		$_ti_WorkTimeEND:=?17:30:00?
	End if 
	If ($_ti_WorkTimeStart=?00:00:00?)
		$_ti_WorkTimeStart:=?09:00:00?
	End if 
	
	If ($_ti_TimeEndFrom>$_ti_WorkTimeEND)
		//this is after end of today tomorrow or more...
		Repeat 
			$_l_TimeEndDays:=$_l_TimeEndDays+1
			$_l_TimeRemainingThisDay:=(($_ti_WorkTimeEND-$_ti_TimeStartFrom)/60)/60
			
			$_ti_TimeStartFrom:=$_ti_WorkTimeStart  //so the amount of hours for subsequent days is calculated from start of working day
			$_l_TimeRequiredHours:=$_l_TimeRequiredHours-$_l_TimeRemainingThisDay
			
			$_ti_TimeEndFrom:=$_ti_TimeStartFrom+(60*60*$_l_TimeRequiredHours)
		Until ($_ti_TimeEndFrom<=$_ti_WorkTimeEND)
		$_d_DateDoTo:=$_d_DateCalculateFrom+$_l_TimeEndDays
		$_ti_TimeDoTo:=$_ti_TimeStartFrom+(60*60*$_l_TimeRequiredHours)
		
	End if 
End if 
TRACE:C157
If (False:C215)
	//Gen_Confirm3 (;Use Existing Function, Create New, Create Query;;;New;;;Select;;;QUERY;)
	$_bo_OK:=(OK=1)
	If (xnext=0)
		
		If ($_bo_OK)
			//create Macro
			
			
		Else 
			
			//Select Macro
			
			
		End if 
	Else 
		//QUery
	End if 
End if 
//TREND_CONNECTtoTops (;WP-CRB/25;
//->PRD_t_Warehouse_Part_No;
//->PRD_t_LabelContents_Packaging;
//->PRD_t_ExtraCatTextBCStock;
//->PRD_t_Dimensions;
//->PRD_t_Catalogue_Text;
//->PRD_t_Video_2;
//->PRD_t_Video_3;
//->PRD_t_Instruction_1;
//->PRD_t_Instruction_2;
//->PRD_t_MenuLevel3;
//->PRD_t_Shank_Diameter;
//->PRD_t_TradePoint_Program_Current;
//->PRD_t_LabelProductGraphicNew;
//->PRD_t_Screwfix_Program_Current;
//->PRD_t_SparePartsDiagram1;
//->PRD_t_TextReviewMag1;
//->PRD_t_TextReviewMag2;
//->PRD_t_TextReviewMag3;
//->PRD_t_FAQ1;
//->PRD_t_FAQ2;
//->PRD_t_FAQ3;
//->PRD_t_FAQ4;
//->PRD_t_FAQ5;
//->PRD_t_HowdensQty;
//->PRD_t_Titan_screwfix;
//->PRD_t_Erbauer_Screwfix;
//->PRD_t_NJMFinalSignOff;
//->PRD_t_LabelContents_Products;
//->PRD_t_IndustrialToolingRef;
//->PRD_t_ShankLength;
//->PRD_t_WEEEWeight;
//->PRD_t_WEEEText;
//->PRD_t_BandQAproveProductOLD;
//->PRD_t_BuckandHickmanPartNo;
//->PRD_t_Product_Reference;
//->PRD_t_Delete;
//->PRD_t_MenuLevel1;
//->PRD_t_MenuLevel2;
//->PRD_t_Deal_bo_Qty;
//->PRD_t_Catpage_Future;
//->PRD_t_Catpage_Current;
//->PRD_t_CatPagePDFURLS_Future;
//->PRD_t_Cabinet_Order;
//->PRD_t_Diameter_Imperial;
//->PRD_t_Diameter_Metric;
//->PRD_t_Diameter2_metric;
//->PRD_t_CutLength_Imperial;
//->PRD_t_CutLength_Metric;
//->PRD_t_Overall_Metric;
//->PRD_t_BearingDiameter_Metric;
//->PRD_t_RebateMetric;
//->PRD_t_Radius1;
//->PRD_t_Radius2;
//->PRD_t_Angle;
//->PRD_t_COSHH_1;
//->PRD_t_LabelCountryOfOrigin;
//->PRD_t_Web_Title;
//->PRD_t_DateCreation;
//->PRD_t_DateLaunched;
//->PRD_t_Product_Name;
//->PRD_t_LabelReorderGraphic;
//->PRD_t_LabelProductGraphic;
//->PRD_t_LabelProductTemplate;
//->PRD_t_LabelAddTextLong;
//->PRD_t_Tariff_Code;
//->PRD_t_Packaging_Type;
//->PRD_t_ModifiedDate;
//->PRD_t_ListPrice_minus1;
//->PRD_t_TitmanRef;
//->PRD_t_TitanRef;
//->PRD_t_FreudRef;
//->PRD_t_CMTRef;
//->PRD_t_BoschRef;
//->PRD_t_AxmRef;
//->PRD_t_DeWaltRef;
//->PRD_t_TPRef;
//->PRD_t_JesadaRef;
//->PRD_t_WaveformRef;
//->PRD_t_Deal_D_Qty;
//->PRD_t_ToolbankCode;
//->PRD_t_LabelAddTextShort;
//->PRD_t_TestReviewMag4;
//->PRD_t_TestReviewMag5;
//->PRD_t_ToolPakRef;
//->PRD_t_Width;
//->PRD_t_Height;
//->PRD_t_Depth;
//->PRD_t_Knowledge_links;
//->PRD_t_Video_1;
//->PRD_t_TextReviewMag6;
//->PRD_t_Instruction_links;
//->PRD_t_LabelAddTextLongNew;
//->PRD_t_Future_Cost_Date;
//->PRD_t_LabelTitleNew;
//->PRD_t_Deal_G_Qty;
//->PRD_t_MachineMartRef;
//->PRD_t_RFTag;
//->PRD_t_Sawblade_Bore;
//->PRD_t_SawBlade_Kerf;
//->PRD_t_SawbladePlate_Thick;
//->PRD_t_Sawblade_Teeth;
//->PRD_t_BandQArticleNo;
//->PRD_t_TRC_Category;
//->PRD_t_WebTitleSortOrder;
//->PRD_t_BandQ_Program_Current;
//->PRD_t_HafeleRef;
//->PRD_t_TariffCodeUS;
//->PRD_t_NatoStockNo;
//->PRD_t_ToolbarDealQty_Spare;
//->PRD_t_ToolbarDealQty_Spare2;
//->PRD_t_Toolbar_Deal_Qty_A;
//->PRD_t_Toolbar_Deal_Qty_1_B;
//->PRD_t_Toolbar_Deal_Qty_G;
//->PRD_t_Toolbar_Deal_Qty_2_C;
//->PRD_t_Toolbar_Deal_Qty_3_D;
//->PRD_t_Toolbar_Deal_Qty_4_E;
//->PRD_t_Toolbar_Deal_Qty_5_F;
//->PRD_t_ErbauerRef;
//->PRD_t_CHIP;
//->PRD_t_COSHH_Flag;
//->PRD_t_COSHH_2;
//->PRD_t_EMC;
//->PRD_t_GPSD;
//->PRD_t_LVD;
//->PRD_t_MD;
//->PRD_t_PPE;
//->PRD_t_PWD;
//->PRD_t_WEEE;
//->PRD_t_WEEEdate;
//->PRD_t_ROHS;
//->PRD_t_ROHSdate;
//->PRD_t_Sync_to_Trendnet;
//->PRD_t_Sync_to_Websites;
//->PRD_t_Battery;
//->PRD_t_DONDnnFlag;
//->PRD_t_Comments_minus1;
//->PRD_t_Discount_minus1;
//->PRD_t_Product_label_total_weight;
//->PRD_t_ListPrice_plus1;
//->PRD_t_ListPriceUS_plus1;
//->PRD_t_Discount_plus1;
//->PRD_t_Comments_plus1;
//->PRD_t_Screwfix_ean128;
//->PRD_t_Screwfix_sku_qty;
//->PRD_t_Screwfix_Description;
//->PRD_t_Supply_Chain_Issues;
//->PRD_t_Future_Cost;
//->PRD_t_IronMongery_Direct;
//->PRD_t_ListPriceUSminus1;
//->PRD_t_InstructionsOnLeafletManual;
//->PRD_t_InstructionsOnPack;
//->PRD_t_CEMArk;
//->PRD_t_Freight_Type;
//->PRD_t_Freight_Cost;
//->PRD_t_ImportTax;
//->PRD_t_RoyaltyCost;
//->PRD_t_ToolingCostPerUnit;
//->PRD_t_Deal_E_Qty;
//->PRD_t_ExtraComment;
//->PRD_t_BatteryText;
//->PRD_t_BatteryWeight;
//->PRD_t_Deal_A_Qty;
//->PRD_t_UNHazardCode;
//->PRD_t_HandArmVibrationHAV;
//->PRD_t_SoundPressureValueLPA;
//->PRD_t_AcousticPowerValueLWA;
//->PRD_t_InnerCartonWxHxD;
//->PRD_t_InnerCartonEmptyWeight;
//->PRD_t_SKUQty;
//->PRD_t_OuterCartonWxHxD;
//->PRD_t_OuterCartonEmptyWeight;
//->PRD_t_InnerQty;
//->PRD_t_MasterCartonWxHxD;
//->PRD_t_OuterQty;
//->PRD_t_MasterPalletWxHxD;
//->PRD_t_TotalQtyPalletCarton;
//->PRD_t_Voltage;
//->PRD_t_ExportProduct;
//->PRD_t_CraftRangeRef;
//->PRD_t_TradeRangeRef;
//->PRD_t_Deal_F_Qty;
//->PRD_t_WarrantyCost;
//->PRD_t_FreightMethod;
//->PRD_t_AssemblyInstruction;
//->PRD_t_Wolsely_Part_No;
//->PRD_t_Makita_Part_No;
//->PRD_t_Screwfix_Part_no;
//->PRD_t_Draper_Part_no;
//->PRD_t_GO_InnerCartonWxHxD;
//->PRD_t_GO_InnerCartonEmptyWeight;
//->PRD_t_GO_SKUQty;
//->PRD_t_GO_OuterCartonWxHxD;
//->PRD_t_GO_OuterCartonEmptyWeight;
//->PRD_t_GO_InnerQty;
//->PRD_t_GO_MasterCartonWxHxD;
//->PRD_t_GO_OuterQty;
//->PRD_t_GO_MasterPalletWxHxD;
//->PRD_t_GO_TotalQtyPalletCarton;
//->PRD_t_In_Machine_Mart_Cat;
//->PRD_t_LandedCost;
//->PRD_t_Deal_C_Qty;
//->PRD_t_Clearance_Price;
//->PRD_t_Product_inc;
//->PRD_t_Main_Graphic;
//->PRD_t_Pack_Graphic1;
//->PRD_t_Dime_graphic;
//->PRD_t_Feature_Graphics;
//->PRD_t_Include_Graphics;
//->PRD_t_Listing_graphics;
//->PRD_t_Promo_logos;
//->PRD_t_Feature_Logos;
//->PRD_t_Key_field_logo;
//->PRD_t_Product_logo;
//->PRD_t_Near_Stock_code;
//->PRD_t_BS_280;
//->PRD_t_Show_actual_size_url;
//->PRD_t_SparePartsDiagram2;
//->PRD_t_Wire_pdf;
//->PRD_t_Comp_pdf;
//->PRD_t_Product_logo_2;
//->PRD_t_Product_logo_2_url;
//->PRD_t_Warranty_Period;
//->PRD_t_Warranty_card_flag;
//->PRD_t_Stock_uk;
//->PRD_t_Stock_us;
//->PRD_t_Stock_ie;
//->PRD_t_Stock_de;
//->PRD_t_Stock_fr;
//->PRD_t_Stock_ca;
//->PRD_t_Stock_no;
//->PRD_t_Stock_au;
//->PRD_t_Stock_za;
//->PRD_t_Stock_se;
//->PRD_t_Stock_dk;
//->PRD_t_Diameter2_Imperial2;
//->PRD_t_BearingDiameter_Imperial;
//->PRD_t_TypeGrade;
//->PRD_t_Radius_Imperial;
//->PRD_t_PackQty;
//->PRD_t_ShankDiameter_Imperial;
//->PRD_t_ShankLength_Imperial;
//->PRD_t_Bore_Imperial;
//->PRD_t_Kerf_Imperial;
//->PRD_t_SawPlateThickness_Imperial;
//->PRD_t_OverallLength_Imperial;
//->PRD_t_BandQRetailPrice;
//->PRD_t_Stock_is;
//->PRD_t_Stock_fi;
//->PRD_t_Stock_be;
//->PRD_t_Key_Industrial_Product_Ref;
//->PRD_t_Description;
//->PRD_t_DE_Description;
//->PRD_t_DE_Title;
//->PRD_t_DE_Cat_Text;
//->PRD_t_DE_Dimensions;
//->PRD_t_DE_Includes;
//->PRD_t_DE_SauterShop_text;
//->PRD_t_DE_Search_Words;
//->PRD_t_CatPagePDFurls_current;
//->PRD_t_TempCatIT_page;
//->PRD_t_Dupe;
//->PRD_t_WebSortOrderDandR;
//->PRD_t_WebSortOrderC;
//->PRD_t_Stock_at_now_ice;
//->PRD_t_Stock_cz_now_roe;
//->PRD_t_Stock_lv_now_nz;
//->PRD_t_Stock_ja_now_row;
//->PRD_t_Pack_Graphic2;
//->PRD_t_Amana_Ref;
//->PRD_t_AmanaTimberline_Ref;
//->PRD_t_TrendUsa_Ref;
//->PRD_t_BQPP_Ref;
//->PRD_t_BQTTech_Ref;
//->PRD_t_BQTrade_Ref;
//->PRD_t_PROF_TC_Ref;
//->PRD_t_Sears_Ref;
//->PRD_t_QVC_Ref;
//->PRD_t_Key_Item;
//->PRD_t_LabelAddTextShortNew;
//->PRD_t_LabelRef;
//->PRD_t_Graphic;
//->PRD_t_Howdens_Part_No;
//->PRD_t_FR_Description;
//->PRD_t_FR_Title;
//->PRD_t_FR_Cat_Text;
//->PRD_t_FR_Dimensions;
//->PRD_t_FR_Includes;
//->PRD_t_NO_Description;
//->PRD_t_NO_Title;
//->PRD_t_NO_Cat_Text;
//->PRD_t_NO_Dimensions;
//->PRD_t_NO_Includes;
//->PRD_t_FR_Search_words;
//->PRD_t_NO_Search_Words;
//->PRD_t_NL_Description;
//->PRD_t_NL_Title;
//->PRD_t_NL_Cat_Text;
//->PRD_t_NL_Dimensions;
//->PRD_t_NL_Includes;
//->PRD_t_NL_Search_Words;
//->PRD_t_NewPack_Ref;
//->PRD_t_NewPack_BagBoxClam;
//->PRD_t_NewPack_WalletRef;
//->PRD_t_NewPack_HeaderRef;
//->PRD_t_NewPack_InsertCardRef;
//->PRD_t_LabelProductTemplateNew;
//->PRD_t_NewPack_Comments;
//->PRD_t_NewPack_InsertCardRef2;
//->PRD_t_Quantity;
//->PRD_t_Description_1;
//->PRD_t_Description_2;
//->PRD_t_Description_3;
//->PRD_t_Description_4;
//->PRD_t_Description_5;
//->PRD_t_Quantity_1;
//->PRD_t_MakitaPro;
//->PRD_t_DateDeleted;
//->PRD_t_McFeelysRef;
//->PRD_t_JewsonsRef;
//->PRD_t_Cat_Main;
//->PRD_t_Cat_IT;
//->PRD_t_Cat_IT_Spin_Saw;
//->PRD_t_Cat_IT_Drill_CNC;
//->PRD_t_Cat_IT_Mach;
//->PRD_t_Cat_IT_MWS;
//->PRD_t_Cat_IT_CDS;
//->PRD_t_Cat_US;
//->PRD_t_Cat_Spare2;
//->PRD_t_PriceList_Core;
//->PRD_t_PriceList_IT;
//->PRD_t_PriceList_US;
//->PRD_t_LabelRef2;
//->PRD_t_ExcludeFromDataFiles;
//->PRD_t_FSC;
//->PRD_t_BandQTradepointRef;
//->PRD_t_Type_Plastic;
//->PRD_t_Type_SolidSurface;
//->PRD_t_Type_Aluminium;
//->PRD_t_Type_Composite;
//->PRD_t_Type_Wood;
//->PRD_t_Type_Caravan;
//->PRD_t_Benchmarx_Ref;
//->PRD_t_Type_Engraving;
//->PRD_t_ReorderCardNotRequired;
//->PRD_t_HSS_Hire_Ref;
//->PRD_t_Type_WindowIndustry;
//->PRD_t_Type_SparePartsMenu;
//->PRD_t_Type_DoorHanging;
//->PRD_t_Type_KitchenFitting;
//->PRD_t_WoodBased;
//->PRD_t_Cromwell_Kennedy_ref;
//->PRD_t_Project_Links;
//->PRD_t_Dart_Ref;
//->PRD_t_Axminster_Blue_Line_Ref;
//->PRD_t_Axminster_Premium_Ref;
//->PRD_t_JCB_DIY_Ref;
//->PRD_t_TrendNet_ComingSoon;
//->PRD_t_Type_HomeWoodworker;
//->PRD_t_Hook_Angle;
//->PRD_t_Tooth_Form;
//->PRD_t_MenuLevelZero;
//->PRD_t_Group_Graphic_2d1;
//->PRD_t_Group_Graphic_nd;
//->PRD_t_Graphicusercheck;
//->PRD_t_Graphiccheckdate;
//->PRD_t_CheckIllegalSales;
//->PRD_t_Type_WoodturningProtectUS;
//->PRD_t_Type_AgriProtectUS;
//->PRD_t_Type_RoutingProjectsUS;
//->PRD_t_Type_SharpeningDiamondUS;
//->PRD_t_Type_DoorHangingUS;
//->PRD_t_Type_SawingUS;
//->PRD_t_Promotions;
//->PRD_t_Lifesizer_Own_Ref;
//->PRD_t_Record_Checked;
//->PRD_t_SIG_ref;
//->PRD_t_Type_Makers;
//->PRD_t_PRODUCT_TYPE_1;
//->PRD_t_PRODUCT_TYPE_2;
//->PRD_t_PRODUCT_LOGO_URL;
//->PRD_t_Website_Catagories;
//->PRD_l_LastModifiedStamp;
//->PRD_t_ProductUUID;
//->PRD_t_ProductExtendedUUID;//->PRD_t_ExpiryDateItem;//->PRD_d_ProductNoLongerNEWDate;//->PRD_t_Product_GroupParentUUID;//->PRD_l_Product_GroupSequence;//->PRD_bo_Make_live_on_Website;//->PRD_bo_Product_Deleted;;
//ERR_MethodTrackerReturn (;AA_jumkxl ;;$_t_oldMethodName)