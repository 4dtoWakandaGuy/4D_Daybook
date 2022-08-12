If (False:C215)
	//Table Form Method Name: [COMPANIES]dComp_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2013 08:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_Lb_FurtherFieldsQuery;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(COM_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(COM_at_CoTabChoices;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(WS_at_RecordStateProperties;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	C_BOOLEAN:C305($_bo_VDoDateToSet; $_bo_VeDateToSet; $_bo_VfDateToSet; $_bo_VsDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VeDateToSet; SRCH_bo_VFDateToSet; SRCH_bo_VsDateToSet)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_DoDateF)
	C_DATE:C307($_d_DodateFBase; $_d_doDateT; $_d_DoDateTBase; $_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_fDateF; $_d_fdateFBASE; $_d_fdateTBASE; $_d_sdateFBASE; $_d_SDateT)
	C_DATE:C307($_d_sdateTBASE; ACC_d_EntryDateFrom; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1)
	C_DATE:C307(vDateT2; vDateT3; vDateT4; vDateT5; VdDateT; vDoDateF; vDoDateT; VedateFBASE; VedateTBASE; vFDateF; VfdateFBASE)
	C_DATE:C307(vFDateT; VfdateTBASE; VSDateF; VsdateFBASE; VSDateT; VsdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AccCodeLabelBottom; $_l_AccCodeLabelLeft; $_l_AccCodeLabelRight; $_l_AccCodeLabelTop; $_l_AccountCodeBottom; $_l_AccountCodeLeft; $_l_AccountCodeRight; $_l_AccountCodeTop; $_l_Act1; $_l_Act2)
	C_LONGINT:C283($_l_Act3; $_l_Act4; $_l_Act5; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight; $_l_AreaLabelTop; $_l_AreaLeft; $_l_AreaRight; $_l_AreaTop)
	C_LONGINT:C283($_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ch1; $_l_ColumnsTakeoff; $_l_ColumnsWidth; $_l_CommentsBottom; $_l_CommentsLeft)
	C_LONGINT:C283($_l_CommentsRight; $_l_CommentsTop; $_l_CompaniesCount; $_l_CompanyBottom; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop)
	C_LONGINT:C283($_l_cSetAdd; $_l_cSetMod; $_l_defaultparams; $_l_DoDateFOffset; $_l_DoDateTOffset; $_l_EntryDateToOffset; $_l_event; $_l_fDatetOffset; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft)
	C_LONGINT:C283($_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_Height; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight)
	C_LONGINT:C283($_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_inset; $_l_Left; $_l_ListID; $_l_LocationBottom; $_l_LocationLabelBottom; $_l_LocationLabelLeft)
	C_LONGINT:C283($_l_LocationLabelRight; $_l_LocationLabelTop; $_l_LocationLeft; $_l_LocationRight; $_l_LocationTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_No2; $_l_No3; $_l_No4)
	C_LONGINT:C283($_l_No5; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop)
	C_LONGINT:C283($_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom)
	C_LONGINT:C283($_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight)
	C_LONGINT:C283($_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth; $_l_OK; $_l_OmitBottom; $_l_OmitLabelBottom; $_l_OmitLabelLeft; $_l_OmitLabelRight; $_l_OmitLabelTop; $_l_OmitLeft; $_l_OmitRight)
	C_LONGINT:C283($_l_OmitTop; $_l_PostcodeBottom; $_l_PostcodeLabelBottom; $_l_PostcodeLabelLeft; $_l_PostcodeLabelRight; $_l_PostcodeLabelTop; $_l_PostcodeLeft; $_l_PostcodeRight; $_l_PostcodeTop; $_l_PrefferedWIdth; $_l_ProblemCodeBottom)
	C_LONGINT:C283($_l_ProblemCodeLabelBottom; $_l_ProblemCodeLabelLeft; $_l_ProblemCodeLabelRight; $_l_ProblemCodeLabelTop; $_l_ProblemCodeLeft; $_l_ProblemCodeRight; $_l_ProblemCodeTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght)
	C_LONGINT:C283($_l_QULabelTop; $_l_RecordStateBottom; $_l_RecordStateDDBottom; $_l_RecordStateDDLeft; $_l_RecordStateDDRight; $_l_RecordStateDDTop; $_l_RecordStateLabelBottom; $_l_RecordStateLabelLeft; $_l_RecordStateLabelRight; $_l_RecordStateLabelTop; $_l_RecordStateLeft)
	C_LONGINT:C283($_l_RecordStateRight; $_l_RecordStateTop; $_l_Remaining; $_l_Right; $_l_rState; $_l_SalesBottom; $_l_SalesLabelBottom; $_l_SalesLabelLeft; $_l_SalesLabelRight; $_l_SalesLabelTop; $_l_SalesLeft)
	C_LONGINT:C283($_l_SalesRight; $_l_SalesTop; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SIzeofArray; $_l_SrchMinWidth)
	C_LONGINT:C283($_l_SuperiorBottom; $_l_SuperiorLabelBottom; $_l_SuperiorLabelLeft; $_l_SuperiorLabelRight; $_l_SuperiorLabelTop; $_l_SuperiorLeft; $_l_SuperiorRight; $_l_SuperiorTop; $_l_TableNumber; $_l_TableRow; $_l_TabsWidth)
	C_LONGINT:C283($_l_TakenByBottom; $_l_TakenByLabelBottom; $_l_TakenByLabelLeft; $_l_TakenByLabelRight; $_l_TakenByLabelTop; $_l_TakenByLeft; $_l_TakenByRight; $_l_TakenByTop; $_l_TelephoneBottom; $_l_TelephoneLabelBottom; $_l_TelephoneLabelLeft)
	C_LONGINT:C283($_l_TelephoneLabelRight; $_l_TelephoneLabelTop; $_l_TelephoneLeft; $_l_TelephoneRight; $_l_TelephoneTop; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283($_l_WindowWidth; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16)
	C_LONGINT:C283(CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26)
	C_LONGINT:C283(CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; ch1; cNAA; cNAL)
	C_LONGINT:C283(CON_l_Dataused; cSetAdd; cSetMod; cSIS; RHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; vAct1; vAct2; vAct3)
	C_LONGINT:C283(vAct4; vAct5; VDoDateFOffset; VDoDatetOffset; VfDateFOffset; VfDatetOffset; vNo1; vNo2; vNo3; vNo4; vNo5)
	C_LONGINT:C283(VrStateL; VsDateFOffset; VsDatetOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_DiscountF; $_r_DiscountT; $_r_Valuef; $_r_ValueT; vDiscountF; vDiscountT; VVALUEF; VVALUET)
	C_TEXT:C284($_t_Area; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContactTelephone; $_t_ContractCode; $_t_Country; $_t_County; $_t_Desc1; $_t_Desc2; $_t_Desc3)
	C_TEXT:C284($_t_Desc4; $_t_Desc5; $_t_FormUsage; $_t_FormUsage3; $_t_Location; $_t_oldMethodName; $_t_Omit; $_t_PostCode; $_t_ProblemCode; $_t_ProductCode; $_t_rState)
	C_TEXT:C284($_t_Sales; $_t_Source; $_t_Status; $_t_SubGroup1; $_t_SubGroup2; $_t_SubGroup3; $_t_SubGroup4; $_t_SubGroup5; $_t_Superior; $_t_TableNumberString; $_t_Telephone)
	C_TEXT:C284($_t_Title1; $_t_Title2; $_t_Title3; $_t_Title4; $_t_Title5; $_t_town; $_t_Type; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1; oCCQ_COL10)
	C_TEXT:C284(oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2; oCCQ_COL20)
	C_TEXT:C284(oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5; oCCQ_COL6)
	C_TEXT:C284(oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15; oCCQ_HED16)
	C_TEXT:C284(oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25; oCCQ_HED26)
	C_TEXT:C284(oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; Varea; VComments; VcompCode)
	C_TEXT:C284(vCompName; vContrCode; VCountry; VCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vLocation; VOmit)
	C_TEXT:C284(VpostCode; vProbCode; VProdCode; vrstate; Vsales; Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4)
	C_TEXT:C284(vSubGroup5; VSuperior; Vtel; Vtele; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dComp_Sel"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//TRACE
		ACC_d_EntryDateFrom:=!00-00-00!
		VSDateF:=!00-00-00!
		vFDateF:=!00-00-00!
		vDoDateF:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		VSDateT:=!00-00-00!
		vFDateT:=!00-00-00!
		vDoDateT:=!00-00-00!
		//OBJECT SET VISIBLE(COM_bo_ContactQuery;False)
		//ACC_d_EntryDateFrom:=!00/00/00!
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
		
		SET MENU BAR:C67(48)
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dComp_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		ARRAY TEXT:C222(COM_at_CoTabChoices; 0)
		ARRAY LONGINT:C221(COM_al_coTabChoices; 0)
		APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Companies")
		APPEND TO ARRAY:C911(COM_al_coTabChoices; 0)
		SET QUERY DESTINATION:C396(Into variable:K19:4; CON_l_Dataused)
		
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]))
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If (CON_l_Dataused>0)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INFORMATION:55]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Information")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 2)
				
			End if 
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
			APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Contacts")
			APPEND TO ARRAY:C911(COM_al_coTabChoices; 1)
		End if 
		
		If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Diary Items")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 3)
			End if 
		End if 
		
		If (DB_GetModuleSettingByNUM(Module_Products)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Products")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 4)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Sales Orders")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 5)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Sales Order Items")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 6)
			End if 
		End if 
		
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Invoices")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 8)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_ORDERS:57]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Purchase Orders")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 7)
			End if 
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_INVOICES:37]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Purchase Ledger")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 9)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[TRANSACTION_BATCHES:30]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Nominal Ledger")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 10)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTRACTS:17]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Contracts")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 11)
			End if 
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[SERVICE_CALLS:20]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Service Calls")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 12)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
			
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[JOBS:26]))<0)
				APPEND TO ARRAY:C911(COM_at_CoTabChoices; "Jobs")
				APPEND TO ARRAY:C911(COM_al_coTabChoices; 10)
			End if 
		End if 
		
		COM_at_CoTabChoices:=1
		//ACoTabChoices:=1
		//``
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(COM_at_CoTabChoices))
			dbtabText2:=dbtabText2+COM_at_CoTabChoices{$_l_TabsWidth}+(" "*8)
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
		//``
		
		
		$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; False:C215; ->WS_at_RecordStateProperties)
		WS_at_RecordStates:=0
		//WS_AutoscreenSize (2;$_l_Height;$_l_TotalWidth)
		
		//TRACE
		If (ACC_d_EntryDateFrom=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVEDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
		End if 
		If (vsDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVsDateT@"; False:C215)
		Else 
			//VsdateT:=VsdateF
		End if 
		If (vfDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVfDateT@"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vDoDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; False:C215)
		Else 
			//VDodateT:=VDodateF
		End if 
		
		If (vDiscountF=0)
			OBJECT SET VISIBLE:C603(*; "oDiscountT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
			
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Size:15#0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			
			If ($_l_CompaniesCount=0)
				OBJECT SET VISIBLE:C603(*; "oDiscount@"; False:C215)
			End if 
		End if 
		If (vValueF=0)
			OBJECT SET VISIBLE:C603(*; "oValueT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
			
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Value:31#0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			
			If ($_l_CompaniesCount=0)
				OBJECT SET VISIBLE:C603(*; "oValue@"; False:C215)
			End if 
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Source:14#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oSource@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Type:13#"")
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
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Superior:34#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "osuperior@"; False:C215)
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
			OBJECT SET VISIBLE:C603(*; "otele@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Record_State:62#0)
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oRecordState@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Omit:17#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oomit@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Mailsort_SSC:49#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oLocation@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Mailsort_OFN:50#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		
		If ($_l_CompaniesCount=0)
			OBJECT SET VISIBLE:C603(*; "oProbCode@"; False:C215)
		End if 
		//TRACE
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[COMPANIES:2]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_SIzeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_SIzeofArray#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SIzeofArray)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_SIzeofArray)
				For ($_l_Index; 1; $_l_SIzeofArray)  //clear the arr first
					
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
				
				
				
				
				
				LB_SetupListbox(->COM_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->COM_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->COM_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				LB_SetEnterable(->COM_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->COM_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->COM_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->COM_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->COM_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->COM_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				
				$_l_Height:=375+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
			Else 
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				
				$_l_Height:=371
				If ($_l_Height<371)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=371
					WS_AutoscreenSize(2; 371; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			
			$_l_Height:=371
			If ($_l_Height<371)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=371
				WS_AutoscreenSize(2; 371; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Contacts"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Information"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Diary Items"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Products"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Orders"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Order Items"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Purchase orders"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Ledger"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Purchase Ledger"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Nominal Ledger"); 3; "")
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
		If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2)
			
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Purchase orders"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)<2)
			
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Ledger"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2)
			
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Purchase Ledger"); 3; "")
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)<2)
			
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Contracts"); 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Service calls"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)<2)
			
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Job"); 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction(DB_GetIndexedString(0; 0; "Functions"); DB_GetIndexedString(0; 0; "Set Functions …"); 3; "")
			
		End if 
		
		Comp_SelSec
		Sel_LProc2(->[COMPANIES:2])
		If ((DB_GetModuleSettingByNUM(31))<2)
			OBJECT SET ENTERABLE:C238(vLocation; False:C215)
		End if 
		
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[COMPANIES:2]); <>PER_l_CurrentUserID)
			
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
			VSDateFOffset:=0
			VDoDateFOffset:=0
			VfDatetOffset:=0
			VDoDatetOffset:=0
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
						ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
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
				OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
			End if 
			If (VfDateFOffset#0)
				Case of 
					: (VfDateFOffset>0)
						VfDateF:=Current date:C33-VfDateFOffset
					: (VfDateFOffset>-100)
						//months
						VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
					Else 
						//years
						VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
			End if 
			
			If (VfDateTOffset#0)
				Case of 
					: (VfDateTOffset>0)
						VfDateF:=Current date:C33-VfDateTOffset
					: (VfDateTOffset>-100)
						//months
						VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
					Else 
						//years
						VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
			End if 
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						VDoDateF:=Current date:C33-VDoDateFOffset
					: (VDoDateFOffset>-100)
						//months
						VDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
					Else 
						//years
						VDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						VDoDateF:=Current date:C33-VDoDateTOffset
					: (VDoDateTOffset>-100)
						//months
						VDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
					Else 
						//years
						VDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
			End if 
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			
			OBJECT SET VISIBLE:C603(COM_at_CoTabChoices; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
		SD2_SetDiaryPopup
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		
	: ($_l_event=On Clicked:K2:4)
		
		Sel_LProc2(->[COMPANIES:2])
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<ACC_d_EntryDateFrom)
						ACC_d_EntryDateFrom:=SRCH_d_EntryDateTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VsDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VsDateF>VsDateT) & (VsDateT>!00-00-00!)
						
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
			: ($_ptr_FocusObject=(->VFDATEF))
				If (vFDateF>!00-00-00!)
					If (SRCH_bo_VFDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VFDateF>VFDateT) & (VdDateT>!00-00-00!)
						VFDateT:=VFDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VfDATET))
				If (VfDateT>!00-00-00!)
					If (VfDateT<VfDateF)
						VfDateF:=VfDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VDoDATEF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//vDoDateT:=vDoDateF
					End if 
					If (VDoDateF>VDoDateT) & (vDoDateT>!00-00-00!)
						
						VDoDateT:=VDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVdoDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDoDATET))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=->vDiscountF)
				If (vDiscountT<vDiscountF) & (vDiscountT>0)
					vDiscountT:=vDiscountF
				End if 
			: ($_ptr_FocusObject=->vDiscountT)
				If (vDiscountF>vDiscountT)
					vDiscountF:=vDiscountT
				End if 
			: ($_ptr_FocusObject=->vValueF)
				If (vValueT<vValueF) & (vValueT>0)
					vValueT:=vValueF
				End if 
			: ($_ptr_FocusObject=->vValueT)
				If (vValueF>vValueT)
					vValueF:=vValueT
				End if 
		End case 
		
	: ($_l_event=On Menu Selected:K2:14)
		
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_rState:=vrstate
				$_l_rState:=VrStateL
				$_t_CompanyCode:=VcompCode
				$_t_CompanyName:=vCompName
				$_t_town:=Vtown
				$_t_County:=VCounty
				$_t_Country:=VCountry
				$_t_Status:=Vstatus
				$_t_Type:=Vtype
				$_t_Source:=Vsource
				$_r_DiscountF:=VDiscountF
				$_r_DiscountT:=vDiscountT
				$_r_Valuef:=VValueF
				$_r_ValueT:=VvalueT
				$_d_EntryDateFrom:=ACC_d_EntryDateFrom
				$_d_SDateT:=VSDateT
				$_d_fDateF:=VFDateT
				$_t_Comments:=VComments
				$_t_ProductCode:=VProdCode
				$_d_DoDateF:=vDoDateF
				$_d_doDateT:=VDoDateT
				$_t_Superior:=VSuperior
				$_t_PostCode:=VpostCode
				$_t_Telephone:=Vtel
				$_t_Area:=Varea
				$_t_Sales:=Vsales
				$_t_ContactTelephone:=Vtele
				$_t_Omit:=VOmit
				$_t_Location:=VLocation
				$_t_ProblemCode:=vProbCode
				$_t_ContractCode:=vContrCode
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_l_ch1:=ch1
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
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "OAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarCompanies"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutonWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutonWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "OFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
				OBJECT GET COORDINATES:C663(*; "oSuperior"; $_l_SuperiorLeft; $_l_SuperiorTop; $_l_SuperiorRight; $_l_SuperiorBottom)
				OBJECT GET COORDINATES:C663(*; "oSuperiorLabel"; $_l_SuperiorLabelLeft; $_l_SuperiorLabelTop; $_l_SuperiorLabelRight; $_l_SuperiorLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oPostcode"; $_l_PostcodeLeft; $_l_PostcodeTop; $_l_PostcodeRight; $_l_PostcodeBottom)
				OBJECT GET COORDINATES:C663(*; "oPostcodeLabel"; $_l_PostcodeLabelLeft; $_l_PostcodeLabelTop; $_l_PostcodeLabelRight; $_l_PostcodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom)
				OBJECT GET COORDINATES:C663(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom)
				OBJECT GET COORDINATES:C663(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oSales"; $_l_SalesLeft; $_l_SalesTop; $_l_SalesRight; $_l_SalesBottom)
				OBJECT GET COORDINATES:C663(*; "oSalesLabel"; $_l_SalesLabelLeft; $_l_SalesLabelTop; $_l_SalesLabelRight; $_l_SalesLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oTakenBy"; $_l_TakenByLeft; $_l_TakenByTop; $_l_TakenByRight; $_l_TakenByBottom)
				OBJECT GET COORDINATES:C663(*; "oTakenByLabel"; $_l_TakenByLabelLeft; $_l_TakenByLabelTop; $_l_TakenByLabelRight; $_l_TakenByLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oRecordStateLabel"; $_l_RecordStateLabelLeft; $_l_RecordStateLabelTop; $_l_RecordStateLabelRight; $_l_RecordStateLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oRecordStateDropDown"; $_l_RecordStateDDLeft; $_l_RecordStateDDTop; $_l_RecordStateDDRight; $_l_RecordStateDDBottom)
				OBJECT GET COORDINATES:C663(*; "oRecordState"; $_l_RecordStateLeft; $_l_RecordStateTop; $_l_RecordStateRight; $_l_RecordStateBottom)
				OBJECT GET COORDINATES:C663(*; "oOmit"; $_l_OmitLeft; $_l_OmitTop; $_l_OmitRight; $_l_OmitBottom)
				OBJECT GET COORDINATES:C663(*; "oOmitLabel"; $_l_OmitLabelLeft; $_l_OmitLabelTop; $_l_OmitLabelRight; $_l_OmitLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oLocation"; $_l_LocationLeft; $_l_LocationTop; $_l_LocationRight; $_l_LocationBottom)
				OBJECT GET COORDINATES:C663(*; "oLocationLabel"; $_l_LocationLabelLeft; $_l_LocationLabelTop; $_l_LocationLabelRight; $_l_LocationLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oProbCode"; $_l_ProblemCodeLeft; $_l_ProblemCodeTop; $_l_ProblemCodeRight; $_l_ProblemCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oProbCodeLabel"; $_l_ProblemCodeLabelLeft; $_l_ProblemCodeLabelTop; $_l_ProblemCodeLabelRight; $_l_ProblemCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oTheirAcc"; $_l_AccountCodeLeft; $_l_AccountCodeTop; $_l_AccountCodeRight; $_l_AccountCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oTheirAccLabel"; $_l_AccCodeLabelLeft; $_l_AccCodeLabelTop; $_l_AccCodeLabelRight; $_l_AccCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom)
				OBJECT GET COORDINATES:C663(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom)
				OBJECT GET COORDINATES:C663(*; "oComTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				$_d_edateFBASE:=VedateFBASE
				$_d_edateTBASE:=VedateTBASE
				$_d_sdateFBASE:=VsdateFBASE
				$_d_sdateTBASE:=VsdateTBASE
				$_d_fdateFBASE:=VfdateFBASE
				$_d_fdateTBASE:=VfdateTBASE
				$_d_DodateFBase:=SRCH_d_DodateFBase
				$_d_DoDateTBase:=SRCH_d_DoDateTBase
				$_bo_VeDateToSet:=SRCH_bo_VeDateToSet
				$_bo_VsDateToSet:=SRCH_bo_VsDateToSet
				$_bo_VfDateToSet:=SRCH_bo_VfDateToSet
				$_bo_VDoDateToSet:=SRCH_bo_VDoDateToSet
				$_l_sDateFOffset:=VsDateFOffset
				$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
				$_l_sDatetOffset:=VsDatetOffset
				$_l_sDateFOffset:=VSDateFOffset
				$_l_DoDateFOffset:=VDoDateFOffset
				$_l_fDatetOffset:=VfDatetOffset
				$_l_DoDateTOffset:=VDoDatetOffset
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				
				If (SM_l_QueryMode=0)
					
					$_l_OK:=Comp_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Comp_SelLP(-1; SM_l_QueryMode; Table:C252(->[COMPANIES:2]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(48)
				
				SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); SM_l_QueryMode)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				VedateFBASE:=$_d_edateFBASE
				VedateTBASE:=$_d_edateTBASE
				VsdateFBASE:=$_d_sdateFBASE
				VsdateTBASE:=$_d_sdateTBASE
				VfdateFBASE:=$_d_fdateFBASE
				VfdateTBASE:=$_d_fdateTBASE
				SRCH_d_DodateFBase:=$_d_DodateFBase
				SRCH_d_DoDateTBase:=$_d_DoDateTBase
				SRCH_bo_VeDateToSet:=$_bo_VeDateToSet
				SRCH_bo_VsDateToSet:=$_bo_VsDateToSet
				SRCH_bo_VfDateToSet:=$_bo_VfDateToSet
				SRCH_bo_VDoDateToSet:=$_bo_VDoDateToSet
				VsDateFOffset:=$_l_sDateFOffset
				ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
				VsDatetOffset:=$_l_sDatetOffset
				VSDateFOffset:=$_l_sDateFOffset
				VDoDateFOffset:=$_l_DoDateFOffset
				VfDatetOffset:=$_l_fDatetOffset
				VDoDatetOffset:=$_l_DoDateTOffset
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT MOVE:C664(*; "OAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				
				OBJECT MOVE:C664(*; "oSideBarCompanies"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
				OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
				OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
				OBJECT MOVE:C664(*; "oNoAutonWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoAutonWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
				OBJECT MOVE:C664(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
				OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
				OBJECT MOVE:C664(*; "OHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
				OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
				OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
				
				OBJECT MOVE:C664(*; "OFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
				OBJECT MOVE:C664(*; "oSuperior"; $_l_SuperiorLeft; $_l_SuperiorTop; $_l_SuperiorRight; $_l_SuperiorBottom; *)
				OBJECT MOVE:C664(*; "oSuperiorLabel"; $_l_SuperiorLabelLeft; $_l_SuperiorLabelTop; $_l_SuperiorLabelRight; $_l_SuperiorLabelBottom; *)
				OBJECT MOVE:C664(*; "oPostcode"; $_l_PostcodeLeft; $_l_PostcodeTop; $_l_PostcodeRight; $_l_PostcodeBottom; *)
				OBJECT MOVE:C664(*; "oPostcodeLabel"; $_l_PostcodeLabelLeft; $_l_PostcodeLabelTop; $_l_PostcodeLabelRight; $_l_PostcodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom; *)
				OBJECT MOVE:C664(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom; *)
				OBJECT MOVE:C664(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom; *)
				OBJECT MOVE:C664(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom; *)
				OBJECT MOVE:C664(*; "oSales"; $_l_SalesLeft; $_l_SalesTop; $_l_SalesRight; $_l_SalesBottom; *)
				OBJECT MOVE:C664(*; "oSalesLabel"; $_l_SalesLabelLeft; $_l_SalesLabelTop; $_l_SalesLabelRight; $_l_SalesLabelBottom; *)
				OBJECT MOVE:C664(*; "oTakenBy"; $_l_TakenByLeft; $_l_TakenByTop; $_l_TakenByRight; $_l_TakenByBottom; *)
				OBJECT MOVE:C664(*; "oTakenByLabel"; $_l_TakenByLabelLeft; $_l_TakenByLabelTop; $_l_TakenByLabelRight; $_l_TakenByLabelBottom; *)
				OBJECT MOVE:C664(*; "oRecordStateLabel"; $_l_RecordStateLabelLeft; $_l_RecordStateLabelTop; $_l_RecordStateLabelRight; $_l_RecordStateLabelBottom; *)
				OBJECT MOVE:C664(*; "oRecordStateDropDown"; $_l_RecordStateDDLeft; $_l_RecordStateDDTop; $_l_RecordStateDDRight; $_l_RecordStateDDBottom; *)
				OBJECT MOVE:C664(*; "oRecordState"; $_l_RecordStateLeft; $_l_RecordStateTop; $_l_RecordStateRight; $_l_RecordStateBottom; *)
				OBJECT MOVE:C664(*; "oOmit"; $_l_OmitLeft; $_l_OmitTop; $_l_OmitRight; $_l_OmitBottom; *)
				OBJECT MOVE:C664(*; "oOmitLabel"; $_l_OmitLabelLeft; $_l_OmitLabelTop; $_l_OmitLabelRight; $_l_OmitLabelBottom; *)
				OBJECT MOVE:C664(*; "oLocation"; $_l_LocationLeft; $_l_LocationTop; $_l_LocationRight; $_l_LocationBottom; *)
				OBJECT MOVE:C664(*; "oLocationLabel"; $_l_LocationLabelLeft; $_l_LocationLabelTop; $_l_LocationLabelRight; $_l_LocationLabelBottom; *)
				OBJECT MOVE:C664(*; "oProbCode"; $_l_ProblemCodeLeft; $_l_ProblemCodeTop; $_l_ProblemCodeRight; $_l_ProblemCodeBottom; *)
				OBJECT MOVE:C664(*; "oProbCodeLabel"; $_l_ProblemCodeLabelLeft; $_l_ProblemCodeLabelTop; $_l_ProblemCodeLabelRight; $_l_ProblemCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oTheirAcc"; $_l_AccountCodeLeft; $_l_AccountCodeTop; $_l_AccountCodeRight; $_l_AccountCodeBottom; *)
				OBJECT MOVE:C664(*; "oTheirAccLabel"; $_l_AccCodeLabelLeft; $_l_AccCodeLabelTop; $_l_AccCodeLabelRight; $_l_AccCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
				OBJECT MOVE:C664(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom; *)
				OBJECT MOVE:C664(*; "oComTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=False:C215
				dbtabText2:=""
				For ($_l_TabsWidth; 1; Size of array:C274(COM_at_CoTabChoices))
					dbtabText2:=dbtabText2+COM_at_CoTabChoices{$_l_TabsWidth}+(" "*8)
				End for 
				
				
				INT_SetDialog
				vrstate:=$_t_rState
				VrStateL:=$_l_rState
				vCOmpCode:=$_t_CompanyCode
				vCompName:=$_t_CompanyName
				VTown:=$_t_town
				vCounty:=$_t_County
				vCountry:=$_t_Country
				VStatus:=$_t_Status
				Vtype:=$_t_Type
				vSource:=$_t_Source
				vDiscountF:=$_r_DiscountF
				vDiscountT:=$_r_DiscountT
				vValuef:=$_r_Valuef
				vValueT:=$_r_ValueT
				ACC_d_EntryDateFrom:=$_d_EntryDateFrom
				VSdateT:=$_d_SDateT
				VfDateF:=$_d_fDateF
				VComments:=$_t_Comments
				VprodCode:=$_t_ProductCode
				VDoDateF:=$_d_DoDateF
				VdoDateT:=$_d_doDateT
				Vsuperior:=$_t_Superior
				VpostCode:=$_t_PostCode
				VTel:=$_t_Telephone
				varea:=$_t_Area
				VSales:=$_t_Sales
				Vtele:=$_t_ContactTelephone
				VOmit:=$_t_Omit
				VLocation:=$_t_Location
				vProbCode:=$_t_ProblemCode
				vContrCode:=$_t_ContractCode
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				ch1:=$_l_ch1
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
				$_t_Desc5:=$_t_Desc5
				$_l_No5:=$_l_No5
				$_l_Act5:=$_l_Act5
				$_d_DateF5:=$_d_DateF5
				$_d_DateT5:=$_d_DateT5
				
				If ($_l_OK>0) & (Not:C34(rHold=1))
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
			End if 
		End if 
		Sel_LProc2(->[COMPANIES:2])
	: ($_l_event=On Activate:K2:9)
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dComp_Sel")
		Sel_LProc2(->[COMPANIES:2])
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
	: ($_l_event=On Outside Call:K2:11)
		
		
		Sel_LProc2(->[COMPANIES:2])
	: ($_l_event=On Data Change:K2:15)
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ACC_d_EntryDateFrom))
				If (ACC_d_EntryDateFrom>!00-00-00!)
					If (SRCH_bo_VeDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (ACC_d_EntryDateFrom>SRCH_d_EntryDateTo) & (VdDateT>!00-00-00!)
						
						SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->SRCH_d_EntryDateTo))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (SRCH_d_EntryDateTo<ACC_d_EntryDateFrom)
						ACC_d_EntryDateFrom:=SRCH_d_EntryDateTo
					End if 
				End if 
			: ($_ptr_FocusObject=(->VSDATEF))
				If (vSDateF>!00-00-00!)
					If (SRCH_bo_VsDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VsDateF>VsDateT) & (VsDateT>!00-00-00!)
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
			: ($_ptr_FocusObject=(->VFDATEF))
				If (vFDateF>!00-00-00!)
					If (SRCH_bo_VFDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VFDateF>VFDateT) & (VfDateT>!00-00-00!)
						VFDateT:=VFDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VfDATET))
				If (VfDateT>!00-00-00!)
					If (VfDateT<VfDateF)
						VfDateF:=VfDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VDoDATEF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//vDoDateT:=vDoDateF
					End if 
					If (VDoDateF>VDoDateT) & (VDoDateT>!00-00-00!)
						VDoDateT:=VDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVdoDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDoDATET))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=->vDiscountF)
				If (vDiscountT<vDiscountF) & (vDiscountT>0)
					vDiscountT:=vDiscountF
				End if 
				If (vDiscountF#0)
					OBJECT SET VISIBLE:C603(*; "oDiscountT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vDiscountT)
				If (vDiscountF>vDiscountT)
					vDiscountF:=vDiscountT
				End if 
			: ($_ptr_FocusObject=->vValueF)
				If (vValueT<vValueF) & (vValueT>0)
					vValueT:=vValueF
				End if 
				If (vValueF#0)
					OBJECT SET VISIBLE:C603(*; "oValueT"; True:C214)
				End if 
			: ($_ptr_FocusObject=->vValueT)
				If (vValueF>vValueT)
					vValueF:=vValueT
				End if 
		End case 
		
		
	: ($_l_Event=On Resize:K2:27)
		INT_SetDialog
		
		If (False:C215)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			///
			//oComTabChoices
			//$_l_bestWidth
			$_l_Right:=($_l_WindowWidth-124)-5
			$_l_Left:=10
			OBJECT GET COORDINATES:C663(*; "oComTabChoices"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT SET COORDINATES:C1248(*; "oComTabChoices"; $_l_Left; $_l_ObjectTop; $_l_Right; $_l_ObjectBottom)
			If (False:C215)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_inset:=592-480  //-$_l_ObjectRight
				$_l_FromBottom:=446-384
				$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				//OBJECT SET COORDINATES(*; "oCancelButton"; $_l_inset; $_l_FromBottom; $_l_inset+$_l_ObjectWidth; $_l_FromBottom+$_l_ObjectHeight)
				///
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				//$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
				$_l_FromBottom:=$_l_FromBottom+$_l_ObjectHeight+10
				///OBJECT SET COORDINATES(*; "oContinueButton"; $_l_inset; $_l_FromBottom; $_l_inset+$_l_ObjectWidth; $_l_FromBottom+$_l_ObjectHeight)
			End if 
			OBJECT GET COORDINATES:C663(*; "oSideBarCompanies"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			//$_l_inset:=$_l_TotalWidth-$_l_ObjectRight
			$_l_FromBottom:=$_l_FromBottom+$_l_ObjectHeight+10
			OBJECT SET COORDINATES:C1248(*; "oSideBarCompanies"; $_l_WindowWidth-124; 0; $_l_WindowWidth; $_l_WindowHeight)
			
			//End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dComp_Sel"; $_t_oldMethodName)

