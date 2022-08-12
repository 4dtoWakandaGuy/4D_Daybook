If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]ditems_sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_MoveTypeINC; 0)
	ARRAY BOOLEAN:C223($_abo_StockTypeINC; 0)
	//ARRAY BOOLEAN(STK_abo_MoveTypeINC;0)
	//ARRAY BOOLEAN(STK_abo_StockTypeINC;0)
	//ARRAY BOOLEAN(STK_LB_MoveTypes;0)
	//ARRAY BOOLEAN(STK_LB_StockTypes;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY LONGINT(STK_al_TabOffset;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	ARRAY TEXT:C222($_at_MoveTypeCodes; 0)
	ARRAY TEXT:C222($_at_MoveTypeNames; 0)
	ARRAY TEXT:C222($_at_StockTypeCodes; 0)
	ARRAY TEXT:C222($_at_StockTypeNames; 0)
	//ARRAY TEXT(STK_at_SearchItemTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(STK_at_MoveTypeCodes;0)
	//ARRAY TEXT(STK_at_MoveTypeNames;0)
	//ARRAY TEXT(STK_at_StockTypeCodes;0)
	//ARRAY TEXT(STK_at_StockTypeNames;0)
	C_BOOLEAN:C305($_bo_CBRetained; $_bo_ShowHold; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; STK_bo_CBRetained; STK_bo_MoveTypesLoaded; STK_bo_TypesLoaded; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DeliveryDateF; $_d_DeliveryDateT; $_d_MoveDateF; $_d_MoveDateT; vDeliveryDateF; vDeliveryDateT; vMoveDateF; vMoveDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight)
	C_LONGINT:C283($_l_ContinueButtonTop; $_l_defaultparams; $_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop)
	C_LONGINT:C283($_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_ItemNumF; $_l_ItemNumT; $_l_NAA)
	C_LONGINT:C283($_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom)
	C_LONGINT:C283($_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop)
	C_LONGINT:C283($_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_QueryMode; $_l_QULabelBottom)
	C_LONGINT:C283($_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TabsWidth; $_l_TotalWidth)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; cNAA; cNAL; cSIS; MT_l_BUT1; MT_l_BUT10; MT_l_BUT11; MT_l_BUT12)
	C_LONGINT:C283(MT_l_BUT13; MT_l_BUT14; MT_l_BUT15; MT_l_BUT16; MT_l_BUT17; MT_l_BUT18; MT_l_BUT19; MT_l_BUT2; MT_l_BUT20; MT_l_BUT21; MT_l_BUT22)
	C_LONGINT:C283(MT_l_BUT23; MT_l_BUT24; MT_l_BUT25; MT_l_BUT26; MT_l_BUT27; MT_l_BUT3; MT_l_BUT4; MT_l_BUT5; MT_l_BUT6; MT_l_BUT7; MT_l_BUT8)
	C_LONGINT:C283(MT_l_BUT9; rHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; ST_l_BUT1; ST_l_BUT10; ST_l_BUT11; ST_l_BUT12; ST_l_BUT13; ST_l_BUT14)
	C_LONGINT:C283(ST_l_BUT15; ST_l_BUT16; ST_l_BUT17; ST_l_BUT18; ST_l_BUT19; ST_l_BUT2; ST_l_BUT20; ST_l_BUT21; ST_l_BUT22; ST_l_BUT23; ST_l_BUT24)
	C_LONGINT:C283(ST_l_BUT25; ST_l_BUT26; ST_l_BUT27; ST_l_BUT3; ST_l_BUT4; ST_l_BUT5; ST_l_BUT6; ST_l_BUT7; ST_l_BUT8; ST_l_BUT9; VItemNumF)
	C_LONGINT:C283(VItemNumT; xCancel; xOK)
	C_REAL:C285($_r_QuantityF; $_r_QuantityT; $_r_ValuesF; $_r_ValuesT; VQuantityF; VQuantityT; vValuesF; vValuesT)
	C_TEXT:C284($_t_CompanyCode; $_t_DeliveryReferenceF; $_t_DeliveryReferenceT; $_t_MoveCodeF; $_t_MoveCodeT; $_t_oldMethodName; $_t_OrderCodeF; $_t_OrderCodeT; $_t_ProductCode; $_t_PurchCodeF; $_t_PurchCodeT)
	C_TEXT:C284($_t_SerialNumber; dbtabText2; oMT_COL1; oMT_COL10; oMT_COL11; oMT_COL12; oMT_COL13; oMT_COL14; oMT_COL15; oMT_COL16; oMT_COL17)
	C_TEXT:C284(oMT_COL18; oMT_COL19; oMT_COL2; oMT_COL20; oMT_COL21; oMT_COL22; oMT_COL23; oMT_COL24; oMT_COL25; oMT_COL26; oMT_COL27)
	C_TEXT:C284(oMT_COL3; oMT_COL4; oMT_COL5; oMT_COL6; oMT_COL7; oMT_COL8; oMT_COL9; oMT_HED1; oMT_HED10; oMT_HED11; oMT_HED12)
	C_TEXT:C284(oMT_HED13; oMT_HED14; oMT_HED15; oMT_HED16; oMT_HED17; oMT_HED18; oMT_HED19; oMT_HED2; oMT_HED20; oMT_HED21; oMT_HED22)
	C_TEXT:C284(oMT_HED23; oMT_HED24; oMT_HED25; oMT_HED26; oMT_HED27; oMT_HED3; oMT_HED4; oMT_HED5; oMT_HED6; oMT_HED7; oMT_HED8)
	C_TEXT:C284(oMT_HED9; oST_COL1; oST_COL10; oST_COL11; oST_COL12; oST_COL13; oST_COL14; oST_COL15; oST_COL16; oST_COL17; oST_COL18)
	C_TEXT:C284(oST_COL19; oST_COL2; oST_COL20; oST_COL21; oST_COL22; oST_COL23; oST_COL24; oST_COL25; oST_COL26; oST_COL27; oST_COL3)
	C_TEXT:C284(oST_COL4; oST_COL5; oST_COL6; oST_COL7; oST_COL8; oST_COL9; oST_HED1; oST_HED10; oST_HED11; oST_HED12; oST_HED13)
	C_TEXT:C284(oST_HED14; oST_HED15; oST_HED16; oST_HED17; oST_HED18; oST_HED19; oST_HED2; oST_HED20; oST_HED21; oST_HED22; oST_HED23)
	C_TEXT:C284(oST_HED24; oST_HED25; oST_HED26; oST_HED27; oST_HED3; oST_HED4; oST_HED5; oST_HED6; oST_HED7; oST_HED8; oST_HED9)
	C_TEXT:C284(VcompCode; vDeliveryReferenceF; vDeliveryReferenceT; vMoveCodeF; VMoveCodeT; VOrderCodeF; VOrderCodeT; VprodCode; VPurchaseCodeF; VPurchaseCodeT; VserialNo)
	C_TEXT:C284(vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].ditems_sel"; Form event code:C388)


