If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]dItems_Sel.oSTITabChoices
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
	C_BOOLEAN:C305($_bo_CBRetained; $_bo_ShowHold; SRCH_bo_Pathinited; SRCH_bo_ShowHold; STK_bo_CBRetained; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DeliveryDateF; $_d_DeliveryDateT; $_d_MoveDateFrom; $_d_MoveDateTo; vDeliveryDateF; vDeliveryDateT; vMoveDateF; vMoveDateT)
	C_LONGINT:C283($_l_AQLabelBottom; $_l_AQLabelLeft; $_l_AQLabelRight; $_l_AQLabelTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight)
	C_LONGINT:C283($_l_ContinueButtonTop; $_l_CustomBottom; $_l_CustomLeft; $_l_CustomRight; $_l_CustomTop; $_l_FromLabeBottom; $_l_FromLabeLeft; $_l_FromLabeRight; $_l_FromLabeTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft)
	C_LONGINT:C283($_l_FromnoVarRight; $_l_FromnoVarTop; $_l_HoldBottom; $_l_HoldCBBottom; $_l_HoldCBLeft; $_l_HoldCBRight; $_l_HoldCBTop; $_l_HoldLeft; $_l_HoldRight; $_l_HoldTop; $_l_inselectButtonBottom)
	C_LONGINT:C283($_l_inselectButtonLeft; $_l_inselectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_ItemNumF; $_l_ItemNumT; $_l_LoadLabelBottom; $_l_LoadLabelLeft)
	C_LONGINT:C283($_l_LoadLabelRight; $_l_LoadLabelTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight)
	C_LONGINT:C283($_l_NoLookupLabelTop; $_l_NowildButtonBottom; $_l_NowildButtonLeft; $_l_NowildButtonRight; $_l_NowildButtonTop; $_l_NowildLabelBottom; $_l_NowildLabelLeft; $_l_NowildLabelRight; $_l_NowildLabelTop; $_l_OK; $_l_QueryDDBottom)
	C_LONGINT:C283($_l_QueryDDLeft; $_l_QueryDDRight; $_l_QueryDDTop; $_l_QueryMode; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TabBottom)
	C_LONGINT:C283($_l_TabLeft; $_l_TabRight; $_l_TabTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; cNAA; cNAL; cSIS; rHold)
	C_LONGINT:C283(SM_l_QueryMode; SRCH_l_MinWidth; VItemNumF; VItemNumT)
	C_REAL:C285($_r_QuantityF; $_r_QuantityT; $_r_ValuesF; $_r_ValuesT; VQuantityF; VQuantityT; vValuesF; vValuesT)
	C_TEXT:C284($_t_CompanyCode; $_t_DeliveryReferenceF; $_t_DeliveryReferenceT; $_t_MoveCodeFrom; $_t_MoveCodeTo; $_t_oldMethodName; $_t_OrderCodeF; $_t_OrderCodeT; $_t_ProductCode; $_t_PurchaseCodeF; $_t_PurchaseCodeT)
	C_TEXT:C284($_t_SerialNumber; VcompCode; vDeliveryReferenceF; vDeliveryReferenceT; vMoveCodeF; VMoveCodeT; VOrderCodeF; VOrderCodeT; VprodCode; VPurchaseCodeF; VPurchaseCodeT)
	C_TEXT:C284(VserialNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.oSTITabChoices"; Form event code:C388)

If (STK_al_TabOffset{STK_at_SearchItemTab}>0)
	$_d_MoveDateFrom:=vMoveDateF
	$_d_MoveDateTo:=vMoveDateT
	$_t_MoveCodeFrom:=vMoveCodeF
	$_t_MoveCodeTo:=VMoveCodeT
	$_t_PurchaseCodeF:=VPurchaseCodeF
	$_t_PurchaseCodeT:=VPurchaseCodeT
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
	COPY ARRAY:C226(STK_at_MoveTypeCodes; $_at_MoveTypeCodes)
	COPY ARRAY:C226(STK_at_MoveTypeNames; $_at_MoveTypeNames)
	COPY ARRAY:C226(STK_at_StockTypeNames; $_at_StockTypeNames)
	COPY ARRAY:C226(STK_at_StockTypeCodes; $_at_StockTypeCodes)
	COPY ARRAY:C226(STK_abo_MoveTypeINC; $_abo_MoveTypeINC)
	COPY ARRAY:C226(STK_abo_StockTypeINC; $_abo_StockTypeINC)
	
	
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_AQLabelLeft; $_l_AQLabelTop; $_l_AQLabelRight; $_l_AQLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarStockItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
	OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NowildButtonLeft; $_l_NowildButtonTop; $_l_NowildButtonRight; $_l_NowildButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NowildLabelLeft; $_l_NowildLabelTop; $_l_NowildLabelRight; $_l_NowildLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inselectButtonRight; $_l_inselectButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_HoldCBLeft; $_l_HoldCBTop; $_l_HoldCBRight; $_l_HoldCBBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_HoldLeft; $_l_HoldTop; $_l_HoldRight; $_l_HoldBottom)
	OBJECT GET COORDINATES:C663(*; "oSTITabChoices"; $_l_TabLeft; $_l_TabTop; $_l_TabRight; $_l_TabBottom)
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_QueryDDLeft; $_l_QueryDDTop; $_l_QueryDDRight; $_l_QueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_LoadLabelLeft; $_l_LoadLabelTop; $_l_LoadLabelRight; $_l_LoadLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabeLeft; $_l_FromLabeTop; $_l_FromLabeRight; $_l_FromLabeBottom)
	
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_CustomLeft; $_l_CustomTop; $_l_CustomRight; $_l_CustomBottom)
	
	
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
	//TRACE
	If (SM_l_QueryMode=0)
		$_l_OK:=Stock_SelLP(STK_al_TabOffset{STK_at_SearchItemTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Stock_SelLP(STK_al_TabOffset{STK_at_SearchItemTab}; SM_l_QueryMode; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_AQLabelLeft; $_l_AQLabelTop; $_l_AQLabelRight; $_l_AQLabelBottom; *)
	
	OBJECT MOVE:C664(*; "oSideBarStockItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
	OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
	OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
	OBJECT MOVE:C664(*; "oNoAutonWildcardCheckbox"; $_l_NowildButtonLeft; $_l_NowildButtonTop; $_l_NowildButtonRight; $_l_NowildButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoAutonWildcardLabel"; $_l_NowildLabelLeft; $_l_NowildLabelTop; $_l_NowildLabelRight; $_l_NowildLabelBottom; *)
	OBJECT MOVE:C664(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inselectButtonRight; $_l_inselectButtonBottom; *)
	OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
	OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_HoldCBLeft; $_l_HoldCBTop; $_l_HoldCBRight; $_l_HoldCBBottom; *)
	OBJECT MOVE:C664(*; "oHoldText"; $_l_HoldLeft; $_l_HoldTop; $_l_HoldRight; $_l_HoldBottom; *)
	OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_QueryDDLeft; $_l_QueryDDTop; $_l_QueryDDRight; $_l_QueryDDBottom; *)
	OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_LoadLabelLeft; $_l_LoadLabelTop; $_l_LoadLabelRight; $_l_LoadLabelBottom; *)
	OBJECT MOVE:C664(*; "oSTITabChoices"; $_l_TabLeft; $_l_TabTop; $_l_TabRight; $_l_TabBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabeLeft; $_l_FromLabeTop; $_l_FromLabeRight; $_l_FromLabeBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_CustomLeft; $_l_CustomTop; $_l_CustomRight; $_l_CustomBottom; *)
	SM_LoadSearchParameterNames(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); SM_l_QueryMode)
	SRCH_bo_ShowHold:=$_bo_ShowHold
	$_d_MoveDateFrom:=vMoveDateF
	$_d_MoveDateTo:=vMoveDateT
	$_t_MoveCodeFrom:=vMoveCodeF
	$_t_MoveCodeTo:=VMoveCodeT
	$_t_PurchaseCodeF:=VPurchaseCodeF
	$_t_PurchaseCodeT:=VPurchaseCodeT
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
	COPY ARRAY:C226($_at_MoveTypeCodes; STK_at_MoveTypeCodes)
	COPY ARRAY:C226($_at_MoveTypeNames; STK_at_MoveTypeNames)
	COPY ARRAY:C226($_at_StockTypeNames; STK_at_StockTypeNames)
	COPY ARRAY:C226($_at_StockTypeCodes; STK_at_StockTypeCodes)
	COPY ARRAY:C226($_abo_MoveTypeINC; STK_abo_MoveTypeINC)
	COPY ARRAY:C226($_abo_StockTypeINC; STK_abo_StockTypeINC)
	
	
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	//TRACE
	If ($_l_OK>0) & (Not:C34(rHold=1))
		
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
	End if 
	rHold:=0
End if 
STK_at_SearchItemTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.oSTITabChoices"; $_t_oldMethodName)
