If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oPRDTabChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/07/2012 19:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	//ARRAY LONGINT(PRD_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	//ARRAY TEXT(PRD_at_SearchTab;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VeDateToSet; $_bo_VIntDateToSet; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VeDateToSet; SRCH_bo_VIntDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_edateFBASE; $_d_edateTBASE; $_d_EntryDateFrom; $_d_EntryDateTo; $_d_IntDateF; $_d_IntdateFBASE; $_d_IntDateT; $_d_IntdateTBASE; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo; VedateFBASE)
	C_DATE:C307(VedateTBASE; VintDateF; VIntdateFBASE; VintDateT; VIntdateTBASE)
	C_LONGINT:C283($_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ch1; $_l_ch2; $_l_ch3; $_l_CommodityCodeBottom; $_l_CommodityCodeLabelBottom; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelRight)
	C_LONGINT:C283($_l_CommodityCodeLabelTop; $_l_CommodityCodeLeft; $_l_CommodityCodeRight; $_l_CommodityCodeTop; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft; $_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd; $_l_cSetMod; $_l_DescriptionBottom)
	C_LONGINT:C283($_l_DescriptionLeft; $_l_DescriptionRight; $_l_DescriptionTop; $_l_EnclosuresBottom; $_l_EnclosuresLeft; $_l_EnclosuresRight; $_l_EnclosuresTop; $_l_EntryDateFromOffset; $_l_EntryDateToOffset; $_l_FromLabelBottom; $_l_FromLabelLeft)
	C_LONGINT:C283($_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom; $_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_FurtherAnalysisCodeBottom; $_l_FurtherAnalysisCodeLabelBott; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelTop)
	C_LONGINT:C283($_l_FurtherAnalysisCodeLeft; $_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeTop; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight; $_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop)
	C_LONGINT:C283($_l_intDateFOffset; $_l_intDateTOffset; $_l_ModelCodeBottom; $_l_ModelCodeLeft; $_l_ModelCodeRight; $_l_ModelCodeTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight)
	C_LONGINT:C283($_l_NoLookupButtonTop; $_l_NoLookupLabelBottom; $_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft)
	C_LONGINT:C283($_l_NoWildLabelRight; $_l_NoWildLabelTop; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop)
	C_LONGINT:C283($_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDTop)
	C_LONGINT:C283($_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_OK; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_ProductNameBottom; $_l_ProductNameLeft)
	C_LONGINT:C283($_l_ProductNameRight; $_l_ProductNameTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_ShortCodeBottom; $_l_ShortCodeLabelBottom; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelRight)
	C_LONGINT:C283($_l_ShortCodeLabelTop; $_l_ShortCodeLeft; $_l_ShortCodeRight; $_l_ShortCodeTop; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS; $_l_SrchMinWidth; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; CH1; CH2; CH3; cNAA; cNAL; cSetAdd)
	C_LONGINT:C283(cSetMod; cSIS; rHold; SM_l_QueryMode; SRCH_l_MinWidth; VintDateFOffset; VintDatetOffset)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ValueF; $_r_valueT; VAmountF; VAmountT; vValueF; vValueT)
	C_TEXT:C284($_t_AnalysisCode; $_t_Brand; $_t_Comments; $_t_Enclosues; $_t_Group; $_t_LetterCode; $_t_ModelCode; $_t_oldMethodName; $_t_Problem; $_t_Product; $_t_ProductCode)
	C_TEXT:C284($_t_ProductName; $_t_Superior; $_t_Supplier; vAnalysis; vBrand; VComments; vEnclosures; Vgroup; VLetterCode; vModelCode; vProblem)
	C_TEXT:C284(VProdCode; vProdName; vProduct; Vsuperior; Vsupplier)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oPRDTabChoices"; Form event code:C388)

