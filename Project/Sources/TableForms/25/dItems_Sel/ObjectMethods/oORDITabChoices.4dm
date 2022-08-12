If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oORDITabChoices
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
	//ARRAY BOOLEAN(OrdI_abo_Include;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORDI_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldList; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORDI_at_TabContexts;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDnDateToSet; $_bo_ViDateToSet; $_bo_VRDDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDNDateToSet; SRCH_bo_ViDateToSet; SRCH_bo_VRDDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateFrom; $_d_DateTo; $_d_DNDateFrom; $_d_DNDateTo; $_d_FromBase; $_d_idateTBASE; $_d_ndateFBASE; $_d_ndateTBASE; $_d_rdateFBASE; $_d_RddateTBASE; SRCH_d_FromBase)
	C_DATE:C307(VDNDateF; VDNdateFBASE; VDNDateT; VDNdateTBASE; ViDateF; ViDateT; VidateTBASE; VRddateFBASE; VRddateTBASE)
	C_LONGINT:C283($_l_AQLabelBottom; $_l_AQLabelLeft; $_l_AQLabelRight; $_l_AQLabelTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight)
	C_LONGINT:C283($_l_ContinueButtonTop; $_l_CustomerItemReferenceBottom; $_l_CustomerItemReferenceLabelBo; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceRight; $_l_CustomerItemReferenceTop; $_l_DNDateFromOffset; $_l_DNDateToOffset)
	C_LONGINT:C283($_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromNumVarBottom; $_l_FromNumVarLeft; $_l_FromNumVarRight; $_l_FromNumVarTop; $_l_HoldCBBottom; $_l_HoldCBLeft; $_l_HoldCBRight)
	C_LONGINT:C283($_l_HoldCBTop; $_l_HoldTextBottom; $_l_HoldTextLeft; $_l_HoldTextRight; $_l_HoldTextTop; $_l_IDateFromOffset; $_l_IDateToOffset; $_l_Index; $_l_InSelectionButtonBottom; $_l_InSelectionButtonLeft; $_l_InSelectionButtonRight)
	C_LONGINT:C283($_l_InSelectionButtonTop; $_l_InSelectionLabelBottom; $_l_InSelectionLabelLeft; $_l_InSelectionLabelRight; $_l_InSelectionLabelTop; $_l_ItemNumber; $_l_ItemNumberBottom; $_l_ItemNumberLabelBottom; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelRight; $_l_ItemNumberLabelTop)
	C_LONGINT:C283($_l_ItemNumberLeft; $_l_ItemNumberRight; $_l_ItemNumberTop; $_l_LoadLabelBottom; $_l_LoadLabelLeft; $_l_LoadLabelRight; $_l_LoadLabelTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft)
	C_LONGINT:C283($_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom)
	C_LONGINT:C283($_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop)
	C_LONGINT:C283($_l_OK; $_l_OrderStatesBottom; $_l_OrderStatesLeft; $_l_OrderStatesRight; $_l_OrderStatesTop; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_ProductNameBottom; $_l_ProductNameLeft)
	C_LONGINT:C283($_l_ProductNameRight; $_l_ProductNameTop; $_l_QueryDDBottom; $_l_QueryDDLeft; $_l_QueryDDRight; $_l_QueryDDTop; $_l_QueryMode; $_l_r0; $_l_r1; $_l_r2; $_l_r3)
	C_LONGINT:C283($_l_r4; $_l_r5; $_l_r6; $_l_r7; $_l_RDateFromOffset; $_l_RDateToOffset; $_l_SetAdd; $_l_SetMod; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight)
	C_LONGINT:C283($_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; cNAA; cNAL; cSetAdd; cSetMod)
	C_LONGINT:C283(cSIS; r0; r1; r2; r3; r4; r5; r6; r7; rHold; SM_l_QueryMode)
	C_LONGINT:C283(SRCH_l_MinWidth; VDnDateFOffset; VDnDateTOffset; ViDateFOffset; ViDateTOffset; VItemNum; VRdDateFOffset; VRdDateTOffset)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginFrom; $_r_MarginTo; VamountF; VamountT; VMarginF; VMarginT)
	C_TEXT:C284($_t_ContractCode; $_t_InvoiceNumberFrom; $_t_InvoiceNumberTo; $_t_ItemReference; $_t_oldMethodName; $_t_OrderCode; $_t_OrderNo; $_t_ProblemCode; $_t_ProductCode; $_t_ProductName; $_t_SalesPerson)
	C_TEXT:C284($_t_SerialNumber; $_t_SolutionCode; vCOntrCode; VInvNoF; VInvNoT; vItemRef; VOrderCode; vOrderNo; VProbCode; VProdCode; vProdName)
	C_TEXT:C284(VSales; VSerialNo; VSolCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].dItems_Sel.oORDITabChoices"; Form event code:C388)
