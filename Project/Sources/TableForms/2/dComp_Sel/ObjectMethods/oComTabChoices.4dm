If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oComTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 08:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_TEXT(dbtabText2)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(COM_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(COM_at_CoTabChoices;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDoDateToSet; $_bo_VeDateToSet; $_bo_VfDateToSet; $_bo_VsDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VeDateToSet; SRCH_bo_VfDateToSet; SRCH_bo_VsDateToSet)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_DoDateF)
	C_DATE:C307($_d_DodateFBase; $_d_doDateT; $_d_DoDateTBase; $_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_fDateF; $_d_fdateFBASE; $_d_fdateTBASE; $_d_sdateFBASE; $_d_SDateT)
	C_DATE:C307($_d_sdateTBASE; ACC_d_EntryDateFrom; ElseC_DATE; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1)
	C_DATE:C307(vDateT2; vDateT3; vDateT4; vDateT5; vDoDateF; VDoDateT; VedateFBASE; VedateTBASE; VfDateF; VfdateFBASE; VFDateT)
	C_DATE:C307(VfdateTBASE; VsdateFBASE; VSDateT; VsdateTBASE)
	C_LONGINT:C283($_l_ACCCodeBottom; $_l_ACCCodeLabelBottom; $_l_ACCCodeLabelLeft; $_l_ACCCodeLabelRight; $_l_ACCCodeLabelTop; $_l_ACCCodeLeft; $_l_ACCCodeRight; $_l_AccountCodeTop; $_l_Act1; $_l_Act2; $_l_Act3)
	C_LONGINT:C283($_l_Act4; $_l_Act5; $_l_AreaBottom; $_l_AreaLabelBottom; $_l_AreaLabelLeft; $_l_AreaLabelRight; $_l_AreaLabelTop; $_l_AreaLeft; $_l_AreaRight; $_l_AreaTop; $_l_bestHeight)
	C_LONGINT:C283($_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ch1; $_l_CommentsBottom; $_l_CommentsLeft; $_l_CommentsRight; $_l_CommentsTop; $_l_CompanyBottom)
	C_LONGINT:C283($_l_CompanyLeft; $_l_CompanyRight; $_l_CompanyTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd; $_l_cSetMod; $_l_DoDateFOffset; $_l_DoDateTOffset)
	C_LONGINT:C283($_l_EntryDateToOffset; $_l_fDatetOffset; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_inSelectButtonBottom)
	C_LONGINT:C283($_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_LocationBottom; $_l_LocationLabelBottom; $_l_LocationLabelLeft; $_l_LocationLabelRight)
	C_LONGINT:C283($_l_LocationLabelTop; $_l_LocationLeft; $_l_LocationRight; $_l_LocationTop; $_l_NAA; $_l_NAL; $_l_No1; $_l_No2; $_l_No3; $_l_No4; $_l_No5)
	C_LONGINT:C283($_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight)
	C_LONGINT:C283($_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom)
	C_LONGINT:C283($_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop; $_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom)
	C_LONGINT:C283($_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_OmitBottom; $_l_OmitLabelBottom; $_l_OmitLabelLeft)
	C_LONGINT:C283($_l_OmitLabelRight; $_l_OmitLabelTop; $_l_OmitLeft; $_l_OmitRight; $_l_OmitTop; $_l_PostCodeBottom; $_l_PostcodeLabelBottom; $_l_PostcodeLabelLeft; $_l_PostcodeLabelRight; $_l_PostcodeLabelTop; $_l_PostCodeLeft)
	C_LONGINT:C283($_l_PostCodeRight; $_l_PostCodeTop; $_l_ProbCodeBottom; $_l_ProbCodeLabelBottom; $_l_ProbCodeLabelLeft; $_l_ProbCodeLabelRight; $_l_ProbCodeLabelTop; $_l_ProbCodeLeft; $_l_ProbCodeRight; $_l_ProbCodeTop; $_l_QueryMode)
	C_LONGINT:C283($_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_RecordStateBottom; $_l_RecordStateDDBottom; $_l_RecordStateDDLeft; $_l_RecordStateDDRight; $_l_RecordStateDDTop; $_l_RecordStateLabelBottom; $_l_RecordStateLabelLeft)
	C_LONGINT:C283($_l_RecordStateLabelRight; $_l_RecordStateLabelTop; $_l_RecordStateLeft; $_l_RecordStateRight; $_l_RecordStateTop; $_l_rState; $_l_SalesBottom; $_l_SalesLabelBottom; $_l_SalesLabelLeft; $_l_SalesLabelRight; $_l_SalesLabelTop)
	C_LONGINT:C283($_l_SalesLeft; $_l_SalesRight; $_l_SalesTop; $_l_sDateFOffset; $_l_sDatetOffset; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth)
	C_LONGINT:C283($_l_SuperiorBottom; $_l_SuperiorLabelBottom; $_l_SuperiorLabelLeft; $_l_SuperiorLabelRight; $_l_SuperiorLabelTop; $_l_SuperiorLeft; $_l_SuperiorRight; $_l_SuperiorTop; $_l_TabsWidth; $_l_TakenByBottom; $_l_TakenByLabelBottom)
	C_LONGINT:C283($_l_TakenByLabelLeft; $_l_TakenByLabelRight; $_l_TakenByLabelTop; $_l_TakenByLeft; $_l_TakenByRight; $_l_TakenByTop; $_l_TelephoneBottom; $_l_TelephoneLabelBottom; $_l_TelephoneLabelLeft; $_l_TelephoneLabelRight; $_l_TelephoneLabelTop)
	C_LONGINT:C283($_l_TelephoneLeft; $_l_TelephoneRight; $_l_TelephoneTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ch1; cNAA)
	C_LONGINT:C283(cNAL; cSetAdd; cSetMod; cSIS; rHold; SM_l_QueryMode; SRCH_l_MinWidth; vAct1; vAct2; vAct3; vAct4)
	C_LONGINT:C283(vAct5; VDoDateFOffset; VDoDatetOffset; VfDatetOffset; vNo1; vNo2; vNo3; vNo4; vNo5; VrStateL; VsDateFOffset)
	C_LONGINT:C283(VsDatetOffset)
	C_REAL:C285($_r_DiscountF; $_r_DiscountT; $_r_ValueF; $_r_ValueT; VDiscountF; vDiscountT; VValueF; VvalueT)
	C_TEXT:C284($_t_Area; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContactTelephone; $_t_ContractCode; $_t_Country; $_t_County; $_t_Desc1; $_t_Desc2; $_t_Desc3)
	C_TEXT:C284($_t_Desc4; $_t_Desc5; $_t_Location; $_t_oldMethodName; $_t_Omit; $_t_PostCode; $_t_ProblemCode; $_t_ProductCode; $_t_rState; $_t_Sales; $_t_Source)
	C_TEXT:C284($_t_Status; $_t_SubGroup1; $_t_SubGroup2; $_t_SubGroup3; $_t_SubGroup4; $_t_SubGroup5; $_t_Superior; $_t_Telephone; $_t_Title1; $_t_Title2; $_t_Title3)
	C_TEXT:C284($_t_Title4; $_t_Title5; $_t_town; $_t_Type; Varea; VComments; VcompCode; vCompName; vContrCode; VCountry; VCounty)
	C_TEXT:C284(vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; VLocation; VOmit; VpostCode; vProbCode; VProdCode; vrstate)
	C_TEXT:C284(Vsales; Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; VSuperior; Vtel; Vtele)
	C_TEXT:C284(vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oComTabChoices"; Form event code:C388)

If (COM_al_coTabChoices{COM_at_CoTabChoices}>0)
	ACC_l_EntryDateFromOffset:=0
	$_l_sDateFOffset:=VsDateFOffset
	$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
	$_l_sDatetOffset:=VsDatetOffset
	$_l_sDateFOffset:=VSDateFOffset
	$_l_DoDateFOffset:=VDoDateFOffset
	$_l_fDatetOffset:=VfDatetOffset
	$_l_DoDateTOffset:=VDoDatetOffset
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
	$_r_ValueF:=VValueF
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
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarCompanies"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oPostcode"; $_l_PostCodeLeft; $_l_PostCodeTop; $_l_PostCodeRight; $_l_PostCodeBottom)
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
	OBJECT GET COORDINATES:C663(*; "oProbCode"; $_l_ProbCodeLeft; $_l_ProbCodeTop; $_l_ProbCodeRight; $_l_ProbCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oProbCodeLabel"; $_l_ProbCodeLabelLeft; $_l_ProbCodeLabelTop; $_l_ProbCodeLabelRight; $_l_ProbCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oTheirAcc"; $_l_ACCCodeLeft; $_l_AccountCodeTop; $_l_ACCCodeRight; $_l_ACCCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oTheirAccLabel"; $_l_ACCCodeLabelLeft; $_l_ACCCodeLabelTop; $_l_ACCCodeLabelRight; $_l_ACCCodeLabelBottom)
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
		If (COM_al_coTabChoices{COM_at_CoTabChoices}>0)
			$_l_OK:=Comp_SelLP(COM_al_coTabChoices{COM_at_CoTabChoices})
		End if 
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		If (COM_al_coTabChoices{COM_at_CoTabChoices}>0)
			$_l_OK:=Comp_SelLP(COM_al_coTabChoices{COM_at_CoTabChoices}; SM_l_QueryMode; Table:C252(->[COMPANIES:2]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		End if 
		SM_l_QueryMode:=$_l_QueryMode
	End if 
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
	SRCH_d_DodateFBase:=$_d_DodateFBase
	SRCH_d_DoDateTBase:=$_d_DoDateTBase
	SRCH_bo_VeDateToSet:=$_bo_VeDateToSet
	SRCH_bo_VsDateToSet:=$_bo_VsDateToSet
	SRCH_bo_VfDateToSet:=$_bo_VfDateToSet
	SRCH_bo_VDoDateToSet:=$_bo_VDoDateToSet
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	
	
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	
	OBJECT MOVE:C664(*; "oSideBarCompanies"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	OBJECT MOVE:C664(*; "oSuperior"; $_l_SuperiorLeft; $_l_SuperiorTop; $_l_SuperiorRight; $_l_SuperiorBottom; *)
	OBJECT MOVE:C664(*; "oSuperiorLabel"; $_l_SuperiorLabelLeft; $_l_SuperiorLabelTop; $_l_SuperiorLabelRight; $_l_SuperiorLabelBottom; *)
	OBJECT MOVE:C664(*; "oPostcode"; $_l_PostCodeLeft; $_l_PostCodeTop; $_l_PostCodeRight; $_l_PostCodeBottom; *)
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
	OBJECT MOVE:C664(*; "oProbCode"; $_l_ProbCodeLeft; $_l_ProbCodeTop; $_l_ProbCodeRight; $_l_ProbCodeBottom; *)
	OBJECT MOVE:C664(*; "oProbCodeLabel"; $_l_ProbCodeLabelLeft; $_l_ProbCodeLabelTop; $_l_ProbCodeLabelRight; $_l_ProbCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oTheirAcc"; $_l_ACCCodeLeft; $_l_AccountCodeTop; $_l_ACCCodeRight; $_l_ACCCodeBottom; *)
	OBJECT MOVE:C664(*; "oTheirAccLabel"; $_l_ACCCodeLabelLeft; $_l_ACCCodeLabelTop; $_l_ACCCodeLabelRight; $_l_ACCCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oCompany"; $_l_CompanyLeft; $_l_CompanyTop; $_l_CompanyRight; $_l_CompanyBottom; *)
	OBJECT MOVE:C664(*; "oComments"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom; *)
	OBJECT MOVE:C664(*; "oComTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); SM_l_QueryMode)
	SRCH_bo_ShowHold:=$_bo_ShowHold
	dbtabText2:=""
	For ($_l_TabsWidth; 1; Size of array:C274(COM_at_CoTabChoices))
		dbtabText2:=dbtabText2+COM_at_CoTabChoices{$_l_TabsWidth}+(" "*8)
	End for 
	VsDateFOffset:=$_l_sDateFOffset
	ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
	VsDatetOffset:=$_l_sDatetOffset
	VSDateFOffset:=$_l_sDateFOffset
	VDoDateFOffset:=$_l_DoDateFOffset
	VfDatetOffset:=$_l_fDatetOffset
	VDoDatetOffset:=$_l_DoDateTOffset
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
	vValuef:=$_r_ValueF
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
	End if 
End if 
COM_at_CoTabChoices:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oComTabChoices"; $_t_oldMethodName)
