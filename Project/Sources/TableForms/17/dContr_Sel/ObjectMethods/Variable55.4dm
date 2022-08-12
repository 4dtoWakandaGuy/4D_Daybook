If (False:C215)
	//object Name: [CONTRACTS]dContr_Sel.Variable55
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(CONT_at_SearchTab;0)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateTo; $_d_sDateF; $_d_SDateT; SRCH_d_EntryDateTo; VsDateF; VsDateT)
	C_LONGINT:C283($_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA; cNAL; cSIS; rHold; SM_l_QueryMode)
	C_TEXT:C284($_t_CompanyCode; $_t_ContCode; $_t_ContractCode; $_t_Job; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; $_t_Type; vCompCode; vContCode; vContrCode)
	C_TEXT:C284(vJob; VorderCode; VprodCode; VType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].dContr_Sel.Variable55"; Form event code:C388)

$_l_SIS:=cSIS
$_l_NAA:=cNAA
$_l_NAL:=cNAL
$_t_CompanyCode:=vCompCode
$_t_ContCode:=vContCode
$_t_ContractCode:=vContrCode
$_t_Type:=VType
$_d_sDateF:=VsDateF
$_d_SDateT:=VsDateT
$_d_EntryDateTo:=SRCH_d_EntryDateTo
$_t_Job:=vJob
$_t_OrderCode:=VorderCode
$_t_ProductCode:=VprodCode


If (SM_l_QueryMode=0)
	$_l_OK:=Contracts_SelLP(CONT_at_SearchTab)
Else 
	$_l_QueryMode:=SM_l_QueryMode
	//note that the arrays below are declared in the method Comp_SelP
	$_l_OK:=Contracts_SelLP(CONT_at_SearchTab; SM_l_QueryMode; Table:C252(->[CONTRACTS:17]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
	SM_l_QueryMode:=$_l_QueryMode
End if 
SM_LoadSearchParameterNames(Table:C252(->[CONTRACTS:17]); SM_l_QueryMode)
cSIS:=$_l_SIS
cNAA:=$_l_NAA
cNAL:=$_l_NAL
VCompCode:=$_t_CompanyCode
vContCode:=$_t_ContCode
vContrCode:=$_t_ContractCode
vType:=$_t_Type
Vsdatef:=$_d_sDateF
VsDateT:=$_d_SDateT
SRCH_d_EntryDateTo:=$_d_EntryDateTo
VJob:=$_t_Job
VorderCode:=$_t_OrderCode
VprodCode:=$_t_ProductCode
If ($_l_OK>0) & (Not:C34(rHold=1))
	
	ACCEPT:C269
	WS_bo_InsearchScreen:=False:C215
Else 
	
End if 
CONT_at_SearchTab:=0
rhold:=0
ERR_MethodTrackerReturn("OBJ [CONTRACTS].dContr_Sel.Variable55"; $_t_oldMethodName)
