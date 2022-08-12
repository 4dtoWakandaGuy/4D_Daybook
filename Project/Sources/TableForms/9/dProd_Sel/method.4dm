If (False:C215)
	//Table Form Method Name: [PRODUCTS]dProd_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 21:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_Lb_FurtherFieldsQuery;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(PRD_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(PRD_at_SearchTab;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VeDateToSet; $_bo_VIntDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VeDateToSet; SRCH_bo_VIntDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_EntryDateTo; $_d_IntDateF; $_d_IntdateFBASE; $_d_IntDateT; $_d_IntdateTBASE; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo; VedateFBASE)
	C_DATE:C307(VedateTBASE; vIntDateF; VIntdateFBASE; vIntdateT; VIntdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ch1; $_l_ch2; $_l_ch3; $_l_ColumnsTakeoff)
	C_LONGINT:C283($_l_ColumnsWidth; $_l_CommodityCodeBottom; $_l_CommodityCodeLabelBottom; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelRight; $_l_CommodityCodeLabelTop; $_l_CommodityCodeLeft; $_l_CommodityCodeRight; $_l_CommodityCodeTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft)
	C_LONGINT:C283($_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_CountCustomFields; $_l_cSetAdd; $_l_cSetMod; $_l_CusFieldIndex; $_l_defaultparams; $_l_DescriptionBottom; $_l_DescriptionLeft; $_l_DescriptionRight; $_l_DescriptionTop)
	C_LONGINT:C283($_l_EnclosuresBottom; $_l_EnclosuresLeft; $_l_EnclosuresRight; $_l_EnclosuresTop; $_l_EntryDateFromOffset; $_l_EntryDateToOffset; $_l_event; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight)
	C_LONGINT:C283($_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_FurtherAnalysisCodeBottom; $_l_FurtherAnalysisCodeLabelBott; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelTop; $_l_FurtherAnalysisCodeLeft)
	C_LONGINT:C283($_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeTop; $_l_Height; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop)
	C_LONGINT:C283($_l_Inset; $_l_IntDateFOffset; $_l_IntDateTOffset; $_l_ModelCodeBottom; $_l_ModelCodeLeft; $_l_ModelCodeRight; $_l_ModelCodeTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom)
	C_LONGINT:C283($_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom)
	C_LONGINT:C283($_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop)
	C_LONGINT:C283($_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth)
	C_LONGINT:C283($_l_OK; $_l_PrefferedWIdth; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_ProductNameBottom; $_l_ProductNameLeft; $_l_ProductNameRight; $_l_ProductNameTop; $_l_ProductsCount)
	C_LONGINT:C283($_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_Remaining; $_l_ShortCodeBottom; $_l_ShortCodeLabelBottom; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelRight; $_l_ShortCodeLabelTop)
	C_LONGINT:C283($_l_ShortCodeLeft; $_l_ShortCodeRight; $_l_ShortCodeTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TableNumber; $_l_TableNumberRow)
	C_LONGINT:C283($_l_TabsWidth; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11)
	C_LONGINT:C283(CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21)
	C_LONGINT:C283(CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7)
	C_LONGINT:C283(CCQ_l_BUT8; CCQ_l_BUT9; ch1; ch2; ch3; cNAA; cNAL; cSetAdd; cSetMod; cSIS; RHold)
	C_LONGINT:C283(SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; VintDateFOffset; VintDatetOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ValueF; $_r_valueT; vAmountF; vAmountT; vDiscountF; vValueF; vValueT)
	C_TEXT:C284($_t_AnalysisCode; $_t_Brand; $_t_Comments; $_t_Enclosures; $_t_FormUsage; $_t_FormUsage3; $_t_Group; $_t_LetterCode; $_t_ModelCode; $_t_oldMethodName; $_t_Problem)
	C_TEXT:C284($_t_Product; $_t_ProductCode; $_t_ProductName; $_t_Superior; $_t_Supplier; $_t_TableNumberString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1)
	C_TEXT:C284(oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2)
	C_TEXT:C284(oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5)
	C_TEXT:C284(oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15)
	C_TEXT:C284(oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25)
	C_TEXT:C284(oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; vAnalysis; vBrand)
	C_TEXT:C284(VComments; Venclosures; Vgroup; VLetterCode; vModelCode; vProblem; VProdCode; vProdName; vProduct; Vsuperior; Vsupplier)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].dProd_Sel"; Form event code:C388)

