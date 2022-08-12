If (False:C215)
	//Table Form Method Name: [INVOICES]dInv_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_Lb_FurtherFieldsQuery;0)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(INV_al_TabOffset;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_ContextualPeriodT;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(INV_at_SearchTab;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDoDateToSet; $_bo_ViDateToSet; $_bo_VRDateToSet; $_bo_VSDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VIdateToSet; SRCH_bo_VRDateToSet)
	C_BOOLEAN:C305(SRCH_bo_VSDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DoDateF; $_d_DodateFBase; $_d_DoDateT; $_d_FromBase; $_d_LDateF; $_d_lDateT; $_d_RDateF; $_d_RDateT; $_d_rdateTBase; $_d_SDateF; $_d_SDateT)
	C_DATE:C307($_d_sdateTBASE; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_FromBase; SRCH_d_rdateTBase; vDoDateF; vDoDateT; VIdateBASE; vIDateF; vIDateT; VIdateTBASE)
	C_DATE:C307(vRDateF; VrdateFBASE; vRDateT; vSDateF; VSdateFBASE; vSDateT; VSdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_0; $_l_1; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight; $_l_AreaLabelTop; $_l_ArealLeft; $_l_ArealRight; $_l_ArealTop)
	C_LONGINT:C283($_l_ArraySize; $_l_ArraySizeM_l_QueryMode; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CH0; $_l_CH0Bottom; $_l_CH0Left)
	C_LONGINT:C283($_l_CH0Right; $_l_CH0Top; $_l_ch1; $_l_CH1Bottom; $_l_CH1Left; $_l_CH1Right; $_l_CH1Top; $_l_ch2; $_l_CH2Bottom; $_l_CH2Left; $_l_CH2Right)
	C_LONGINT:C283($_l_CH2Top; $_l_ch3; $_l_CH3Bottom; $_l_CH3Left; $_l_CH3Right; $_l_CH3Top; $_l_Ch4; $_l_CH4Bottom; $_l_CH4Left; $_l_CH4Right; $_l_CH4Top)
	C_LONGINT:C283($_l_Ch5; $_l_CH5Bottom; $_l_CH5Left; $_l_CH5Right; $_l_CH5Top; $_l_Ch6; $_l_CH6Bottom; $_l_CH6Left; $_l_CH6Right; $_l_CH6Top; $_l_Ch7)
	C_LONGINT:C283($_l_CH7Bottom; $_l_CH7Left; $_l_CH7Right; $_l_CH7Top; $_l_Ch8; $_l_CH8Bottom; $_l_CH8Left; $_l_CH8Right; $_l_CH8Top; $_l_ColumnsTakeoff; $_l_ColumnsWidth)
	C_LONGINT:C283($_l_CompanyBottom; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContactBottom; $_l_ContactLeft; $_l_ContactRight; $_l_ContactTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight)
	C_LONGINT:C283($_l_ContinueButtonTop; $_l_CurrencyBottom; $_l_CurrencyLabelBottom; $_l_CurrencyLabelLeft; $_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight; $_l_CurrencyTop; $_l_defaultparams; $_l_DoDateFOffset)
	C_LONGINT:C283($_l_DoDateTOffset; $_l_event; $_l_Formevent; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight)
	C_LONGINT:C283($_l_FromnoVarTop; $_l_Height; $_l_iDateFOffset; $_l_iDateTOffset; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft)
	C_LONGINT:C283($_l_inselectLabelRight; $_l_inselectLabelTop; $_l_Inset; $_l_InvoicesCount; $_l_LayerBottom; $_l_LayerLabelBottom; $_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight)
	C_LONGINT:C283($_l_LayerTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop)
	C_LONGINT:C283($_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft)
	C_LONGINT:C283($_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft)
	C_LONGINT:C283($_l_ObjectTabRight; $_l_ObjectTabTop; $_l_ObjectTop; $_l_oHeight; $_l_OK; $_l_oWIdth; $_l_PrefferedWIdth; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop)
	C_LONGINT:C283($_l_RDateFOffset; $_l_RDateTOffset; $_l_Remaining; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth)
	C_LONGINT:C283($_l_TableNumber; $_l_TableRow; $_l_TabsWidth; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CCQ_l_BUT1)
	C_LONGINT:C283(CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2)
	C_LONGINT:C283(CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5)
	C_LONGINT:C283(CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; CH0; CH1; CH2; ch3; ch4; ch5; ch6)
	C_LONGINT:C283(ch7; ch8; cNAA; cNAL; cSIS; r0; r1; RHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth)
	C_LONGINT:C283(VDoDateFOffset; VDoDateTOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VsDateFOffset; VsDateTOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ChargesF; $_r_ChargesT; $_r_DueF; $_r_DueTo; $_r_invF; $_r_invT; VamountF; VamountT; vChargesF)
	C_REAL:C285(vChargesT; vDueF; vDueTo; VinvF; vInvT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalCodeT; $_t_AnalysisCodeF; $_t_Area; $_t_CompanyCode; $_t_CompName; $_t_ContCode; $_t_CurrencyCode)
	C_TEXT:C284($_t_event; $_t_ForeName; $_t_FormUsage; $_t_FormUsage3; $_t_InvNoF; $_t_InvNoT; $_t_Job; $_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_ProductCode)
	C_TEXT:C284($_t_Sales; $_t_Stage; $_t_Surname; $_t_TableNumberString; $_t_Terms; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1; oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15)
	C_TEXT:C284(oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2; oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25)
	C_TEXT:C284(oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5; oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10)
	C_TEXT:C284(oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15; oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20)
	C_TEXT:C284(oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25; oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6)
	C_TEXT:C284(oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; SRCH_T_DateCallBack; vAnalCodeT; Varea; VCompCode; VCompName; VContCode; Vevent; VForename)
	C_TEXT:C284(vINVNOF; vInvNoT; vjob; Vlayer; Vname; VProdCode; Vsales; vStage; Vsurname; VTerms)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].dInv_Sel"; Form event code:C388)
