If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oORDTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Ord_abo_Include;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORD_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORD_at_TabChoices;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VeDateToSet; $_bo_VfDateToSet; $_bo_ViDateToSet; $_bo_VRDateToSet; $_bo_VsDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VeDateToSet; SRCH_bo_VfDateToSet; SRCH_bo_ViDateToSet)
	C_BOOLEAN:C305(SRCH_bo_VRDateToSet; SRCH_bo_VsDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_eDateFBase; $_d_eDateTBase; $_d_EntryDateFrom; $_d_EntryDateTo; $_d_fDateF; $_d_fDateFBase; $_d_fDateT; $_d_fDateTBase; $_d_FromBase; $_d_iDateTBase; $_d_LDateF)
	C_DATE:C307($_d_lDateT; $_d_RDateF; $_d_rDateFBase; $_d_RDateT; $_d_rdateTBase; $_d_SDateF; $_d_sDateFBase; $_d_SDateT; $_d_sDateTBase; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_DATE:C307(SRCH_d_FromBase; SRCH_d_rdateTBase; VedateFBASE; VedateTBASE; VFDateF; VfdateFBASE; VFDateT; VfdateTBASE; viDateF; ViDateT; VidateTBASE)
	C_DATE:C307(VRDateF; VRdateFBASE; VRDateT; VsDateF; VsdateFBASE; VsDateT; VsdateTBASE)
	C_LONGINT:C283($_l_AnalysisBottom; $_l_AnalysisLabelBottom; $_l_AnalysisLabelLeft; $_l_AnalysisLabelRight; $_l_AnalysisLabelTop; $_l_AnalysisLeft; $_l_AnalysisRight; $_l_AnalysisTop; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft)
	C_LONGINT:C283($_l_AreaLabelRight; $_l_AreaLabelTop; $_l_AreaLeft; $_l_AreaRight; $_l_AreaTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CompanyBottom; $_l_CompanyLeft)
	C_LONGINT:C283($_l_CompanyRight; $_l_CompanyTop; $_l_ContactBottom; $_l_ContactLeft; $_l_ContactRight; $_l_ContactTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd)
	C_LONGINT:C283($_l_cSetMod; $_l_CurrencyBottom; $_l_CurrencyLabelBottom; $_l_CurrencyLabelLeft; $_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight; $_l_CurrencyTop; $_l_EntryDateFromOffset; $_l_EntryDateToOffset)
	C_LONGINT:C283($_l_fDateFOffset; $_l_fDateToOffset; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_iDateFOffset)
	C_LONGINT:C283($_l_iDateToOffset; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_LayerBottom)
	C_LONGINT:C283($_l_LayerLabelBottom; $_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight; $_l_LayerTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom)
	C_LONGINT:C283($_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight)
	C_LONGINT:C283($_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight)
	C_LONGINT:C283($_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_ProductBottom; $_l_ProductLeft; $_l_ProductRight)
	C_LONGINT:C283($_l_ProductTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_rDateToOffset; $_l_sDateFOffset; $_l_sDateToOffset; $_l_SideBarBottom; $_l_SideBarLeft)
	C_LONGINT:C283($_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_StatesBottom; $_l_StatesLeft; $_l_StatesRight; $_l_StatesTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; cNAA; cNAL; cSetAdd; cSetMod; cSIS; rHold)
	C_LONGINT:C283(SM_l_QueryMode; SRCH_l_MinWidth; VFDateFOffset; VFDateTOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VSDateFOffset; VSDateTOffset)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginPF; $_r_MarginPT; $_r_MarginT; VamountF; VamountT; VMarginF; vMarginPF; vMarginPT)
	C_REAL:C285(VMarginT)
	C_TEXT:C284($_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalysisCode; $_t_Area; $_t_AttendType; $_t_Comments; $_t_CompanyCode; $_t_CompName; $_t_ContactName; $_t_ContCode; $_t_CurrencyCode)
	C_TEXT:C284($_t_Enclosures; $_t_Event; $_t_ForeName; $_t_LayerCode; $_t_oldMethodName; $_t_OrderCode; $_t_OrderNo; $_t_ProductCode; $_t_Sales; $_t_Source; $_t_Surname)
	C_TEXT:C284($_t_Telephone; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; Vanalysis; vArea; VattendType; VComments; VCompCode; VCompName; VcontactName)
	C_TEXT:C284(VcontCode; vEnclosures; vEvent; VForename; vLayer; VorderCode; vOrderNo; vProdCode; VSales; Vsource; VSurname)
	C_TEXT:C284(vTele)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oORDTabChoices"; Form event code:C388)