Sel_LProc2(->[PRODUCTS:9])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		vIntDateF:=!00-00-00!
		vIntdateT:=!00-00-00!
		ACC_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		
		//ACC_d_EntryDateFrom:=!00/00/00!
		
		VedateFBASE:=!00-00-00!
		VedateTBASE:=!00-00-00!
		VIntdateFBASE:=!00-00-00!
		VIntdateTBASE:=!00-00-00!
		
		SRCH_bo_VeDateToSet:=False:C215
		SRCH_bo_VintDateToSet:=False:C215
		
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(52)
		OpenHelp(Table:C252(->[PRODUCTS:9]); "dProd_Sel")
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		ARRAY TEXT:C222(PRD_at_SearchTab; 0)
		ARRAY LONGINT:C221(PRD_al_coTabChoices; 0)
		
		APPEND TO ARRAY:C911(PRD_at_SearchTab; "Products")
		APPEND TO ARRAY:C911(PRD_al_coTabChoices; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INFORMATION:55]))<0)
			APPEND TO ARRAY:C911(PRD_at_SearchTab; "Information")
			APPEND TO ARRAY:C911(PRD_al_coTabChoices; 2)
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(PRD_at_SearchTab; "Companies")
			APPEND TO ARRAY:C911(PRD_al_coTabChoices; 1)
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))<0)
				APPEND TO ARRAY:C911(PRD_at_SearchTab; "Diary Items")
				APPEND TO ARRAY:C911(PRD_al_coTabChoices; 3)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
				APPEND TO ARRAY:C911(PRD_at_SearchTab; "Order Items")
				APPEND TO ARRAY:C911(PRD_al_coTabChoices; 4)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))<0)
				APPEND TO ARRAY:C911(PRD_at_SearchTab; "Stock items")
				APPEND TO ARRAY:C911(PRD_al_coTabChoices; 5)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CURRENT_STOCK:62]))<0)
				APPEND TO ARRAY:C911(PRD_at_SearchTab; "Current stock")
				APPEND TO ARRAY:C911(PRD_al_coTabChoices; 6)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[STOCK_LEVELS:58]))<0)
				APPEND TO ARRAY:C911(PRD_at_SearchTab; "Stock levels")
				APPEND TO ARRAY:C911(PRD_al_coTabChoices; 7)
			End if 
		End if 
		PRD_at_SearchTab:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(PRD_at_SearchTab))
			dbtabText2:=dbtabText2+PRD_at_SearchTab{$_l_TabsWidth}+(" "*8)
		End for 
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=552
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=552)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=552
				SRCH_l_MinWidth:=552
			End if 
		End if 
		If (ACC_d_EntryDateFrom=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVEDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
		End if 
		If (vintDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "ovintDateT@"; False:C215)
		Else 
			//VsdateT:=VsdateF
		End if 
		If (vAmountF=0)
			OBJECT SET VISIBLE:C603(*; "oSalesPriceT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
			
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Sales_Price:9#0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			
			If ($_l_ProductsCount=0)
				OBJECT SET VISIBLE:C603(*; "oSalesPrice@"; False:C215)
			End if 
		End if 
		If (vValueF=0)
			OBJECT SET VISIBLE:C603(*; "oStandardPriceT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
			
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Standard_Price:16#0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			
			If ($_l_ProductsCount=0)
				OBJECT SET VISIBLE:C603(*; "oStandardPrice@"; False:C215)
			End if 
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
		
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Superior:15#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_ProductsCount=0)
			OBJECT SET VISIBLE:C603(*; "oParentProduct@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
		
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Enclosures:20#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_ProductsCount=0)
			OBJECT SET VISIBLE:C603(*; "oEnclosures@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
		
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Short_Code:19#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_ProductsCount=0)
			OBJECT SET VISIBLE:C603(*; "oShortCode@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ProductsCount)
		
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Commodity_Code:38#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_ProductsCount=0)
			OBJECT SET VISIBLE:C603(*; "oCommodityCode@"; False:C215)
		End if 
		
		
		
		If (SM_l_QueryMode#0)  // edit or create
			
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		//WS_AutoscreenSize (2;353;530)
		$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
		$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[PRODUCTS:9]))
		If (<>SYS_al_TableUniqueField{$_l_TableNumberRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumberRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableNumberRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_CountCustomFields:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})
			If ($_l_CountCustomFields#0)
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableNumberRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_CountCustomFields)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_CountCustomFields)
				For ($_l_CusFieldIndex; 1; $_l_CountCustomFields)  //clear the arr first
					
					CUS_at_DisplayedData{$_l_CusFieldIndex}:=""
					CUS_at_PageText{$_l_CusFieldIndex}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
				ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)  //& (False)
				
				
				
				
				
				LB_SetupListbox(->PRD_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->PRD_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->PRD_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				LB_SetEnterable(->PRD_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->PRD_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->PRD_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->PRD_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->PRD_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->PRD_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_Height:=375+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_objectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_objectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					//$_l_ObjectTop:=
					OBJECT MOVE:C664(*; "OHoldText"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					
					OBJECT GET COORDINATES:C663(*; "oCancelButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
				End if 
			Else 
				$_l_Height:=371
				If ($_l_Height<371)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=371
					WS_AutoscreenSize(2; 371; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			
			$_l_Height:=371
			If ($_l_Height<371)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=371
				WS_AutoscreenSize(2; 371; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		SM_LoadSearchParameterNames(Table:C252(->[PRODUCTS:9]); SM_l_QueryMode)
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Information"; 3; "")
			DB_MenuAction("Find"; "Diary"; 3; "")
			DB_MenuAction("Find"; "Order items"; 3; "")
			DB_MenuAction("Find"; "Stock Items"; 3; "")
			DB_MenuAction("Find"; "Current Stock"; 3; "")
			DB_MenuAction("Find"; "Stock levels"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
			
			DB_MenuAction("Find"; "Diary"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
			
			DB_MenuAction("Find"; "Order items"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_StockControl)<2)
			
			DB_MenuAction("Find"; "Stock Items"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_StockControl)<2)
			
			DB_MenuAction("Find"; "Current Stock"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_StockControl)<2)
			
			DB_MenuAction("Find"; "Stock levels"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		Case of 
			: (DB_t_CurrentFormUsage="Price")
				ch1:=1
			: (DB_t_CurrentFormUsage="Stock")
				ch2:=1
		End case 
		
		
		OBJECT SET TITLE:C194(ch2; Term_StoWT("Maintain Inventory"))
		OBJECT SET TITLE:C194(ch3; Term_StoWT("Serial No Inventory"))
		
		INT_SetDialog
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[PRODUCTS:9]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		
		If ($_l_defaultparams>0)
			ACC_l_EntryDateFromOffset:=0
			VintDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VintDatetOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
			If (VintDateFOffset#0)
				Case of 
					: (VintDateFOffset>0)
						VintDateF:=Current date:C33-VintDateFOffset
					: (VintDateFOffset>-100)
						//months
						VintDateF:=Add to date:C393(Current date:C33; 0; VintDateFOffset; 0)
					Else 
						//years
						VintDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVintDateT@"; True:C214)
			End if 
			If (VintDateTOffset#0)
				Case of 
					: (VintDateTOffset>0)
						VintDateF:=Current date:C33-VintDateTOffset
					: (VintDateTOffset>-100)
						//months
						VintDateT:=Add to date:C393(Current date:C33; 0; VintDateTOffset; 0)
					Else 
						//years
						VintDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVintDateT@"; True:C214)
			End if 
			If (ACC_l_EntryDateFromOffset#0)
				Case of 
					: (ACC_l_EntryDateFromOffset>0)
						ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
			End if 
			If (ACC_l_EntryDateToOffset#0)
				Case of 
					: (ACC_l_EntryDateToOffset>0)
						ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
					: (ACC_l_EntryDateToOffset>-100)
						//months
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
			End if 
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			
			OBJECT SET VISIBLE:C603(PRD_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
	: ($_l_event=On Clicked:K2:4)
		
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<ACC_d_EntryDateFrom)
						ACC_d_EntryDateFrom:=SRCH_d_EntryDateTo
						
					End if 
				End if 
			: ($_ptr_FocusObject=(->VintDATEF))
				If (vintDateF>!00-00-00!)
					If (SRCH_bo_VintDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VintDateF>VintDateT) & (VintDateT>!00-00-00!)
						
						VintDateT:=VintDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVintDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VintDATET))
				If (VintDateT>!00-00-00!)
					If (VintDateT<VintDateF)
						VintDateF:=VintDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vDiscountF
				End if 
				If (vAmountF>0)
					OBJECT SET VISIBLE:C603(*; "oSalesPriceT@"; True:C214)
				End if 
				
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vValueF)
				If (vValueT<vValueF) & (vValueT>0)
					vValueT:=vValueF
				End if 
				If (vValueF>0)
					OBJECT SET VISIBLE:C603(*; "oStandardPriceT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vValueT)
				If (vValueF>vValueT)
					vValueF:=vValueT
				End if 
		End case 
		
	: ($_l_event=On Data Change:K2:15)
		
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<ACC_d_EntryDateFrom)
						ACC_d_EntryDateFrom:=SRCH_d_EntryDateTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->VintDATEF))
				If (vintDateF>!00-00-00!)
					If (SRCH_bo_VintDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VintDateF>VintDateT) & (VintDateT>!00-00-00!)
						
						VintDateT:=VintDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVintDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VintDATET))
				If (VintDateT>!00-00-00!)
					If (VintDateT<VintDateF)
						VintDateF:=VintDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vDiscountF
				End if 
				If (vAmountF>0)
					OBJECT SET VISIBLE:C603(*; "oSalesPriceT@"; True:C214)
				End if 
				
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vValueF)
				If (vValueT<vValueF) & (vValueT>0)
					vValueT:=vValueF
				End if 
				If (vValueF>0)
					OBJECT SET VISIBLE:C603(*; "oStandardPriceT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vValueT)
				If (vValueF>vValueT)
					vValueF:=vValueT
				End if 
		End case 
		
	: ($_l_event=On Menu Selected:K2:14)
		
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_Group:=Vgroup
				$_t_Brand:=vBrand
				$_t_Product:=vProduct
				$_t_ModelCode:=vModelCode
				$_t_ProductCode:=VProdCode
				$_t_ProductName:=vProdName
				$_t_Comments:=VComments
				$_t_Enclosures:=vEnclosures
				$_t_Superior:=Vsuperior
				$_r_AmountFrom:=VAmountF
				$_r_AmountTo:=VAmountT
				$_r_ValueF:=vValueF
				$_r_valueT:=vValueT
				$_d_EntryDateFrom:=ACC_d_EntryDateFrom
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				$_d_IntDateF:=VintDateF
				$_d_IntDateT:=VintDateT
				$_t_Supplier:=Vsupplier
				$_t_LetterCode:=VLetterCode
				$_t_Problem:=vProblem
				$_t_LetterCode:=vLetterCode
				$_t_AnalysisCode:=vAnalysis
				$_l_ch1:=CH1
				$_l_ch2:=CH2
				$_l_ch3:=CH3
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
				$_l_IntDateFOffset:=VintDateFOffset
				$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
				$_l_IntDateTOffset:=VintDatetOffset
				
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarProducts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				OBJECT GET COORDINATES:C663(*; "oPrdTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
				OBJECT GET COORDINATES:C663(*; "oModelCode"; $_l_ModelCodeLeft; $_l_ModelCodeTop; $_l_ModelCodeRight; $_l_ModelCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oShortCode"; $_l_ShortCodeLeft; $_l_ShortCodeTop; $_l_ShortCodeRight; $_l_ShortCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oShortCodeLabel"; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelTop; $_l_ShortCodeLabelRight; $_l_ShortCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom)
				OBJECT GET COORDINATES:C663(*; "oDescription"; $_l_DescriptionLeft; $_l_DescriptionTop; $_l_DescriptionRight; $_l_DescriptionBottom)
				OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_EnclosuresLeft; $_l_EnclosuresTop; $_l_EnclosuresRight; $_l_EnclosuresBottom)
				OBJECT GET COORDINATES:C663(*; "oCommodityCode"; $_l_CommodityCodeLeft; $_l_CommodityCodeTop; $_l_CommodityCodeRight; $_l_CommodityCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oCommodityCodeLabel"; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelTop; $_l_CommodityCodeLabelRight; $_l_CommodityCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oFurtherAnalysisCode"; $_l_FurtherAnalysisCodeLeft; $_l_FurtherAnalysisCodeTop; $_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oFurtherAnalysisCodeLabel"; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelTop; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelBott)
				
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				$_d_edateFBASE:=VedateFBASE
				$_d_edateTBASE:=VedateTBASE
				$_d_IntdateFBASE:=VIntdateFBASE
				$_d_IntdateTBASE:=VIntdateTBASE
				$_bo_VeDateToSet:=SRCH_bo_VeDateToSet
				$_bo_VIntDateToSet:=SRCH_bo_VIntDateToSet
				
				
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))
					
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Prod_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Prod_SelLP(-1; SM_l_QueryMode; Table:C252(->[PRODUCTS:9]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(52)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				VedateFBASE:=$_d_edateFBASE
				VedateTBASE:=$_d_edateTBASE
				VIntdateFBASE:=$_d_IntdateFBASE
				VIntdateTBASE:=$_d_IntdateTBASE
				SRCH_bo_VeDateToSet:=$_bo_VeDateToSet
				SRCH_bo_VIntDateToSet:=$_bo_VIntDateToSet
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				
				OBJECT MOVE:C664(*; "oSideBarProducts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
				OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
				OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
				OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
				OBJECT MOVE:C664(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
				OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
				OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
				OBJECT MOVE:C664(*; "oPrdTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
				OBJECT MOVE:C664(*; "oModelCode"; $_l_ModelCodeLeft; $_l_ModelCodeTop; $_l_ModelCodeRight; $_l_ModelCodeBottom; *)
				OBJECT MOVE:C664(*; "oShortCode"; $_l_ShortCodeLeft; $_l_ShortCodeTop; $_l_ShortCodeRight; $_l_ShortCodeBottom; *)
				OBJECT MOVE:C664(*; "oShortCodeLabel"; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelTop; $_l_ShortCodeLabelRight; $_l_ShortCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
				OBJECT MOVE:C664(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom; *)
				OBJECT MOVE:C664(*; "oDescription"; $_l_DescriptionLeft; $_l_DescriptionTop; $_l_DescriptionRight; $_l_DescriptionBottom; *)
				OBJECT MOVE:C664(*; "oEnclosures"; $_l_EnclosuresLeft; $_l_EnclosuresTop; $_l_EnclosuresRight; $_l_EnclosuresBottom; *)
				OBJECT MOVE:C664(*; "oCommodityCode"; $_l_CommodityCodeLeft; $_l_CommodityCodeTop; $_l_CommodityCodeRight; $_l_CommodityCodeBottom; *)
				OBJECT MOVE:C664(*; "oCommodityCodeLabel"; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelTop; $_l_CommodityCodeLabelRight; $_l_CommodityCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oFurtherAnalysisCode"; $_l_FurtherAnalysisCodeLeft; $_l_FurtherAnalysisCodeTop; $_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeBottom; *)
				OBJECT MOVE:C664(*; "oFurtherAnalysisCodeLabel"; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelTop; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelBott; *)
				
				SM_LoadSearchParameterNames(Table:C252(->[PRODUCTS:9]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				
				VGroup:=$_t_Group
				vBrand:=$_t_Brand
				vProduct:=$_t_Product
				vModelCode:=$_t_ModelCode
				vProdCode:=$_t_ProductCode
				vProdName:=$_t_ProductName
				vComments:=$_t_Comments
				vEnclosures:=$_t_Enclosures
				vSuperior:=$_t_Superior
				vAmountF:=$_r_AmountFrom
				vAmountT:=$_r_AmountTo
				vValueF:=$_r_ValueF
				vValueT:=$_r_valueT
				ACC_d_EntryDateFrom:=$_d_EntryDateFrom
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				vSupplier:=$_t_Supplier
				vLetterCOde:=$_t_LetterCode
				vProblem:=$_t_Problem
				vLetterCode:=$_t_LetterCode
				vAnalysis:=$_t_AnalysisCode
				CH1:=$_l_ch1
				CH2:=$_l_ch2
				CH3:=$_l_ch3
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				VintDateF:=$_d_IntDateF
				VintDateT:=$_d_IntDateT
				ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
				VintDateFOffset:=$_l_IntDateFOffset
				ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
				VintDatetOffset:=$_l_IntDateTOffset
				
				If ($_l_OK>0) & (Not:C34(rHold=1))
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
				End if 
				rHold:=0
				If (Not:C34(SRCH_bo_ShowHold))
					OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
				End if 
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dProd_Sel"; $_t_oldMethodName)
