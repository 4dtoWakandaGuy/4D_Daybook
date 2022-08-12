If (False:C215)
	//Table Form Method Name: [ORDERS]dOrders_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Ord_abo_Include;0)
	//ARRAY BOOLEAN(ORD_Lb_FurtherFieldsQuery;0)
	//ARRAY BOOLEAN(ORD_LB_States;0)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORD_al_coTabChoices;0)
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
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_ContextualPeriodT;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORD_at_TabChoices;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VeDateToSet; $_bo_VfDateToSet; $_bo_ViDateToSet; $_bo_VRDateToSet; $_bo_VsDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VeDateToSet; SRCH_bo_VFDateToSet)
	C_BOOLEAN:C305(SRCH_bo_ViDateToSet; SRCH_bo_VRDateToSet; SRCH_bo_VsDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_EntryDateTo; $_d_fDateF; $_d_fdateFBASE; $_d_fDateT; $_d_fdateTBASE; $_d_FromBase; $_d_iDateTBase)
	C_DATE:C307($_d_LDateF; $_d_lDateT; $_d_RDateF; $_d_RDateT; $_d_rdateTBase; $_d_SDateF; $_d_sdateFBASE; $_d_SDateT; $_d_sdateTBASE; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_DATE:C307(SRCH_d_FromBase; SRCH_d_rdateTBase; VedateFBASE; VedateTBASE; vFDateF; VFdateFBASE; vFdateT; VFdateTBASE; vIDateF; vIDateT; VidateTBASE)
	C_DATE:C307(vRDateF; VRdateFBASE; vRdateT; vsDateF; VsdateFBASE; vsDateT; VsdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AnalysisBottom; $_l_AnalysisLabelBottom; $_l_AnalysisLabelLeft; $_l_AnalysisLabelRight; $_l_AnalysisLabelTop; $_l_AnalysisLeft; $_l_AnalysisRight; $_l_AnalysisTop; $_l_BestHeight; $_l_BestWidth)
	C_LONGINT:C283($_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ColumnsTakeOff; $_l_ColumnsWidth; $_l_CompanyBottom; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContactBottom)
	C_LONGINT:C283($_l_ContactLeft; $_l_ContactRight; $_l_ContactTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd; $_l_cSetMod; $_l_CurrencyBottom; $_l_CurrencyLabelBottom)
	C_LONGINT:C283($_l_CurrencyLabelLeft; $_l_CurrencyLabelRight; $_l_CurrencyLabelTop; $_l_CurrencyLeft; $_l_CurrencyRight; $_l_CurrencyTop; $_l_CustomFieldsCount; $_l_CustomFieldsIndex; $_l_defaultparams; $_l_EntryDateFromOffset; $_l_EntryDateToOffset)
	C_LONGINT:C283($_l_fDateFromOffset; $_l_fDateToOffset; $_l_FormEvent; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight)
	C_LONGINT:C283($_l_FromnoVarTop; $_l_iDateFromOffset; $_l_iDateToOffset; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop)
	C_LONGINT:C283($_l_Inset; $_l_LayerBottom; $_l_LayerLabelBottom; $_l_LayerLabelLeft; $_l_LayerLabelRight; $_l_LayerLabelTop; $_l_LayerLeft; $_l_LayerRight; $_l_LayerTop; $_l_ListboxHeight; $_l_NAA)
	C_LONGINT:C283($_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop)
	C_LONGINT:C283($_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom)
	C_LONGINT:C283($_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight)
	C_LONGINT:C283($_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth; $_l_offset; $_l_OK; $_l_OrderCount; $_l_PeriodFromOffset; $_l_PeriodToOffset; $_l_PreferredWidth; $_l_ProductBottom; $_l_ProductLeft)
	C_LONGINT:C283($_l_ProductRight; $_l_ProductTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_rDateFromOffset; $_l_rDateToOffset; $_l_RemaingWidth; $_l_SDateFromOffset)
	C_LONGINT:C283($_l_sDateToOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_StatesBottom; $_l_StatesLeft; $_l_StatesRight; $_l_StatesTop)
	C_LONGINT:C283($_l_TableNumber; $_l_TableRow; $_l_TabsWidth; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset)
	C_LONGINT:C283(ACC_l_PeriodToOffset; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18)
	C_LONGINT:C283(CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3)
	C_LONGINT:C283(CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; cNAA; cNAL; cSetAdd; cSetMod; cSIS)
	C_LONGINT:C283(RHold; RS_l_BUT1; RS_l_BUT10; RS_l_BUT11; RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17; RS_l_BUT18)
	C_LONGINT:C283(RS_l_BUT19; RS_l_BUT2; RS_l_BUT20; RS_l_BUT21; RS_l_BUT22; RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27; RS_l_BUT3)
	C_LONGINT:C283(RS_l_BUT4; RS_l_BUT5; RS_l_BUT6; RS_l_BUT7; RS_l_BUT8; RS_l_BUT9; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; VDnDateFOffset; VDnDateTOffset)
	C_LONGINT:C283(VDoDateFOffset; VDoDateTOffset; VFDateFOffset; VFDateTOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VRdDateFOffset; VRdDateTOffset; VsDateFOffset)
	C_LONGINT:C283(VsDateTOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginPF; $_r_MarginPT; $_r_MarginT; vAmountF; VamountT; vMarginF; vMarginPF; vMarginPT)
	C_REAL:C285(vMarginT)
	C_TEXT:C284($_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalysisCode; $_t_Area; $_t_AttendType; $_t_Comments; $_t_CompanyCode; $_t_CompName; $_t_ContactName; $_t_ContCode; $_t_CurrencyCode)
	C_TEXT:C284($_t_Enclosures; $_t_Event; $_t_ForeName; $_t_FormUsage; $_t_FormUsage3; $_t_LayerCode; $_t_oldMethodName; $_t_OrderCode; $_t_OrderNo; $_t_ProductCode; $_t_Sales)
	C_TEXT:C284($_t_Source; $_t_Surname; $_t_TableNumberString; $_t_Telephone; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2)
	C_TEXT:C284(oCCQ_COL1; oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19)
	C_TEXT:C284(oCCQ_COL2; oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4)
	C_TEXT:C284(oCCQ_COL5; oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14)
	C_TEXT:C284(oCCQ_HED15; oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24)
	C_TEXT:C284(oCCQ_HED25; oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; Ord_t_EnquiryLabel)
	C_TEXT:C284(Ord_t_QuotationLabel; oRS_COL1; oRS_COL10; oRS_COL11; oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15; oRS_COL16; oRS_COL17; oRS_COL18)
	C_TEXT:C284(oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21; oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25; oRS_COL26; oRS_COL27; oRS_COL3)
	C_TEXT:C284(oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7; oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10; oRS_HED11; oRS_HED12; oRS_HED13)
	C_TEXT:C284(oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17; oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20; oRS_HED21; oRS_HED22; oRS_HED23)
	C_TEXT:C284(oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27; oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6; oRS_HED7; oRS_HED8; oRS_HED9)
	C_TEXT:C284(Vanalysis; vArea; VattendType; VComments; VCompCode; VCompName; VcontactName; VcontCode; Venclosures; vEvent; VForename)
	C_TEXT:C284(vLayer; VorderCode; vOrderNo; vProdCode; vResDesc; VSales; Vsource; VSurname; vTele; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].dOrders_Sel"; Form event code:C388)

Sel_LProc2(->[ORDERS:24])
$_l_FormEvent:=Form event code:C388

Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		ACC_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		vsDateF:=!00-00-00!
		vsDateT:=!00-00-00!
		vIDateF:=!00-00-00!
		vIDateT:=!00-00-00!
		vFDateF:=!00-00-00!
		vFdateT:=!00-00-00!
		vRDateF:=!00-00-00!
		vRdateT:=!00-00-00!
		
		
		
		VedateFBASE:=!00-00-00!
		VedateTBASE:=!00-00-00!
		VsdateFBASE:=!00-00-00!
		VsdateTBASE:=!00-00-00!
		VfdateFBASE:=!00-00-00!
		VfdateTBASE:=!00-00-00!
		SRCH_d_FromBase:=!00-00-00!
		VidateTBASE:=!00-00-00!
		
		VRdateFBASE:=!00-00-00!
		SRCH_d_rdateTBase:=!00-00-00!
		ARRAY TEXT:C222(ACC_at_ContextualPeriodF; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodF; 0)
		ARRAY TEXT:C222(ACC_at_ContextualPeriodT; 0)
		ARRAY LONGINT:C221(ACC_al_ContextualPeriodT; 0)
		
		
		SRCH_bo_VeDateToSet:=False:C215
		SRCH_bo_VsDateToSet:=False:C215
		SRCH_bo_VfDateToSet:=False:C215
		SRCH_bo_ViDateToSet:=False:C215
		SRCH_bo_VRDateToSet:=False:C215
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
		SET MENU BAR:C67(53)
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		
		
		OpenHelp(Table:C252(->[ORDERS:24]); "dOrders_Sel")
		ARRAY TEXT:C222(ORD_at_TabChoices; 0)
		ARRAY LONGINT:C221(ORD_al_coTabChoices; 0)
		APPEND TO ARRAY:C911(ORD_at_TabChoices; "Orders")
		APPEND TO ARRAY:C911(ORD_al_coTabChoices; 0)
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
				APPEND TO ARRAY:C911(ORD_at_TabChoices; "Order Items")
				APPEND TO ARRAY:C911(ORD_al_coTabChoices; 5)
			End if 
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INFORMATION:55]))<0)
			APPEND TO ARRAY:C911(ORD_at_TabChoices; "Information")
			APPEND TO ARRAY:C911(ORD_al_coTabChoices; 2)
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(ORD_at_TabChoices; "Companies")
			APPEND TO ARRAY:C911(ORD_al_coTabChoices; 1)
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
			APPEND TO ARRAY:C911(ORD_at_TabChoices; "Contacts")
			APPEND TO ARRAY:C911(ORD_al_coTabChoices; 3)
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))<0)
				APPEND TO ARRAY:C911(ORD_at_TabChoices; "Diary Items")
				APPEND TO ARRAY:C911(ORD_al_coTabChoices; 4)
			End if 
		End if 
		
		If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[SUBSCRIPTIONS:93]))<0)
				APPEND TO ARRAY:C911(ORD_at_TabChoices; "Subscriptions")
				APPEND TO ARRAY:C911(ORD_al_coTabChoices; 6)
			End if 
		End if 
		
		ORD_at_TabChoices:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(ORD_at_TabChoices))
			dbtabText2:=dbtabText2+ORD_at_TabChoices{$_l_TabsWidth}+(" "*8)
		End for 
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=592
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_BestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=592)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=592
				SRCH_l_MinWidth:=592
			End if 
		End if 
		SM_LoadSearchParameterNames(Table:C252(->[ORDERS:24]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (ACC_d_EntryDateFrom=!00-00-00!)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderCount)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Enquiry_Date:25#!00-00-00!)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_OrderCount=0)
				OBJECT SET VISIBLE:C603(*; "oOrderDate@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; False:C215)
			End if 
		Else 
			//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
		End if 
		If (vsDateF=!00-00-00!)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderCount)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Quotation_Date:26#!00-00-00!)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_OrderCount=0)
				OBJECT SET VISIBLE:C603(*; "oVsDate@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oVsDateT@"; False:C215)
			End if 
		Else 
			//VsdateT:=VsdateF
		End if 
		If (viDateF=!00-00-00!)  //Order date
			OBJECT SET VISIBLE:C603(*; "oViDateT@"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vfDateF=!00-00-00!)  //Forecast
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderCount)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Forecast_Date:23#!00-00-00!)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_OrderCount=0)
				OBJECT SET VISIBLE:C603(*; "oVfDate@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oVfDateT@"; False:C215)
			End if 
			
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vRDateF=!00-00-00!)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderCount)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Required_Date:9#!00-00-00!)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_OrderCount=0)
				OBJECT SET VISIBLE:C603(*; "oVRDate@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oVRDateT@"; False:C215)
			End if 
			
		Else 
			//VDodateT:=VDodateF
		End if 
		If (vAmountF=0)
			OBJECT SET VISIBLE:C603(*; "ovAmountT"; False:C215)
		End if 
		If (vMarginF=0)
			OBJECT SET VISIBLE:C603(*; "ovMarginT"; False:C215)
		End if 
		If (vMarginPF=0)
			OBJECT SET VISIBLE:C603(*; "ovMarginPT"; False:C215)
		End if 
		If (ACC_t_PeriodFrom="")
			OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; False:C215)
		End if 
		//TRACE
		//WS_AutoscreenSize (2;383;529)
		
		$_l_TableNumber:=Table:C252(->[ORDERS:24])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[ORDERS:24]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_CustomFieldsCount:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_CustomFieldsCount#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_CustomFieldsCount)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_CustomFieldsCount)
				For ($_l_CustomFieldsIndex; 1; $_l_CustomFieldsCount)  //clear the arr first
					CUS_at_DisplayedData{$_l_CustomFieldsIndex}:=""
					CUS_at_PageText{$_l_CustomFieldsIndex}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
				ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)
				
				LB_SetupListbox(->ORD_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->ORD_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeOff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeOff
				$_l_PreferredWidth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PreferredWidth)
					$_l_RemaingWidth:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->ORD_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_RemaingWidth/2); ($_l_RemaingWidth/2); 40; 0)
				End if 
				
				LB_SetEnterable(->ORD_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->ORD_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->ORD_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->ORD_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->ORD_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->ORD_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_ListboxHeight:=401+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_ListboxHeight<600)
					WS_AutoscreenSize(2; $_l_ListboxHeight; $_l_TotalWidth)
				Else 
					$_l_ListboxHeight:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_ListboxHeight-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_objectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_ListboxHeight-$_l_objectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					//$_l_ObjectTop:=
					OBJECT MOVE:C664(*; "OHoldText"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					
					OBJECT GET COORDINATES:C663(*; "oCancelButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_ListboxHeight-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_ListboxHeight-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_ListboxHeight-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
				End if 
			Else 
				$_l_ListboxHeight:=404
				If ($_l_ListboxHeight<404)
					WS_AutoscreenSize(2; $_l_ListboxHeight; $_l_TotalWidth)
				Else 
					$_l_ListboxHeight:=404
					WS_AutoscreenSize(2; 404; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			
			$_l_ListboxHeight:=404
			If ($_l_ListboxHeight<404)
				WS_AutoscreenSize(2; $_l_ListboxHeight; $_l_TotalWidth)
			Else 
				$_l_ListboxHeight:=404
				WS_AutoscreenSize(2; 404; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		If (SM_l_QueryMode=2)
			
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Contacts"; 3; "")
			DB_MenuAction("Find"; "Diary"; 3; "")
			DB_MenuAction("Find"; "Order items"; 3; "")
			DB_MenuAction("Find"; "Subscriptions"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
			DB_MenuAction("Find"; "Diary"; 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Diary Items"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
			DB_MenuAction("Find"; "Order items"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_Subscriptions)<2)
			DB_MenuAction("Find"; "Subscriptions"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		If (DB_t_CurrentFormUsage="Fore")
			vFDateF:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
			vFDateT:=vFDateF+32-Day of:C23(vFDateF+32)
		End if 
		If (DB_t_CurrentFormUsage="GM")
			vIDateF:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
			vIDateT:=vIDateF+32-Day of:C23(vIDateF+32)
		End if 
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		Ord_t_EnquiryLabel:=Term_OrdWT("Enquiry Date")
		OBJECT SET TITLE:C194(*; "oEnquriesLabel"; Ord_t_EnquiryLabel+" :")
		
		Ord_t_QuotationLabel:=Term_OrdWT("Qtn Date")
		OBJECT SET TITLE:C194(*; "oQuotationLabel"; Ord_t_QuotationLabel+" :")
		
		vTitle2:=Term_FSWT("Fore/Surname")
		OBJECT SET TITLE:C194(*; "oContactNameLabel"; vTitle2+" :")
		
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[ORDERS:24]); <>PER_l_CurrentUserID)
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
			ACC_l_EntryDateFromOffset:=0
			VSDateFOffset:=0
			ViDateFOffset:=0
			VFDateFOffset:=0
			VRDateFOffset:=0
			
			ACC_l_EntryDateToOffset:=0
			VSDateTOffset:=0
			ViDateTOffset:=0
			VFDateTOffset:=0
			VRDateTOffset:=0
			
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
					
					OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
					If (ACC_l_PeriodToOffset>0)
						If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
						
						OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
						
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
						
						OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
					End if 
				End if 
			End if 
			
			If (ACC_l_EntryDateFromOffset#0)
				Case of 
					: (ACC_l_EntryDateFromOffset>0)
						ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
			End if 
			If (ACC_l_EntryDateToOffset#0)
				Case of 
					: (ACC_l_EntryDateToOffset>0)
						ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
					: (ACC_l_EntryDateToOffset>-100)
						//months
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
				
			End if 
			If (VsDateFOffset#0)
				Case of 
					: (VsDateFOffset>0)
						VsDateF:=Current date:C33-VsDateFOffset
					: (VsDateFOffset>-100)
						//months
						VsDateF:=Add to date:C393(Current date:C33; 0; VsDateFOffset; 0)
					Else 
						//years
						VsDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
			End if 
			If (VsDateTOffset#0)
				Case of 
					: (VsDateTOffset>0)
						VsDateF:=Current date:C33-VsDateTOffset
					: (VsDateTOffset>-100)
						//months
						VsDateT:=Add to date:C393(Current date:C33; 0; VsDateTOffset; 0)
					Else 
						//years
						VsDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
			End if 
			If (vIDateFOffset#0)
				Case of 
					: (vIDateFOffset>0)
						vIDateF:=Current date:C33-vIDateFOffset
					: (vIDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; vIDateFOffset; 0)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
			End if 
			If (vIDateTOffset#0)
				Case of 
					: (vIDateTOffset>0)
						vIDateF:=Current date:C33-vIDateTOffset
					: (vIDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; vIDateTOffset; 0)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
			End if 
			If (vFDateFOffset#0)
				Case of 
					: (vFDateFOffset>0)
						vFDateF:=Current date:C33-vFDateFOffset
					: (vFDateFOffset>-100)
						//months
						vFDateF:=Add to date:C393(Current date:C33; 0; vFDateFOffset; 0)
					Else 
						//years
						vFDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovFDateT@"; True:C214)
			End if 
			If (vFDateTOffset#0)
				Case of 
					: (vFDateTOffset>0)
						vFDateF:=Current date:C33-vFDateTOffset
					: (vFDateTOffset>-100)
						//months
						vFDateT:=Add to date:C393(Current date:C33; 0; vFDateTOffset; 0)
					Else 
						//years
						vFDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovFDateT@"; True:C214)
			End if 
			If (vRDateFOffset#0)
				Case of 
					: (vRDateFOffset>0)
						vRDateF:=Current date:C33-vRDateFOffset
					: (vRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; vRDateFOffset; 0)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
			End if 
			If (vRDateTOffset#0)
				Case of 
					: (vRDateTOffset>0)
						vRDateF:=Current date:C33-vRDateTOffset
					: (vRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; vRDateTOffset; 0)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
			End if 
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(ORD_at_TabChoices; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		ARRAY BOOLEAN:C223(Ord_abo_Include; 0)
		ARRAY BOOLEAN:C223(Ord_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
		For ($_l_CustomFieldsIndex; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
			Ord_abo_Include{$_l_CustomFieldsIndex}:=(MOD_al_ModuleAccessStatus{$_l_CustomFieldsIndex}=1)
		End for 
		
		
		LB_SetupListbox(->ORD_LB_States; "oRS"; "RS_L"; 1; ->Ord_abo_Include; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus)
		
		
		LB_SetColumnHeaders(->ORD_LB_States; "RS_L"; 1; "Include"; "Name")
		
		
		LB_SetColumnWidths(->ORD_LB_States; "oABR"; 1; 20; 80; 0)
		
		LB_SetEnterable(->ORD_LB_States; False:C215; 0)
		LB_SetEnterable(->ORD_LB_States; True:C214; 1)
		
		If ((Size of array:C274(SYS_at_RecordStateNames)*16)>90)
			LB_SetScroll(->ORD_LB_States; -3; -2)
		Else 
			LB_SetScroll(->ORD_LB_States; -3; -3)
		End if 
		LB_StyleSettings(->ORD_LB_States; "Black"; 9; "STK_t"; ->[ORDERS:24])
		
		rHold:=0
	: ($_l_FormEvent=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VSDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VSDateF>VSDateT) & (VSDateT>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->ViDATEF))
				If (ViDateF>!00-00-00!)
					If (SRCH_bo_ViDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ViDateF>ViDateT) & (ViDateT>!00-00-00!)
						ViDateT:=ViDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oViDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ViDATET))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (ViDateT<ViDateF)
						ViDateF:=ViDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRDATEF))
				If (vRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VRDateF>VRDateT) & (VRDateT>!00-00-00!)
						
						VRDateT:=VRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRDATET))
				If (VRDateT>!00-00-00!)
					If (VRDateT<VRDateF)
						VRDateF:=VRDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VFDATEF))
				If (vFDateF>!00-00-00!)
					If (SRCH_bo_VFDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VFDateF>VFDateT) & (VFDateT>!00-00-00!)
						VFDateT:=VFDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VFDATET))
				If (VFDateT>!00-00-00!)
					If (VFDateT<VFDateF)
						VFDateF:=VFDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountF>0)
					OBJECT SET VISIBLE:C603(*; "ovAmountT"; True:C214)
					If (vAmountT<vAmountF) & (vAmountT>0)
						vAmountT:=vAmountF
					End if 
				End if 
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vMarginF)
				If (vMarginF>0)
					OBJECT SET VISIBLE:C603(*; "ovMarginT"; True:C214)
					
					If (vMarginT<vMarginF) & (vMarginT>0)
						vMarginT:=vMarginF
					End if 
				End if 
			: ($_ptr_FocusObject=->vMarginT)
				If (vMarginF>vMarginT)
					vMarginF:=vMarginT
				End if 
			: ($_ptr_FocusObject=->vMarginPF)
				If (vMarginPF>0)
					OBJECT SET VISIBLE:C603(*; "ovMarginPT"; True:C214)
					
					If (vMarginPT<vMarginPF) & (vMarginPT>0)
						vMarginPT:=vMarginPF
					End if 
				End if 
			: ($_ptr_FocusObject=->vMarginPT)
				If (vMarginPF>vMarginPT)
					vMarginPF:=vMarginPT
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodFrom))
				If (ACC_t_PeriodFrom#"")
					OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
					
					If (ACC_t_PeriodTo<ACC_t_PeriodFrom) & (ACC_t_PeriodTo#"")
						ACC_t_PeriodTo:=ACC_t_PeriodFrom
					End if 
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodTo))
				If (ACC_t_PeriodFrom>ACC_t_PeriodTo)
					ACC_t_PeriodFrom:=ACC_t_PeriodTo
				End if 
		End case 
		
		
	: ($_l_FormEvent=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VSDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VSDateF>VSDateT) & (VSDateT>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VSDATET))
				If (VSDateT>!00-00-00!)
					If (VSDateT<VSDateF)
						VSDateF:=VSDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->ViDATEF))
				If (ViDateF>!00-00-00!)
					If (SRCH_bo_ViDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ViDateF>ViDateT) & (ViDateT>!00-00-00!)
						ViDateT:=ViDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ViDATET))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (ViDateT<ViDateF)
						ViDateF:=ViDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRDATEF))
				If (vRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VRDateF>VRDateT) & (VRDateT>!00-00-00!)
						
						VRDateT:=VRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRDATET))
				If (VRDateT>!00-00-00!)
					If (VRDateT<VRDateF)
						VRDateF:=VRDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VFDATEF))
				If (vFDateF>!00-00-00!)
					If (SRCH_bo_VFDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VFDateF>VFDateT) & (VFDateT>!00-00-00!)
						VFDateT:=VFDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VFDATET))
				If (VFDateT>!00-00-00!)
					If (VFDateT<VFDateF)
						VFDateF:=VFDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vAmountF
				End if 
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vMarginF)
				If (vMarginT<vMarginF) & (vMarginT>0)
					vMarginT:=vMarginF
				End if 
			: ($_ptr_FocusObject=->vMarginT)
				If (vMarginF>vMarginT)
					vMarginF:=vMarginT
				End if 
			: ($_ptr_FocusObject=->vMarginPF)
				If (vMarginPT<vMarginPF) & (vMarginPT>0)
					vMarginPT:=vMarginPF
				End if 
			: ($_ptr_FocusObject=->vMarginPT)
				If (vMarginPF>vMarginPT)
					vMarginPF:=vMarginPT
				End if 
		End case 
		
		
	: ($_l_FormEvent=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
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
				$_d_LDateF:=vIDateF
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
				$_t_Enclosures:=venclosures
				$_t_OrderNo:=vOrderNo
				$_t_Telephone:=vTele
				$_t_ProductCode:=vProdCode
				$_t_Event:=vEvent
				$_t_Area:=vArea
				$_t_AnalysisCode:=Vanalysis
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_t_LayerCode:=vLayer
				COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
				COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_l_PeriodToOffset:=ACC_l_PeriodToOffset
				$_l_PeriodFromOffset:=ACC_l_PeriodFromOffset
				$_t_ContactName:=VcontactName
				$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
				$_l_SDateFromOffset:=VSDateFOffset
				$_l_iDateFromOffset:=ViDateFOffset
				$_l_fDateFromOffset:=VFDateFOffset
				$_l_rDateFromOffset:=VRDateFOffset
				$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
				$_l_sDateToOffset:=VSDateTOffset
				$_l_iDateToOffset:=ViDateTOffset
				$_l_fDateToOffset:=VFDateTOffset
				$_l_rDateToOffset:=VRDateTOffset
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
				OBJECT GET COORDINATES:C663(*; "oStates"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom)
				OBJECT GET COORDINATES:C663(*; "oanalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom)
				OBJECT GET COORDINATES:C663(*; "oanalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom)
				OBJECT GET COORDINATES:C663(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom)
				OBJECT GET COORDINATES:C663(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom)
				
				
				
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				$_d_edateFBASE:=VedateFBASE
				$_d_edateTBASE:=VedateTBASE
				$_d_sdateFBASE:=VsdateFBASE
				$_d_sdateTBASE:=VsdateTBASE
				$_d_fdateFBASE:=VfdateFBASE
				$_d_fdateTBASE:=VfdateTBASE
				$_d_FromBase:=SRCH_d_FromBase
				$_d_iDateTBase:=VidateTBASE
				$_d_rDateTBase:=VRdateFBASE
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
					$_l_OK:=Orders_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Orders_SelLP(-1; SM_l_QueryMode; Table:C252(->[ORDERS:24]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(53)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				VedateFBASE:=$_d_edateFBASE
				VedateTBASE:=$_d_edateTBASE
				VsdateFBASE:=$_d_sdateFBASE
				VsdateTBASE:=$_d_sdateTBASE
				VfdateFBASE:=$_d_fdateFBASE
				VfdateTBASE:=$_d_fdateTBASE
				SRCH_d_FromBase:=$_d_FromBase
				VidateTBASE:=$_d_iDateTBase
				VRdateFBASE:=$_d_rDateTBase
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
				OBJECT MOVE:C664(*; "oStates"; $_l_StatesLeft; $_l_StatesTop; $_l_StatesRight; $_l_StatesBottom; *)
				OBJECT MOVE:C664(*; "oanalysis"; $_l_AnalysisLeft; $_l_AnalysisTop; $_l_AnalysisRight; $_l_AnalysisBottom; *)
				OBJECT MOVE:C664(*; "oanalysisLabel"; $_l_AnalysisLabelLeft; $_l_AnalysisLabelTop; $_l_AnalysisLabelRight; $_l_AnalysisLabelBottom; *)
				OBJECT MOVE:C664(*; "oCurrency"; $_l_CurrencyLeft; $_l_CurrencyTop; $_l_CurrencyRight; $_l_CurrencyBottom; *)
				OBJECT MOVE:C664(*; "oCurrencyLabel"; $_l_CurrencyLabelLeft; $_l_CurrencyLabelTop; $_l_CurrencyLabelRight; $_l_CurrencyLabelBottom; *)
				OBJECT MOVE:C664(*; "oLayer"; $_l_LayerLeft; $_l_LayerTop; $_l_LayerRight; $_l_LayerBottom; *)
				OBJECT MOVE:C664(*; "oLayerLabel"; $_l_LayerLabelLeft; $_l_LayerLabelTop; $_l_LayerLabelRight; $_l_LayerLabelBottom; *)
				ARRAY BOOLEAN:C223(Ord_abo_Include; 0)
				ARRAY BOOLEAN:C223(Ord_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
				For ($_l_CustomFieldsIndex; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
					Ord_abo_Include{$_l_CustomFieldsIndex}:=(MOD_al_ModuleAccessStatus{$_l_CustomFieldsIndex}=1)
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
				[ORDERS:24]Enclosures:21:=$_t_Enclosures
				
				vOrderNo:=$_t_OrderNo
				vTele:=$_t_Telephone
				vProdCode:=$_t_ProductCode
				vEvent:=$_t_Event
				vArea:=$_t_Area
				vanalysis:=$_t_AnalysisCode
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				vLayer:=$_t_LayerCode
				COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
				COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				ACC_l_PeriodToOffset:=$_l_PeriodToOffset
				ACC_l_PeriodFromOffset:=$_l_PeriodFromOffset
				VcontactName:=$_t_ContactName
				ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
				VSDateFOffset:=$_l_SDateFromOffset
				ViDateFOffset:=$_l_iDateFromOffset
				VFDateFOffset:=$_l_fDateFromOffset
				VRDateFOffset:=$_l_rDateFromOffset
				ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
				VSDateTOffset:=$_l_sDateToOffset
				ViDateTOffset:=$_l_iDateToOffset
				VFDateTOffset:=$_l_fDateToOffset
				VRDateTOffset:=$_l_rDateToOffset
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
				rHold:=0
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:dOrders_Sel"; $_t_oldMethodName)
