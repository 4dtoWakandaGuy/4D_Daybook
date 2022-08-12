If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oINVTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 20:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(INV_al_TabOffset;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(INV_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDoDateToSet; $_bo_VDSDateToSet; $_bo_ViDateToSet; $_bo_VRDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_ViDateToSet; SRCH_bo_VRDateToSet; SRCH_bo_VSDateToSet)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DoDateF; $_d_DodateFBase; $_d_DoDateT; $_d_FromBase; $_d_LDateF; $_d_lDateT; $_d_RDateF; $_d_RDateT; $_d_rdateTBase; $_d_SDateF; $_d_SDateT)
	C_DATE:C307($_d_sdateTBASE; SRCH_d_DodateFBase; SRCH_d_FromBase; SRCH_d_rdateTBase; VDoDateF; VDoDateT; VIdateBASE; viDateF; viDateT; VRdateF; VRDateT)
	C_DATE:C307(vSDateF; vSDateT; VsdateTBASE)
	C_LONGINT:C283($_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight; $_l_AreaLabelTop; $_l_AreaLeft; $_l_AreaRight; $_l_AreaTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight)
	C_LONGINT:C283($_l_CancelButtonTop; $_l_CH0; $_l_CH0Bottom; $_l_CH0Left; $_l_CH0Right; $_l_CH0Top; $_l_ch1; $_l_CH1Bottom; $_l_CH1Left; $_l_CH1Right; $_l_CH1Top)
	C_LONGINT:C283($_l_ch2; $_l_CH2Bottom; $_l_CH2Left; $_l_CH2Right; $_l_CH2Top; $_l_ch3; $_l_CH3Bottom; $_l_CH3Left; $_l_CH3Right; $_l_CH3Top; $_l_Ch4)
	C_LONGINT:C283($_l_CH4Bottom; $_l_CH4Left; $_l_CH4Right; $_l_CH4Top; $_l_Ch5; $_l_CH5Bottom; $_l_CH5Left; $_l_CH5Right; $_l_CH5Top; $_l_Ch6; $_l_CH6Bottom)
	C_LONGINT:C283($_l_CH6Left; $_l_CH6Right; $_l_CH6Top; $_l_Ch7; $_l_CH7Bottom; $_l_CH7Left; $_l_CH7Right; $_l_CH7Top; $_l_Ch8; $_l_CH8Bottom; $_l_CH8Left)
	C_LONGINT:C283($_l_CH8Right; $_l_CH8Top; $_l_CompanyBottom; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContactBottom; $_l_ContactLeft; $_l_ContactRight; $_l_ContactTop; $_l_ContinueButtonBottom)
	C_LONGINT:C283($_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_CurrencyBottom; $_l_CurrencyLabelBottom; $_l_CurrencyLabelLeft; $_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight; $_l_CurrencyTop)
	C_LONGINT:C283($_l_DoDateFOffset; $_l_DoDateTOffset; $_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop)
	C_LONGINT:C283($_l_iDateFOffset; $_l_iDateTOffset; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_LayerBottom)
	C_LONGINT:C283($_l_LayerLabelBottom; $_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight; $_l_LayerTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom)
	C_LONGINT:C283($_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight)
	C_LONGINT:C283($_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight)
	C_LONGINT:C283($_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft)
	C_LONGINT:C283($_l_QULabelRIght; $_l_QULabelTop; $_l_r0; $_l_r1; $_l_RDateFOffset; $_l_RDateTOffset; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight)
	C_LONGINT:C283($_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CH0; CH1)
	C_LONGINT:C283(CH2; CH3; CH4; CH5; CH6; CH7; CH8; cNAA; cNAL; cSIS; r0)
	C_LONGINT:C283(r1; rHold; SM_l_QueryMode; SRCH_l_MinWidth; VDoDateFOffset; VDoDatetOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VsDateFOffset)
	C_LONGINT:C283(VsDatetOffset)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ChargesF; $_r_ChargesT; $_r_DueF; $_r_DueTo; $_r_invF; $_r_invT; VamountF; VamountT; VChargesF)
	C_REAL:C285(VChargesT; VDueF; VDueTo; VinvF; VInvT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalCodeT; $_t_AnalysisCodeF; $_t_Area; $_t_CompanyCode; $_t_CompName; $_t_ContactName; $_t_ContCode)
	C_TEXT:C284($_t_CurrencyCode; $_t_event; $_t_ForeName; $_t_InvNoF; $_t_InvNoT; $_t_Job; $_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_ProductCode; $_t_Sales)
	C_TEXT:C284($_t_Stage; $_t_Surname; $_t_Terms; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; Varea)
	C_TEXT:C284(VCompCode; VCompName; VcontactName; VContCode; Vevent; VForename; VInvNoF; VInvNoT; VJob; Vlayer; Vname)
	C_TEXT:C284(VProdCode; Vsales; VStage; Vsurname; VTerms)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oINVTabChoices"; Form event code:C388)
