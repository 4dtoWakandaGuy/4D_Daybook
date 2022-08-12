If (False:C215)
	//object Name: Object Name:      dInvoiceItems_Sel.Variable74
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(INV_at_SearchTab;0)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DoDateF; $_d_DoDateT; $_d_LDateF; $_d_lDateT; $_d_RDateF; $_d_RDateT; $_d_SDateF; $_d_SDateT; VDoDateF; VDoDateT; viDateF)
	C_DATE:C307(viDateT; VRdateF; VRDateT; vSDateF; vSDateT)
	C_LONGINT:C283($_l_CH0; $_l_ch1; $_l_ch2; $_l_ch3; $_l_Ch4; $_l_Ch5; $_l_Ch6; $_l_Ch7; $_l_Ch8; $_l_NAA; $_l_NAL)
	C_LONGINT:C283($_l_OK; $_l_QueryMode; $_l_r0; $_l_r1; $_l_SIS; CH0; CH1; CH2; CH3; CH4; CH5)
	C_LONGINT:C283(CH6; CH7; CH8; cNAA; cNAL; cSIS; r0; r1; rHold; SM_l_QueryMode)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ChargesF; $_r_ChargesT; $_r_DueF; $_r_DueTo; $_r_invF; $_r_invT; VamountF; VamountT; VChargesF)
	C_REAL:C285(VChargesT; VDueF; VDueTo; VinvF; VInvT)
	C_TEXT:C284($_t_AccountCodeFrom; $_t_AccountCodeTo; $_t_AccPeriodFrom; $_t_AccPeriodTo; $_t_AnalCodeT; $_t_AnalysisCodeF; $_t_Area; $_t_CompanyCode; $_t_CompName; $_t_ContCode; $_t_CurrencyCode)
	C_TEXT:C284($_t_Event; $_t_ForeName; $_t_InvNoF; $_t_InvNoT; $_t_Job; $_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_ProductCode; $_t_Sales; $_t_Stage)
	C_TEXT:C284($_t_Surname; $_t_Terms; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; Varea; VCompCode)
	C_TEXT:C284(VCompName; VContCode; Vevent; VForename; VInvNoF; VInvNoT; VJob; Vlayer; Vname; VProdCode; Vsales)
	C_TEXT:C284(VStage; Vsurname; VTerms)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable74")

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable74"; Form event code:C388)

$_t_CompanyCode:=VCompCode
$_t_CompName:=VCompName
$_t_ContCode:=VContCode
$_t_ForeName:=VForename
$_t_Surname:=Vsurname
$_t_InvNoF:=VInvNoF
$_t_InvNoT:=VInvNoT

$_d_LDateF:=viDateF
$_d_lDateT:=viDateT
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
$_t_Event:=Vevent
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
$_l_r0:=r0
$_l_r1:=r1

If (SM_l_QueryMode=0)
	$_l_OK:=Invoices_SelLP(INV_at_SearchTab)
Else 
	$_l_QueryMode:=SM_l_QueryMode
	$_l_OK:=Invoices_SelLP(INV_at_SearchTab; SM_l_QueryMode; Table:C252(->[INVOICES:39]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
	SM_l_QueryMode:=$_l_QueryMode
End if 
SM_LoadSearchParameterNames(Table:C252(->[INVOICES:39]); SM_l_QueryMode)

vCompCode:=$_t_CompanyCode
vCompName:=$_t_CompName
vContCode:=$_t_ContCode
vForename:=$_t_ForeName
vSurname:=$_t_Surname
vInvNoF:=$_t_InvNoF
vINvNoT:=$_t_InvNoT
viDateF:=$_d_LDateF
viDateT:=$_d_lDateT
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
vevent:=$_t_Event
vName:=$_t_Name
vsales:=$_t_Sales
varea:=$_t_Area
ACC_t_CurrencyCode:=$_t_CurrencyCode
vLayer:=$_t_LayerCode

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
r0:=$_l_r0
r1:=$_l_r1
If ($_l_OK>0) & (Not:C34(rHold=1))
	
	ACCEPT:C269
	WS_bo_InsearchScreen:=False:C215
Else 
	
	
End if 
INV_at_SearchTab:=0
ERR_MethodTrackerReturn("OBJ dInvoiceItems_Sel.Variable74"; $_t_oldMethodName)
