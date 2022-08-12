If (False:C215)
	//Table Form Method Name: Object Name:      [PURCHASE_INVOICES].dPurch_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PUR_Lb_FurtherFieldsQuery;0)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(PUR_al_TabOffset;0)
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
	//ARRAY TEXT(PUR_at_SearchTab;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VIDateToSet; $_bo_VPDateToSet; $_bo_VRDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VIDateToSet; SRCH_bo_VpDateToSet; SRCH_bo_VRDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_FromBase; $_d_iDateF; $_d_iDateT; $_d_iDateTBase; $_d_pDateF; $_d_pDateFBASE; $_d_pDateT; $_d_pDateTBASE; $_d_rDateFBase; $_d_rDateT; $_d_rdateTBase)
	C_DATE:C307(SRCH_d_FromBase; SRCH_d_rdateTBase; vIDateF; vIdateT; VIdateTBASE; vPDateF; VPdateFBASE; vPdateT; VPdateTBASE; vRDateF; VRdateFBASE)
	C_DATE:C307(vRdateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CH0; $_l_CH0Bottom; $_l_CH0Left; $_l_CH0Right)
	C_LONGINT:C283($_l_CH0Top; $_l_ch1; $_l_CH1Bottom; $_l_CH1Left; $_l_CH1Right; $_l_CH1Top; $_l_ch2; $_l_CH2Bottom; $_l_CH2Left; $_l_CH2Right; $_l_CH2Top)
	C_LONGINT:C283($_l_ch3; $_l_CH3Bottom; $_l_CH3Left; $_l_CH3Right; $_l_CH3Top; $_l_Ch4; $_l_CH4Bottom; $_l_CH4Left; $_l_CH4Right; $_l_CH4Top; $_l_Ch5)
	C_LONGINT:C283($_l_CH5Bottom; $_l_CH5Left; $_l_CH5Right; $_l_CH5Top; $_l_Ch6; $_l_Ch7; $_l_ColumnsTakeoff; $_l_ColumnsWidth; $_l_CompanyNameBottom; $_l_CompanyNameLeft; $_l_CompanyNameRight)
	C_LONGINT:C283($_l_CompanyNameTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_defaultparams; $_l_event; $_l_Formevent; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft)
	C_LONGINT:C283($_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_Height; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight)
	C_LONGINT:C283($_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_inset; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight)
	C_LONGINT:C283($_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft)
	C_LONGINT:C283($_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft)
	C_LONGINT:C283($_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom)
	C_LONGINT:C283($_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth; $_l_offset)
	C_LONGINT:C283($_l_OK; $_l_OrderNoBottom; $_l_OrderNoLabelBottom; $_l_OrderNoLabelLeft; $_l_OrderNoLabelRight; $_l_OrderNoLabelTop; $_l_OrderNoLeft; $_l_OrderNoRight; $_l_OrderNoTop; $_l_PrefferedWIdth; $_l_QueryMode)
	C_LONGINT:C283($_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_R0; $_l_R1; $_l_Remaining; $_l_SelectedRow; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight)
	C_LONGINT:C283($_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_TableNumber; $_l_TableRow; $_l_TabsWidth; $_l_TotalWidth; $_l_VIDateFOffset; $_l_VIDateTOffset; $_l_VPDateFOffset; $_l_VPDateTOffset)
	C_LONGINT:C283($_l_VRDateFOffset; $_l_VRDateTOffset; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11)
	C_LONGINT:C283(CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21)
	C_LONGINT:C283(CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7)
	C_LONGINT:C283(CCQ_l_BUT8; CCQ_l_BUT9; CH0; ch1; ch2; ch3; ch4; CH5; ch6; ch7; cNAA)
	C_LONGINT:C283(cNAL; cSIS; r0; R1; RHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; VIDateFOffset; ViDateTOffset; VPDateFOffset)
	C_LONGINT:C283(VPDateTOffset; VRDateFOffset; VRDateTOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ChargesF; $_r_ChargesT; $_r_DueF; $_r_DueTo; $_r_InvF; $_r_InvT; VamountF; VamountT; vChargesF)
	C_REAL:C285(VCHARGEST; vDueF; vDueT; VDUETO; VinvF; vInvT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalCodeT; $_t_AnalysisCodeF; $_t_CompanyCode; $_t_CompName; $_t_CurrencyCode; $_t_event; $_t_FormUsage)
	C_TEXT:C284($_t_FormUsage3; $_t_Job; $_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_OrderNo; $_t_ProductCode; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_Stage; $_t_TableNumberString)
	C_TEXT:C284(Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1)
	C_TEXT:C284(oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2)
	C_TEXT:C284(oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5)
	C_TEXT:C284(oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15)
	C_TEXT:C284(oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25)
	C_TEXT:C284(oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; VAnalCodeT; VAnalCodT)
	C_TEXT:C284(VCompCode; VCompName; Vevent; VJob; VLayer; Vname; VorderNo; VProdCode; VPurchCode; VPurchInvNo; vStage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].dPurch_Sel"; Form event code:C388)