$_l_event:=Form event code:C388  //BSW 4/09/02 this was missing can you beleive it???


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(STK_bo_MoveTypesLoaded))
			ALL RECORDS:C47([MOVEMENT_TYPES:60])
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; STK_at_MoveTypeCodes; [MOVEMENT_TYPES:60]Type_Name:2; STK_at_MoveTypeNames)
			
			STK_bo_MoveTypesLoaded:=True:C214
		End if 
		
		ARRAY BOOLEAN:C223(STK_abo_MoveTypeINC; 0)
		ARRAY BOOLEAN:C223(STK_abo_MoveTypeINC; Size of array:C274(STK_at_MoveTypeCodes))
		
		If (Not:C34(STK_bo_TypesLoaded))
			ALL RECORDS:C47([STOCK_TYPES:59])
			SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; STK_at_StockTypeCodes; [STOCK_TYPES:59]Type_Name:2; STK_at_StockTypeNames)
			STK_bo_TypesLoaded:=True:C214
		End if 
		ARRAY BOOLEAN:C223(STK_abo_StockTypeINC; 0)
		ARRAY BOOLEAN:C223(STK_abo_StockTypeINC; Size of array:C274(STK_at_StockTypeCodes))
		
		
		
		
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(61)
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "ditems_sel")
		ARRAY TEXT:C222(STK_at_SearchItemTab; 0)
		ARRAY LONGINT:C221(STK_al_TabOffset; 0)
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		APPEND TO ARRAY:C911(STK_at_SearchItemTab; "Stock Items")
		APPEND TO ARRAY:C911(STK_al_TabOffset; 0)
		
		If (DB_GetModuleSettingByNUM(Module_Products)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
				APPEND TO ARRAY:C911(STK_at_SearchItemTab; "Products")
				APPEND TO ARRAY:C911(STK_al_TabOffset; 1)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[STOCK_MOVEMENTS:40]))<0)
				APPEND TO ARRAY:C911(STK_at_SearchItemTab; "Stock Movements")
				APPEND TO ARRAY:C911(STK_al_TabOffset; 2)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
				APPEND TO ARRAY:C911(STK_at_SearchItemTab; "Sales Order items")
				APPEND TO ARRAY:C911(STK_al_TabOffset; 3)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_ORDERS:57]))<0)
				APPEND TO ARRAY:C911(STK_at_SearchItemTab; "Purchase Orders")
				APPEND TO ARRAY:C911(STK_al_TabOffset; 4)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SerialNos)<2)
			OBJECT SET VISIBLE:C603(*; "oSerialNo@"; False:C215)
		End if 
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(STK_at_SearchItemTab))
			dbtabText2:=dbtabText2+STK_at_SearchItemTab{$_l_TabsWidth}+(" "*8)
		End for 
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=531
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=531)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=531
				SRCH_l_MinWidth:=531
			End if 
		End if 
		
		STK_at_SearchItemTab:=1
		
		SM_LoadSearchParameterNames(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		rHold:=0
		
		WS_bo_InsearchScreen:=True:C214
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Products"; 3; "")
			DB_MenuAction("Find"; "Stock Movements"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		Sel_LProc
		vTitle2:=Uppercase:C13(Term_StoWT("Stock Items Selection"))
		DB_MenuAction("Find"; "Stock Movements"; 1; Term_StoWT("Stock Movements"))
		//TRACE
		WS_AutoscreenSize(2; 520; $_l_TotalWidth)
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
		
		LB_SetupListbox(->STK_LB_MoveTypes; "oRS"; "MT_L"; 1; ->STK_abo_MoveTypeINC; ->STK_at_MoveTypeNames; ->STK_at_MoveTypeCodes)
		
		
		LB_SetColumnHeaders(->STK_LB_MoveTypes; "MT_L"; 1; "Include"; "Name")
		
		
		LB_SetColumnWidths(->STK_LB_MoveTypes; "oABR"; 1; 20; 80; 0)
		
		LB_SetEnterable(->STK_LB_MoveTypes; False:C215; 0)
		LB_SetEnterable(->STK_LB_MoveTypes; True:C214; 1)
		
		LB_SetScroll(->STK_LB_MoveTypes; -3; -2)
		
		LB_StyleSettings(->STK_LB_MoveTypes; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
		
		
		
		
		LB_SetupListbox(->STK_LB_StockTypes; "oRS"; "ST_L"; 1; ->STK_abo_StockTypeINC; ->STK_at_StockTypeNames; ->STK_at_StockTypeCodes)
		
		
		LB_SetColumnHeaders(->STK_LB_StockTypes; "ST_L"; 1; "Include"; "Name")
		
		
		LB_SetColumnWidths(->STK_LB_StockTypes; "oABR"; 1; 20; 80; 0)
		
		LB_SetEnterable(->STK_LB_StockTypes; False:C215; 0)
		LB_SetEnterable(->STK_LB_StockTypes; True:C214; 1)
		
		LB_SetScroll(->STK_LB_StockTypes; -3; -2)
		
		LB_StyleSettings(->STK_LB_StockTypes; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
		
		
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_d_MoveDateF:=vMoveDateF
				$_d_MoveDateT:=vMoveDateT
				$_t_MoveCodeF:=vMoveCodeF
				$_t_MoveCodeT:=VMoveCodeT
				$_t_PurchCodeF:=VPurchaseCodeF
				$_t_PurchCodeT:=VPurchaseCodeT
				$_t_OrderCodeF:=VOrderCodeF
				$_t_OrderCodeT:=VOrderCodeT
				$_l_ItemNumF:=VItemNumF
				$_l_ItemNumT:=VItemNumT
				$_r_QuantityF:=VQuantityF
				$_r_QuantityT:=VQuantityT
				$_r_ValuesF:=vValuesF
				$_r_ValuesT:=vValuesT
				$_t_DeliveryReferenceF:=vDeliveryReferenceF
				$_t_DeliveryReferenceT:=vDeliveryReferenceT
				$_d_DeliveryDateF:=vDeliveryDateF
				$_d_DeliveryDateT:=vDeliveryDateT
				$_bo_CBRetained:=STK_bo_CBRetained
				$_t_CompanyCode:=VcompCode
				$_t_ProductCode:=VprodCode
				$_t_SerialNumber:=VserialNo
				
				COPY ARRAY:C226(STK_abo_MoveTypeINC; $_abo_MoveTypeINC)
				COPY ARRAY:C226(STK_abo_StockTypeINC; $_abo_StockTypeINC)
				COPY ARRAY:C226(STK_at_MoveTypeCodes; $_at_MoveTypeCodes)
				COPY ARRAY:C226(STK_at_MoveTypeNames; $_at_MoveTypeNames)
				COPY ARRAY:C226(STK_at_StockTypeNames; $_at_StockTypeNames)
				COPY ARRAY:C226(STK_at_StockTypeCodes; $_at_StockTypeCodes)
				
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarStockItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				OBJECT GET COORDINATES:C663(*; "oSTITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
				
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				
				
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Stock_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Stock_SelLP(-1; SM_l_QueryMode; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(61)
				SM_LoadSearchParameterNames(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); SM_l_QueryMode)
				vMoveDateF:=$_d_MoveDateF
				vMoveDateT:=$_d_MoveDateT
				vMoveCodeF:=$_t_MoveCodeF
				VMoveCodeT:=$_t_MoveCodeT
				VPurchaseCodeF:=$_t_PurchCodeF
				VPurchaseCodeT:=$_t_PurchCodeT
				VOrderCodeF:=$_t_OrderCodeF
				VOrderCodeT:=$_t_OrderCodeT
				VItemNumF:=$_l_ItemNumF
				VItemNumT:=$_l_ItemNumT
				VQuantityF:=$_r_QuantityF
				VQuantityT:=$_r_QuantityT
				vValuesF:=$_r_ValuesF
				vValuesT:=$_r_ValuesT
				vDeliveryReferenceF:=$_t_DeliveryReferenceF
				vDeliveryReferenceT:=$_t_DeliveryReferenceT
				vDeliveryDateF:=$_d_DeliveryDateF
				vDeliveryDateT:=$_d_DeliveryDateT
				STK_bo_CBRetained:=$_bo_CBRetained
				VcompCode:=$_t_CompanyCode
				VprodCode:=$_t_ProductCode
				VserialNo:=$_t_SerialNumber
				COPY ARRAY:C226($_at_MoveTypeCodes; STK_at_MoveTypeCodes)
				COPY ARRAY:C226($_at_MoveTypeNames; STK_at_MoveTypeNames)
				COPY ARRAY:C226($_at_StockTypeNames; STK_at_StockTypeNames)
				COPY ARRAY:C226($_at_StockTypeCodes; STK_at_StockTypeCodes)
				COPY ARRAY:C226($_abo_MoveTypeINC; STK_abo_MoveTypeINC)
				COPY ARRAY:C226($_abo_StockTypeINC; STK_abo_StockTypeINC)
				
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				
				OBJECT MOVE:C664(*; "oSideBarStockItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
				OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
				OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
				OBJECT MOVE:C664(*; "oNoAutonWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoAutonWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
				OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
				OBJECT MOVE:C664(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
				OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
				OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
				OBJECT MOVE:C664(*; "oSTITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
				SM_LoadSearchParameterNames(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
				End if 
				If (Not:C34(SRCH_bo_ShowHold))
					OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
				End if 
			End if 
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[STOCK_MOVEMENT_ITEMS:27])
			
		End if 
		<>WS_Search_Message:=0
		
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dItems_Sel"; $_t_oldMethodName)
