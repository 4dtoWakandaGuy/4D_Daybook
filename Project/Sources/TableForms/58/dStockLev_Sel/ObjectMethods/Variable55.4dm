If (False:C215)
	//object Name: [STOCK_LEVELS]dStockLev_Sel.Variable55
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2009 21:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(STK_at_SearchLevelTab;0)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_LONGINT:C283($_l_NAA; $_l_NAL; $_l_OK; $_l_SIS; $_l_QueryMode; cNAA; cNAL; cSIS; rHold; SM_l_QueryMode)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginT; VamountF; VamountT; vmarginF; vmarginT)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_ProductCode; $_t_type; ACC_t_CurrencyCode; Vanalysis; Vlayer; VProdCode; VType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable55"; Form event code:C388)

$_t_ProductCode:=VProdCode
$_t_type:=VType
$_t_AnalysisCode:=Vanalysis
$_t_CurrencyCode:=ACC_t_CurrencyCode
$_t_LayerCode:=Vlayer
$_r_AmountFrom:=VamountF
$_r_AmountTo:=VamountT
$_r_MarginF:=vmarginF
$_r_MarginT:=vmarginT
$_l_SIS:=cSIS
$_l_NAA:=cNAA
$_l_NAL:=cNAL



If (SM_l_QueryMode=0)
	$_l_OK:=StockLev_SelLP(STK_at_SearchLevelTab)
Else 
	$_l_QueryMode:=SM_l_QueryMode
	
	$_l_OK:=StockLev_SelLP(STK_at_SearchLevelTab; SM_l_QueryMode; Table:C252(->[STOCK_LEVELS:58]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
	SM_l_QueryMode:=$_l_QueryMode
End if 

SM_LoadSearchParameterNames(Table:C252(->[STOCK_LEVELS:58]); SM_l_QueryMode)

VprodCode:=$_t_ProductCode
VType:=$_t_type
Vanalysis:=$_t_AnalysisCode
ACC_t_CurrencyCode:=$_t_CurrencyCode
VLayer:=$_t_LayerCode
VamountF:=$_r_AmountFrom
VamountT:=$_r_AmountTo
VMarginF:=$_r_MarginF
VMarginT:=$_r_MarginT
cSIS:=$_l_SIS
cNAA:=$_l_NAA
cNAL:=$_l_NAL
STK_at_SearchLevelTab:=0
If ($_l_OK>0) & (Not:C34(rHold=1))
	
	ACCEPT:C269
	WS_bo_InsearchScreen:=False:C215
Else 
	
	
End if 
rHold:=0
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable55"; $_t_oldMethodName)