If (ORDI_al_coTabChoices{ORDI_at_TabContexts}>0)
	$_t_OrderCode:=VOrderCode
	$_t_SolutionCode:=VSolCode
	$_t_ProductCode:=VProdCode
	$_t_ProductName:=vProdName
	$_t_SerialNumber:=VSerialNo
	$_t_SalesPerson:=VSales
	$_t_ProblemCode:=VProbCode
	$_l_ItemNumber:=VItemNum
	$_t_ItemReference:=vItemRef
	$_t_InvoiceNumberFrom:=VInvNoF
	$_t_InvoiceNumberTo:=VInvNoT
	$_d_DateFrom:=ViDateF
	$_d_DateTo:=ViDateT
	$_d_DNDateFrom:=VDNDateF
	$_d_DNDateTo:=VDNDateT
	$_r_AmountTo:=VamountT
	$_r_AmountFrom:=VamountF
	$_r_MarginFrom:=VMarginF
	$_r_MarginTo:=VMarginT
	$_t_OrderNo:=vOrderNo
	$_t_ContractCode:=vCOntrCode
	$_l_IDateFromOffset:=ViDateFOffset
	$_l_RDateFromOffset:=VRdDateFOffset
	$_l_DNDateFromOffset:=VDnDateFOffset
	$_l_IDateToOffset:=ViDateTOffset
	$_l_RDateToOffset:=VRdDateTOffset
	$_l_DNDateToOffset:=VDnDateTOffset
	$_l_RDateFromOffset:=VRdDateFOffset
	$_l_DNDateFromOffset:=VDnDateFOffset
	$_l_IDateToOffset:=ViDateTOffset
	$_l_RDateToOffset:=VRdDateTOffset
	$_l_DNDateToOffset:=VDnDateTOffset
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	
	COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
	COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_SetAdd:=cSetAdd
	$_l_SetMod:=cSetMod
	$_l_r0:=r0
	$_l_r1:=r1
	$_l_r2:=r2
	$_l_r3:=r3
	$_l_r4:=r4
	$_l_r5:=r5
	$_l_r6:=r6
	$_l_r7:=r7
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_AQLabelLeft; $_l_AQLabelTop; $_l_AQLabelRight; $_l_AQLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarOrderItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
	OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_InSelectionButtonLeft; $_l_InSelectionButtonTop; $_l_InSelectionButtonRight; $_l_InSelectionButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_InSelectionLabelLeft; $_l_InSelectionLabelTop; $_l_InSelectionLabelRight; $_l_InSelectionLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_HoldCBLeft; $_l_HoldCBTop; $_l_HoldCBRight; $_l_HoldCBBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_HoldTextLeft; $_l_HoldTextTop; $_l_HoldTextRight; $_l_HoldTextBottom)
	
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_QueryDDLeft; $_l_QueryDDTop; $_l_QueryDDRight; $_l_QueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_LoadLabelLeft; $_l_LoadLabelTop; $_l_LoadLabelRight; $_l_LoadLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromNumVarLeft; $_l_FromNumVarTop; $_l_FromNumVarRight; $_l_FromNumVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oOrderStatesListbox"; $_l_OrderStatesLeft; $_l_OrderStatesTop; $_l_OrderStatesRight; $_l_OrderStatesBottom)
	OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
	OBJECT GET COORDINATES:C663(*; "oORDITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	OBJECT GET COORDINATES:C663(*; "oItemNumber"; $_l_ItemNumberLeft; $_l_ItemNumberTop; $_l_ItemNumberRight; $_l_ItemNumberBottom)
	OBJECT GET COORDINATES:C663(*; "oItemNumberLabel"; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelTop; $_l_ItemNumberLabelRight; $_l_ItemNumberLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomerItemReference"; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceTop; $_l_CustomerItemReferenceRight; $_l_CustomerItemReferenceBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomerItemReferenceLabel"; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelBo)
	
	
	
	
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldList)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_FromBase:=SRCH_d_FromBase
	$_d_idateTBASE:=VidateTBASE
	$_d_ndateFBASE:=VDNdateFBASE
	$_d_ndateTBASE:=VDNdateTBASE
	$_d_rdateFBASE:=VRddateFBASE
	$_d_RddateTBASE:=VRddateTBASE
	$_bo_ViDateToSet:=SRCH_bo_ViDateToSet
	$_bo_VDnDateToSet:=SRCH_bo_VDNDateToSet
	$_bo_VRDDateToSet:=SRCH_bo_VRDDateToSet
	
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	
	
	$_l_OK:=0
	
	
	If (SM_l_QueryMode=0)
		$_l_OK:=OrderI_SelLP(ORDI_al_coTabChoices{ORDI_at_TabContexts})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=OrderI_SelLP(ORDI_al_coTabChoices{ORDI_at_TabContexts}; SM_l_QueryMode; Table:C252(->[ORDER_ITEMS:25]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_bo_ShowHold:=$_bo_ShowHold
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldList; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	SRCH_d_FromBase:=$_d_FromBase
	VidateTBASE:=$_d_idateTBASE
	VDNdateFBASE:=$_d_ndateFBASE
	VDNdateTBASE:=$_d_ndateTBASE
	VRddateFBASE:=$_d_rdateFBASE
	VRddateTBASE:=$_d_RddateTBASE
	SRCH_bo_ViDateToSet:=$_bo_ViDateToSet
	SRCH_bo_VDNDateToSet:=$_bo_VDnDateToSet
	SRCH_bo_VRDDateToSet:=$_bo_VRDDateToSet
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_AQLabelLeft; $_l_AQLabelTop; $_l_AQLabelRight; $_l_AQLabelBottom; *)
	
	OBJECT MOVE:C664(*; "oSideBarOrderItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
	OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
	OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
	OBJECT MOVE:C664(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
	OBJECT MOVE:C664(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
	OBJECT MOVE:C664(*; "oWIthinSelectionCheckbox"; $_l_InSelectionButtonLeft; $_l_InSelectionButtonTop; $_l_InSelectionButtonRight; $_l_InSelectionButtonBottom; *)
	OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_InSelectionLabelLeft; $_l_InSelectionLabelTop; $_l_InSelectionLabelRight; $_l_InSelectionLabelBottom; *)
	OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_HoldCBLeft; $_l_HoldCBTop; $_l_HoldCBRight; $_l_HoldCBBottom; *)
	OBJECT MOVE:C664(*; "oHoldText"; $_l_HoldTextLeft; $_l_HoldTextTop; $_l_HoldTextRight; $_l_HoldTextBottom; *)
	
	OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_QueryDDLeft; $_l_QueryDDTop; $_l_QueryDDRight; $_l_QueryDDBottom; *)
	OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_LoadLabelLeft; $_l_LoadLabelTop; $_l_LoadLabelRight; $_l_LoadLabelBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromNumVarLeft; $_l_FromNumVarTop; $_l_FromNumVarRight; $_l_FromNumVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oOrderStatesListbox"; $_l_OrderStatesLeft; $_l_OrderStatesTop; $_l_OrderStatesRight; $_l_OrderStatesBottom; *)
	OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
	OBJECT MOVE:C664(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	OBJECT MOVE:C664(*; "oORDITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromNumVarLeft; $_l_FromNumVarTop; $_l_FromNumVarRight; $_l_FromNumVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oItemNumber"; $_l_ItemNumberLeft; $_l_ItemNumberTop; $_l_ItemNumberRight; $_l_ItemNumberBottom; *)
	OBJECT MOVE:C664(*; "oItemNumberLabel"; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelTop; $_l_ItemNumberLabelRight; $_l_ItemNumberLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomerItemReference"; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceTop; $_l_CustomerItemReferenceRight; $_l_CustomerItemReferenceBottom; *)
	OBJECT MOVE:C664(*; "oCustomerItemReferenceLabel"; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelBo; *)
	
	
	ARRAY BOOLEAN:C223(OrdI_abo_Include; 0)
	ARRAY BOOLEAN:C223(OrdI_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
	For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
		OrdI_abo_Include{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
	End for 
	SM_LoadSearchParameterNames(Table:C252(->[ORDER_ITEMS:25]); SM_l_QueryMode)
	vOrderCode:=$_t_OrderCode
	vSolCode:=$_t_SolutionCode
	vProdCode:=$_t_ProductCode
	vProdName:=$_t_ProductName
	vSerialNo:=$_t_SerialNumber
	vSales:=$_t_SalesPerson
	vProbCode:=$_t_ProblemCode
	vitemNum:=$_l_ItemNumber
	vItemRef:=$_t_ItemReference
	vInvNoF:=$_t_InvoiceNumberFrom
	vInvNoT:=$_t_InvoiceNumberTo
	viDateF:=$_d_DateFrom
	viDateT:=$_d_DateTo
	vDnDateF:=$_d_DNDateFrom
	vDNDateT:=$_d_DNDateTo
	vAmountT:=$_r_AmountTo
	vAmountF:=$_r_AmountFrom
	vMarginF:=$_r_MarginFrom
	vMarginT:=$_r_MarginTo
	vOrderNo:=$_t_OrderNo
	vContrCode:=$_t_ContractCode
	COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
	COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	cSetAdd:=$_l_SetAdd
	cSetMod:=$_l_SetMod
	ViDateFOffset:=$_l_IDateFromOffset
	VRdDateFOffset:=$_l_RDateFromOffset
	VDnDateFOffset:=$_l_DNDateFromOffset
	ViDateTOffset:=$_l_IDateToOffset
	VRdDateTOffset:=$_l_RDateToOffset
	VDnDateTOffset:=$_l_DNDateToOffset
	VRdDateFOffset:=$_l_RDateFromOffset
	VDnDateFOffset:=$_l_DNDateFromOffset
	ViDateTOffset:=$_l_IDateToOffset
	VRdDateTOffset:=$_l_RDateToOffset
	VDnDateTOffset:=$_l_DNDateToOffset
	r0:=$_l_r0
	r1:=$_l_r1
	r2:=$_l_r2
	r3:=$_l_r3
	r4:=$_l_r4
	r5:=$_l_r5
	r6:=$_l_r6
	r7:=$_l_r7
	If ($_l_OK>0) & (Not:C34(rHold=1))
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
	End if 
End if 
ORDI_at_TabContexts:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 

RHold:=0
ERR_MethodTrackerReturn("OBJ:dItems_Sel,ORDI_at_TabContexts"; $_t_oldMethodName)
