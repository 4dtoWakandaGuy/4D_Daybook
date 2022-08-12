If (False:C215)
	//Table Form Method Name: [CONTACTS]dCont_Sel
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
	//ARRAY BOOLEAN(CON_Lb_FurtherFieldsQuery;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(CON_al_TabsOffset;0)
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
	//ARRAY TEXT(CON_at_SearchTab;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VeDateToSet; SRCH_bo_VFDateToSet; SRCH_bo_VsDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_EntryDateFr)
	C_DATE:C307($_d_EntryDateTo; $_d_sDateF; $_d_SDateT; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4)
	C_DATE:C307(vDateF5; vDateT1; vDateT2; vDateT3; vDateT4; vDateT5; VedateFBASE; VedateTBASE; VfdateFBASE; VfdateTBASE; vsDateF)
	C_DATE:C307(VsdateFBASE; vsDateT; VsdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_Act1; $_l_Act2; $_l_Act3; $_l_Act4; $_l_Act5; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight)
	C_LONGINT:C283($_l_AreaLabelTop; $_l_AreaLeft; $_l_AreaRight; $_l_AreaTop; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CoAnalysisBottom)
	C_LONGINT:C283($_l_CoAnalysisLabelBottom; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelRight; $_l_CoAnalysisLabelTop; $_l_CoAnalysisLeft; $_l_CoAnalysisRight; $_l_CoAnalysisTop; $_l_ColumnsTakeoff; $_l_ColumnsWidth; $_l_CommentsBottom; $_l_CommentsLeft)
	C_LONGINT:C283($_l_CommentsRight; $_l_CommentsTop; $_l_CompaniesCount; $_l_CompanyBottom; $_l_CompanyCodeBottom; $_l_CompanyCodeLeft; $_l_CompanyCodeRight; $_l_CompanyCodeTop; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop)
	C_LONGINT:C283($_l_ContactCodeBottom; $_l_ContactCodeLabelBottom; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelTop; $_l_ContactCodeLeft; $_l_ContactCodeRight; $_l_ContactCodeTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight)
	C_LONGINT:C283($_l_ContinueButtonTop; $_l_CountryBottom; $_l_CountryLeft; $_l_CountryRight; $_l_CountryTop; $_l_CountyBottom; $_l_CountyLeft; $_l_CountyRight; $_l_CountyTop; $_l_cSetAdd; $_l_cSetMod)
	C_LONGINT:C283($_l_defaultparams; $_l_DupBottom; $_l_DupLabelBottom; $_l_DupLabelLeft; $_l_DupLabelRight; $_l_DupLabelTop; $_l_DupLeft; $_l_DupRight; $_l_DupTop; $_l_EmailBottom; $_l_EmailLeft)
	C_LONGINT:C283($_l_EmailRight; $_l_EmailTop; $_l_EntryDateFromOffset; $_l_EntryDateToOffset; $_l_event; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom)
	C_LONGINT:C283($_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_Height; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft)
	C_LONGINT:C283($_l_inselectLabelRight; $_l_inselectLabelTop; $_l_inset; $_l_JobTitleBottom; $_l_JobTitleLeft; $_l_JobTitleRight; $_l_JobTitleTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_No2)
	C_LONGINT:C283($_l_No3; $_l_No4; $_l_No5; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop)
	C_LONGINT:C283($_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft)
	C_LONGINT:C283($_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom)
	C_LONGINT:C283($_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth; $_l_OK; $_l_OmitBottom; $_l_OmitLabelBottom; $_l_OmitLabelLeft; $_l_OmitLabelRight; $_l_OmitLabelTop)
	C_LONGINT:C283($_l_OmitLeft; $_l_OmitRight; $_l_OmitTop; $_l_PersonBottom; $_l_PersonLeft; $_l_PersonRight; $_l_PersonTop; $_l_PostCodeBottom; $_l_PostCodeLabelBottom; $_l_PostCodeLabelLeft; $_l_PostCodeLabelRight)
	C_LONGINT:C283($_l_PostCodeLabelTop; $_l_PostCodeLeft; $_l_PostCodeRight; $_l_PostCodeTop; $_l_PrefferedWIdth; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_Remaining)
	C_LONGINT:C283($_l_RoleBottom; $_l_RoleLabelBottom; $_l_RoleLabelLeft; $_l_RoleLabelRight; $_l_RoleLabelTop; $_l_RoleLeft; $_l_RoleRight; $_l_RoleTop; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom)
	C_LONGINT:C283($_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SizeofArray; $_l_SizeofArrayalesBottom; $_l_SizeofArrayalesLabelBottom; $_l_SizeofArrayalesLabelLeft; $_l_SizeofArrayalesLabelRight; $_l_SizeofArrayalesLabelTop; $_l_SizeofArrayalesLeft)
	C_LONGINT:C283($_l_SizeofArrayalesRight; $_l_SizeofArrayalesTop; $_l_SourceBottom; $_l_SourceLabelBottom; $_l_SourceLabelLeft; $_l_SourceLabelRight; $_l_SourceLabelTop; $_l_SourceLeft; $_l_SourceRight; $_l_SourceTop; $_l_SrchMinWidth)
	C_LONGINT:C283($_l_StatusBottom; $_l_StatusLabelBottom; $_l_StatusLabelLeft; $_l_StatusLabelRight; $_l_StatusLabelTop; $_l_StatusLeft; $_l_StatusRight; $_l_StatusTop; $_l_TableNumber; $_l_TableRow; $_l_TabsWidth)
	C_LONGINT:C283($_l_TakenByBottom; $_l_TakenByLabelBottom; $_l_TakenByLabelLeft; $_l_TakenByLabelRight; $_l_TakenByLabelTop; $_l_TakenByLeft; $_l_TakenByRight; $_l_TakenByTop; $_l_TelephoneBottom; $_l_TelephoneLabelBottom; $_l_TelephoneLabelLeft)
	C_LONGINT:C283($_l_TelephoneLabelRight; $_l_TelephoneLabelTop; $_l_TelephoneLeft; $_l_TelephoneRight; $_l_TelephoneTop; $_l_TotalWidth; $_l_TownBottom; $_l_TownLeft; $_l_TownRight; $_l_TownTop; $_l_TypeBottom)
	C_LONGINT:C283($_l_TypeLabelBottom; $_l_TypeLabelLeft; $_l_TypeLabelRight; $_l_TypeLabelTop; $_l_TypeLeft; $_l_TypeRight; $_l_TypeTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283(ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17)
	C_LONGINT:C283(CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27)
	C_LONGINT:C283(CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; cNAA; cNAL; CON_l_Dataused; cSetAdd)
	C_LONGINT:C283(cSetMod; cSIS; RHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; vAct1; vAct2; vAct3; vAct4; vAct5)
	C_LONGINT:C283(vNo1; vNo2; vNo3; vNo4; vNo5; VsDateFOffset; VsDatetOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_TEXT:C284($_t_AccountName; $_t_Analysis; $_t_Area; $_t_CalYr; $_t_Charge; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContactTelephone; $_t_ContCode; $_t_Country)
	C_TEXT:C284($_t_County; $_t_Desc1; $_t_Desc2; $_t_Desc3; $_t_Desc4; $_t_Desc5; $_t_email; $_t_ForeName; $_t_FormUsage; $_t_FormUsage3; $_t_JobTitle)
	C_TEXT:C284($_t_oldMethodName; $_t_Omit; $_t_person; $_t_PostCode; $_t_ProductCode; $_t_Role; $_t_Sales; $_t_Source; $_t_Status; $_t_SubGroup1; $_t_SubGroup2)
	C_TEXT:C284($_t_SubGroup3; $_t_SubGroup4; $_t_SubGroup5; $_t_Surname; $_t_TableNumberString; $_t_Title; $_t_Title1; $_t_Title2; $_t_Title3; $_t_Title4; $_t_Title5)
	C_TEXT:C284($_t_town; $_t_Type; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1; oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15)
	C_TEXT:C284(oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2; oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25)
	C_TEXT:C284(oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5; oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10)
	C_TEXT:C284(oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15; oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20)
	C_TEXT:C284(oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25; oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6)
	C_TEXT:C284(oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; vAccName; Vaccount; vAnalysis; Varea; vCalYr; VCharge; Vcomments; vCompCode)
	C_TEXT:C284(VCompName; VContCode; vCountry; vCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vemail; VForeName)
	C_TEXT:C284(VJobTitle; Vomit; Vperson; VPostCode; vProdCode; Vrole; VSales; Vsource; Vstatus; vSubGroup1; vSubGroup2)
	C_TEXT:C284(vSubGroup3; vSubGroup4; vSubGroup5; Vsurname; vTele; Vtitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
	C_TEXT:C284(Vtown; Vtype)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dCont_Sel"; Form event code:C388)
Sel_LProc2(->[CONTACTS:1])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SRCH_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		vsDateF:=!00-00-00!
		vsDateT:=!00-00-00!
		
		VedateFBASE:=!00-00-00!
		VedateTBASE:=!00-00-00!
		VsdateFBASE:=!00-00-00!
		VsdateTBASE:=!00-00-00!
		VfdateFBASE:=!00-00-00!
		VfdateTBASE:=!00-00-00!
		SRCH_d_DodateFBase:=!00-00-00!
		SRCH_d_DoDateTBase:=!00-00-00!
		
		SRCH_bo_VeDateToSet:=False:C215
		SRCH_bo_VsDateToSet:=False:C215
		SRCH_bo_VfDateToSet:=False:C215
		SRCH_bo_VDoDateToSet:=False:C215
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(49)
		OpenHelp(Table:C252(->[CONTACTS:1]); "dCont_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[CONTACTS:1]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		ARRAY TEXT:C222(CON_at_SearchTab; 0)
		ARRAY LONGINT:C221(CON_al_TabsOffset; 0)
		APPEND TO ARRAY:C911(CON_at_SearchTab; "Contacts")
		APPEND TO ARRAY:C911(CON_al_TabsOffset; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(CON_at_SearchTab; "Companies")
			APPEND TO ARRAY:C911(CON_al_TabsOffset; 1)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; CON_l_Dataused)
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[CONTACTS:1]))
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If (CON_l_Dataused>0)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INFORMATION:55]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Information")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 2)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Diary Items")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 3)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Sales Orders")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 4)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Sales Order Items")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 5)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Sales Ledger")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 6)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTRACTS:17]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Contracts")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 7)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[SERVICE_CALLS:20]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Service Calls")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 8)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[JOBS:26]))<0)
				APPEND TO ARRAY:C911(CON_at_SearchTab; "Jobs")
				APPEND TO ARRAY:C911(CON_al_TabsOffset; 9)
			End if 
		End if 
		
		CON_at_SearchTab:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(CON_at_SearchTab))
			dbtabText2:=dbtabText2+CON_at_SearchTab{$_l_TabsWidth}+(" "*8)
		End for 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=592
		End if 
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
		Else 
			If (SRCH_l_MinWidth>=592)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=592
				SRCH_l_MinWidth:=592
			End if 
		End if 
		//TRACE
		//WS_AutoscreenSize (2;381;$_l_TotalWidth)
		$_l_TableNumber:=Table:C252(->[CONTACTS:1])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[CONTACTS:1]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_SizeofArray#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SizeofArray)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_SizeofArray)
				For ($_l_Index; 1; $_l_SizeofArray)  //clear the arr first
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
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)
				
				LB_SetupListbox(->CON_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->CON_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				
				LB_SetColumnWidths(->CON_Lb_FurtherFieldsQuery; "oABR"; 1; 120; 280; 280; 40; 0)
				
				LB_SetEnterable(->CON_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->CON_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->CON_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->CON_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->CON_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->CON_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_Height:=372+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_TotalWidth<900)
					$_l_TotalWidth:=900
				End if 
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->CON_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
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
			Else 
				$_l_Height:=372
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			$_l_Height:=372
			If ($_l_Height<600)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=600
				WS_AutoscreenSize(2; 600; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		
		
		If (SM_l_QueryMode=2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Companies"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Information"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Diary Items"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Orders"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Order Items"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Ledger"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Contracts"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Service calls"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Job"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "And …"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "Or …"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "Not …"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "Save Criteria ..."); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "User Search …"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Diary Items"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Orders"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Order Items"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)<2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Ledger"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)<2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Contracts"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Service calls"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)<2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Job"); 3; "")
		End if 
		
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		
		INT_SetDialog
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[CONTACTS:1]); <>PER_l_CurrentUserID)
			
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		If ($_l_defaultparams>0)
			ACC_l_EntryDateFromOffset:=0
			VsDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VsDatetOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						VSDateF:=Current date:C33-VSDateFOffset
					: (VSDateFOffset>-100)
						//months
						VSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
					Else 
						//years
						VSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVSDateT@"; True:C214)
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						VSDateF:=Current date:C33-VSDateTOffset
					: (VSDateTOffset>-100)
						//months
						VSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
					Else 
						//years
						VSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVSDateT@"; True:C214)
			End if 
			If (ACC_l_EntryDateFromOffset#0)
				Case of 
					: (ACC_l_EntryDateFromOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
			End if 
			If (ACC_l_EntryDateToOffset#0)
				Case of 
					: (ACC_l_EntryDateToOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
					: (ACC_l_EntryDateToOffset>-100)
						//months
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
			End if 
			
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(CON_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		
		rHold:=0
		SD2_SetDiaryPopup
		If (SRCH_d_EntryDateFrom=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVEDateT@"; False:C215)
		Else 
			SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vSDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVSDateT@"; False:C215)
		Else 
			VSdateT:=VSdateF
		End if 
		If (Records in table:C83([CONTACTS_RECORD_ANALYSIS:144])=0)
			OBJECT SET VISIBLE:C603(*; "oAnalysisCON@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Source:14#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oSource@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Source:16#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oCONSource@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Type:13#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oCoType@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Type:15#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oType@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Status:12#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oStatus@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Status:14#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oCONStatus@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Area:11#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oArea@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Sales_Person:29#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "osales@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Taken_By:26#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "otaken@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Taken_by:29#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oCONtaken@"; False:C215)
		End if 
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateFrom))
				If (SRCH_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (SRCH_d_EntryDateFrom>SRCH_d_EntryDateTo)
						SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<SRCH_d_EntryDateFrom)
						SRCH_d_EntryDateFrom:=SRCH_d_EntryDateTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VsDateToSet=False:C215)
						vSDateT:=vSDateF
					End if 
					If (VsDateF>VsDateT)
						VsDateT:=VsDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VsDATET))
				If (VsDateT>!00-00-00!)
					If (VsDateT<VsDateF)
						VsDateF:=VsDateT
					End if 
				End if 
				
				
		End case 
		
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				
				$_t_CompanyCode:=vCompCode
				$_t_Title:=Vtitle
				$_t_ForeName:=VForeName
				$_t_Surname:=Vsurname
				$_t_JobTitle:=VJobTitle
				$_t_Status:=Vstatus
				$_t_Type:=Vtype
				$_t_Source:=Vsource
				$_d_EntryDateFr:=SRCH_d_EntryDateFrom
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				$_d_sDateF:=VsDateF
				$_d_SDateT:=VsDateT
				$_t_CompanyName:=VCompName
				$_t_town:=Vtown
				$_t_County:=vCounty
				$_t_Country:=vCountry
				$_t_Status:=VStatus
				$_t_Type:=VType
				$_t_Source:=VSource
				$_t_ContCode:=VContCode
				$_t_Role:=Vrole
				$_t_Omit:=Vomit
				$_t_Charge:=VCharge
				$_t_person:=Vperson
				$_t_CalYr:=vCalYr
				$_t_AccountName:=vAccName
				$_t_AccountName:=vAccName
				$_t_email:=vemail  // 01/09/03 pb
				$_t_Analysis:=vAnalysis
				$_t_Comments:=Vcomments
				$_t_PostCode:=VPostCode
				$_t_ProductCode:=vProdCode
				$_t_Area:=Varea
				$_t_Sales:=VSales
				$_t_ContactTelephone:=vTele
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				//ch1:=ch1
				$_t_Title1:=vTitle1
				$_t_SubGroup1:=vSubGroup1
				$_t_Desc1:=vDesc1
				$_l_No1:=vNo1
				$_l_Act1:=vAct1
				$_d_DateF1:=vDateF1
				$_d_DateT1:=vDateT1
				$_t_Title2:=vTitle2
				$_t_SubGroup2:=vSubGroup2
				$_t_Desc2:=vDesc2
				$_l_No2:=vNo2
				$_l_Act2:=vAct2
				$_d_DateF2:=vDateF2
				$_d_DateT2:=vDateT2
				
				$_t_Title3:=vTitle3
				$_t_SubGroup3:=vSubGroup3
				$_t_Desc3:=vDesc3
				$_l_No3:=vNo3
				$_l_Act3:=vAct3
				$_d_DateF3:=vDateF3
				$_d_DateT3:=vDateT3
				
				$_t_Title4:=vTitle4
				$_t_SubGroup4:=vSubGroup4
				$_t_Desc4:=vDesc4
				$_l_No4:=vNo4
				$_l_Act4:=vAct4
				$_d_DateF4:=vDateF4
				$_d_DateT4:=vDateT4
				
				$_t_Title5:=vTitle5
				$_t_SubGroup5:=vSubGroup5
				$_t_Desc5:=vDesc5
				$_l_No5:=vNo5
				$_l_Act5:=vAct5
				$_d_DateF5:=vDateF5
				$_d_DateT5:=vDateT5
				$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
				$_l_sDateFOffset:=VsDateFOffset
				$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
				$_l_sDatetOffset:=VsDatetOffset
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarContacts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
				OBJECT GET COORDINATES:C663(*; "oContactCode"; $_l_ContactCodeLeft; $_l_ContactCodeTop; $_l_ContactCodeRight; $_l_ContactCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oContactCodeLabel"; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelTop; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oRole"; $_l_RoleLeft; $_l_RoleTop; $_l_RoleRight; $_l_RoleBottom)
				OBJECT GET COORDINATES:C663(*; "oRoleLabel"; $_l_RoleLabelLeft; $_l_RoleLabelTop; $_l_RoleLabelRight; $_l_RoleLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oPostcode"; $_l_PostCodeLeft; $_l_PostCodeTop; $_l_PostCodeRight; $_l_PostCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oPostcodeLabel"; $_l_PostCodeLabelLeft; $_l_PostCodeLabelTop; $_l_PostCodeLabelRight; $_l_PostCodeLabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom)
				OBJECT GET COORDINATES:C663(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom)
				OBJECT GET COORDINATES:C663(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oSales"; $_l_SizeofArrayalesLeft; $_l_SizeofArrayalesTop; $_l_SizeofArrayalesRight; $_l_SizeofArrayalesBottom)
				OBJECT GET COORDINATES:C663(*; "oSalesLabel"; $_l_SizeofArrayalesLabelLeft; $_l_SizeofArrayalesLabelTop; $_l_SizeofArrayalesLabelRight; $_l_SizeofArrayalesLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oTakenBy"; $_l_TakenByLeft; $_l_TakenByTop; $_l_TakenByRight; $_l_TakenByBottom)
				OBJECT GET COORDINATES:C663(*; "oTakenByLabel"; $_l_TakenByLabelLeft; $_l_TakenByLabelTop; $_l_TakenByLabelRight; $_l_TakenByLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oSourceLabel"; $_l_SourceLabelLeft; $_l_SourceLabelTop; $_l_SourceLabelRight; $_l_SourceLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oSource"; $_l_SourceLeft; $_l_SourceTop; $_l_SourceRight; $_l_SourceBottom)
				OBJECT GET COORDINATES:C663(*; "oStatusLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oStatus"; $_l_StatusLeft; $_l_StatusTop; $_l_StatusRight; $_l_StatusBottom)
				OBJECT GET COORDINATES:C663(*; "oCoTypeLabel"; $_l_TypeLabelLeft; $_l_TypeLabelTop; $_l_TypeLabelRight; $_l_TypeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCoType"; $_l_TypeLeft; $_l_TypeTop; $_l_TypeRight; $_l_TypeBottom)
				OBJECT GET COORDINATES:C663(*; "oOmit"; $_l_OmitLeft; $_l_OmitTop; $_l_OmitRight; $_l_OmitBottom)
				OBJECT GET COORDINATES:C663(*; "oOmitLabel"; $_l_OmitLabelLeft; $_l_OmitLabelTop; $_l_OmitLabelRight; $_l_OmitLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oDuplicateState"; $_l_DupLeft; $_l_DupTop; $_l_DupRight; $_l_DupBottom)
				OBJECT GET COORDINATES:C663(*; "oDuplicateStateLabel"; $_l_DupLabelLeft; $_l_DupLabelTop; $_l_DupLabelRight; $_l_DupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCoAnalysis"; $_l_CoAnalysisLeft; $_l_CoAnalysisTop; $_l_CoAnalysisRight; $_l_CoAnalysisBottom)
				OBJECT GET COORDINATES:C663(*; "oCoAnalysisLabel"; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelTop; $_l_CoAnalysisLabelRight; $_l_CoAnalysisLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom)
				OBJECT GET COORDINATES:C663(*; "oPerson"; $_l_PersonLeft; $_l_PersonTop; $_l_PersonRight; $_l_PersonBottom)
				OBJECT GET COORDINATES:C663(*; "oeMail"; $_l_EmailLeft; $_l_EmailTop; $_l_EmailRight; $_l_EmailBottom)
				OBJECT GET COORDINATES:C663(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom)
				OBJECT GET COORDINATES:C663(*; "oContTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				OBJECT GET COORDINATES:C663(*; "oCompanyCode"; $_l_CompanyCodeLeft; $_l_CompanyCodeTop; $_l_CompanyCodeRight; $_l_CompanyCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oJobTitle"; $_l_JobTitleLeft; $_l_JobTitleTop; $_l_JobTitleRight; $_l_JobTitleBottom)
				OBJECT GET COORDINATES:C663(*; "oTown"; $_l_TownLeft; $_l_TownTop; $_l_TownRight; $_l_TownBottom)
				OBJECT GET COORDINATES:C663(*; "oCounty"; $_l_CountyLeft; $_l_CountyTop; $_l_CountyRight; $_l_CountyBottom)
				OBJECT GET COORDINATES:C663(*; "oCountry"; $_l_CountryLeft; $_l_CountryTop; $_l_CountryRight; $_l_CountryBottom)
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				If (SM_l_QueryMode=0)
					
					$_l_OK:=Cont_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Cont_SelLP(-1; SM_l_QueryMode; Table:C252(->[CONTACTS:1]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(49)
				SM_LoadSearchParameterNames(Table:C252(->[CONTACTS:1]); SM_l_QueryMode)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				OBJECT MOVE:C664(*; "oSideBarContacts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
				OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
				OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
				OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
				OBJECT MOVE:C664(*; "OHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
				OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
				OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
				OBJECT MOVE:C664(*; "oContactCode"; $_l_ContactCodeLeft; $_l_ContactCodeTop; $_l_ContactCodeRight; $_l_ContactCodeBottom; *)
				OBJECT MOVE:C664(*; "oContactCodeLabel"; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelTop; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oRole"; $_l_RoleLeft; $_l_RoleTop; $_l_RoleRight; $_l_RoleBottom; *)
				OBJECT MOVE:C664(*; "oRoleLabel"; $_l_RoleLabelLeft; $_l_RoleLabelTop; $_l_RoleLabelRight; $_l_RoleLabelBottom; *)
				OBJECT MOVE:C664(*; "oPostcode"; $_l_PostCodeLeft; $_l_PostCodeTop; $_l_PostCodeRight; $_l_PostCodeBottom; *)
				OBJECT MOVE:C664(*; "oPostcodeLabel"; $_l_PostCodeLabelLeft; $_l_PostCodeLabelTop; $_l_PostCodeLabelRight; $_l_PostCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom; *)
				OBJECT MOVE:C664(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom; *)
				OBJECT MOVE:C664(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom; *)
				OBJECT MOVE:C664(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom; *)
				OBJECT MOVE:C664(*; "oSales"; $_l_SizeofArrayalesLeft; $_l_SizeofArrayalesTop; $_l_SizeofArrayalesRight; $_l_SizeofArrayalesBottom; *)
				OBJECT MOVE:C664(*; "oSalesLabel"; $_l_SizeofArrayalesLabelLeft; $_l_SizeofArrayalesLabelTop; $_l_SizeofArrayalesLabelRight; $_l_SizeofArrayalesLabelBottom; *)
				OBJECT MOVE:C664(*; "oTakenBy"; $_l_TakenByLeft; $_l_TakenByTop; $_l_TakenByRight; $_l_TakenByBottom; *)
				OBJECT MOVE:C664(*; "oTakenByLabel"; $_l_TakenByLabelLeft; $_l_TakenByLabelTop; $_l_TakenByLabelRight; $_l_TakenByLabelBottom; *)
				OBJECT MOVE:C664(*; "oSourceLabel"; $_l_SourceLabelLeft; $_l_SourceLabelTop; $_l_SourceLabelRight; $_l_SourceLabelBottom; *)
				OBJECT MOVE:C664(*; "oSource"; $_l_SourceLeft; $_l_SourceTop; $_l_SourceRight; $_l_SourceBottom; *)
				OBJECT MOVE:C664(*; "oStatusLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom; *)
				OBJECT MOVE:C664(*; "oStatus"; $_l_StatusLeft; $_l_StatusTop; $_l_StatusRight; $_l_StatusBottom; *)
				OBJECT MOVE:C664(*; "oCoTypeLabel"; $_l_TypeLabelLeft; $_l_TypeLabelTop; $_l_TypeLabelRight; $_l_TypeLabelBottom; *)
				OBJECT MOVE:C664(*; "oCoType"; $_l_TypeLeft; $_l_TypeTop; $_l_TypeRight; $_l_TypeBottom; *)
				OBJECT MOVE:C664(*; "oOmit"; $_l_OmitLeft; $_l_OmitTop; $_l_OmitRight; $_l_OmitBottom; *)
				OBJECT MOVE:C664(*; "oOmitLabel"; $_l_OmitLabelLeft; $_l_OmitLabelTop; $_l_OmitLabelRight; $_l_OmitLabelBottom; *)
				OBJECT MOVE:C664(*; "oDuplicateState"; $_l_DupLeft; $_l_DupTop; $_l_DupRight; $_l_DupBottom; *)
				OBJECT MOVE:C664(*; "oDuplicateStateLabel"; $_l_DupLabelLeft; $_l_DupLabelTop; $_l_DupLabelRight; $_l_DupLabelBottom; *)
				OBJECT MOVE:C664(*; "oCoAnalysis"; $_l_CoAnalysisLeft; $_l_CoAnalysisTop; $_l_CoAnalysisRight; $_l_CoAnalysisBottom; *)
				OBJECT MOVE:C664(*; "oCoAnalysisLabel"; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelTop; $_l_CoAnalysisLabelRight; $_l_CoAnalysisLabelBottom; *)
				OBJECT MOVE:C664(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
				OBJECT MOVE:C664(*; "oPerson"; $_l_PersonLeft; $_l_PersonTop; $_l_PersonRight; $_l_PersonBottom; *)
				OBJECT MOVE:C664(*; "oeMail"; $_l_EmailLeft; $_l_EmailTop; $_l_EmailRight; $_l_EmailBottom; *)
				OBJECT MOVE:C664(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom; *)
				OBJECT MOVE:C664(*; "oContTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				OBJECT MOVE:C664(*; "oCompanyCode"; $_l_CompanyCodeLeft; $_l_CompanyCodeTop; $_l_CompanyCodeRight; $_l_CompanyCodeBottom; *)
				OBJECT MOVE:C664(*; "oJobTitle"; $_l_JobTitleLeft; $_l_JobTitleTop; $_l_JobTitleRight; $_l_JobTitleBottom; *)
				OBJECT MOVE:C664(*; "oTown"; $_l_TownLeft; $_l_TownTop; $_l_TownRight; $_l_TownBottom; *)
				OBJECT MOVE:C664(*; "oCounty"; $_l_CountyLeft; $_l_CountyTop; $_l_CountyRight; $_l_CountyBottom; *)
				OBJECT MOVE:C664(*; "oCountry"; $_l_CountryLeft; $_l_CountryTop; $_l_CountryRight; $_l_CountryBottom; *)
				SM_LoadSearchParameterNames(Table:C252(->[CONTACTS:1]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				
				
				vCompCode:=$_t_CompanyCode
				VTitle:=$_t_Title
				VForeName:=$_t_ForeName
				VSurname:=$_t_Surname
				VJobtitle:=$_t_JobTitle
				vStatus:=$_t_Status
				Vtype:=$_t_Type
				VSource:=$_t_Source
				SRCH_d_EntryDateFrom:=$_d_EntryDateFr
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				VsDateF:=$_d_sDateF
				VsdateT:=$_d_SDateT
				VCOmpName:=$_t_CompanyName
				VTown:=$_t_town
				VCounty:=$_t_County
				Vcountry:=$_t_Country
				Vstatus:=$_t_Status
				VType:=$_t_Type
				Vsource:=$_t_Source
				VContCode:=$_t_ContCode
				Vrole:=$_t_Role
				Vomit:=$_t_Omit
				vCharge:=$_t_Charge
				VPerson:=$_t_person
				VCalYr:=$_t_CalYr
				vAccName:=$_t_AccountName
				Vaccount:=$_t_AccountName
				vemail:=$_t_email  // 01/09/03 pb
				VAnalysis:=$_t_Analysis
				VComments:=$_t_Comments
				VPostCode:=$_t_PostCode
				vProdCOde:=$_t_ProductCode
				VArea:=$_t_Area
				Vsales:=$_t_Sales
				Vtele:=$_t_ContactTelephone
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				//ch1:=$_l_ch1
				vTitle1:=$_t_Title1
				vSubGroup1:=$_t_SubGroup1
				VDesc1:=$_t_Desc1
				vNo1:=$_l_No1
				vAct1:=$_l_Act1
				vDateF1:=$_d_DateF1
				vDateT1:=$_d_DateT1
				vTitle2:=$_t_Title2
				vSubGroup2:=$_t_SubGroup2
				VDesc2:=$_t_Desc2
				vNo2:=$_l_No2
				vAct2:=$_l_Act2
				vDateF2:=$_d_DateF2
				vDateT2:=$_d_DateT2
				
				vTitle3:=$_t_Title3
				vSubGroup3:=$_t_SubGroup3
				VDesc3:=$_t_Desc3
				vNo3:=$_l_No3
				vAct3:=$_l_Act3
				vDateF3:=$_d_DateF3
				vDateT3:=$_d_DateT3
				
				vTitle4:=$_t_Title4
				vSubGroup4:=$_t_SubGroup4
				VDesc4:=$_t_Desc4
				vNo4:=$_l_No4
				vAct4:=$_l_Act4
				vDateF4:=$_d_DateF4
				vDateT4:=$_d_DateT4
				
				vTitle5:=$_t_Title5
				vSubGroup5:=$_t_SubGroup5
				VDesc5:=$_t_Desc5
				vNo5:=$_l_No5
				vAct5:=$_l_Act5
				vDateF5:=$_d_DateF5
				vDateT5:=$_d_DateT5
				ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
				VsDateFOffset:=$_l_sDateFOffset
				ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
				VsDatetOffset:=$_l_sDatetOffset
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
			In_ButtdCall(->[CONTACTS:1])
		End if 
		<>WS_Search_Message:=0
		
		
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateFrom))
				If (SRCH_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (SRCH_d_EntryDateFrom>SRCH_d_EntryDateTo)
						SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<SRCH_d_EntryDateFrom)
						SRCH_d_EntryDateFrom:=SRCH_d_EntryDateTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VsDateToSet=False:C215)
						vSDateT:=vSDateF
					End if 
					If (VsDateF>VsDateT)
						VsDateT:=VsDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VsDATET))
				If (VsDateT>!00-00-00!)
					If (VsDateT<VsDateF)
						VsDateF:=VsDateT
					End if 
				End if 
				
				
		End case 
		
		
		
End case 
ERR_MethodTrackerReturn("FM:dCont_Sel"; $_t_oldMethodName)
