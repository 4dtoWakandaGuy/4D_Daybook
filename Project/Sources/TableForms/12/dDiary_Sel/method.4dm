If (False:C215)
	//Table Form Method Name: [DIARY]dDiary_Sel
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
	//ARRAY BOOLEAN(DIA_Lb_FurtherFieldsQuery;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(DIA_al_coTabChoices;0)
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
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(DIA_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDnDateToSet; $_bo_VDoDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDnDateToSet; SRCH_bo_VDoDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DoDateF; $_d_DodateFBase; $_d_doDateT; $_d_DoDateTBase; $_d_nDateF; $_d_nDateFBASE; $_d_nDateT; $_d_nDateTBase; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; vDNDateF)
	C_DATE:C307(VDndateFBASE; vDnDateT; VDndateTBASE; vDoDateF; vDoDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CodeCodeBottom; $_l_CodeCodeLabelBottom; $_l_CodeCodeLabelLeft; $_l_CodeCodeLabelRight)
	C_LONGINT:C283($_l_CodeCodeLabelTop; $_l_CodeCodeLeft; $_l_CodeCodeRight; $_l_CodeCodeTop; $_l_ColumnsTakeoff; $_l_ColumnsWidth; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd)
	C_LONGINT:C283($_l_cSetMod; $_l_defaultparams; $_l_DiaryCount; $_l_DoDateFOffset; $_l_DoDateTOffset; $_l_event; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop)
	C_LONGINT:C283($_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_Height; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom)
	C_LONGINT:C283($_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_inset; $_l_MacroBottom; $_l_MacroLabelBottom; $_l_MacroLabelLeft; $_l_MacroLabelRight; $_l_MacroLabelTop; $_l_MacroLeft; $_l_MacroRIght)
	C_LONGINT:C283($_l_MacroTop; $_l_NAA; $_l_NAL; $_l_nDateFOffset; $_l_nDateToffset; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft)
	C_LONGINT:C283($_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectBottom)
	C_LONGINT:C283($_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft)
	C_LONGINT:C283($_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_OK; $_l_OrderCodeBottom; $_l_OrderCodeLabelBottom; $_l_OrderCodeLabelLeft; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelTop; $_l_OrderCodeLeft; $_l_OrderCodeRIght)
	C_LONGINT:C283($_l_OrderCodeTop; $_l_PrefferedWIdth; $_l_PriorityBottom; $_l_PriorityLabelBottom; $_l_PriorityLabelLeft; $_l_PriorityLabelRight; $_l_PriorityLabelTop; $_l_PriorityLeft; $_l_PriorityRight; $_l_PriorityTop; $_l_QueryMode)
	C_LONGINT:C283($_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_Remaining; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SIzeOfArray)
	C_LONGINT:C283($_l_SrchMinWidth; $_l_StatusBottom; $_l_StatusLabelBottom; $_l_StatusLabelLeft; $_l_StatusLabelRight; $_l_StatusLabelTop; $_l_StatusLeft; $_l_StatusRight; $_l_StatusTop; $_l_SuperiorBottom; $_l_SuperiorLabelBottom)
	C_LONGINT:C283($_l_SuperiorLabelLeft; $_l_SuperiorLabelRight; $_l_SuperiorLabelTop; $_l_SuperiorLeft; $_l_SuperiorRight; $_l_SuperiorTop; $_l_TableNumber; $_l_TableRow; $_l_TabsWidth; $_l_TotalWidth; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16)
	C_LONGINT:C283(CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26)
	C_LONGINT:C283(CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; cNAA; cNAL; cSetAdd)
	C_LONGINT:C283(cSetMod; cSIS; RHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; VDnDateFOffset; VDnDatetOffset; VDoDateFOffset; VDoDatetOffset; xCancel)
	C_LONGINT:C283(xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_ValueF; $_r_ValueT; vValueF; VvalueT)
	C_TEXT:C284($_t_Action; $_t_ActionDescription; $_t_CallCode; $_t_CompanyCode; $_t_CompanyName; $_t_ContactTelephone; $_t_ContCode; $_t_ContractCode; $_t_DocumentCode; $_t_Event; $_t_ForeName)
	C_TEXT:C284($_t_FormUsage; $_t_FormUsage3; $_t_Group; $_t_Job; $_t_oldMethodName; $_t_OrderCode; $_t_Priority; $_t_Product; $_t_ResultCode; $_t_ResultDescription; $_t_Sales)
	C_TEXT:C284($_t_Stage; $_t_Status; $_t_Superior; $_t_Surname; $_t_TableNumberString; $_t_Terms; DB_t_CurrentFormUsage3; dbtabText2; DIA_t_actionCode; DIA_t_actionName; oCCQ_COL1)
	C_TEXT:C284(oCCQ_COL10; oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2)
	C_TEXT:C284(oCCQ_COL20; oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5)
	C_TEXT:C284(oCCQ_COL6; oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15)
	C_TEXT:C284(oCCQ_HED16; oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25)
	C_TEXT:C284(oCCQ_HED26; oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; VCallCode; VCompcode)
	C_TEXT:C284(vCompName; vContCode; VContrCode; Vevent; VforeName; VGroup; VJob; VLetterCode; VOrderCode; VPriority; VProduct)
	C_TEXT:C284(VResDesc; VResult; vSales; VStage; VStatus; Vsuperior; Vsurname; Vtele; Vterms; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].dDiary_Sel"; Form event code:C388)
