If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oContTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 07:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(CON_al_TabsOffset;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(CON_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDoDateToSet; $_bo_VeDateToSet; $_bo_VfDateToSet; $_bo_VsDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VeDateToSet; SRCH_bo_VfDateToSet; SRCH_bo_VsDateToSet)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_DodateFBase)
	C_DATE:C307($_d_DoDateTBase; $_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_EntryDateTo; $_d_fdateFBASE; $_d_fdateTBASE; $_d_sDateF; $_d_sdateFBASE; $_d_SDateT; $_d_sdateTBASE)
	C_DATE:C307(SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2)
	C_DATE:C307(vDateT3; vDateT4; vDateT5; VedateFBASE; VedateTBASE; VfdateFBASE; VfdateTBASE; VsDateF; VsdateFBASE; VsDateT; VsdateTBASE)
	C_LONGINT:C283($_l_Act1; $_l_Act2; $_l_Act3; $_l_Act4; $_l_Act5; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight; $_l_AreaLabelTop; $_l_AreaLeft)
	C_LONGINT:C283($_l_AreaRight; $_l_AreaTop; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_CoAnalysisBottom; $_l_CoAnalysisLabelBottom; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelRIght; $_l_CoAnalysisLabelTop)
	C_LONGINT:C283($_l_CoAnalysisLeft; $_l_CoAnalysisRight; $_l_CoAnalysisTop; $_l_CommentsBottom; $_l_CommentsLeft; $_l_CommentsRight; $_l_CommentsTop; $_l_CompanyBottom; $_l_CompanyCodeBottom; $_l_CompanyCodeLeft; $_l_CompanyCodeRight)
	C_LONGINT:C283($_l_CompanyCodeTop; $_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContactCodeBottom; $_l_ContactCodeLabelBottom; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelTop; $_l_ContactCodeLeft; $_l_ContactCodeRIght)
	C_LONGINT:C283($_l_ContactCodeTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_CountryBottom; $_l_CountryLeft; $_l_CountryRight; $_l_CountryTop; $_l_CountyBottom; $_l_CountyLeft)
	C_LONGINT:C283($_l_CountyRight; $_l_CountyTop; $_l_cSetAdd; $_l_cSetMod; $_l_DupBottom; $_l_DupLabelBottom; $_l_DupLabelLeft; $_l_DupLabelRight; $_l_DupLabelTop; $_l_DupLeft; $_l_DupRight)
	C_LONGINT:C283($_l_DupTop; $_l_emailBottom; $_l_emailLeft; $_l_emailRight; $_l_emailTop; $_l_EntryDateFromOffset; $_l_EntryDateToOffset; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop)
	C_LONGINT:C283($_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight)
	C_LONGINT:C283($_l_inselectLabelTop; $_l_JobTitleBottom; $_l_JobTitleLeft; $_l_JobTitleRight; $_l_JobTitleTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_No2; $_l_No3; $_l_No4)
	C_LONGINT:C283($_l_No5; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft)
	C_LONGINT:C283($_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom)
	C_LONGINT:C283($_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop)
	C_LONGINT:C283($_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_OmitBottom; $_l_OmitLabelBottom)
	C_LONGINT:C283($_l_OmitLabelLeft; $_l_OmitLabelRight; $_l_OmitLabelTop; $_l_OmitLeft; $_l_OmitRight; $_l_OmitTop; $_l_PersonBottom; $_l_PersonLeft; $_l_PersonRight; $_l_PersonTop; $_l_PostcodeBottom)
	C_LONGINT:C283($_l_PostCodeLabelBottom; $_l_PostCodeLabelLeft; $_l_PostCodeLabelRight; $_l_PostCodeLabelTop; $_l_PostcodeLeft; $_l_PostcodeRight; $_l_PostcodeTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght)
	C_LONGINT:C283($_l_QULabelTop; $_l_RoleBottom; $_l_RoleLabelBottom; $_l_RoleLabelLeft; $_l_RoleLabelRight; $_l_RoleLabelTop; $_l_RoleLeft; $_l_RoleRight; $_l_RoleTop; $_l_SalesBottom; $_l_SalesLabelBottom)
	C_LONGINT:C283($_l_SalesLabelLeft; $_l_SalesLabelRight; $_l_SalesLabelTop; $_l_SalesLeft; $_l_SalesRight; $_l_SalesTop; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight)
	C_LONGINT:C283($_l_SideBarTop; $_l_SIS; $_l_SourceBottom; $_l_SourceLabelBottom; $_l_SourceLabelLeft; $_l_SourceLabelRight; $_l_SourceLabelTop; $_l_SourceLeft; $_l_SourceRight; $_l_SourceTop; $_l_SrchMinWidth)
	C_LONGINT:C283($_l_StatusBottom; $_l_StatusLabelBottom; $_l_StatusLabelLeft; $_l_StatusLabelRight; $_l_StatusLabelTop; $_l_StatusLeft; $_l_StatusRight; $_l_StatusTop; $_l_TakenByBottom; $_l_TakenByLabelBottom; $_l_TakenByLabelLeft)
	C_LONGINT:C283($_l_TakenByLabelRight; $_l_TakenByLabelTop; $_l_TakenByLeft; $_l_TakenByRight; $_l_TakenByTop; $_l_TelephoneBottom; $_l_TelephoneLabelBottom; $_l_TelephoneLabelLeft; $_l_TelephoneLabelRight; $_l_TelephoneLabelTop; $_l_TelephoneLeft)
	C_LONGINT:C283($_l_TelephoneRight; $_l_TelephoneTop; $_l_TownBottom; $_l_TownLeft; $_l_TownRight; $_l_TownTop; $_l_TypeBottom; $_l_TypeLabelBottom; $_l_TypeLabelLeft; $_l_TypeLabelRight; $_l_TypeLabelTop)
	C_LONGINT:C283($_l_TypeLeft; $_l_TypeRight; $_l_TypeTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; cNAA; cNAL)
	C_LONGINT:C283(cSetAdd; cSetMod; cSIS; rHold; SM_l_QueryMode; SRCH_l_MinWidth; vAct1; vAct2; vAct3; vAct4; vAct5)
	C_LONGINT:C283(vNo1; vNo2; vNo3; vNo4; vNo5; VsDateFOffset; VsDatetOffset)
	C_TEXT:C284($_t_AccountName; $_t_Analysis; $_t_Area; $_t_CalYr; $_t_Charge; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContCode; $_t_Country; $_t_County)
	C_TEXT:C284($_t_Desc1; $_t_Desc2; $_t_Desc3; $_t_Desc4; $_t_Desc5; $_t_Email; $_t_ForeName; $_t_JobTitle; $_t_oldMethodName; $_t_Omit; $_t_Person)
	C_TEXT:C284($_t_PersonName; $_t_PostCode; $_t_ProductCode; $_t_Role; $_t_Sales; $_t_Source; $_t_status; $_t_SubGroup1; $_t_SubGroup2; $_t_SubGroup3; $_t_SubGroup4)
	C_TEXT:C284($_t_SubGroup5; $_t_Surname; $_t_Telephone; $_t_Title; $_t_Title1; $_t_Title2; $_t_Title3; $_t_Title4; $_t_Title5; $_t_town; $_t_Type)
	C_TEXT:C284($_t_Type_; vAccName; Vaccount; vAnalysis; Varea; vCalYr; VCharge; Vcomments; vCompCode; VCompName; VContCode)
	C_TEXT:C284(vCountry; vCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vemail; VForeName; VJobTitle; Vomit)
	C_TEXT:C284(Vperson; vPersonName; VPostCode; vProdCode; Vrole; VSales; Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3)
	C_TEXT:C284(vSubGroup4; vSubGroup5; Vsurname; vTele; Vtitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown)
	C_TEXT:C284(Vtype; VType_)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oContTabChoices"; Form event code:C388)