Sel_LProc2(->[PURCHASE_INVOICES:37])
$_l_Formevent:=Form event code:C388

Case of 
	: ($_l_Formevent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		vIDateF:=!00-00-00!
		vIdateT:=!00-00-00!
		vPDateF:=!00-00-00!
		vPdateT:=!00-00-00!
		vRDateF:=!00-00-00!
		vRdateT:=!00-00-00!
		//SRCH_d_EntryDateFrom:=!00/00/00!
		SRCH_d_FromBase:=!00-00-00!
		vIdateTBASE:=!00-00-00!
		vPdateFBASE:=!00-00-00!
		VPdateTBASE:=!00-00-00!
		VRdateFBASE:=!00-00-00!
		SRCH_d_rdateTBase:=!00-00-00!
		
		
		SRCH_bo_VIDateToSet:=False:C215
		SRCH_bo_VPDateToSet:=False:C215
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
		
		SET MENU BAR:C67(51)
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "dPurch_Sel")
		ARRAY TEXT:C222(PUR_at_SearchTab; 0)
		ARRAY LONGINT:C221(PUR_al_TabOffset; 0)
		APPEND TO ARRAY:C911(PUR_at_SearchTab; "Purchases")
		APPEND TO ARRAY:C911(PUR_al_TabOffset; 0)
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(PUR_at_SearchTab; "Companies")
			APPEND TO ARRAY:C911(PUR_al_TabOffset; 1)
			
		End if 
		PUR_at_SearchTab:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(PUR_at_SearchTab))
			dbtabText2:=dbtabText2+PUR_at_SearchTab{$_l_TabsWidth}+(" "*8)
		End for 
		//TRACE
		
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
		If (vIDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vPDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; False:C215)
		Else 
			//VsdateT:=VsdateF
		End if 
		If (vRDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oDueDateT@"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (ACC_t_PeriodFrom="")
			OBJECT SET VISIBLE:C603(*; "oPeriodCodeT"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ovPeriodTDropDown"; False:C215)
			
		Else 
			//VfdateT:=VfdateF
		End if 
		If (ACC_t_AnalysisCodeFrom="")
			OBJECT SET VISIBLE:C603(*; "oAnalysisT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vStage="")
			OBJECT SET VISIBLE:C603(*; "oCreditstageT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vAmountF=0)
			OBJECT SET VISIBLE:C603(*; "oAgeT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vInvF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalInvoicedT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vChargesF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalPaidT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vDueF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalDueT"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		
		
		SM_LoadSearchParameterNames(Table:C252(->[PURCHASE_INVOICES:37]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		
		//WS_AutoscreenSize (2;361;529)
		$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICES:37])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[PURCHASE_INVOICES:37]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_SelectedRow:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_SelectedRow#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SelectedRow)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_SelectedRow)
				For ($_l_Index; 1; $_l_SelectedRow)  //clear the arr first
					
					CUS_at_DisplayedData{$_l_Index}:=""
					CUS_at_PageText{$_l_Index}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
				ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)  //& (False)
				
				
				
				
				
				LB_SetupListbox(->PUR_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->PUR_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=592-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->PUR_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				LB_SetEnterable(->PUR_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->PUR_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->PUR_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->PUR_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->PUR_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->PUR_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_Height:=375+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_inset; $_l_ObjectTop; $_l_TotalWidth-$_l_inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_objectBottom)
					$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_objectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					//$_l_ObjectTop:=
					OBJECT MOVE:C664(*; "OHoldText"; $_l_TotalWidth-$_l_ObjectWidth-$_l_inset; $_l_ObjectTop; $_l_TotalWidth-$_l_inset; $_l_ObjectBottom; *)
					
					OBJECT GET COORDINATES:C663(*; "oCancelButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_inset; $_l_ObjectTop; $_l_TotalWidth-$_l_inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_inset; $_l_ObjectTop; $_l_TotalWidth-$_l_inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_inset; $_l_ObjectTop; $_l_TotalWidth-$_l_inset; $_l_ObjectBottom; *)
				End if 
				$_l_Height:=459
				If ($_l_Height<459)
					
					
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
					
					
				Else 
					$_l_Height:=459
					
					WS_AutoscreenSize(2; 386; $_l_TotalWidth)
					
					
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			
			$_l_Height:=386
			If ($_l_Height<386)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=386
				WS_AutoscreenSize(2; 386; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		
		r0:=1
		If ((DB_t_CurrentFormUsage="AC") | (DB_t_CurrentFormUsage="Pay"))
			ch1:=1
			ch2:=1
			ch3:=1
			ch7:=1
		End if 
		If (DB_t_CurrentFormUsage="AA")
			ch1:=1
			ch2:=1
			ch3:=1
		End if 
		If ((DB_t_CurrentFormUsage="Cheq") | (DB_t_CurrentFormUsage="AP"))
			ch3:=1
			ch4:=1
		End if 
		If (DB_t_CurrentFormUsage="AP")
			ch6:=1
		End if 
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		DB_MenuAction("Functions"; "Contacts"; 3; "")
		//DISABLE MENU ITEM(2049;2)
		
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[PURCHASE_INVOICES:37]); <>PER_l_CurrentUserID)
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
			
			VIDateFOffset:=0
			VPDateFOffset:=0
			VRDateFOffset:=0
			
			ViDateTOffset:=0
			VPDateTOffset:=0
			VRDateTOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
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
				OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
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
				OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
			End if 
			If (vPDateFOffset#0)
				Case of 
					: (vPDateFOffset>0)
						vPDateF:=Current date:C33-vPDateFOffset
					: (vPDateFOffset>-100)
						//months
						vPDateF:=Add to date:C393(Current date:C33; 0; vPDateFOffset; 0)
					Else 
						//years
						vPDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
			End if 
			If (vPDateTOffset#0)
				Case of 
					: (vPDateTOffset>0)
						vPDateF:=Current date:C33-vPDateTOffset
					: (vPDateTOffset>-100)
						//months
						vPDateT:=Add to date:C393(Current date:C33; 0; vPDateTOffset; 0)
					Else 
						//years
						vPDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
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
				OBJECT SET VISIBLE:C603(*; "oDueDateT@"; True:C214)
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
				OBJECT SET VISIBLE:C603(*; "oDueDateT@"; True:C214)
			End if 
			
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
		If (SM_l_QueryMode=2)  // edit
			
			OBJECT SET VISIBLE:C603(PUR_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
		
	: ($_l_Formevent=On Menu Selected:K2:14)
		
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_CompanyCode:=VCompCode
				$_t_CompName:=VCompName
				$_t_PurchaseCode:=VPurchCode
				$_t_PurchaseInvoiceNo:=VPurchInvNo
				$_t_OrderNo:=VorderNo
				$_d_iDateF:=ViDateF
				$_d_iDateT:=ViDateT
				$_t_AccPeriodFrom:=ACC_t_PeriodFrom
				$_t_AnalysisCodeF:=ACC_t_AnalysisCodeFrom
				$_t_AccPeriodTo:=ACC_t_PeriodTo
				$_t_AnalCodeT:=VAnalCodeT
				$_t_Stage:=VStage
				$_t_Job:=VJob
				$_d_pDateF:=VpDateF
				$_d_pDateT:=VRdateF
				$_r_AmountFrom:=VamountF
				$_r_InvF:=VInvF
				$_r_ChargesF:=VChargesF
				$_r_DueF:=vDueF
				$_t_AccountCodeFrom:=Acc_t_AccountCodeFrom
				$_d_pDateT:=VpDateT
				$_d_rDateT:=VRdateT
				$_r_AmountTo:=VamountT
				$_r_InvT:=VInvT
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
				$_d_iDateTBase:=VIdateTBASE
				$_d_pDateTBASE:=VPdateTBASE
				$_d_pDateFBASE:=VPdateFBASE
				$_d_rDateFBase:=VRdateFBASE
				$_d_rdateTBase:=SRCH_d_rdateTBase
				$_bo_VIDateToSet:=SRCH_bo_VIDateToSet
				$_bo_VPDateToSet:=SRCH_bo_VpDateToSet
				$_bo_VRDateToSet:=SRCH_bo_VRDateToSet
				$_l_VIDateFOffset:=VIDateFOffset
				$_l_VPDateFOffset:=VPDateFOffset
				$_l_VRDateFOffset:=VRDateFOffset
				$_l_VIDateTOffset:=ViDateTOffset
				$_l_VPDateTOffset:=VPDateTOffset
				$_l_VRDateTOffset:=VRDateTOffset
				
				
				
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
					$_l_OK:=Purchases_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Purchases_SelLP(-1; SM_l_QueryMode; Table:C252(->[PURCHASE_INVOICES:37]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(51)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				SRCH_d_FromBase:=$_d_FromBase
				VIdateTBASE:=$_d_iDateTBase
				VPdateTBASE:=$_d_pDateTBASE
				VPdateFBASE:=$_d_pDateFBASE
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
				ViDateF:=$_d_iDateF
				ViDateT:=$_d_iDateT
				ACC_t_PeriodFrom:=$_t_AccPeriodFrom
				ACC_t_AnalysisCodeFrom:=$_t_AnalysisCodeF
				ACC_t_PeriodTo:=$_t_AccPeriodTo
				VAnalCodT:=$_t_AnalCodeT
				VStage:=$_t_Stage
				VJob:=$_t_Job
				VpDateF:=$_d_pDateF
				VRDateF:=$_d_pDateT
				VamountF:=$_r_AmountFrom
				VInvF:=$_r_InvF
				VChargesF:=$_r_ChargesF
				VDueF:=$_r_DueF
				Acc_t_AccountCodeFrom:=$_t_AccountCodeFrom
				VpDateT:=$_d_pDateT
				VRDateT:=$_d_rDateT
				VamountT:=$_r_AmountTo
				VInvT:=$_r_InvT
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
				VIDateFOffset:=$_l_VIDateFOffset
				VPDateFOffset:=$_l_VPDateFOffset
				VRDateFOffset:=$_l_VRDateFOffset
				ViDateTOffset:=$_l_VIDateTOffset
				VPDateTOffset:=$_l_VPDateTOffset
				VRDateTOffset:=$_l_VRDateTOffset
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
	: ($_l_Formevent=On Data Change:K2:15)
		
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->vIDateF))
				If (vIDateF>!00-00-00!)
					
					If (vIDateF>vIDateT) & (vIDateF>!00-00-00!)
						
						vIDateT:=vIDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDate@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vIDateT))
				If (vIDateT>!00-00-00!)
					If (vIDateT<vIDateF)
						vIDateF:=vIDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodFrom))
				If (ACC_t_PeriodFrom#"")
					
					If (ACC_t_PeriodFrom>ACC_t_PeriodTo) & (ACC_t_PeriodFrom#"")
						
						
						ACC_t_PeriodTo:=ACC_t_PeriodFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oPeriodCodeT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ACC_t_PeriodTo))
				If (ACC_t_PeriodTo#"")
					If (ACC_t_PeriodTo<ACC_t_PeriodFrom)
						ACC_t_PeriodFrom:=ACC_t_PeriodTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->ACC_t_AnalysisCodeFrom))
				If (ACC_t_AnalysisCodeFrom#"")
					
					If (ACC_t_AnalysisCodeFrom>vAnalCodeT) & (ACC_t_AnalysisCodeFrom#"")
						
						
						vAnalCodeT:=ACC_t_AnalysisCodeFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oAnalysisT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vPDateF))
				If (vPDateF>!00-00-00!)
					
					If (vPDateF>vPDateT) & (vPDateF>!00-00-00!)
						
						vPDateT:=vPDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vPDateT))
				If (vPDateT>!00-00-00!)
					If (vPDateT<vPDateF)
						vPDateF:=vPDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vrDateF))
				If (vrDateF>!00-00-00!)
					
					If (vrDateF>vrDateT) & (vrDateF>!00-00-00!)
						
						vrDateT:=vrDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oDueDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vrDateT))
				If (vrDateT>!00-00-00!)
					If (vrDateT<vrDateF)
						vrDateF:=vrDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vAmountF))
				If (vAmountF#0)
					
					If (vAmountF>vAmountT) & (vAmountF#0)
						
						vAmountT:=vAmountF
					End if 
					OBJECT SET VISIBLE:C603(*; "oAgeT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vAmountT))
				If (vAmountT#0)
					If (vAmountT<vAmountF)
						vAmountF:=vAmountT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vInvF))
				If (vInvF#0)
					
					If (vInvF>vInvT) & (vInvF#0)
						
						vInvT:=vInvF
					End if 
					OBJECT SET VISIBLE:C603(*; "oAgeT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vInvT))
				If (vInvT#0)
					If (vInvT<vInvF)
						vInvF:=vInvT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vChargesF))
				If (vChargesF#0)
					
					If (vChargesF>vChargesT) & (vChargesF#0)
						
						vChargesT:=vChargesF
					End if 
					OBJECT SET VISIBLE:C603(*; "oTotalPaidT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vChargesT))
				If (vChargesT#0)
					If (vChargesT<vChargesF)
						vChargesF:=vChargesT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vDueF))
				If (vDueF#0)
					
					If (vDueF>vDueT) & (vDueF#0)
						
						vDueT:=vDueF
					End if 
					OBJECT SET VISIBLE:C603(*; "oTotalDueT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vDueT))
				If (vDueT#0)
					If (vDueT<vDueF)
						vDueF:=vDueT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vStage))
				If (vStage#"")
					
					If (vStage>vJob) & (vStage#"")
						
						
						vJob:=vStage
					End if 
					OBJECT SET VISIBLE:C603(*; "oCreditstageT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vJob))
				If (vJob#"")
					If (vJob<vStage)
						vStage:=vJob
					End if 
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("FM:dPurch Sel"; $_t_oldMethodName)
