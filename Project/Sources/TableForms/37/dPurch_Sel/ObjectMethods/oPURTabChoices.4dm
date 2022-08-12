If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oPURTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(PUR_al_TabOffset;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(PUR_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VIDateToSet; $_bo_VPDateToSet; $_bo_VRDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VIDateToSet; SRCH_bo_VpDateToSet; SRCH_bo_VRDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_FromBase; $_d_LDateF; $_d_lDateT; $_d_lDateTBase; $_d_pDateF; $_d_pDateFBase; $_d_pDateT; $_d_pDateTBase; $_d_RDateF; $_d_rDateFBase; $_d_RDateT)
	C_DATE:C307($_d_rdateTBase; SRCH_d_FromBase; SRCH_d_rdateTBase; ViDateF; ViDateT; VIdateTBASE; VpDateF; VPdateFBASE; VpDateT; VPdateTBASE; VRdateF)
	C_DATE:C307(VRdateFBASE; VRdateT)
	C_LONGINT:C283($_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CH0; $_l_CH0Bottom; $_l_CH0Left; $_l_CH0Right; $_l_CH0Top; $_l_ch1; $_l_CH1Bottom)
	C_LONGINT:C283($_l_CH1Left; $_l_CH1Right; $_l_CH1Top; $_l_ch2; $_l_CH2Bottom; $_l_CH2Left; $_l_CH2Right; $_l_CH2Top; $_l_ch3; $_l_CH3Bottom; $_l_CH3Left)
	C_LONGINT:C283($_l_CH3Right; $_l_CH3Top; $_l_Ch4; $_l_CH4Bottom; $_l_CH4Left; $_l_CH4Right; $_l_CH4Top; $_l_Ch5; $_l_CH5Bottom; $_l_CH5Left; $_l_CH5Right)
	C_LONGINT:C283($_l_CH5Top; $_l_Ch6; $_l_Ch7; $_l_CompanyNameBottom; $_l_CompanyNameLeft; $_l_CompanyNameRight; $_l_CompanyNameTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop)
	C_LONGINT:C283($_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_iDateFOffset; $_l_inSelectButtonBottom)
	C_LONGINT:C283($_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom)
	C_LONGINT:C283($_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight)
	C_LONGINT:C283($_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight)
	C_LONGINT:C283($_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_OrderNoBottom; $_l_OrderNoLabelBottom; $_l_OrderNoLabelLeft; $_l_OrderNoLabelRight; $_l_OrderNoLabelTop)
	C_LONGINT:C283($_l_OrderNoLeft; $_l_OrderNoRight; $_l_OrderNoTop; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_R0)
	C_LONGINT:C283($_l_R1; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283(ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CH0; CH1; CH2; CH3; CH4; CH5; CH6; CH7; cNAA)
	C_LONGINT:C283(cNAL; cSIS; R0; R1; rHold; SM_l_QueryMode; SRCH_l_MinWidth; ViDateFOffset; ViDateTOffset; VPDateFOffset; VPDateTOffset)
	C_LONGINT:C283(VRDateFOffset; VRDateTOffset)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ChargesF; $_r_ChargesT; $_r_DueF; $_r_DueTo; $_r_invF; $_r_invT; VamountF; VamountT; VChargesF)
	C_REAL:C285(VChargesT; vDueF; vDueTo; VInvF; VInvT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalCodeT; $_t_AnalysisCodeF; $_t_CompanyCode; $_t_CompName; $_t_CurrencyCode; $_t_event; $_t_Job)
	C_TEXT:C284($_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_OrderNo; $_t_ProductCode; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_Stage; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom)
	C_TEXT:C284(ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; VCompCode; VCompName; Vevent; VJob; VLayer; Vname; VorderNo)
	C_TEXT:C284(VProdCode; VPurchCode; VPurchInvNo; VStage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oPURTabChoices"; Form event code:C388)

If (PUR_al_TabOffset{PUR_at_SearchTab}>0)
	$_t_CompanyCode:=VCompCode
	$_t_CompName:=VCompName
	$_t_PurchaseCode:=VPurchCode
	$_t_PurchaseInvoiceNo:=VPurchInvNo
	$_t_OrderNo:=VorderNo
	$_d_LDateF:=ViDateF
	$_d_lDateT:=ViDateT
	$_t_AccPeriodFrom:=ACC_t_PeriodFrom
	$_t_AnalysisCodeF:=ACC_t_AnalysisCodeFrom
	$_t_AccPeriodTo:=ACC_t_PeriodTo
	$_t_AnalCodeT:=VAnalCodeT
	$_t_Stage:=VStage
	$_t_Job:=VJob
	$_d_pDateF:=VpDateF
	$_d_RDateF:=VRdateF
	$_r_AmountFrom:=VamountF
	$_r_invF:=VInvF
	$_r_ChargesF:=VChargesF
	$_r_DueF:=vDueF
	$_t_AccountCodeFrom:=Acc_t_AccountCodeFrom
	$_d_pDateT:=VpDateT
	$_d_RDateT:=VRdateT
	$_r_AmountTo:=VamountT
	$_r_invT:=VInvT
	$_r_ChargesT:=VChargesT
	$_r_DueTo:=vDueTo
	$_t_AccountCodeTo:=Acc_t_AccountCodeTo
	$_t_ProductCode:=VProdCode
	$_t_Name:=Vname
	$_t_event:=Vevent
	$_t_CurrencyCode:=ACC_t_CurrencyCode
	$_t_LayerCode:=VLayer
	$_l_CH0:=CH0
	$_l_ch1:=CH1
	$_l_ch2:=CH2
	$_l_ch3:=CH3
	$_l_Ch4:=CH4
	$_l_Ch5:=CH5
	$_l_Ch6:=CH6
	$_l_Ch7:=CH7
	$_l_R0:=R0
	$_l_R1:=R1
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_PeriodToOffset:=ACC_l_PeriodToOffset
	$_l_PeriodFromOffset:=ACC_l_PeriodFromOffset
	
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	OBJECT GET COORDINATES:C663(*; "oSideBarPurchases"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oPOTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
	
	
	OBJECT GET COORDINATES:C663(*; "oOrderNo"; $_l_OrderNoLeft; $_l_OrderNoTop; $_l_OrderNoRight; $_l_OrderNoBottom)
	OBJECT GET COORDINATES:C663(*; "oOrderNoLabel"; $_l_OrderNoLabelLeft; $_l_OrderNoLabelTop; $_l_OrderNoLabelRight; $_l_OrderNoLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom)
	OBJECT GET COORDINATES:C663(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom)
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom)
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_FromBase:=SRCH_d_FromBase
	$_d_lDateTBase:=VIdateTBASE
	$_d_pDateTBase:=VPdateTBASE
	$_d_pDateFBase:=VPdateFBASE
	$_d_rDateFBase:=VRdateFBASE
	$_d_rdateTBase:=SRCH_d_rdateTBase
	$_bo_VIDateToSet:=SRCH_bo_VIDateToSet
	$_bo_VPDateToSet:=SRCH_bo_VpDateToSet
	$_bo_VRDateToSet:=SRCH_bo_VRDateToSet
	$_l_iDateFOffset:=VIDateFOffset
	$_l_iDateFOffset:=VPDateFOffset
	$_l_iDateFOffset:=VRDateFOffset
	$_l_iDateFOffset:=ViDateTOffset
	$_l_iDateFOffset:=VPDateTOffset
	$_l_iDateFOffset:=VRDateTOffset
	
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_INVOICES:37]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_INVOICES:37]))
		
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	
	If (SM_l_QueryMode=0)
		$_l_OK:=Purchases_SelLP(PUR_al_TabOffset{PUR_at_SearchTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Purchases_SelLP(PUR_al_TabOffset{PUR_at_SearchTab}; SM_l_QueryMode; Table:C252(->[PURCHASE_INVOICES:37]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	SRCH_d_FromBase:=$_d_FromBase
	VIdateTBASE:=$_d_lDateTBase
	VPdateTBASE:=$_d_pDateTBase
	VPdateFBASE:=$_d_pDateFBase
	VRdateFBASE:=$_d_rDateFBase
	SRCH_d_rdateTBase:=$_d_rdateTBase
	SRCH_bo_VIDateToSet:=$_bo_VIDateToSet
	SRCH_bo_VpDateToSet:=$_bo_VPDateToSet
	SRCH_bo_VRDateToSet:=$_bo_VRDateToSet
	
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	OBJECT MOVE:C664(*; "oSideBarPurchases"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oPOTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
	OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	
	
	OBJECT MOVE:C664(*; "oOrderNo"; $_l_OrderNoLeft; $_l_OrderNoTop; $_l_OrderNoRight; $_l_OrderNoBottom; *)
	OBJECT MOVE:C664(*; "oOrderNoLabel"; $_l_OrderNoLabelLeft; $_l_OrderNoLabelTop; $_l_OrderNoLabelRight; $_l_OrderNoLabelBottom; *)
	
	OBJECT MOVE:C664(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom; *)
	OBJECT MOVE:C664(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom; *)
	OBJECT MOVE:C664(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom; *)
	OBJECT MOVE:C664(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom; *)
	OBJECT MOVE:C664(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom; *)
	OBJECT MOVE:C664(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom; *)
	OBJECT MOVE:C664(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom; *)
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SM_LoadSearchParameterNames(Table:C252(->[PURCHASE_INVOICES:37]); SM_l_QueryMode)
	
	VCompCode:=$_t_CompanyCode
	VCompName:=$_t_CompName
	VPurchCode:=$_t_PurchaseCode
	VPurchInvNo:=$_t_PurchaseInvoiceNo
	VOrderNo:=$_t_OrderNo
	ViDateF:=$_d_LDateF
	ViDateT:=$_d_lDateT
	ACC_t_PeriodFrom:=$_t_AccPeriodFrom
	ACC_t_AnalysisCodeFrom:=$_t_AnalysisCodeF
	ACC_t_PeriodTo:=$_t_AccPeriodTo
	VAnalCodeT:=$_t_AnalCodeT
	VStage:=$_t_Stage
	VJob:=$_t_Job
	VpDateF:=$_d_pDateF
	VRDateF:=$_d_RDateF
	VamountF:=$_r_AmountFrom
	VInvF:=$_r_invF
	VChargesF:=$_r_ChargesF
	VDueF:=$_r_DueF
	Acc_t_AccountCodeFrom:=$_t_AccountCodeFrom
	VpDateT:=$_d_pDateT
	VRDateT:=$_d_RDateT
	VamountT:=$_r_AmountTo
	VInvT:=$_r_invT
	VChargesT:=$_r_ChargesT
	VDueTo:=$_r_DueTo
	Acc_t_AccountCodeTo:=$_t_AccountCodeTo
	VProdCode:=$_t_ProductCode
	VName:=$_t_Name
	VEvent:=$_t_event
	ACC_t_CurrencyCode:=$_t_CurrencyCode
	VLayer:=$_t_LayerCode
	CH0:=$_l_CH0
	CH1:=$_l_ch1
	CH2:=$_l_ch2
	CH3:=$_l_ch3
	CH4:=$_l_Ch4
	CH5:=$_l_Ch5
	CH6:=$_l_Ch6
	CH7:=$_l_Ch7
	R0:=$_l_R0
	R1:=$_l_R1
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	ACC_l_PeriodToOffset:=$_l_PeriodToOffset
	ACC_l_PeriodFromOffset:=$_l_PeriodFromOffset
	VIDateFOffset:=$_l_iDateFOffset
	VPDateFOffset:=$_l_iDateFOffset
	VRDateFOffset:=$_l_iDateFOffset
	ViDateTOffset:=$_l_iDateFOffset
	VPDateTOffset:=$_l_iDateFOffset
	VRDateTOffset:=$_l_iDateFOffset
	If ($_l_OK>0) & (Not:C34(rHold=1))
		
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
	End if 
	rhold:=0
End if 
PUR_at_SearchTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ:dPurch Sel,PUR_at_SearchTab"; $_t_oldMethodName)
