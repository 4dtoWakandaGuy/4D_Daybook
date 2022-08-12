If (False:C215)
	//object Method Name: Object Name:      [DIARY].dDiary_Sel.oDIATabChoices
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
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(DIA_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(DIA_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDnDateToSet; $_bo_VDoDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDnDateToSet; SRCH_bo_VDoDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DoDateF; $_d_DodateFBase; $_d_doDateT; $_d_DoDateTBase; $_d_nDateF; $_d_nDateFBase; $_d_nDateT; $_d_nDateTBase; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; VDnDateF)
	C_DATE:C307(VDndateFBASE; VDnDateT; VDndateTBASE; VdodateF; VdodateT)
	C_LONGINT:C283($_l_CallCodeBottom; $_l_CallCodeLabelBottom; $_l_CallCodeLabelLeft; $_l_CallCodeLabelRight; $_l_CallCodeLabelTop; $_l_CallCodeLeft; $_l_CallCodeRight; $_l_CallCodeTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight)
	C_LONGINT:C283($_l_CancelButtonTop; $_l_CompanyNameBottom; $_l_CompanyNameLeft; $_l_CompanyNameRight; $_l_CompanyNameTop; $_l_ContactNameBottom; $_l_ContactNameLeft; $_l_ContactNameRight; $_l_ContactNameTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft)
	C_LONGINT:C283($_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd; $_l_cSetMod; $_l_DoDateFromOffset; $_l_DoDateToOffset; $_l_DoneDateFromOffset; $_l_DoneDateToOffset; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight)
	C_LONGINT:C283($_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft)
	C_LONGINT:C283($_l_inselectLabelRight; $_l_inselectLabelTop; $_l_MacroBottom; $_l_MacroLabelBottom; $_l_MacroLabelLeft; $_l_MacroLabelRight; $_l_MacroLabelTop; $_l_MacroLeft; $_l_MacroRIght; $_l_MacroTop; $_l_NAA)
	C_LONGINT:C283($_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom)
	C_LONGINT:C283($_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop)
	C_LONGINT:C283($_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_OrderCodeBottom; $_l_OrderCodeLabelBottom)
	C_LONGINT:C283($_l_OrderCodeLabelLeft; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelTop; $_l_OrderCodeLeft; $_l_OrderCodeRIght; $_l_OrderCodeTop; $_l_PriorityBottom; $_l_PriorityLabelBottom; $_l_PriorityLabelLeft; $_l_PriorityLabelRight; $_l_PriorityLabelTop)
	C_LONGINT:C283($_l_PriorityLeft; $_l_PriorityRight; $_l_PriorityTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight)
	C_LONGINT:C283($_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_StatusBottom; $_l_StatusLabelBottom; $_l_StatusLabelLeft; $_l_StatusLabelRight; $_l_StatusLabelTop; $_l_StatusLeft; $_l_StatusRight; $_l_StatusTop)
	C_LONGINT:C283($_l_SuperiorBottom; $_l_SuperiorLabelBottom; $_l_SuperiorLabelLeft; $_l_SuperiorLabelRight; $_l_SuperiorLabelTop; $_l_SuperiorLeft; $_l_SuperiorRight; $_l_SuperiorTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; cNAA; cNAL; cSetAdd; cSetMod; cSIS; rHold; SM_l_QueryMode; SRCH_l_MinWidth; VDnDatefOffset; VDnDatetOffset)
	C_LONGINT:C283(VDoDateFffset; VDoDateFOffset; VDoDatetOffset)
	C_REAL:C285($_r_ValueF; $_r_ValueT; VvalueF; VvalueT)
	C_TEXT:C284($_t_ActionCode; $_t_ActionDescription; $_t_CallCode; $_t_CompanyCode; $_t_CompanyName; $_t_ContactName; $_t_ContactTelephone; $_t_ContCode; $_t_ContractCode; $_t_DocumentCode; $_t_Event)
	C_TEXT:C284($_t_ForeName; $_t_Group; $_t_JobCode; $_t_oldMethodName; $_t_OrderCode; $_t_Priority; $_t_ProductCode; $_t_ResultCode; $_t_ResultDescription; $_t_Sales; $_t_StageCode)
	C_TEXT:C284($_t_Status; $_t_Superior; $_t_Surname; $_t_Terms; DIA_t_actionCode; DIA_t_actionName; Vcallcode; VCompcode; vCompName; VcontactName; vContCode)
	C_TEXT:C284(VContrCode; Vevent; VforeName; VGroup; VJob; VLetterCode; VOrderCode; Vpriority; VProduct; VResDesc; VResult)
	C_TEXT:C284(vSales; VStage; Vstatus; Vsuperior; Vsurname; VTele; VTerms)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oDIATabChoices"; Form event code:C388)
//TRACE
If (DIA_al_coTabChoices{DIA_at_SearchTab}>0)
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
	$_t_ActionCode:=DIA_t_actionCode
	$_t_ActionDescription:=DIA_t_actionName
	$_t_DocumentCode:=VLetterCode
	$_t_Terms:=VTerms
	$_t_ResultCode:=VResult
	$_t_ResultDescription:=VResDesc
	$_t_ProductCode:=VProduct
	$_t_JobCode:=VJob
	$_t_StageCode:=VStage
	$_t_ContractCode:=VContrCode
	$_t_OrderCode:=VOrderCode
	$_t_Event:=Vevent
	$_t_CallCode:=Vcallcode
	$_t_ContactName:=VcontactName
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
	OBJECT GET COORDINATES:C663(*; "oStatusLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oMacro"; $_l_MacroLeft; $_l_MacroTop; $_l_MacroRIght; $_l_MacroBottom)
	OBJECT GET COORDINATES:C663(*; "oMacroLabel"; $_l_MacroLabelLeft; $_l_MacroLabelTop; $_l_MacroLabelRight; $_l_MacroLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oOrderCode"; $_l_OrderCodeLeft; $_l_OrderCodeTop; $_l_OrderCodeRIght; $_l_OrderCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oOrderCodeLabel"; $_l_OrderCodeLabelLeft; $_l_OrderCodeLabelTop; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCallCode"; $_l_CallCodeLeft; $_l_CallCodeTop; $_l_CallCodeRight; $_l_CallCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oCallCodeLabel"; $_l_CallCodeLabelLeft; $_l_CallCodeLabelTop; $_l_CallCodeLabelRight; $_l_CallCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom)
	OBJECT GET COORDINATES:C663(*; "oContactName"; $_l_ContactNameLeft; $_l_ContactNameTop; $_l_ContactNameRight; $_l_ContactNameBottom)
	OBJECT GET COORDINATES:C663(*; "oDIATabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_DodateFBase:=SRCH_d_DodateFBase
	$_d_DoDateTBase:=SRCH_d_DoDateTBase
	$_d_nDateFBase:=VDndateFBASE
	$_d_nDateTBase:=VDndateTBASE
	$_bo_VDoDateToSet:=SRCH_bo_VDoDateToSet
	$_bo_VDnDateToSet:=SRCH_bo_VDnDateToSet
	$_l_DoDateFromOffset:=VDoDateFOffset
	$_l_DoneDateFromOffset:=VDnDatetOffset
	$_l_DoDateToOffset:=VDoDatetOffset
	$_l_DoneDateToOffset:=VDnDatetOffset
	
	
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
		$_l_OK:=Diary_SelLP(DIA_al_coTabChoices{DIA_at_SearchTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Diary_SelLP(DIA_al_coTabChoices{DIA_at_SearchTab}; SM_l_QueryMode; Table:C252(->[DIARY:12]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
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
	OBJECT MOVE:C664(*; "oStatusLabel"; $_l_StatusLabelLeft; $_l_StatusLabelTop; $_l_StatusLabelRight; $_l_StatusLabelBottom; *)
	OBJECT MOVE:C664(*; "oMacro"; $_l_MacroLeft; $_l_MacroTop; $_l_MacroRIght; $_l_MacroBottom; *)
	OBJECT MOVE:C664(*; "oMacroLabel"; $_l_MacroLabelLeft; $_l_MacroLabelTop; $_l_MacroLabelRight; $_l_MacroLabelBottom; *)
	OBJECT MOVE:C664(*; "oOrderCode"; $_l_OrderCodeLeft; $_l_OrderCodeTop; $_l_OrderCodeRIght; $_l_OrderCodeBottom; *)
	OBJECT MOVE:C664(*; "oOrderCodeLabel"; $_l_OrderCodeLabelLeft; $_l_OrderCodeLabelTop; $_l_OrderCodeLabelRight; $_l_OrderCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oCallCode"; $_l_CallCodeLeft; $_l_CallCodeTop; $_l_CallCodeRight; $_l_CallCodeBottom; *)
	OBJECT MOVE:C664(*; "oCallCodeLabel"; $_l_CallCodeLabelLeft; $_l_CallCodeLabelTop; $_l_CallCodeLabelRight; $_l_CallCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oCompanyName"; $_l_CompanyNameLeft; $_l_CompanyNameTop; $_l_CompanyNameRight; $_l_CompanyNameBottom; *)
	OBJECT MOVE:C664(*; "oContactName"; $_l_ContactNameLeft; $_l_ContactNameTop; $_l_ContactNameRight; $_l_ContactNameBottom; *)
	OBJECT MOVE:C664(*; "oDIATabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	
	
	SRCH_d_DodateFBase:=$_d_DodateFBase
	SRCH_d_DoDateTBase:=$_d_DoDateTBase
	VDndateFBASE:=$_d_nDateFBase
	VDndateTBASE:=$_d_nDateTBase
	SRCH_bo_VDoDateToSet:=$_bo_VDoDateToSet
	SRCH_bo_VDnDateToSet:=$_bo_VDnDateToSet
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
	DIA_t_actionCode:=$_t_ActionCode
	DIA_t_actionName:=$_t_ActionDescription
	VLetterCode:=$_t_DocumentCode
	VTerms:=$_t_Terms
	VResult:=$_t_ResultCode
	VResDesc:=$_t_ResultDescription
	VProduct:=$_t_ProductCode
	VJob:=$_t_JobCode
	vStage:=$_t_StageCode
	vContrCode:=$_t_ContractCode
	VOrderCode:=$_t_OrderCode
	VEvent:=$_t_Event
	VCallCode:=$_t_CallCode
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	cSetAdd:=$_l_cSetAdd
	cSetMod:=$_l_cSetMod
	VcontactName:=$_t_ContactName
	VDoDateFOffset:=$_l_DoDateFromOffset
	VDnDatetOffset:=$_l_DoneDateFromOffset
	VDoDatetOffset:=$_l_DoDateToOffset
	VDnDatetOffset:=$_l_DoneDateToOffset
	If ($_l_OK>0) & (Not:C34(rHold=1))
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
	End if 
	SRCH_bo_ShowHold:=$_bo_ShowHold
	
End if 
DIA_at_SearchTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oDIATabChoices"; $_t_oldMethodName)