If (INV_al_TabOffset{INV_at_SearchTab}>0)
	$_t_CompanyCode:=VCompCode
	$_t_CompName:=VCompName
	$_t_ContCode:=VContCode
	$_t_ForeName:=VForename
	$_t_Surname:=Vsurname
	$_t_InvNoF:=VInvNoF
	$_t_InvNoT:=VInvNoT
	
	$_d_LDateF:=viDateF
	$_d_lDateT:=viDateT
	$_t_AccPeriodFrom:=ACC_t_PeriodFrom
	$_t_AccPeriodTo:=ACC_t_PeriodTo
	$_t_AnalysisCodeF:=ACC_t_AnalysisCodeFrom
	$_t_AnalCodeT:=VAnalCodeT
	$_t_Stage:=VStage
	$_t_Job:=VJob
	$_d_RDateF:=VRdateF
	$_d_RDateT:=VRDateT
	$_r_invF:=VinvF
	$_r_invT:=VInvT
	$_r_ChargesF:=VChargesF
	$_r_ChargesT:=VChargesT
	$_r_DueF:=VDueF
	$_r_DueTo:=VDueTo
	$_r_AmountFrom:=VamountF
	$_r_AmountTo:=VamountT
	$_d_DoDateF:=VDoDateF
	$_d_DoDateT:=VDoDateT
	$_d_SDateF:=vSDateF
	$_d_SDateT:=vSDateT
	$_t_AccountCodeFrom:=Acc_t_AccountCodeFrom
	$_t_AccountCodeTo:=Acc_t_AccountCodeTo
	$_t_Terms:=VTerms
	$_t_ProductCode:=VProdCode
	$_t_event:=Vevent
	$_t_Name:=Vname
	$_t_Sales:=Vsales
	$_t_Area:=Varea
	$_t_CurrencyCode:=ACC_t_CurrencyCode
	$_t_LayerCode:=Vlayer
	$_l_PeriodToOffset:=ACC_l_PeriodToOffset
	$_l_PeriodFromOffset:=ACC_l_PeriodFromOffset
	$_t_ContactName:=VcontactName
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_CH0:=CH0
	$_l_ch1:=CH1
	$_l_ch2:=CH2
	$_l_ch3:=CH3
	$_l_Ch4:=CH4
	$_l_Ch5:=CH5
	$_l_Ch6:=CH6
	$_l_Ch7:=CH7
	$_l_Ch8:=CH8
	$_l_iDateFOffset:=ViDateFOffset
	$_l_RDateFOffset:=VRDateFOffset
	$_l_DoDateFOffset:=VDoDateFOffset
	$_l_sDateFOffset:=VsDateFOffset
	$_l_iDateTOffset:=ViDateTOffset
	$_l_RDateTOffset:=VRDateTOffset
	$_l_DoDateTOffset:=VDoDateTOffset
	$_l_sDatetOffset:=VsDateTOffset
	
	$_l_r0:=r0
	$_l_r1:=r1
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	OBJECT GET COORDINATES:C663(*; "oSideBarInvoices"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oINVTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom)
	OBJECT GET COORDINATES:C663(*; "oContactName"; $_l_ContactLeft; $_l_ContactTop; $_l_ContactRight; $_l_ContactBottom)
	
	
	OBJECT GET COORDINATES:C663(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH6"; $_l_CH6Left; $_l_CH6Top; $_l_CH6Right; $_l_CH6Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH7"; $_l_CH7Left; $_l_CH7Top; $_l_CH7Right; $_l_CH7Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH8"; $_l_CH8Left; $_l_CH8Top; $_l_CH8Right; $_l_CH8Bottom)
	OBJECT GET COORDINATES:C663(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom)
	OBJECT GET COORDINATES:C663(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom)
	OBJECT GET COORDINATES:C663(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oINVTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_FromBase:=SRCH_d_FromBase
	$_d_rdateTBase:=SRCH_d_rdateTBase
	$_d_DodateFBase:=SRCH_d_DodateFBase
	$_d_sdateTBASE:=VsdateTBASE
	$_bo_ViDateToSet:=SRCH_bo_ViDateToSet
	$_bo_VRDateToSet:=SRCH_bo_VRDateToSet
	$_bo_VDoDateToSet:=SRCH_bo_VDoDateToSet
	$_bo_VDSDateToSet:=SRCH_bo_VSDateToSet
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	
	If (SM_l_QueryMode=0)
		$_l_OK:=Invoices_SelLP(INV_al_TabOffset{INV_at_SearchTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		$_l_OK:=Invoices_SelLP(INV_al_TabOffset{INV_at_SearchTab}; SM_l_QueryMode; Table:C252(->[INVOICES:39]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	$_d_FromBase:=VIdateBASE
	SRCH_d_rdateTBase:=$_d_rdateTBase
	SRCH_d_DodateFBase:=$_d_DodateFBase
	VsdateTBASE:=$_d_sdateTBASE
	SRCH_bo_ViDateToSet:=$_bo_ViDateToSet
	SRCH_bo_VRDateToSet:=$_bo_VRDateToSet
	SRCH_bo_VDoDateToSet:=$_bo_VDoDateToSet
	SRCH_bo_VSDateToSet:=$_bo_VDSDateToSet
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	OBJECT MOVE:C664(*; "oSideBarInvoices"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oINVTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oCompanyName"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
	OBJECT MOVE:C664(*; "oContactName"; $_l_ContactLeft; $_l_ContactTop; $_l_ContactRight; $_l_ContactBottom; *)
	
	OBJECT MOVE:C664(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom; *)
	OBJECT MOVE:C664(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom; *)
	OBJECT MOVE:C664(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom; *)
	OBJECT MOVE:C664(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom; *)
	OBJECT MOVE:C664(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom; *)
	OBJECT MOVE:C664(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom; *)
	OBJECT MOVE:C664(*; "oCH6"; $_l_CH6Left; $_l_CH6Top; $_l_CH6Right; $_l_CH6Bottom; *)
	OBJECT MOVE:C664(*; "oCH7"; $_l_CH7Left; $_l_CH7Top; $_l_CH7Right; $_l_CH7Bottom; *)
	OBJECT MOVE:C664(*; "oCH8"; $_l_CH8Left; $_l_CH8Top; $_l_CH8Right; $_l_CH8Bottom; *)
	OBJECT MOVE:C664(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom; *)
	OBJECT MOVE:C664(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom; *)
	OBJECT MOVE:C664(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom; *)
	OBJECT MOVE:C664(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom; *)
	OBJECT MOVE:C664(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom; *)
	OBJECT MOVE:C664(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom; *)
	OBJECT MOVE:C664(*; "oINVTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	
	SM_LoadSearchParameterNames(Table:C252(->[INVOICES:39]); SM_l_QueryMode)
	SRCH_bo_ShowHold:=$_bo_ShowHold
	vCompCode:=$_t_CompanyCode
	vCompName:=$_t_CompName
	vContCode:=$_t_ContCode
	vForename:=$_t_ForeName
	vSurname:=$_t_Surname
	vInvNoF:=$_t_InvNoF
	vINvNoT:=$_t_InvNoT
	viDateF:=$_d_LDateF
	viDateT:=$_d_lDateT
	ACC_t_PeriodFrom:=$_t_AccPeriodFrom
	ACC_t_PeriodTo:=$_t_AccPeriodTo
	ACC_t_AnalysisCodeFrom:=$_t_AnalysisCodeF
	vAnalCodeT:=$_t_AnalCodeT
	vStage:=$_t_Stage
	vJob:=$_t_Job
	vRDateF:=$_d_RDateF
	vRDateT:=$_d_RDateT
	vinvF:=$_r_invF
	vinvT:=$_r_invT
	vChargesF:=$_r_ChargesF
	vChargesT:=$_r_ChargesT
	vDueF:=$_r_DueF
	vDueTo:=$_r_DueTo
	vamountF:=$_r_AmountFrom
	vamountT:=$_r_AmountTo
	vDoDateF:=$_d_DoDateF
	vDoDateT:=$_d_DoDateT
	vsDateF:=$_d_SDateF
	vsDateT:=$_d_SDateT
	Acc_t_AccountCodeFrom:=$_t_AccountCodeFrom
	Acc_t_AccountCodeTo:=$_t_AccountCodeTo
	vTerms:=$_t_Terms
	vProdCode:=$_t_ProductCode
	vevent:=$_t_event
	vName:=$_t_Name
	vsales:=$_t_Sales
	varea:=$_t_Area
	ACC_t_CurrencyCode:=$_t_CurrencyCode
	vLayer:=$_t_LayerCode
	ACC_l_PeriodToOffset:=$_l_PeriodToOffset
	ACC_l_PeriodFromOffset:=$_l_PeriodFromOffset
	VcontactName:=$_t_ContactName
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	CH0:=$_l_CH0
	CH1:=$_l_ch1
	CH2:=$_l_ch2
	CH3:=$_l_ch3
	CH4:=$_l_Ch4
	CH5:=$_l_Ch5
	CH6:=$_l_Ch6
	CH7:=$_l_Ch7
	CH8:=$_l_Ch8
	ViDateFOffset:=$_l_iDateFOffset
	VRDateFOffset:=$_l_RDateFOffset
	VDoDateFOffset:=$_l_DoDateFOffset
	VsDateFOffset:=$_l_sDateFOffset
	ViDateTOffset:=$_l_iDateTOffset
	VRDateTOffset:=$_l_RDateTOffset
	VDoDateTOffset:=$_l_DoDateTOffset
	VsDateTOffset:=$_l_sDatetOffset
	
	r0:=$_l_r0
	r1:=$_l_r1
	If ($_l_OK>0) & (Not:C34(rHold=1))
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
	End if 
End if 
INV_at_SearchTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oINVTabChoices"; $_t_oldMethodName)
