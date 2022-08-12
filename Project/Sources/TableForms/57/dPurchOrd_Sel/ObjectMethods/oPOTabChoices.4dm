If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oPOTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_abo_Include;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(PO_al_TabOffset;0)
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
	//ARRAY TEXT(PO_at_TabChoices;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VIDateToSet; $_bo_VPDateToSet; $_bo_VRDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VIDateToSet; SRCH_bo_VpDateToSet; SRCH_bo_VRDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_FromBase; $_d_LDateF; $_d_LDateT; $_d_PDateF; $_d_PDateT; $_d_PDateTBASE; $_d_rDateF; $_d_RdateFBASE; $_d_RDateT; $_d_rdateTBase; SRCH_d_FromBase)
	C_DATE:C307(SRCH_d_rdateTBase; ViDateF; ViDateT; VPDateF; VPDateT; VPdateTBASE; VRDateF; VRdateFBASE; VRDateT)
	C_LONGINT:C283($_l_AnalysisBottom; $_l_AnalysisLabelBottom; $_l_AnalysisLabelLeft; $_l_AnalysisLabelRight; $_l_AnalysisLabelTop; $_l_AnalysisLeft; $_l_AnalysisRight; $_l_AnalysisTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight)
	C_LONGINT:C283($_l_CancelButtonTop; $_l_CH0; $_l_ch1; $_l_CompanyNameBottom; $_l_CompanyNameLeft; $_l_CompanyNameRight; $_l_CompanyNameTop; $_l_ContactNameBottom; $_l_ContactNameLeft; $_l_ContactNameRight; $_l_ContactNameTop)
	C_LONGINT:C283($_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_CurrencyBottom; $_l_CurrencyLabelBottom; $_l_CurrencyLabelLeft; $_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight)
	C_LONGINT:C283($_l_CurrencyTop; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_iDateFOffset; $_l_iDateTOffset)
	C_LONGINT:C283($_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_LayerBottom; $_l_LayerLabelBottom)
	C_LONGINT:C283($_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight; $_l_LayerTop; $_l_MinWidth; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NotPostedBottom; $_l_NotPostedLeft; $_l_NotPostedRight; $_l_NotPostedTop; $_l_NoWildButtonBottom)
	C_LONGINT:C283($_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop)
	C_LONGINT:C283($_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight)
	C_LONGINT:C283($_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_pDateFoffset)
	C_LONGINT:C283($_l_pDateToffset; $_l_PostedBottom; $_l_PostedLeft; $_l_PostedRight; $_l_PostedTop; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_QueryMode; $_l_QULabelBottom)
	C_LONGINT:C283($_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_R1; $_l_RDateFOffset; $_l_RDateTOffset; $_l_RO; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop)
	C_LONGINT:C283($_l_SIS; $_l_StatesBottom; $_l_StatesLeft; $_l_StatesRight; $_l_StatesTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; CH0; CH1)
	C_LONGINT:C283(cNAA; cNAL; cSIS; R0; R1; rHold; SM_l_QueryMode; SRCH_l_MinWidth; ViDateFOffset; ViDateTOffset; vpDateFOffset)
	C_LONGINT:C283(vpDateTOffset; VRDateFOffset; VRDateTOffset)
	C_REAL:C285($_r_InvF; $_r_InvT; VInvF; VinvT)
	C_TEXT:C284($_t_AnalysisCode; $_t_CompanyCode; $_t_CompName; $_t_CompNameC; $_t_ContactName; $_t_ContCode; $_t_CurrencyCode; $_t_ForeName; $_t_LayerCode; $_t_oldMethodName; $_t_OrderNumber)
	C_TEXT:C284($_t_ProductCode; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_Surname; ACC_t_CurrencyCode; VAnalysis; VCompCode; VCompName; VCOmpNameC; VcontactName; vContCode)
	C_TEXT:C284(VforeName; VLayer; VorderNo; VProdCode; VPurchCode; VPurchInvNo; Vsurname)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPOTabChoices"; Form event code:C388)
