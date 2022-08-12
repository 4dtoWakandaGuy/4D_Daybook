If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.oTRNTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 04:42
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
	//ARRAY LONGINT(TRN_al_TabChoices;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(TRANS_at_TabChoices;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; SRCH_bo_Pathinited; SRCH_bo_ShowHold; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateFrom; $_d_EntryDateTo; $_d_TransDateFrom; $_d_TransDateTo; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; vTDateF)
	C_LONGINT:C283($_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CH0; $_l_ch1; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_EntryDateFromOffset)
	C_LONGINT:C283($_l_EntryDateToOffset; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft)
	C_LONGINT:C283($_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_no2; $_l_NoLookupButtonBottom)
	C_LONGINT:C283($_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop)
	C_LONGINT:C283($_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft)
	C_LONGINT:C283($_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft)
	C_LONGINT:C283($_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_QueryMode; $_l_QULabelBottom)
	C_LONGINT:C283($_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TransDateFromOffset; $_l_TransDateToOffset)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; ACC_l_TransDateFromOffset; CH0; CH1)
	C_LONGINT:C283(cNAA; cNAL; cSIS; rHold; SM_l_QueryMode; SRCH_l_MinWidth; Vno1; Vno2)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; VamountF; VamountT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_ChequeNo; $_t_CompanyCode; $_t_ConfCode; $_t_ContCode; $_t_ContrCode; $_t_CurrencyCode; $_t_JobCode)
	C_TEXT:C284($_t_LayerCode; $_t_oldMethodName; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_ReconcilliationReference; $_t_TransactionCode; $_t_Type; $_t_VATTitle; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_CurrencyCode)
	C_TEXT:C284(ACC_t_PeriodFrom; ACC_t_PeriodTo; TR_t_ReconcilliationReference; vChequeNo; VCompCode; VConfCode; vContCode; VcontrCode; VJobCode; Vlayer; vPurchCode)
	C_TEXT:C284(vPurchInvNo; VTransCode; vType; vVATTitle)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS]dTrans_Sel.oTRNTabChoices"; Form event code:C388)

If (TRN_al_TabChoices{TRANS_at_TabChoices}>0)
	$_t_ReconcilliationReference:=TR_t_ReconcilliationReference
	$_t_TransactionCode:=VTransCode
	$_t_AccountCodeFrom:=Acc_t_AccountCodeFrom
	$_t_AccountCodeTo:=Acc_t_AccountCodeTo
	$_t_AccPeriodFrom:=ACC_t_PeriodFrom
	$_t_AccPeriodTo:=ACC_t_PeriodTo
	$_l_No1:=Vno1
	$_l_no2:=Vno2
	$_t_CompanyCode:=VCompCode
	$_t_JobCode:=VJobCode
	$_t_ContrCode:=VcontrCode
	$_t_ConfCode:=VConfCode
	$_d_TransDateFrom:=vTDateF
	$_d_TransDateTo:=SRCH_d_TransToDate
	$_d_EntryDateFrom:=SRCH_d_EntryDateFrom
	$_d_EntryDateTo:=SRCH_d_EntryDateTo
	$_r_AmountFrom:=VamountF
	$_r_AmountTo:=VamountT
	$_t_PurchaseInvoiceNo:=vPurchInvNo
	$_t_PurchaseCode:=vPurchCode
	$_t_ChequeNo:=vChequeNo
	$_t_VATTitle:=vVATTitle
	$_t_Type:=vType
	$_t_ContCode:=vContCode
	$_t_LayerCode:=Vlayer
	$_t_CurrencyCode:=ACC_t_CurrencyCode
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_CH0:=CH0
	$_l_ch1:=CH1
	$_l_PeriodFromOffset:=ACC_l_PeriodFromOffset
	$_l_PeriodToOffset:=ACC_l_PeriodToOffset
	$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
	$_l_TransDateFromOffset:=ACC_l_TransDateFromOffset
	$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
	$_l_TransDateToOffset:=$_l_TransDateToOffset
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarTransactions"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oTRNTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
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
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[TRANSACTIONS:29]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[TRANSACTIONS:29]))
		
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	If (SM_l_QueryMode=0)
		$_l_OK:=Trans_SelLP(TRN_al_TabChoices{TRANS_at_TabChoices})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Trans_SelLP(TRN_al_TabChoices{TRANS_at_TabChoices}; SM_l_QueryMode; Table:C252(->[TRANSACTIONS:29]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	
	OBJECT MOVE:C664(*; "oSideBarTransactions"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oTRNTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	
	SRCH_bo_ShowHold:=$_bo_ShowHold
	
	SM_LoadSearchParameterNames(Table:C252(->[TRANSACTIONS:29]); SM_l_QueryMode)
	$_t_ReconcilliationReference:=TR_t_ReconcilliationReference
	vTransCode:=$_t_TransactionCode
	Acc_t_AccountCodeFrom:=$_t_AccountCodeFrom
	Acc_t_AccountCodeTo:=$_t_AccountCodeTo
	ACC_t_PeriodFrom:=$_t_AccPeriodFrom
	ACC_t_PeriodTo:=$_t_AccPeriodTo
	vNo1:=$_l_No1
	vno2:=$_l_no2
	vCompCode:=$_t_CompanyCode
	vJobCode:=$_t_JobCode
	vContrCode:=$_t_ContrCode
	vConfCode:=$_t_ConfCode
	vTDateF:=$_d_TransDateFrom
	SRCH_d_TransToDate:=$_d_TransDateTo
	SRCH_d_EntryDateFrom:=$_d_EntryDateFrom
	SRCH_d_EntryDateTo:=$_d_EntryDateTo
	vamountF:=$_r_AmountFrom
	vamountT:=$_r_AmountTo
	vPurchInvNo:=$_t_PurchaseInvoiceNo
	vPurchCode:=$_t_PurchaseCode
	vChequeNo:=$_t_ChequeNo
	vVATTitle:=$_t_VATTitle
	vType:=$_t_Type
	vContCode:=$_t_ContCode
	vLayer:=$_t_LayerCode
	ACC_t_CurrencyCode:=$_t_CurrencyCode
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	CH0:=$_l_CH0
	CH1:=$_l_ch1
	ACC_l_PeriodFromOffset:=$_l_PeriodFromOffset
	ACC_l_PeriodToOffset:=$_l_PeriodToOffset
	ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
	ACC_l_TransDateFromOffset:=$_l_TransDateFromOffset
	ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
	$_l_TransDateToOffset:=$_l_TransDateToOffset
	
	TRANS_at_TabChoices:=0
	If ($_l_OK>0) & (Not:C34(rHold=1))
		
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
		
	End if 
End if 

rHold:=0
TRANS_at_TabChoices:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.oTRNTabChoices"; $_t_oldMethodName)