$_l_event:=Form event code:C388
Sel_LProc2(->[DIARY:12]; $_l_event)

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vDoDateF:=!00-00-00!
		vDoDateT:=!00-00-00!
		vDNDateF:=!00-00-00!
		vDnDateT:=!00-00-00!
		
		OpenHelp(Table:C252(->[DIARY:12]); "dDiary_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[DIARY:12]); SM_l_QueryMode)
		//ACC_d_EntryDateFrom:=!00/00/00!
		SRCH_d_DodateFBase:=!00-00-00!
		SRCH_d_DoDateTBase:=!00-00-00!
		VDndateFBASE:=!00-00-00!
		VDndateTBASE:=!00-00-00!
		
		
		
		
		SRCH_bo_VDoDateToSet:=False:C215
		SRCH_bo_VDnDateToSet:=False:C215
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		
		
		ARRAY TEXT:C222(DIA_at_SearchTab; 0)
		ARRAY LONGINT:C221(DIA_al_coTabChoices; 0)
		APPEND TO ARRAY:C911(DIA_at_SearchTab; "Diary")
		APPEND TO ARRAY:C911(DIA_al_coTabChoices; 0)
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(DIA_at_SearchTab; "Companies")
			APPEND TO ARRAY:C911(DIA_al_coTabChoices; 1)
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
			APPEND TO ARRAY:C911(DIA_at_SearchTab; "Contacts")
			APPEND TO ARRAY:C911(DIA_al_coTabChoices; 2)
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
				APPEND TO ARRAY:C911(DIA_at_SearchTab; "Products")
				APPEND TO ARRAY:C911(DIA_al_coTabChoices; 3)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))<0)
				APPEND TO ARRAY:C911(DIA_at_SearchTab; "Orders")
				APPEND TO ARRAY:C911(DIA_al_coTabChoices; 4)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[SERVICE_CALLS:20]))<0)
				APPEND TO ARRAY:C911(DIA_at_SearchTab; "Service Calls")
				APPEND TO ARRAY:C911(DIA_al_coTabChoices; 5)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[JOBS:26]))<0)
				APPEND TO ARRAY:C911(DIA_at_SearchTab; "Jobs")
				APPEND TO ARRAY:C911(DIA_al_coTabChoices; 6)
			End if 
		End if 
		
		//DIA_at_SearchTab{1}:="Companies"
		//DIA_at_SearchTab{2}:="Contacts"
		//DIA_at_SearchTab{3}:="Products"
		//DIA_at_SearchTab{4}:="Orders"
		//DIA_at_SearchTab{5}:="Service Calls"
		//DIA_at_SearchTab{6}:="Jobs"
		DIA_at_SearchTab:=1
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(DIA_at_SearchTab))
			dbtabText2:=dbtabText2+DIA_at_SearchTab{$_l_TabsWidth}+(" "*8)
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
		If (vDoDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; False:C215)
		Else 
			//VDodateT:=VDodateF
		End if 
		If (vDnDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; False:C215)
		Else 
			//VDndateT:=VDndateF
		End if 
		If (vValueF=0)
			OBJECT SET VISIBLE:C603(*; "oValueT"; False:C215)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Value:16#0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oValue@"; False:C215)
			End if 
		End if 
		If (VPriority="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Priority:17#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oPriority@"; False:C215)
			End if 
		End if 
		If (Vtele="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Originator:23#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oOriginator@"; False:C215)
			End if 
		End if 
		If (VStatus="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Status:30#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oStatus@"; False:C215)
			End if 
		End if 
		If (VGroup="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Status:30#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oStatus@"; False:C215)
			End if 
		End if 
		If (Vterms="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Script_Code:29#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oMacro@"; False:C215)
			End if 
		End if 
		If (VOrderCode="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oMacro@"; False:C215)
			End if 
		End if 
		If (VCallCode="")
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
			QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25#"")
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_DiaryCount=0)
				OBJECT SET VISIBLE:C603(*; "oCallCode@"; False:C215)
			End if 
		End if 
		vTitle2:=Term_FSWT("Fore/Surname")
		INT_SetDialog
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Contacts"; 3; "")
			DB_MenuAction("Find"; "Products"; 3; "")
			DB_MenuAction("Find"; "Orders"; 3; "")
			DB_MenuAction("Find"; "Service Calls"; 3; "")
			DB_MenuAction("Find"; "Jobs"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)<2)
			DB_MenuAction("Find"; "Products"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
			DB_MenuAction("Find"; "Orders"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)<2)
			DB_MenuAction("Find"; "Service Calls"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)<2)
			DB_MenuAction("Find"; "Jobs"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[DIARY:12]); <>PER_l_CurrentUserID)
			
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		If ($_l_defaultparams>0)
			VDoDateFOffset:=0
			VDnDatetOffset:=0
			VDoDatetOffset:=0
			VDnDatetOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
			
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						VDnDateF:=Current date:C33-VDnDateFOffset
					: (VDnDateFOffset>-100)
						//months
						VDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
					Else 
						//years
						VDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						VDnDateF:=Current date:C33-VDnDateTOffset
					: (VDnDateTOffset>-100)
						//months
						VDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
					Else 
						//years
						VDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
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
		//TRACE
		
		$_l_TableNumber:=Table:C252(->[DIARY:12])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[DIARY:12]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_SIzeOfArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_SIzeOfArray#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SIzeOfArray)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_SIzeOfArray)
				For ($_l_Index; 1; $_l_SIzeOfArray)  //clear the arr first
					CUS_at_DisplayedData{$_l_Index}:=""
					CUS_at_PageText{$_l_Index}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0) & (True:C214)
				
				LB_SetupListbox(->DIA_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->DIA_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->DIA_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				LB_SetEnterable(->DIA_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->DIA_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->DIA_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->DIA_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->DIA_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->DIA_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[DIARY:12])
				
				$_l_Height:=335+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
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
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				$_l_Height:=335
				If ($_l_Height<335)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=335
					WS_AutoscreenSize(2; 335; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			//TRACE
			$_l_Height:=335
			If ($_l_Height<600)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=335
				WS_AutoscreenSize(2; 335; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(DIA_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->vDoDateF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (vDoDateF>vDoDateT) & (vDoDateT>!00-00-00!)
						vDoDateT:=vDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vDoDateT))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vDnDateF))
				If (vDnDateF>!00-00-00!)
					If (SRCH_bo_VDnDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (vDnDateF>vDnDateT) & (vDnDateT>!00-00-00!)
						vDnDateT:=vDnDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vDnDateT))
				If (VDnDateT>!00-00-00!)
					If (VDnDateT<VDnDateF)
						VDnDateF:=VDnDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vValueF))
				If (vValueF>0)
					OBJECT SET VISIBLE:C603(*; "oValueT"; True:C214)
				End if 
				
				
				
		End case 
		
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->vDoDateF))
				If (vDoDateF>!00-00-00!)
					If (SRCH_bo_VDoDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (vDoDateF>vDoDateT) & (vDoDateT>!00-00-00!)
						vDoDateT:=vDoDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vDoDateT))
				If (VDoDateT>!00-00-00!)
					If (VDoDateT<VDoDateF)
						VDoDateF:=VDoDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vDnDateF))
				If (vDnDateF>!00-00-00!)
					If (SRCH_bo_VDnDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (vDnDateF>vDnDateT) & (vDnDateT>!00-00-00!)
						vDnDateT:=vDnDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->vDnDateT))
				If (VDnDateT>!00-00-00!)
					If (VDnDateT<VDnDateF)
						VDnDateF:=VDnDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vValueF))
				If (vValueF>0)
					OBJECT SET VISIBLE:C603(*; "oValueT"; True:C214)
				End if 
				
				
				
		End case 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_CompanyCode:=VCompcode
				$_t_CompanyName:=vCompName
				$_t_ContCode:=vContCode
				$_t_ForeName:=VforeName
				$_t_Surname:=Vsurname
				$_t_Superior:=Vsuperior
				$_d_DoDateF:=VdodateF
				$_d_nDateF:=VDnDateF
				$_d_doDateT:=VdodateT
				$_d_nDateT:=VDnDateT
				$_r_ValueF:=VvalueF
				$_r_ValueT:=VvalueT
				$_t_Sales:=vSales
				$_t_Group:=VGroup
				$_t_ContactTelephone:=VTele
				$_t_Priority:=Vpriority
				$_t_Status:=Vstatus
				
				$_t_Action:=DIA_t_actionCode
				$_t_ActionDescription:=DIA_t_actionName
				$_t_DocumentCode:=VLetterCode
				$_t_Terms:=VTerms
				$_t_ResultCode:=VResult
				$_t_ResultDescription:=VResDesc
				$_t_Product:=VProduct
				$_t_Job:=VJob
				$_t_Stage:=VStage
				$_t_ContractCode:=VContrCode
				$_t_OrderCode:=VOrderCode
				$_t_Event:=Vevent
				$_t_CallCode:=Vcallcode
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarDiary"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
				
				OBJECT GET COORDINATES:C663(*; "oSuperior"; $_l_SuperiorLeft; $_l_SuperiorTop; $_l_SuperiorRight; $_l_SuperiorBottom)
				OBJECT GET COORDINATES:C663(*; "oSuperiorLabel"; $_l_SuperiorLabelLeft; $_l_SuperiorLabelTop; $_l_SuperiorLabelRight; $_l_SuperiorLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oPriority"; $_l_PriorityLeft; $_l_PriorityTop; $_l_PriorityRight; $_l_PriorityBottom)
				OBJECT GET COORDINATES:C663(*; "oPriorityLabel"; $_l_PriorityLabelLeft; $_l_PriorityLabelTop; $_l_PriorityLabelRight; $_l_PriorityLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oStatus"; $_l_StatusLeft; $_l_StatusTop; $_l_StatusRight; $_l_StatusBottom)
				OBJECT GET COORDINATES:C663(*; "ooStatusLLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oMacro"; $_l_MacroLeft; $_l_MacroTop; $_l_MacroRIght; $_l_MacroBottom)
				OBJECT GET COORDINATES:C663(*; "oMacroLabel"; $_l_MacroLabelLeft; $_l_MacroLabelTop; $_l_MacroLabelRight; $_l_MacroLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oOrderCode"; $_l_OrderCodeLeft; $_l_OrderCodeTop; $_l_OrderCodeRIght; $_l_OrderCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oOrderCodeLabel"; $_l_OrderCodeLabelLeft; $_l_OrderCodeLabelTop; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCallCode"; $_l_CodeCodeLeft; $_l_CodeCodeTop; $_l_CodeCodeRight; $_l_CodeCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oCallCodeLabel"; $_l_CodeCodeLabelLeft; $_l_CodeCodeLabelTop; $_l_CodeCodeLabelRight; $_l_CodeCodeLabelBottom)
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				$_d_DodateFBase:=SRCH_d_DodateFBase
				$_d_DoDateTBase:=SRCH_d_DoDateTBase
				$_d_nDateFBASE:=VDndateFBASE
				$_d_nDateTBase:=VDndateTBASE
				$_bo_VDoDateToSet:=SRCH_bo_VDoDateToSet
				$_bo_VDnDateToSet:=SRCH_bo_VDnDateToSet
				
				$_l_DoDateFOffset:=VDoDateFOffset
				$_l_nDateFOffset:=VDnDatetOffset
				$_l_DoDateTOffset:=VDoDatetOffset
				$_l_nDateToffset:=VDnDatetOffset
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[DIARY:12]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Diary_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Diary_SelLP(-1; SM_l_QueryMode; Table:C252(->[DIARY:12]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SM_LoadSearchParameterNames(Table:C252(->[DIARY:12]); SM_l_QueryMode)
				SRCH_bo_ShowHold:=False:C215
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				OBJECT MOVE:C664(*; "oSideBarDiary"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
				OBJECT MOVE:C664(*; "oSuperior"; $_l_SuperiorLeft; $_l_SuperiorTop; $_l_SuperiorRight; $_l_SuperiorBottom; *)
				OBJECT MOVE:C664(*; "oSuperiorLabel"; $_l_SuperiorLabelLeft; $_l_SuperiorLabelTop; $_l_SuperiorLabelRight; $_l_SuperiorLabelBottom; *)
				OBJECT MOVE:C664(*; "oPriority"; $_l_PriorityLeft; $_l_PriorityTop; $_l_PriorityRight; $_l_PriorityBottom; *)
				OBJECT MOVE:C664(*; "oPriorityLabel"; $_l_PriorityLabelLeft; $_l_PriorityLabelTop; $_l_PriorityLabelRight; $_l_PriorityLabelBottom; *)
				OBJECT MOVE:C664(*; "oStatus"; $_l_StatusLeft; $_l_StatusTop; $_l_StatusRight; $_l_StatusBottom; *)
				OBJECT MOVE:C664(*; "ooStatusLLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom; *)
				OBJECT MOVE:C664(*; "oMacro"; $_l_MacroLeft; $_l_MacroTop; $_l_MacroRIght; $_l_MacroBottom; *)
				OBJECT MOVE:C664(*; "oMacroLabel"; $_l_MacroLabelLeft; $_l_MacroLabelTop; $_l_MacroLabelRight; $_l_MacroLabelBottom; *)
				OBJECT MOVE:C664(*; "oOrderCode"; $_l_OrderCodeLeft; $_l_OrderCodeTop; $_l_OrderCodeRIght; $_l_OrderCodeBottom; *)
				OBJECT MOVE:C664(*; "oOrderCodeLabel"; $_l_OrderCodeLabelLeft; $_l_OrderCodeLabelTop; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelBottom; *)
				OBJECT MOVE:C664(*; "oCallCode"; $_l_CodeCodeLeft; $_l_CodeCodeTop; $_l_CodeCodeRight; $_l_CodeCodeBottom; *)
				OBJECT MOVE:C664(*; "oCallCodeLabel"; $_l_CodeCodeLabelLeft; $_l_CodeCodeLabelTop; $_l_CodeCodeLabelRight; $_l_CodeCodeLabelBottom; *)
				
				SRCH_d_DodateFBase:=$_d_DodateFBase
				SRCH_d_DoDateTBase:=$_d_DoDateTBase
				VDndateFBASE:=$_d_nDateFBASE
				VDndateTBASE:=$_d_nDateTBase
				SRCH_bo_VDoDateToSet:=$_bo_VDoDateToSet
				SRCH_bo_VDnDateToSet:=$_bo_VDnDateToSet
				VDoDateFOffset:=$_l_DoDateFOffset
				VDnDatetOffset:=$_l_nDateFOffset
				VDoDatetOffset:=$_l_DoDateTOffset
				VDnDatetOffset:=$_l_nDateToffset
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				vCompCode:=$_t_CompanyCode
				vCompName:=$_t_CompanyName
				VContCode:=$_t_ContCode
				Vforename:=$_t_ForeName
				VSurname:=$_t_Surname
				Vsuperior:=$_t_Superior
				VdoDateF:=$_d_DoDateF
				VdnDateF:=$_d_nDateF
				VdoDateT:=$_d_doDateT
				VdnDateT:=$_d_nDateT
				VValueF:=$_r_ValueF
				VValueT:=$_r_ValueT
				Vsales:=$_t_Sales
				VGroup:=$_t_Group
				VTele:=$_t_ContactTelephone
				VPriority:=$_t_Priority
				VStatus:=$_t_Status
				DIA_t_actionName:=$_t_Action
				DIA_t_actionName:=$_t_ActionDescription
				VLetterCode:=$_t_DocumentCode
				VTerms:=$_t_Terms
				VResult:=$_t_ResultCode
				VResDesc:=$_t_ResultDescription
				VProduct:=$_t_Product
				VJob:=$_t_Job
				vStage:=$_t_Stage
				vContrCode:=$_t_ContractCode
				VOrderCode:=$_t_OrderCode
				VEvent:=$_t_Event
				VCallCode:=$_t_CallCode
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				If ($_l_OK>0) & (Not:C34(rHold=1))
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
				SRCH_bo_ShowHold:=$_bo_ShowHold
				If (Not:C34(SRCH_bo_ShowHold))
					OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM [DIARY].dDiary_Sel"; $_t_oldMethodName)