If (PO_al_TabOffset{PO_at_TabChoices}>0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	$_t_CompanyCode:=VCompCode
	$_t_CompName:=VCompName
	$_t_ContCode:=vContCode
	$_t_ForeName:=VforeName
	$_t_Surname:=Vsurname
	$_t_PurchaseCode:=VPurchCode
	$_t_PurchaseInvoiceNo:=VPurchInvNo
	$_t_OrderNumber:=VorderNo
	$_t_CompNameC:=VCOmpNameC
	$_d_LDateF:=ViDateF
	$_d_LDateT:=ViDateT
	$_d_PDateF:=VPDateF
	$_d_PDateT:=VPDateT
	$_d_rDateF:=VRDateF
	$_d_RDateT:=VRDateT
	$_r_InvF:=VInvF
	$_r_InvT:=VinvT
	$_t_ProductCode:=VProdCode
	$_t_AnalysisCode:=VAnalysis
	$_t_CurrencyCode:=ACC_t_CurrencyCode
	$_t_LayerCode:=VLayer
	$_t_ContactName:=VcontactName
	$_l_iDateFOffset:=vIDateFOffset
	$_l_iDateTOffset:=vIDateTOffset
	$_l_pDateFoffset:=vpDateFOffset
	$_l_pDateToffset:=vpDateTOffset
	$_l_RDateFOffset:=vRDateFOffset
	$_l_RDateTOffset:=vRDateTOffset
	COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
	COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
	$_l_CH0:=CH0
	$_l_ch1:=CH1
	$_l_RO:=R0
	$_l_R1:=R1
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	OBJECT GET COORDINATES:C663(*; "oSideBarPurchaseOrders"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom)
	OBJECT GET COORDINATES:C663(*; "oContactName"; $_l_ContactNameLeft; $_l_ContactNameTop; $_l_ContactNameRight; $_l_ContactNameBottom)
	OBJECT GET COORDINATES:C663(*; "oPurchaseStatesListbox"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom)
	OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oStockNotPosted"; $_l_NotPostedLeft; $_l_NotPostedTop; $_l_NotPostedRight; $_l_NotPostedBottom)
	OBJECT GET COORDINATES:C663(*; "oStockPosted"; $_l_PostedLeft; $_l_PostedTop; $_l_PostedRight; $_l_PostedBottom)
	OBJECT GET COORDINATES:C663(*; "oPurchaseStatesListbox"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAnalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom)
	OBJECT GET COORDINATES:C663(*; "oAnalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom)
	OBJECT GET COORDINATES:C663(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom)
	OBJECT GET COORDINATES:C663(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom)
	
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_FromBase:=SRCH_d_FromBase
	$_d_PDateTBASE:=VPdateTBASE
	$_d_RdateFBASE:=VRdateFBASE
	$_d_rdateTBase:=SRCH_d_rdateTBase
	$_bo_VIDateToSet:=SRCH_bo_VIDateToSet
	$_bo_VPDateToSet:=SRCH_bo_VpDateToSet
	$_bo_VRDateToSet:=SRCH_bo_VRDateToSet
	
	
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_MinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_ORDERS:57]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_ORDERS:57]))
		
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	If (SM_l_QueryMode=0)
		$_l_OK:=PurchOrd_SelLP(PO_al_TabOffset{PO_at_TabChoices})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=PurchOrd_SelLP(PO_al_TabOffset{PO_at_TabChoices}; SM_l_QueryMode; Table:C252(->[PURCHASE_ORDERS:57]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_MinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	SRCH_d_FromBase:=$_d_FromBase
	VPdateTBASE:=$_d_PDateTBASE
	VRdateFBASE:=$_d_RdateFBASE
	SRCH_d_rdateTBase:=$_d_rdateTBase
	SRCH_bo_VIDateToSet:=$_bo_VIDateToSet
	SRCH_bo_VpDateToSet:=$_bo_VPDateToSet
	SRCH_bo_VRDateToSet:=$_bo_VRDateToSet
	
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	OBJECT MOVE:C664(*; "oSideBarPurchaseOrders"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom; *)
	OBJECT MOVE:C664(*; "oContactName"; $_l_ContactNameLeft; $_l_ContactNameTop; $_l_ContactNameRight; $_l_ContactNameBottom; *)
	OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
	OBJECT MOVE:C664(*; "oStockNotPosted"; $_l_NotPostedLeft; $_l_NotPostedTop; $_l_NotPostedRight; $_l_NotPostedBottom; *)
	OBJECT MOVE:C664(*; "oStockPosted"; $_l_PostedLeft; $_l_PostedTop; $_l_PostedRight; $_l_PostedBottom; *)
	
	OBJECT MOVE:C664(*; "oPurchaseStatesListbox"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom; *)
	OBJECT MOVE:C664(*; "oAnalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom; *)
	OBJECT MOVE:C664(*; "oAnalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom; *)
	OBJECT MOVE:C664(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom; *)
	OBJECT MOVE:C664(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom; *)
	OBJECT MOVE:C664(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom; *)
	OBJECT MOVE:C664(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom; *)
	
	$_bo_ShowHold:=SRCH_bo_ShowHold
	
	SM_LoadSearchParameterNames(Table:C252(->[PURCHASE_ORDERS:57]); SM_l_QueryMode)
	ARRAY BOOLEAN:C223(PO_abo_Include; 0)
	ARRAY BOOLEAN:C223(PO_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
	For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
		PO_abo_Include{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
	End for 
	vCompCode:=$_t_CompanyCode
	vCompName:=$_t_CompName
	vCOntCode:=$_t_ContCode
	vForename:=$_t_ForeName
	vSurname:=$_t_Surname
	vPurchCode:=$_t_PurchaseCode
	vPurchInvNo:=$_t_PurchaseInvoiceNo
	vOrderNo:=$_t_OrderNumber
	vCompNameC:=$_t_CompNameC
	viDateF:=$_d_LDateF
	viDateT:=$_d_LDateT
	vPDateF:=$_d_PDateF
	vPDateT:=$_d_PDateT
	vRDateF:=$_d_rDateF
	vRDateT:=$_d_RDateT
	vinvF:=$_r_InvF
	vInvT:=$_r_InvT
	vProdCode:=$_t_ProductCode
	vAnalysis:=$_t_AnalysisCode
	ACC_t_CurrencyCode:=$_t_CurrencyCode
	VcontactName:=$_t_ContactName
	vLayer:=$_t_LayerCode
	CH0:=$_l_CH0
	CH1:=$_l_ch1
	R0:=$_l_RO
	R1:=$_l_R1
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	vIDateFOffset:=$_l_iDateFOffset
	vIDateTOffset:=$_l_iDateTOffset
	vpDateFOffset:=$_l_pDateFoffset
	vpDateTOffset:=$_l_pDateToffset
	vRDateFOffset:=$_l_RDateFOffset
	vRDateTOffset:=$_l_RDateTOffset
	COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
	COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
	If ($_l_OK>0) & (Not:C34(rHold=1))
		
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
	End if 
	rHold:=0
	
	
	PO_at_TabChoices:=1
End if 
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPOTabChoices"; $_t_oldMethodName)