If (ORD_al_coTabChoices{ORD_at_TabChoices}>0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	$_t_CompanyCode:=VCompCode
	$_t_CompName:=VCompName
	$_t_ContCode:=VcontCode
	$_t_ForeName:=VForename
	$_t_Surname:=VSurname
	$_t_OrderCode:=VorderCode
	$_t_Sales:=VSales
	$_t_AttendType:=VattendType
	$_t_Source:=Vsource
	$_d_EntryDateFrom:=ACC_d_EntryDateFrom
	$_d_EntryDateTo:=SRCH_d_EntryDateTo
	$_d_SDateF:=VsDateF
	$_d_SDateT:=VsDateT
	$_d_LDateF:=viDateF
	$_d_lDateT:=ViDateT
	$_t_AccPeriodFrom:=ACC_t_PeriodFrom
	$_t_AccPeriodTo:=ACC_t_PeriodTo
	$_d_fDateF:=VFDateF
	$_d_fDateT:=VFDateT
	$_d_RDateF:=VRDateF
	$_d_RDateT:=VRDateT
	$_d_EntryDateFrom:=ACC_d_EntryDateFrom
	$_r_AmountTo:=VamountT
	$_r_AmountFrom:=VamountF
	$_r_MarginF:=VMarginF
	$_r_MarginT:=VMarginT
	$_r_MarginPF:=vMarginPF
	$_r_MarginPT:=vMarginPT
	
	$_t_Comments:=VComments
	
	$_t_Enclosures:=vEnclosures
	$_t_OrderNo:=vOrderNo
	$_t_Telephone:=vTele
	$_t_ProductCode:=vProdCode
	$_t_Event:=vEvent
	$_t_Area:=vArea
	$_t_AnalysisCode:=Vanalysis
	$_t_CurrencyCode:=ACC_t_CurrencyCode
	$_t_LayerCode:=vLayer
	$_l_PeriodToOffset:=ACC_l_PeriodToOffset
	$_l_PeriodFromOffset:=ACC_l_PeriodFromOffset
	$_t_ContactName:=VcontactName
	$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
	$_l_sDateFOffset:=VSDateFOffset
	$_l_iDateFOffset:=ViDateFOffset
	$_l_fDateFOffset:=VFDateFOffset
	$_l_fDateFOffset:=VRDateFOffset
	$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
	$_l_sDateToOffset:=VSDateTOffset
	$_l_iDateToOffset:=ViDateTOffset
	$_l_fDateToOffset:=VFDateTOffset
	$_l_rDateToOffset:=VRDateTOffset
	COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
	COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_cSetAdd:=cSetAdd
	$_l_cSetMod:=cSetMod
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	OBJECT GET COORDINATES:C663(*; "oORDTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	OBJECT GET COORDINATES:C663(*; "oSideBarOrders"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom)
	OBJECT GET COORDINATES:C663(*; "oContactName"; $_l_ContactLeft; $_l_ContactTop; $_l_ContactRight; $_l_ContactBottom)
	OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductLeft; $_l_ProductTop; $_l_ProductRight; $_l_ProductBottom)
	OBJECT GET COORDINATES:C663(*; "oOrderStatesListbox"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom)
	OBJECT GET COORDINATES:C663(*; "oanalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom)
	OBJECT GET COORDINATES:C663(*; "oanalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom)
	OBJECT GET COORDINATES:C663(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom)
	OBJECT GET COORDINATES:C663(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom)
	
	
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_eDateFBase:=VedateFBASE
	$_d_eDateTBase:=VedateTBASE
	$_d_sDateFBase:=VsdateFBASE
	$_d_sDateTBase:=VsdateTBASE
	$_d_fDateFBase:=VfdateFBASE
	$_d_fDateTBase:=VfdateTBASE
	$_d_FromBase:=SRCH_d_FromBase
	$_d_iDateTBase:=VidateTBASE
	$_d_rDateFBase:=VRdateFBASE
	$_d_rdateTBase:=SRCH_d_rdateTBase
	$_bo_VeDateToSet:=SRCH_bo_VeDateToSet
	$_bo_VsDateToSet:=SRCH_bo_VsDateToSet
	$_bo_VfDateToSet:=SRCH_bo_VfDateToSet
	$_bo_ViDateToSet:=SRCH_bo_ViDateToSet
	$_bo_VRDateToSet:=SRCH_bo_VRDateToSet
	
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	
	
	If (SM_l_QueryMode=0)
		$_l_OK:=Orders_SelLP(ORD_al_coTabChoices{ORD_at_TabChoices})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Orders_SelLP(ORD_al_coTabChoices{ORD_at_TabChoices}; SM_l_QueryMode; Table:C252(->[ORDERS:24]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	VedateFBASE:=$_d_eDateFBase
	VedateTBASE:=$_d_eDateTBase
	VsdateFBASE:=$_d_sDateFBase
	VsdateTBASE:=$_d_sDateTBase
	VfdateFBASE:=$_d_fDateFBase
	VfdateTBASE:=$_d_fDateTBase
	SRCH_d_FromBase:=$_d_FromBase
	VidateTBASE:=$_d_iDateTBase
	VRdateFBASE:=$_d_rDateFBase
	SRCH_d_rdateTBase:=$_d_rdateTBase
	SRCH_bo_VeDateToSet:=$_bo_VeDateToSet
	SRCH_bo_VsDateToSet:=$_bo_VsDateToSet
	SRCH_bo_VfDateToSet:=$_bo_VfDateToSet
	SRCH_bo_ViDateToSet:=$_bo_ViDateToSet
	SRCH_bo_VRDateToSet:=$_bo_VRDateToSet
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	OBJECT MOVE:C664(*; "oORDTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oSideBarOrders"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
	OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
	OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
	OBJECT MOVE:C664(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
	OBJECT MOVE:C664(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
	OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
	OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
	OBJECT MOVE:C664(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
	OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
	OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	OBJECT MOVE:C664(*; "oCompanyName"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
	OBJECT MOVE:C664(*; "oContactName"; $_l_ContactLeft; $_l_ContactTop; $_l_ContactRight; $_l_ContactBottom; *)
	OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductLeft; $_l_ProductTop; $_l_ProductRight; $_l_ProductBottom; *)
	OBJECT MOVE:C664(*; "oOrderStatesListbox"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom; *)
	OBJECT MOVE:C664(*; "oanalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom; *)
	OBJECT MOVE:C664(*; "oanalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom; *)
	OBJECT MOVE:C664(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom; *)
	OBJECT MOVE:C664(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom; *)
	OBJECT MOVE:C664(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom; *)
	OBJECT MOVE:C664(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom; *)
	OBJECT MOVE:C664(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom; *)
	OBJECT MOVE:C664(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom; *)
	ARRAY BOOLEAN:C223(Ord_abo_Include; 0)
	ARRAY BOOLEAN:C223(Ord_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
	For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
		Ord_abo_Include{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
	End for 
	SRCH_bo_ShowHold:=$_bo_ShowHold
	SM_LoadSearchParameterNames(Table:C252(->[ORDERS:24]); SM_l_QueryMode)
	
	vCOmpCOde:=$_t_CompanyCode
	vCompName:=$_t_CompName
	vCOntCode:=$_t_ContCode
	vForename:=$_t_ForeName
	vSurname:=$_t_Surname
	vOrderCode:=$_t_OrderCode
	vSales:=$_t_Sales
	vAttendTYPE:=$_t_AttendType
	vSource:=$_t_Source
	ACC_d_EntryDateFrom:=$_d_EntryDateFrom
	SRCH_d_EntryDateTo:=$_d_EntryDateTo
	vsDateF:=$_d_SDateF
	vsDateT:=$_d_SDateT
	viDateF:=$_d_LDateF
	viDateT:=$_d_lDateT
	ACC_t_PeriodFrom:=$_t_AccPeriodFrom
	ACC_t_PeriodTo:=$_t_AccPeriodTo
	vFDateF:=$_d_fDateF
	vFDateT:=$_d_fDateT
	vRDateF:=$_d_RDateF
	vRDateT:=$_d_RDateT
	ACC_d_EntryDateFrom:=$_d_EntryDateFrom
	vAmountT:=$_r_AmountTo
	vAmountF:=$_r_AmountFrom
	vMarginF:=$_r_MarginF
	vMarginT:=$_r_MarginT
	
	vMarginPF:=$_r_MarginPF
	
	vMarginPT:=$_r_MarginPT
	vcomments:=$_t_Comments
	vEnclosures:=$_t_Enclosures
	
	vOrderNo:=$_t_OrderNo
	vTele:=$_t_Telephone
	vProdCode:=$_t_ProductCode
	vEvent:=$_t_Event
	vArea:=$_t_Area
	vanalysis:=$_t_AnalysisCode
	ACC_t_CurrencyCode:=$_t_CurrencyCode
	vLayer:=$_t_LayerCode
	ACC_l_PeriodToOffset:=$_l_PeriodToOffset
	ACC_l_PeriodFromOffset:=$_l_PeriodFromOffset
	VcontactName:=$_t_ContactName
	
	ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
	VSDateFOffset:=$_l_sDateFOffset
	ViDateFOffset:=$_l_iDateFOffset
	VFDateFOffset:=$_l_fDateFOffset
	VRDateFOffset:=$_l_fDateFOffset
	ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
	VSDateTOffset:=$_l_sDateToOffset
	ViDateTOffset:=$_l_iDateToOffset
	VFDateTOffset:=$_l_fDateToOffset
	VRDateTOffset:=$_l_rDateToOffset
	COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
	COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	cSetAdd:=$_l_cSetAdd
	cSetMod:=$_l_cSetMod
	
	If ($_l_OK>0) & (Not:C34(rHold=1))
		
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
	End if 
	
	ORD_at_TabChoices:=1
	rhold:=0
	
End if 
ORD_at_TabChoices:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oORDTabChoices"; $_t_oldMethodName)