If (PRD_al_coTabChoices{PRD_at_SearchTab}>0)
	$_t_Group:=Vgroup
	$_t_Brand:=vBrand
	$_t_Product:=vProduct
	$_t_ModelCode:=vModelCode
	$_t_ProductCode:=VProdCode
	$_t_ProductName:=vProdName
	$_t_Comments:=VComments
	$_t_Enclosues:=vEnclosures
	$_t_Superior:=Vsuperior
	$_r_AmountFrom:=VAmountF
	$_r_AmountTo:=VAmountT
	$_r_ValueF:=vValueF
	$_r_valueT:=vValueT
	$_d_EntryDateFrom:=ACC_d_EntryDateFrom
	$_d_EntryDateTo:=SRCH_d_EntryDateTo
	$_d_IntDateF:=VintDateF
	$_d_IntDateT:=VintDateT
	$_t_Supplier:=Vsupplier
	$_t_LetterCode:=VLetterCode
	$_t_Problem:=vProblem
	$_t_LetterCode:=vLetterCode
	$_t_AnalysisCode:=vAnalysis
	$_l_ch1:=CH1
	$_l_ch2:=CH2
	$_l_ch3:=CH3
	$_l_SIS:=cSIS
	$_l_NAA:=cNAA
	$_l_NAL:=cNAL
	$_l_cSetAdd:=cSetAdd
	$_l_cSetMod:=cSetMod
	$_l_EntryDateFromOffset:=ACC_l_EntryDateFromOffset
	$_l_intDateFOffset:=VintDateFOffset
	$_l_EntryDateToOffset:=ACC_l_EntryDateToOffset
	$_l_intDateTOffset:=VintDatetOffset
	
	$_bo_ShowHold:=SRCH_bo_ShowHold
	SRCH_bo_ShowHold:=True:C214
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oSideBarProducts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
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
	OBJECT GET COORDINATES:C663(*; "oPrdTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
	OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
	OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	
	OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
	OBJECT GET COORDINATES:C663(*; "oModelCode"; $_l_ModelCodeLeft; $_l_ModelCodeTop; $_l_ModelCodeRight; $_l_ModelCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oShortCode"; $_l_ShortCodeLeft; $_l_ShortCodeTop; $_l_ShortCodeRight; $_l_ShortCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oShortCodeLabel"; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelTop; $_l_ShortCodeLabelRight; $_l_ShortCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom)
	OBJECT GET COORDINATES:C663(*; "oDescription"; $_l_DescriptionLeft; $_l_DescriptionTop; $_l_DescriptionRight; $_l_DescriptionBottom)
	OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_EnclosuresLeft; $_l_EnclosuresTop; $_l_EnclosuresRight; $_l_EnclosuresBottom)
	OBJECT GET COORDINATES:C663(*; "oCommodityCode"; $_l_CommodityCodeLeft; $_l_CommodityCodeTop; $_l_CommodityCodeRight; $_l_CommodityCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oCommodityCodeLabel"; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelTop; $_l_CommodityCodeLabelRight; $_l_CommodityCodeLabelBottom)
	OBJECT GET COORDINATES:C663(*; "oFurtherAnalysisCode"; $_l_FurtherAnalysisCodeLeft; $_l_FurtherAnalysisCodeTop; $_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oFurtherAnalysisCodeLabel"; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelTop; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelBott)
	
	
	COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
	COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
	COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
	$_d_edateFBASE:=VedateFBASE
	$_d_edateTBASE:=VedateTBASE
	$_d_IntdateFBASE:=VIntdateFBASE
	$_d_IntdateTBASE:=VIntdateTBASE
	$_bo_VeDateToSet:=SRCH_bo_VeDateToSet
	$_bo_VIntDateToSet:=SRCH_bo_VIntDateToSet
	
	
	
	SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_SrchMinWidth:=SRCH_l_MinWidth
	If (Not:C34(SRCH_bo_Pathinited))
		ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
		SRCH_bo_Pathinited:=True:C214
	End if 
	If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
		APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))
		
	End if 
	
	COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
	
	
	If (SM_l_QueryMode=0)
		$_l_OK:=Prod_SelLP(PRD_al_coTabChoices{PRD_at_SearchTab})
	Else 
		$_l_QueryMode:=SM_l_QueryMode
		//note that the arrays below are declared in the method Comp_SelP
		$_l_OK:=Prod_SelLP(PRD_al_coTabChoices{PRD_at_SearchTab}; SM_l_QueryMode; Table:C252(->[PRODUCTS:9]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
		SM_l_QueryMode:=$_l_QueryMode
	End if 
	SRCH_l_MinWidth:=$_l_SrchMinWidth
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
	COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
	VedateFBASE:=$_d_edateFBASE
	VedateTBASE:=$_d_edateTBASE
	VIntdateFBASE:=$_d_IntdateFBASE
	VIntdateTBASE:=$_d_IntdateTBASE
	SRCH_bo_VeDateToSet:=$_bo_VeDateToSet
	SRCH_bo_VIntDateToSet:=$_bo_VIntDateToSet
	COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
	OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
	
	OBJECT MOVE:C664(*; "oSideBarProducts"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
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
	OBJECT MOVE:C664(*; "oPrdTabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
	OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
	OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
	OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
	OBJECT MOVE:C664(*; "oModelCode"; $_l_ModelCodeLeft; $_l_ModelCodeTop; $_l_ModelCodeRight; $_l_ModelCodeBottom; *)
	OBJECT MOVE:C664(*; "oShortCode"; $_l_ShortCodeLeft; $_l_ShortCodeTop; $_l_ShortCodeRight; $_l_ShortCodeBottom; *)
	OBJECT MOVE:C664(*; "oShortCodeLabel"; $_l_ShortCodeLabelLeft; $_l_ShortCodeLabelTop; $_l_ShortCodeLabelRight; $_l_ShortCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
	OBJECT MOVE:C664(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom; *)
	OBJECT MOVE:C664(*; "oDescription"; $_l_DescriptionLeft; $_l_DescriptionTop; $_l_DescriptionRight; $_l_DescriptionBottom; *)
	OBJECT MOVE:C664(*; "oEnclosures"; $_l_EnclosuresLeft; $_l_EnclosuresTop; $_l_EnclosuresRight; $_l_EnclosuresBottom; *)
	OBJECT MOVE:C664(*; "oCommodityCode"; $_l_CommodityCodeLeft; $_l_CommodityCodeTop; $_l_CommodityCodeRight; $_l_CommodityCodeBottom; *)
	OBJECT MOVE:C664(*; "oCommodityCodeLabel"; $_l_CommodityCodeLabelLeft; $_l_CommodityCodeLabelTop; $_l_CommodityCodeLabelRight; $_l_CommodityCodeLabelBottom; *)
	OBJECT MOVE:C664(*; "oFurtherAnalysisCode"; $_l_FurtherAnalysisCodeLeft; $_l_FurtherAnalysisCodeTop; $_l_FurtherAnalysisCodeRight; $_l_FurtherAnalysisCodeBottom; *)
	OBJECT MOVE:C664(*; "oFurtherAnalysisCodeLabel"; $_l_FurtherAnalysisCodeLabelLeft; $_l_FurtherAnalysisCodeLabelTop; $_l_FurtherAnalysisCodeLabelRigh; $_l_FurtherAnalysisCodeLabelBott; *)
	
	SM_LoadSearchParameterNames(Table:C252(->[PRODUCTS:9]); SM_l_QueryMode)
	SRCH_bo_ShowHold:=$_bo_ShowHold
	
	VGroup:=$_t_Group
	vBrand:=$_t_Brand
	vProduct:=$_t_Product
	vModelCode:=$_t_ModelCode
	vProdCode:=$_t_ProductCode
	vProdName:=$_t_ProductName
	vComments:=$_t_Comments
	vEnclosures:=$_t_Enclosues
	vSuperior:=$_t_Superior
	vAmountF:=$_r_AmountFrom
	vAmountT:=$_r_AmountTo
	vValueF:=$_r_ValueF
	vValueT:=$_r_valueT
	ACC_d_EntryDateFrom:=$_d_EntryDateFrom
	SRCH_d_EntryDateTo:=$_d_EntryDateTo
	vSupplier:=$_t_Supplier
	vLetterCOde:=$_t_LetterCode
	vProblem:=$_t_Problem
	vLetterCode:=$_t_LetterCode
	vAnalysis:=$_t_AnalysisCode
	CH1:=$_l_ch1
	CH2:=$_l_ch2
	CH3:=$_l_ch3
	cSIS:=$_l_SIS
	cNAA:=$_l_NAA
	cNAL:=$_l_NAL
	cSetAdd:=$_l_cSetAdd
	cSetMod:=$_l_cSetMod
	VintDateF:=$_d_IntDateF
	VintDateT:=$_d_IntDateT
	ACC_l_EntryDateFromOffset:=$_l_EntryDateFromOffset
	VintDateFOffset:=$_l_intDateFOffset
	ACC_l_EntryDateToOffset:=$_l_EntryDateToOffset
	VintDatetOffset:=$_l_intDateTOffset
	
	If ($_l_OK>0) & (Not:C34(rHold=1))
		ACCEPT:C269
		WS_bo_InsearchScreen:=False:C215
	Else 
		
		
	End if 
	rHold:=0
	
End if 
PRD_at_SearchTab:=1
If (Not:C34(SRCH_bo_ShowHold))
	OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ:dProd_Sel,PRD_at_SearchTab"; $_t_oldMethodName)
