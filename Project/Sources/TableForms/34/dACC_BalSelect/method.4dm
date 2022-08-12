If (False:C215)
	//Table Form Method Name: Object Name:      [ACCOUNT_BALANCES].dACC_BalSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(AA_al_TabOffset;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_ContextualPeriodT;0)
	//ARRAY TEXT(ACC_at_SearchTab;0)
	C_BOOLEAN:C305($_bo_ShowHold; ACC_bo_PopUpInitedFrom; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_Ch5; $_l_Ch6; $_l_Ch7)
	C_LONGINT:C283($_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_defaultparams; $_l_event; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom)
	C_LONGINT:C283($_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop)
	C_LONGINT:C283($_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom)
	C_LONGINT:C283($_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight)
	C_LONGINT:C283($_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight)
	C_LONGINT:C283($_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_offset; $_l_OK; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght)
	C_LONGINT:C283($_l_QULabelTop; $_l_S1; $_l_S2; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TabsWidth; $_l_TotalWidth)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_DataUsed; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; cABL; ch5; ch6; ch7)
	C_LONGINT:C283(cNAA; cNAL; cSIS; rHold; s1; s2; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; xCancel; xOK)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ValueF; vAmountF; vAmountT; vValueF)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_CurrencyCode; $_t_oldMethodName; $_t_Text; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom)
	C_TEXT:C284(ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage2; dbtabText2; vAnalCodeT; VText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].dACC_BalSelect"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Activate:K2:9)
		SD2_SetDiaryPopup
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222(ACC_at_ContextualPeriodF; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodF; 0)
		ARRAY TEXT:C222(ACC_at_ContextualPeriodT; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodT; 0)
		SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodF; ->ACC_al_ContextualPeriodF)
		SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodT; ->ACC_al_ContextualPeriodT)
		
		ACC_bo_PopUpInitedFrom:=True:C214
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		SET MENU BAR:C67(59)
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "dACC_BalSelect")
		SM_LoadSearchParameterNames(Table:C252(->[ACCOUNT_BALANCES:34]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; Get localized string:C991("CancelButton"))
			OBJECT SET TITLE:C194(xOK; Get localized string:C991("SaveButton"))
			
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		ARRAY TEXT:C222(ACC_at_SearchTab; 0)
		ARRAY LONGINT:C221(AA_al_TabOffset; 0)
		APPEND TO ARRAY:C911(ACC_at_SearchTab; Get localized string:C991("Table_Balances"))
		APPEND TO ARRAY:C911(AA_al_TabOffset; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ACCOUNTS:32]))<0)
			APPEND TO ARRAY:C911(ACC_at_SearchTab; Get localized string:C991("Accounts"))
			APPEND TO ARRAY:C911(AA_al_TabOffset; 1)
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ACCOUNTS:32]))<0)
			APPEND TO ARRAY:C911(ACC_at_SearchTab; Get localized string:C991("Periods"))
			APPEND TO ARRAY:C911(AA_al_TabOffset; 2)
		End if 
		ACC_at_SearchTab:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(ACC_at_SearchTab))
			dbtabText2:=dbtabText2+ACC_at_SearchTab{$_l_TabsWidth}+(" "*8)
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
		cABL:=0
		rHold:=0
		WS_bo_InsearchScreen:=True:C214
		Sel_LProc
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENTERABLE:C238(ACC_t_CurrencyCode; False:C215)
		End if 
		cNAA:=1
		DB_MenuAction(Get localized string:C991("Menu_Functions"); "And …"; 3; "")
		DB_MenuAction(Get localized string:C991("Menu_Functions"); "Or …"; 3; "")
		DB_MenuAction(Get localized string:C991("Menu_Functions"); "Not …"; 3; "")
		If (SM_l_QueryMode=2)
			DB_MenuAction(Get localized string:C991("Menu_Find"); "Accounts"; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Find"); "Periods"; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "And …"; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "Or …"; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "Not …"; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "Save Criteria ..."; 3; "")
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction(Get localized string:C991("Menu_Functions"); "Set Functions …"; 4; "")
		End if 
		s1:=1
		
		OBJECT SET ENABLED:C1123(s1; (Not:C34(DB_t_CurrentFormUsage2="NCS")))
		OBJECT SET ENABLED:C1123(s2; (Not:C34(DB_t_CurrentFormUsage2="NCS")))
		OBJECT SET ENABLED:C1123(ch6; (Not:C34(DB_t_CurrentFormUsage2="NCS")))
		
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[ACCOUNT_BALANCES:34]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		
		If ($_l_defaultparams>0)
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
			If (ACC_l_PeriodFromOffset>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
				If (Records in selection:C76([PERIODS:33])>0)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
					SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
					If ($_l_offset<Size of array:C274($_ad_FromDates))
						ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
					Else 
						ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
					End if 
					
					OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
					If (ACC_l_PeriodToOffset>0)
						If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
						
						OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
						
					End if 
					
				End if 
				
			Else 
				If (ACC_l_PeriodToOffset>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
						SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
						If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
						
						OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
					End if 
				End if 
			End if 
		End if 
		WS_AutoscreenSize(3; 320; $_l_TotalWidth)
		SD2_SetDiaryPopup
		If (Acc_t_AccountCodeTo="")
			OBJECT SET VISIBLE:C603(Acc_t_AccountCodeTo; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; ACC_l_DataUsed)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If (ACC_l_DataUsed=0)
			OBJECT SET VISIBLE:C603(*; "oAnalysisCode@"; False:C215)
		Else 
			If (vAnalCodeT="")
				OBJECT SET VISIBLE:C603(vAnalCodeT; False:C215)
				
			End if 
		End if 
		If (ACC_t_PeriodTo="")
			OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; ACC_l_DataUsed)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If (ACC_l_DataUsed=0)
			OBJECT SET VISIBLE:C603(*; "ovText@"; False:C215)
			
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; ACC_l_DataUsed)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#""; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#<>SYS_t_BaseCurrency)
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If (ACC_l_DataUsed=0)
			OBJECT SET VISIBLE:C603(*; "ovcurrency@"; False:C215)
			
		End if 
		If (vAmountT=0)
			OBJECT SET VISIBLE:C603(vAmountT; False:C215)
		End if 
	: ($_l_event=On Data Change:K2:15)
		If (Acc_t_AccountCodeFrom#"")
			OBJECT SET VISIBLE:C603(Acc_t_AccountCodeTo; True:C214)
			If (Acc_t_AccountCodeTo="")
				Acc_t_AccountCodeTo:=Acc_t_AccountCodeFrom
			End if 
		End if 
		If (ACC_t_AnalysisCodeFrom#"")
			OBJECT SET VISIBLE:C603(vAnalCodeT; True:C214)
			If (vAnalCodeT="")
				vAnalCodeT:=ACC_t_AnalysisCodeFrom
			End if 
			
		End if 
		If (ACC_t_PeriodFrom#"")
			OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
			If (ACC_t_PeriodTo="")
				ACC_t_PeriodTo:=ACC_t_PeriodFrom
			End if 
		End if 
		If (vAmountF#0)
			OBJECT SET VISIBLE:C603(vAmountT; True:C214)
			If (vAmountT=0)
				vAmountT:=vAmountF
			End if 
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			
			If (Get menu title:C430(Menu selected:C152\65536)#Get localized string:C991("Menu_Edit"))
				$_t_AccountCodeFrom:=Acc_t_AccountCodeFrom
				$_t_AccountCodeTo:=Acc_t_AccountCodeTo
				$_t_AccPeriodFrom:=ACC_t_PeriodFrom
				$_t_AccPeriodTo:=ACC_t_PeriodTo
				$_t_Text:=VText
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_r_AmountFrom:=VamountF
				$_r_AmountTo:=VAmountT
				$_l_Ch5:=ch5
				$_l_Ch7:=ch7
				$_l_Ch6:=ch6
				$_r_ValueF:=vValueF
				$_l_S1:=s1
				$_l_S2:=s2
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarAccBal"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
				OBJECT GET COORDINATES:C663(*; "oACCTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ACCOUNT_BALANCES:34]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[ACCOUNT_BALANCES:34]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				If (SM_l_QueryMode=0)
					$_l_OK:=ACC_BalSelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					
					$_l_OK:=ACC_BalSelLP(-1; SM_l_QueryMode; Table:C252(->[ACCOUNT_BALANCES:34]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(59)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				
				
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				
				OBJECT MOVE:C664(*; "oSideBarAccBal"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
				
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oACCTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				SM_LoadSearchParameterNames(Table:C252(->[ACCOUNT_BALANCES:34]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				
				Acc_t_AccountCodeFrom:=$_t_AccountCodeFrom
				Acc_t_AccountCodeTo:=$_t_AccountCodeTo
				ACC_t_PeriodFrom:=$_t_AccPeriodFrom
				ACC_t_PeriodTo:=$_t_AccPeriodTo
				VText:=$_t_Text
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				VamountF:=$_r_AmountFrom
				VAmountT:=$_r_AmountTo
				ch5:=$_l_Ch5
				ch7:=$_l_Ch7
				ch6:=$_l_Ch6
				vValueF:=$_r_ValueF
				s1:=$_l_S1
				s2:=$_l_S2
				cSIS:=$_l_SIS
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
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[ACCOUNT_BALANCES:34])
		End if 
		<>WS_Search_Message:=0
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dACC_BalSelect"; $_t_oldMethodName)
