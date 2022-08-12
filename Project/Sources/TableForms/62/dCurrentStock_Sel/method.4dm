If (False:C215)
	//Table Form Method Name: [CURRENT_STOCK]dCurrentStock_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 13:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY LONGINT(STK_al_TabsOffset;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(STK_at_CurSearchTab;0)
	C_BOOLEAN:C305($_bo_ShowHold; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AnalysisBottom; $_l_AnalysisLabelBottom; $_l_AnalysisLabelLeft; $_l_AnalysisLabelRight; $_l_AnalysisLabelTop; $_l_AnalysislLeft; $_l_AnalysisRight; $_l_AnalysisTop; $_l_bestHeight; $_l_bestWidth)
	C_LONGINT:C283($_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_CurrencyBottom; $_l_CurrencyLabelBottom; $_l_CurrencyLabelLeft)
	C_LONGINT:C283($_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight; $_l_CurrencyTop; $_l_defaultparams; $_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop)
	C_LONGINT:C283($_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight)
	C_LONGINT:C283($_l_inselectLabelTop; $_l_ItemNum; $_l_LayerBottom; $_l_LayerLabelBottom; $_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight; $_l_LayerTop; $_l_NAA)
	C_LONGINT:C283($_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop)
	C_LONGINT:C283($_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop)
	C_LONGINT:C283($_l_OK; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_SerialBottom)
	C_LONGINT:C283($_l_SerialLeft; $_l_SerialRight; $_l_SerialTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_StockCount; $_l_TabsWidth)
	C_LONGINT:C283($_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; cNAA; cNAL; cSIS; rHold; SM_l_QueryMode; SM_l_QuerySearchID)
	C_LONGINT:C283(SRCH_l_MinWidth; VItemNum; xCancel; xOK)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginPF; $_r_MarginPT; $_r_MarginT; vAmountF; VamountT; vMarginF; vMarginPF; VmarginPT)
	C_REAL:C285(VMarginT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; $_t_SerialNo; $_t_Type; ACC_t_CurrencyCode)
	C_TEXT:C284(dbtabText2; Vanalysis; Vlayer; Vlocation; VorderCode; VprodCode; VSerialNo; Vtype)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CURRENT_STOCK].dCurrentStock_Sel"; Form event code:C388)

