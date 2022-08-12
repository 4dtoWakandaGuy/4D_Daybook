If (False:C215)
	//Table Form Method Name: [TRANSACTIONS]dTrans_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY LONGINT(TRN_al_TabChoices;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_ContextualPeriodT;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(STK_at_CurSearchTab;0)
	//ARRAY TEXT(TRANS_at_TabChoices;0)
	C_BOOLEAN:C305($_bo_ShowHold; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VeDateToSet; SRCH_bo_VtDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateFrom; $_d_EntryDateTo; $_d_TransDateFrom; $_d_TransDateTo; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; VedateFBASE; VedateTBASE)
	C_DATE:C307(VfdateFBASE; VfdateTBASE; VsdateFBASE; VsdateTBASE; vTDateF; VTdateFBASE; VTdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CH0; $_l_ch1; $_l_ContinueButtonBottom)
	C_LONGINT:C283($_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_defaultparams; $_l_EntryDateFromOffset; $_l_EntryDateToOffset; $_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop)
	C_LONGINT:C283($_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight)
	C_LONGINT:C283($_l_inselectLabelTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_no2; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft)
	C_LONGINT:C283($_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom)
	C_LONGINT:C283($_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop)
	C_LONGINT:C283($_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight)
	C_LONGINT:C283($_l_ObjectTabTop; $_l_OK; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_SideBarBottom; $_l_SideBarLeft)
	C_LONGINT:C283($_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TabsWidth; $_l_TotalWidth; $_l_TransDateFromOffset; $_l_TransDateToOffset; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; ACC_l_TransDateFromOffset; ACC_l_TransDateToOffset; CH0; ch1; cNAA; cNAL)
	C_LONGINT:C283(cSIS; rHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; Vno1; Vno2; xCancel; xOK)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; VamountF; VamountT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_ChequeNo; $_t_CompanyCode; $_t_ConfCode; $_t_ContCode; $_t_ContrCode; $_t_CurrencyCode; $_t_JobCode)
	C_TEXT:C284($_t_LayerCode; $_t_oldMethodName; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_ReconcilliationReference; $_t_TransactionCode; $_t_TransactionType; $_t_VATTitle; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_CurrencyCode)
	C_TEXT:C284(ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; TR_t_ReconcilliationReference; vChequeNo; VCompCode; VConfCode; vContCode)
	C_TEXT:C284(VcontrCode; VJobCode; Vlayer; vPurchCode; vPurchInvNo; vTitle3; VTransCode; vType; vVATTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTIONS].dTrans_Sel"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vTDateF:=!00-00-00!
		SRCH_d_TransToDate:=!00-00-00!
		SRCH_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		
		VTdateFBASE:=!00-00-00!
		VTdateTBASE:=!00-00-00!
		VedateFBASE:=!00-00-00!
		VedateTBASE:=!00-00-00!
		
		SRCH_bo_VeDateToSet:=False:C215
		SRCH_bo_VTDateToSet:=False:C215
		ARRAY TEXT:C222(ACC_at_ContextualPeriodF; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodF; 0)
		ARRAY TEXT:C222(ACC_at_ContextualPeriodT; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodT; 0)
		SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodF; ->ACC_al_ContextualPeriodF)
		SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodT; ->ACC_al_ContextualPeriodT)
		
		
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(58)
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); "dTrans_Sel")
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		
		ARRAY TEXT:C222(TRANS_at_TabChoices; 0)
		ARRAY LONGINT:C221(TRN_al_TabChoices; 0)
		APPEND TO ARRAY:C911(TRANS_at_TabChoices; "Transactions")
		APPEND TO ARRAY:C911(TRN_al_TabChoices; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(TRANS_at_TabChoices; "Companies")
			APPEND TO ARRAY:C911(TRN_al_TabChoices; 1)
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))<0)
				APPEND TO ARRAY:C911(TRANS_at_TabChoices; "Invoices")
				APPEND TO ARRAY:C911(TRN_al_TabChoices; 2)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ACCOUNT_BALANCES:34]))<0)
				APPEND TO ARRAY:C911(TRANS_at_TabChoices; "Accounts")
				APPEND TO ARRAY:C911(TRN_al_TabChoices; 3)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PERIODS:33]))<0)
				APPEND TO ARRAY:C911(TRANS_at_TabChoices; "Periods")
				APPEND TO ARRAY:C911(TRN_al_TabChoices; 4)
			End if 
		End if 
		
		TRANS_at_TabChoices:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(TRANS_at_TabChoices))
			dbtabText2:=dbtabText2+TRANS_at_TabChoices{$_l_TabsWidth}+(" "*8)
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
		
		WS_AutoscreenSize(2; 383; $_l_TotalWidth)
		
		SM_LoadSearchParameterNames(Table:C252(->[TRANSACTIONS:29]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		
		rHold:=0
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Invoices"; 3; "")
			DB_MenuAction("Find"; "Accounts"; 3; "")
			DB_MenuAction("Find"; "Periods"; 3; "")
			
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		WS_bo_InsearchScreen:=True:C214
		Sel_LProc
		If (DB_t_CurrentFormUsage="Rec")
			ch1:=1
		End if 
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		vTitle3:=Term_VATWT("VAT/IO/UE")
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[TRANSACTIONS:29]); <>PER_l_CurrentUserID)
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
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
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
				$_t_TransactionType:=vType
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
				$_l_TransDateToOffset:=ACC_l_TransDateToOffset
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
					$_l_OK:=Trans_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Trans_SelLP(-1; SM_l_QueryMode; Table:C252(->[TRANSACTIONS:29]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(58)
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
				TR_t_ReconcilliationReference:=$_t_ReconcilliationReference
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
				vType:=$_t_TransactionType
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
				ACC_l_TransDateToOffset:=$_l_TransDateToOffset
				
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				End if 
				TRANS_at_TabChoices:=1
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
			In_ButtdCall(->[TRANSACTIONS:29])
			
		End if 
		<>WS_Search_Message:=0
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dTrans_Sel"; $_t_oldMethodName)