//ARRAY STRING(55;CON_at_SearchTab;0)
//ARRAY LONGINT(CON_al_TabsOffset;0)
If (CON_al_TabsOffset{CON_at_SearchTab}>0)
	$_t_CompanyCode:=vCompCode
	$_t_Title:=Vtitle
	$_t_ForeName:=VForeName
	$_t_Surname:=Vsurname
	$_t_JobTitle:=VJobTitle
	$_t_status:=Vstatus
	$_t_Type:=Vtype
	$_t_Source:=Vsource
	$_d_EntryDateFrom:=SRCH_d_EntryDateFrom
	$_d_EntryDateTo:=SRCH_d_EntryDateTo
	$_d_sDateF:=VsDateF
	$_d_SDateT:=VsDateT
	$_t_CompanyName:=VCompName
	$_t_town:=Vtown
	$_t_County:=vCounty
	$_t_Country:=vCountry
	$_t_status:=VStatus
	$_t_Type_:=VType_
	$_t_Source:=VSource
	$_t_ContCode:=VContCode
	$_t_Role:=Vrole
	$_t_Omit:=Vomit
	$_t_Charge:=VCharge
	$_t_Person:=Vperson
	$_t_CalYr:=vCalYr
	$_t_AccountName:=vAccName
	$_t_AccountName:=vAccName
	$_t_Email:=vemail  // 01/09/03 pb
	$_t_Analysis:=vAnalysis
	$_t_Comments:=Vcomments
	$_t_PostCode:=VPostCode
	$_t_ProductCode:=vProdCode
	$_t_Area:=Varea
	$_t_Sales:=VSales
	$_t_Telephone:=vTele
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
	$_t_PersonName:=vPersonName
	//ARRAY STRING(55;CON_at_SearchTab;0)
	//ARRAY LONGINT(CON_al_TabsOffset;0)
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarContacts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
	OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oWithinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
	OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
	OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
	
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
	OBJECT GET COORDINATES:C663(*; "oContactCode"; $_l_ContactCodeLeft; $_l_ContactCodeTop; $_l_ContactCodeRIght; $_l_ContactCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oContactCodeLabel"; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelTop; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oRole"; $_l_RoleLeft; $_l_RoleTop; $_l_RoleRight; $_l_RoleBottom)
	OBJECT GET COORDINATES:C663(*; "oRoleLabel"; $_l_RoleLabelLeft; $_l_RoleLabelTop; $_l_RoleLabelRight; $_l_RoleLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oPostcode"; $_l_PostcodeLeft; $_l_PostcodeTop; $_l_PostcodeRight; $_l_PostcodeBottom)
	OBJECT GET COORDINATES:C663(*; "oPostcodeLabel"; $_l_PostCodeLabelLeft; $_l_PostCodeLabelTop; $_l_PostCodeLabelRight; $_l_PostCodeLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom)
	OBJECT GET COORDINATES:C663(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom)
	OBJECT GET COORDINATES:C663(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oSales"; $_l_SalesLeft; $_l_SalesTop; $_l_SalesRight; $_l_SalesBottom)
	OBJECT GET COORDINATES:C663(*; "oSalesLabel"; $_l_SalesLabelLeft; $_l_SalesLabelTop; $_l_SalesLabelRight; $_l_SalesLabelBottom)
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
	OBJECT GET COORDINATES:C663(*; "oCoAnalysisLabel"; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelTop; $_l_CoAnalysisLabelRIght; $_l_CoAnalysisLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom)
	OBJECT GET COORDINATES:C663(*; "oPerson"; $_l_PersonLeft; $_l_PersonTop; $_l_PersonRight; $_l_PersonBottom)
	OBJECT GET COORDINATES:C663(*; "oeMail"; $_l_emailLeft; $_l_emailTop; $_l_emailRight; $_l_emailBottom)
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
	$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
	$_l_sDateFOffset:=VsDateFOffset
	$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
	$_l_sDatetOffset:=VsDatetOffset
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (SM_l_QueryMode=0)
		
		$_l_OK:=Cont_SelLP(CON_al_TabsOffset{CON_at_SearchTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Cont_SelLP(CON_al_TabsOffset{CON_at_SearchTab}; SM_l_QueryMode; Table:C252(->[CONTACTS:1]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
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
	ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
	VsDateFOffset:=$_l_sDateFOffset
	ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
	VsDatetOffset:=$_l_sDatetOffset
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
	OBJECT MOVE:C664(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
	OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
	OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	OBJECT MOVE:C664(*; "oContactCode"; $_l_ContactCodeLeft; $_l_ContactCodeTop; $_l_ContactCodeRIght; $_l_ContactCodeBottom; *)
	OBJECT MOVE:C664(*; "oContactCodeLabel"; $_l_ContactCodeLabelLeft; $_l_ContactCodeLabelTop; $_l_ContactCodeLabelRight; $_l_ContactCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oRole"; $_l_RoleLeft; $_l_RoleTop; $_l_RoleRight; $_l_RoleBottom; *)
	OBJECT MOVE:C664(*; "oRoleLabel"; $_l_RoleLabelLeft; $_l_RoleLabelTop; $_l_RoleLabelRight; $_l_RoleLabelBottom; *)
	OBJECT MOVE:C664(*; "oPostcode"; $_l_PostcodeLeft; $_l_PostcodeTop; $_l_PostcodeRight; $_l_PostcodeBottom; *)
	OBJECT MOVE:C664(*; "oPostcodeLabel"; $_l_PostCodeLabelLeft; $_l_PostCodeLabelTop; $_l_PostCodeLabelRight; $_l_PostCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oTelephone"; $_l_TelephoneLeft; $_l_TelephoneTop; $_l_TelephoneRight; $_l_TelephoneBottom; *)
	OBJECT MOVE:C664(*; "oTelephoneLabel"; $_l_TelephoneLabelLeft; $_l_TelephoneLabelTop; $_l_TelephoneLabelRight; $_l_TelephoneLabelBottom; *)
	OBJECT MOVE:C664(*; "oArea"; $_l_AreaLeft; $_l_AreaTop; $_l_AreaRight; $_l_AreaBottom; *)
	OBJECT MOVE:C664(*; "oAreaLabel"; $_l_AreaLabelLeft; $_l_AreaLabelTop; $_l_AreaLabelRight; $_l_AreaLabelBottom; *)
	OBJECT MOVE:C664(*; "oSales"; $_l_SalesLeft; $_l_SalesTop; $_l_SalesRight; $_l_SalesBottom; *)
	OBJECT MOVE:C664(*; "oSalesLabel"; $_l_SalesLabelLeft; $_l_SalesLabelTop; $_l_SalesLabelRight; $_l_SalesLabelBottom; *)
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
	OBJECT MOVE:C664(*; "oCoAnalysisLabel"; $_l_CoAnalysisLabelLeft; $_l_CoAnalysisLabelTop; $_l_CoAnalysisLabelRIght; $_l_CoAnalysisLabelBottom; *)
	OBJECT MOVE:C664(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
	OBJECT MOVE:C664(*; "oPerson"; $_l_PersonLeft; $_l_PersonTop; $_l_PersonRight; $_l_PersonBottom; *)
	OBJECT MOVE:C664(*; "oeMail"; $_l_emailLeft; $_l_emailTop; $_l_emailRight; $_l_emailBottom; *)
	OBJECT MOVE:C664(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom; *)
	OBJECT MOVE:C664(*; "oContTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oCompanyCode"; $_l_CompanyCodeLeft; $_l_CompanyCodeTop; $_l_CompanyCodeRight; $_l_CompanyCodeBottom; *)
	OBJECT MOVE:C664(*; "oJobTitle"; $_l_JobTitleLeft; $_l_JobTitleTop; $_l_JobTitleRight; $_l_JobTitleBottom; *)
	OBJECT MOVE:C664(*; "oTown"; $_l_TownLeft; $_l_TownTop; $_l_TownRight; $_l_TownBottom; *)
	OBJECT MOVE:C664(*; "oCounty"; $_l_CountyLeft; $_l_CountyTop; $_l_CountyRight; $_l_CountyBottom; *)
	OBJECT MOVE:C664(*; "oCountry"; $_l_CountryLeft; $_l_CountryTop; $_l_CountryRight; $_l_CountryBottom; *)
	SM_LoadSearchParameterNames(Table:C252(->[CONTACTS:1]); SM_l_QueryMode)
	SRCH_bo_ShowHold:=$_bo_ShowHold
	CON_at_SearchTab:=1
	vCompCode:=$_t_CompanyCode
	VTitle:=$_t_Title
	VForeName:=$_t_ForeName
	VSurname:=$_t_Surname
	VJobtitle:=$_t_JobTitle
	vStatus:=$_t_status
	Vtype:=$_t_Type
	VType_:=$_t_Type_
	VSource:=$_t_Source
	SRCH_d_EntryDateFrom:=$_d_EntryDateFrom
	SRCH_d_EntryDateTo:=$_d_EntryDateTo
	VsDateF:=$_d_sDateF
	VsdateT:=$_d_SDateT
	VCOmpName:=$_t_CompanyName
	VTown:=$_t_town
	VCounty:=$_t_County
	Vcountry:=$_t_Country
	Vstatus:=$_t_status
	
	Vsource:=$_t_Source
	VContCode:=$_t_ContCode
	Vrole:=$_t_Role
	Vomit:=$_t_Omit
	vCharge:=$_t_Charge
	VPerson:=$_t_Person
	VCalYr:=$_t_CalYr
	vAccName:=$_t_AccountName
	Vaccount:=$_t_AccountName
	vemail:=$_t_Email  // 01/09/03 pb
	VAnalysis:=$_t_Analysis
	VComments:=$_t_Comments
	VPostCode:=$_t_PostCode
	vProdCOde:=$_t_ProductCode
	VArea:=$_t_Area
	Vsales:=$_t_Sales
	Vtele:=$_t_Telephone
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
	vPersonName:=$_t_PersonName
	If ($_l_OK>0) & (Not:C34(rHold=1))
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	End if 
	rHold:=0
	
End if 
CON_at_SearchTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oContTabChoices"; $_t_oldMethodName)