Sel_LProc2(->[INVOICES:39])
$_l_Formevent:=Form event code:C388

Case of 
	: ($_l_Formevent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vIDateF:=!00-00-00!
		vIDateT:=!00-00-00!
		vDoDateF:=!00-00-00!
		vDoDateT:=!00-00-00!
		vRDateF:=!00-00-00!
		vRDateT:=!00-00-00!
		vSDateF:=!00-00-00!
		vSDateT:=!00-00-00!
		SRCH_T_DateCallBack:=""
		
		SET MENU BAR:C67(51)
		OpenHelp(Table:C252(->[INVOICES:39]); "dInv_Sel")
		ARRAY TEXT:C222(INV_at_SearchTab; 2)
		//``
		//SRCH_d_EntryDateFrom:=!00/00/00!
		SRCH_d_FromBase:=!00-00-00!
		VIdateTBASE:=!00-00-00!
		VRdateFBASE:=!00-00-00!
		SRCH_d_rdateTBase:=!00-00-00!
		SRCH_d_DodateFBase:=!00-00-00!
		SRCH_d_DoDateTBase:=!00-00-00!
		VsdateFBASE:=!00-00-00!
		VsdateTBASE:=!00-00-00!
		
		SRCH_bo_VIdateToSet:=False:C215
		SRCH_bo_VrDateToSet:=False:C215
		SRCH_bo_VsDateToSet:=False:C215
		SRCH_bo_VDoDateToSet:=False:C215
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
		//``
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		ARRAY TEXT:C222(INV_at_SearchTab; 0)
		ARRAY LONGINT:C221(INV_al_TabOffset; 0)
		
		APPEND TO ARRAY:C911(INV_at_SearchTab; "Sales Ledger")
		APPEND TO ARRAY:C911(INV_al_TabOffset; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			
			APPEND TO ARRAY:C911(INV_at_SearchTab; "Companies")
			APPEND TO ARRAY:C911(INV_al_TabOffset; 1)
		End if 
		
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
			APPEND TO ARRAY:C911(INV_at_SearchTab; "Contacts")
			APPEND TO ARRAY:C911(INV_al_TabOffset; 2)
		End if 
		INV_at_SearchTab:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(INV_at_SearchTab))
			dbtabText2:=dbtabText2+INV_at_SearchTab{$_l_TabsWidth}+(" "*8)
		End for 
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=595
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=595)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=595
				SRCH_l_MinWidth:=595
			End if 
		End if 
		SM_LoadSearchParameterNames(Table:C252(->[INVOICES:39]); SM_l_QueryMode)
		If (VIdateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vrDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vDoDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oDateDueT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vSDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vINVNOF="")
			OBJECT SET VISIBLE:C603(*; "oInvNumT"; False:C215)
			
		End if 
		If (ACC_t_PeriodFrom="")
			OBJECT SET VISIBLE:C603(*; "oPeriodT@"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
		End if 
		If (ACC_t_AnalysisCodeFrom="")
			OBJECT SET VISIBLE:C603(*; "oAnalysisT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Analysis_Code:17#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_InvoicesCount=0)
				OBJECT SET VISIBLE:C603(*; "oAnalysisL@"; False:C215)
			End if 
		End if 
		If (vStage="")
			OBJECT SET VISIBLE:C603(*; "oCreditStageT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Credit_Stage:22#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_InvoicesCount=0)
				OBJECT SET VISIBLE:C603(*; "oCreditStage@"; False:C215)
			End if 
		End if 
		If (vInvF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalInvoicedT"; False:C215)
			
		End if 
		If (vChargesF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalReceivedT"; False:C215)
		End if 
		If (vDueF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalDueT"; False:C215)
		End if 
		If (vAmountF=0)
			OBJECT SET VISIBLE:C603(*; "oAgeT"; False:C215)
		End if 
		
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Contacts"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		
		//TRACE
		//WS_AutoscreenSize (2;382;529)
		$_l_TableNumber:=Table:C252(->[INVOICES:39])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[INVOICES:39]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_ArraySize:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_ArraySize#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_ArraySize)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_ArraySize)
				For ($_l_Index; 1; $_l_ArraySize)  //clear the arr first
					CUS_at_DisplayedData{$_l_Index}:=""
					CUS_at_PageText{$_l_Index}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				$_l_ArraySize:=Size of array:C274(FUR_at_CustomFieldNames)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_ArraySize)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_ArraySize)
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)  //& (False)
				
				LB_SetupListbox(->INV_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->INV_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->INV_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				
				LB_SetEnterable(->INV_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->INV_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->INV_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->INV_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->INV_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->INV_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_Height:=386+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_oWIdth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_oHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton"; $_l_TotalWidth-$_l_oWIdth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_objectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_objectBottom
					$_l_oWIdth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_oHeight:=$_l_ObjectBottom-$_l_ObjectTop
					//$_l_ObjectTop:=
					OBJECT MOVE:C664(*; "OHoldText"; $_l_TotalWidth-$_l_oWIdth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					
					OBJECT GET COORDINATES:C663(*; "oCancelButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_oWIdth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_oHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton2"; $_l_TotalWidth-$_l_oWIdth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_oWIdth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_oHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton"; $_l_TotalWidth-$_l_oWIdth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_oWIdth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_oHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton2"; $_l_TotalWidth-$_l_oWIdth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
				End if 
			Else 
				$_l_Height:=386
				If ($_l_Height<386)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=386
					WS_AutoscreenSize(2; 386; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			$_l_ArraySize:=Size of array:C274(FUR_at_CustomFieldNames)
			ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_ArraySize)
			ARRAY TEXT:C222(CUS_at_PageText; $_l_ArraySize)
			$_l_Height:=386
			If ($_l_Height<386)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=386
				WS_AutoscreenSize(2; 386; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		
		
		r0:=1
		If ((DB_t_CurrentFormUsage="AD") | (DB_t_CurrentFormUsage="Pay") | (DB_t_CurrentFormUsage="Statement"))
			ch7:=1
			ch3:=1
			ch4:=1
			ch5:=1
		Else 
			If (DB_t_CurrentFormUsage="VAT")
				ch3:=1
			Else 
				If (DB_t_CurrentFormUsage="AA")
					ch3:=1
					ch4:=1
					ch5:=1
				Else 
					If (DB_t_CurrentFormUsage="Rec")
						ch5:=1
						ch6:=1
					End if 
				End if 
			End if 
		End if 
		If (DB_t_CurrentFormUsage="StatementOA")
			ch3:=1
			ch4:=1
			ch5:=1
			ch6:=1
			ch8:=1
		End if 
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		//   vTitle2:=Term_FSWT ("Fore/Surname")
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[INVOICES:39]); <>PER_l_CurrentUserID)
			
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
			ViDateFOffset:=0
			VRDateFOffset:=0
			VDoDateFOffset:=0
			VsDateFOffset:=0
			ViDateTOffset:=0
			VRDateTOffset:=0
			VDoDateTOffset:=0
			VsDateTOffset:=0
			
			SM_LoadSearchParameters($_l_defaultparams)
			If (ACC_l_PeriodFromOffset>0)
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
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateFOffset#0)
				Case of 
					: (VRDateFOffset>0)
						vRDateF:=Current date:C33-VRDateFOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; VRDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						vDODateF:=Current date:C33-VDoDateFOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateFOffset>-100)
						//months
						vDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
			End if 
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						vSDateF:=Current date:C33-VSDateFOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateFOffset>-100)
						//months
						vSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End case 
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateT:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateTOffset#0)
				Case of 
					: (VRDateTOffset>0)
						vRDateT:=Current date:C33-VRDateTOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; VRDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						vDODateT:=Current date:C33-VDoDateTOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateTOffset>-100)
						//months
						vDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
				
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						vSDateT:=Current date:C33-VSDateTOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateTOffset>-100)
						//months
						vSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End case 
			End if 
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(INV_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		
		rHold:=0
	: ($_l_Formevent=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->vIDateF))
				If (vIDateF>!00-00-00!)
					If (SRCH_bo_VIdateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vIDateF>vIDateT) & (vIDateT>!00-00-00!)
						vIDateT:=vIDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VIdateT))
				If (VIdateT>!00-00-00!)
					If (VIdateT<VIdateF)
						VIdateF:=VIdateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vRDateF))
				If (vRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vRDateF>vRDateT) & (vRDateT>!00-00-00!)
						vRDateT:=vRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VrDATET))
				If (VrDateT>!00-00-00!)
					If (VrDateT<VrDateF)
						VrDateF:=VrDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vDoDateF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vDoDateF>vDoDateT) & (vDoDateT>!00-00-00!)
						vDoDateT:=vDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDoDATET))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vSDateF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VSDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vSDateF>vDoDateT) & (vSDateT>!00-00-00!)
						vSDateT:=vSDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodFrom))
				If (ACC_t_PeriodFrom#"")
					OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
					
					If (ACC_t_PeriodTo<ACC_t_PeriodFrom) & (ACC_t_PeriodTo#"")
						ACC_t_PeriodTo:=ACC_t_PeriodFrom
					End if 
				End if 
		End case 
	: ($_l_Formevent=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->vIDateF))
				If (vIDateF>!00-00-00!)
					If (SRCH_bo_VIdateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vIDateF>vIDateT) & (vIDateT>!00-00-00!)
						vIDateT:=vIDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VIdateT))
				If (VIdateT>!00-00-00!)
					If (VIdateT<VIdateF)
						VIdateF:=VIdateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vRDateF))
				If (vRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vRDateF>vRDateT) & (vRDateT>!00-00-00!)
						vRDateT:=vRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VrDATET))
				If (VrDateT>!00-00-00!)
					If (VrDateT<VrDateF)
						VrDateF:=VrDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vDoDateF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vDoDateF>vDoDateT) & (vDoDateT>!00-00-00!)
						vDoDateT:=vDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDoDATET))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vSDateF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VSDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (vSDateF>vDoDateT) & (vSDateT>!00-00-00!)
						vSDateT:=vSDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vInvNoF))
				If (vInvNoT<vInvNoF) & (vInvNoT#"")
					vInvNoT:=vInvNoF
				End if 
				If (vInvNoF#"")
					OBJECT SET VISIBLE:C603(*; "oInvNumT"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vInvNoT))
				If (vInvNoT<vInvNoF)
					vInvNoF:=vInvNoT
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodFrom))
				If (ACC_t_PeriodTo<ACC_t_PeriodFrom) & (ACC_t_PeriodTo#"")
					ACC_t_PeriodTo:=ACC_t_PeriodFrom
				End if 
				If (ACC_t_PeriodFrom#"")
					OBJECT SET VISIBLE:C603(*; "oPeriodT@"; True:C214)
				End if 
				
			: ($_ptr_FocusObject=(->vAnalCodeT))
				If (vAnalCodeT<ACC_t_AnalysisCodeFrom) & (vAnalCodeT#"")
					ACC_t_AnalysisCodeFrom:=vAnalCodeT
				End if 
				If (ACC_t_AnalysisCodeFrom#"")
					OBJECT SET VISIBLE:C603(*; "oAnalysisT"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ACC_t_AnalysisCodeFrom))
				If (vAnalCodeT<ACC_t_AnalysisCodeFrom) & (vAnalCodeT#"")
					vAnalCodeT:=ACC_t_AnalysisCodeFrom
				End if 
				If (ACC_t_AnalysisCodeFrom#"")
					OBJECT SET VISIBLE:C603(*; "oAnalysisT"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vStage))
				If (vjob<vstage) & (vjob#"")
					vstage:=vjob
				End if 
				If (vStage#"")
					OBJECT SET VISIBLE:C603(*; "oCreditStageT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vInvF)
				If (vInvT<vInvF) & (vInvT>0)
					vInvT:=vInvF
				End if 
				If (vInvF#0)
					OBJECT SET VISIBLE:C603(*; "oTotalInvoicedT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vInvT)
				If (vInvT<vInvF) & (vInvT>0)
					vInvF:=vInvT
				End if 
			: ($_ptr_FocusObject=->vChargesF)
				If (vChargesT<vChargesF) & (vChargesT>0)
					vChargesT:=vChargesF
				End if 
				If (vChargesF#0)
					OBJECT SET VISIBLE:C603(*; "oTotalReceivedT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vChargesT)
				If (vChargesT<vChargesF) & (vChargesT>0)
					vChargesF:=vChargesT
				End if 
			: ($_ptr_FocusObject=->vDueF)
				If (vDueTo<vDueF) & (vDueTo>0)
					vDueTo:=vDueF
				End if 
				If (vDueF#0)
					OBJECT SET VISIBLE:C603(*; "oTotalDueT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vDueTo)
				If (vDueTo<vDueF) & (vDueTo>0)
					vDueF:=vDueTo
				End if 
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vAmountF
				End if 
				If (vAmountF#0)
					OBJECT SET VISIBLE:C603(*; "oAgeT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountF:=vAmountT
				End if 
				
		End case 
		
	: ($_l_Formevent=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				
				$_t_CompanyCode:=VCompCode
				$_t_CompName:=VCompName
				$_t_ContCode:=VContCode
				$_t_ForeName:=VForename
				$_t_Surname:=Vsurname
				$_t_InvNoF:=VInvNoF
				$_t_InvNoT:=VInvNoT
				
				$_d_LDateF:=vIDateF
				$_d_lDateT:=vIDateT
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
				$_l_0:=r0
				$_l_1:=r1
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
				
				OBJECT GET COORDINATES:C663(*; "oCH8"; $_l_CH8Left; $_l_CH8Top; $_l_CH8Right; $_l_CH8Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH6"; $_l_CH6Left; $_l_CH6Top; $_l_CH6Right; $_l_CH6Bottom)
				OBJECT GET COORDINATES:C663(*; "oCH7"; $_l_CH7Left; $_l_CH7Top; $_l_CH7Right; $_l_CH7Bottom)
				OBJECT GET COORDINATES:C663(*; "oArea"; $_l_ArealLeft; $_l_ArealTop; $_l_ArealRight; $_l_AreaBottom)
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
				$_bo_VSDateToSet:=SRCH_bo_VSDateToSet
				$_l_iDateFOffset:=ViDateFOffset
				$_l_RDateFOffset:=VRDateFOffset
				$_l_DoDateFOffset:=VDoDateFOffset
				$_l_sDateFOffset:=VsDateFOffset
				$_l_iDateTOffset:=ViDateTOffset
				$_l_RDateTOffset:=VRDateTOffset
				$_l_DoDateTOffset:=VDoDateTOffset
				$_l_sDatetOffset:=VsDateTOffset
				
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
					$_l_OK:=Invoices_SelLP
				Else 
					$_l_ArraySizeM_l_QueryMode:=SM_l_QueryMode
					
					$_l_OK:=Invoices_SelLP(-1; SM_l_QueryMode; Table:C252(->[INVOICES:39]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_ArraySizeM_l_QueryMode
				End if 
				SET MENU BAR:C67(51)
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
				SRCH_bo_VSDateToSet:=$_bo_VSDateToSet
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
				OBJECT MOVE:C664(*; "oCH8"; $_l_CH8Left; $_l_CH8Top; $_l_CH8Right; $_l_CH8Bottom; *)
				OBJECT MOVE:C664(*; "oCH0"; $_l_CH0Left; $_l_CH0Top; $_l_CH0Right; $_l_CH0Bottom; *)
				OBJECT MOVE:C664(*; "oCH1"; $_l_CH1Left; $_l_CH1Top; $_l_CH1Right; $_l_CH1Bottom; *)
				OBJECT MOVE:C664(*; "oCH2"; $_l_CH2Left; $_l_CH2Top; $_l_CH2Right; $_l_CH2Bottom; *)
				OBJECT MOVE:C664(*; "oCH3"; $_l_CH3Left; $_l_CH3Top; $_l_CH3Right; $_l_CH3Bottom; *)
				OBJECT MOVE:C664(*; "oCH4"; $_l_CH4Left; $_l_CH4Top; $_l_CH4Right; $_l_CH4Bottom; *)
				OBJECT MOVE:C664(*; "oCH5"; $_l_CH5Left; $_l_CH5Top; $_l_CH5Right; $_l_CH5Bottom; *)
				OBJECT MOVE:C664(*; "oCH6"; $_l_CH6Left; $_l_CH6Top; $_l_CH6Right; $_l_CH6Bottom; *)
				OBJECT MOVE:C664(*; "oCH7"; $_l_CH7Left; $_l_CH7Top; $_l_CH7Right; $_l_CH7Bottom; *)
				OBJECT MOVE:C664(*; "oArea"; $_l_ArealLeft; $_l_ArealTop; $_l_ArealRight; $_l_AreaBottom; *)
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
				vIDateF:=$_d_LDateF
				vIDateT:=$_d_lDateT
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
				ViDateFOffset:=$_l_iDateFOffset
				VRDateFOffset:=$_l_RDateFOffset
				VDoDateFOffset:=$_l_DoDateFOffset
				VsDateFOffset:=$_l_sDateFOffset
				ViDateTOffset:=$_l_iDateTOffset
				VRDateTOffset:=$_l_RDateTOffset
				VDoDateTOffset:=$_l_DoDateTOffset
				VsDateTOffset:=$_l_sDatetOffset
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
				r0:=$_l_0
				r1:=$_l_1
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
ERR_MethodTrackerReturn("FM:dInv_Sel"; $_t_oldMethodName)