Sel_LProc2(->[CURRENT_STOCK:62])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		SET MENU BAR:C67(67)
		OpenHelp(Table:C252(->[CURRENT_STOCK:62]); "dCurrentStock_Sel")
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		ARRAY TEXT:C222(STK_at_CurSearchTab; 0)
		ARRAY LONGINT:C221(STK_al_TabsOffset; 0)
		APPEND TO ARRAY:C911(STK_at_CurSearchTab; "Current Stock")
		APPEND TO ARRAY:C911(STK_al_TabsOffset; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
			APPEND TO ARRAY:C911(STK_at_CurSearchTab; "Products")
			APPEND TO ARRAY:C911(STK_al_TabsOffset; 1)
		End if 
		
		STK_at_CurSearchTab:=1
		
		SM_LoadSearchParameterNames(Table:C252(->[CURRENT_STOCK:62]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		rHold:=0
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Products"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)<2)
			DB_MenuAction("Find"; "Products"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[CURRENT_STOCK:62]); <>PER_l_CurrentUserID)
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
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(STK_at_CurSearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
		SD2_SetDiaryPopup
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_StockCount)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Serial_Number:2#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_StockCount=0)
			OBJECT SET VISIBLE:C603(*; "oSerialNo@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_StockCount)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Location:8#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_StockCount=0)
			OBJECT SET VISIBLE:C603(*; "oLocation@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_StockCount)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_StockCount=0)
			OBJECT SET VISIBLE:C603(*; "oAnalysis@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_StockCount)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11#""; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11#<>SYS_t_BaseCurrency; *)
		
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_StockCount=0)
			OBJECT SET VISIBLE:C603(*; "oCurrency@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_StockCount)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_StockCount=0)
			OBJECT SET VISIBLE:C603(*; "oLayer@"; False:C215)
		End if 
		If (vAmountF=0)
			OBJECT SET VISIBLE:C603(*; "oQuantiyT"; False:C215)
		End if 
		If (vMarginF=0)
			OBJECT SET VISIBLE:C603(*; "oCostPriceT"; False:C215)
		End if 
		If (vMarginPF=0)
			OBJECT SET VISIBLE:C603(*; "oCostTotalT"; False:C215)
		End if 
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(STK_at_CurSearchTab))
			dbtabText2:=dbtabText2+STK_at_CurSearchTab{$_l_TabsWidth}+(" "*8)
		End for 
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=592
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=592)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=592
				SRCH_l_MinWidth:=592
			End if 
		End if 
		WS_AutoscreenSize(2; 303; $_l_TotalWidth)
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->VamountF))
				If (VamountF#0)
					If (VamountT<VamountF)
						VamountT:=VamountF
					End if 
					OBJECT SET VISIBLE:C603(*; "oQuantiyT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VamountT))
				If (VamountT<VamountF)
					VamountF:=VamountT
				End if 
			: ($_ptr_FocusObject=(->VMarginF))
				If (VMarginF#0)
					If (VMarginT<VMarginF)
						VMarginT:=VMarginF
					End if 
					OBJECT SET VISIBLE:C603(*; "oCostPriceT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VMarginT))
				If (VMarginT<VMarginF)
					VMarginF:=VMarginT
				End if 
			: ($_ptr_FocusObject=(->VmarginPF))
				If (VmarginPF#0)
					If (VmarginPT<VmarginPF)
						VmarginPT:=VmarginPF
					End if 
					OBJECT SET VISIBLE:C603(*; "oCostTotalT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VmarginPT))
				If (VmarginPT<VmarginPF)
					VmarginPF:=VmarginPT
				End if 
		End case 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_ProductCode:=VprodCode
				$_t_SerialNo:=VSerialNo
				$_t_Type:=Vtype
				$_t_Location:=Vlocation
				$_t_AnalysisCode:=Vanalysis
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_t_LayerCode:=Vlayer
				$_t_OrderCode:=VorderCode
				$_l_ItemNum:=VItemNum
				$_r_AmountFrom:=VamountF
				$_r_AmountTo:=VamountT
				$_r_MarginF:=vmarginF
				$_r_MarginT:=vmarginT
				$_r_MarginPF:=vmarginPF
				$_r_MarginPT:=vmarginPT
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CURRENT_STOCK:62]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[CURRENT_STOCK:62]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				OBJECT GET COORDINATES:C663(*; "oSideBarCurrentStock"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oAnalysis"; $_l_AnalysislLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom)
				OBJECT GET COORDINATES:C663(*; "oAnalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom)
				OBJECT GET COORDINATES:C663(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom)
				OBJECT GET COORDINATES:C663(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oSerialNo"; $_l_SerialLeft; $_l_SerialTop; $_l_SerialRight; $_l_SerialBottom)
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				
				
				If (SM_l_QueryMode=0)
					$_l_OK:=StockCurr_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=StockCurr_SelLP(-1; SM_l_QueryMode; Table:C252(->[CURRENT_STOCK:62]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(67)
				SM_LoadSearchParameterNames(Table:C252(->[CURRENT_STOCK:62]); SM_l_QueryMode)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				OBJECT MOVE:C664(*; "oSideBarCurrentStock"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oAnalysis"; $_l_AnalysislLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom; *)
				OBJECT MOVE:C664(*; "oAnalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom; *)
				OBJECT MOVE:C664(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom; *)
				OBJECT MOVE:C664(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom; *)
				OBJECT MOVE:C664(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom; *)
				OBJECT MOVE:C664(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom; *)
				OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
				OBJECT MOVE:C664(*; "oSerialNo"; $_l_SerialLeft; $_l_SerialTop; $_l_SerialRight; $_l_SerialBottom; *)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				vprodCode:=$_t_ProductCode
				vSerialNo:=$_t_SerialNo
				vType:=$_t_Type
				vLocation:=$_t_Location
				vanalysis:=$_t_AnalysisCode
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				vLayer:=$_t_LayerCode
				vOrderCode:=$_t_OrderCode
				vItemNum:=$_l_ItemNum
				vamountF:=$_r_AmountFrom
				vamountT:=$_r_AmountTo
				vMarginF:=$_r_MarginF
				vMarginT:=$_r_MarginT
				vMarginPF:=$_r_MarginPF
				vMarginPT:=$_r_MarginPT
				cSIS:=cSIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
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
End case 
ERR_MethodTrackerReturn("FM:dCurrentStock_Sel"; $_t_oldMethodName)
