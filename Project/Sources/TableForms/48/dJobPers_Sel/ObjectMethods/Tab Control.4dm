If (False:C215)
	//object Name: [JOB PERSONNEL]dJobPers_Sel.Tab Control
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 12:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(COM_at_CoTabChoices;0)
	C_BOOLEAN:C305(SRCH_bo_ShowHold; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_DoDateF)
	C_DATE:C307($_d_doDateT; $_d_EntryDateFrom; $_d_fDateF; $_d_SDateT; ACC_d_EntryDateFrom; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1)
	C_DATE:C307(vDateT2; vDateT3; vDateT4; vDateT5; vDoDateF; VDoDateT; VfDateF; VFDateT; VSDateT)
	C_LONGINT:C283($_l_Act1; $_l_Act2; $_l_Act3; $_l_Act4; $_l_Act5; $_l_bestHeight; $_l_bestWidth; $_l_ch1; $_l_cSetAdd; $_l_cSetMod; $_l_NAA)
	C_LONGINT:C283($_l_NAL; $_l_No1; $_l_No2; $_l_No3; $_l_No4; $_l_No5; $_l_OK; $_l_QueryMode; $_l_RecordState; $_l_SIS; $_l_TabsWidth)
	C_LONGINT:C283($_l_TotalWidth; ch1; cNAA; cNAL; cSetAdd; cSetMod; cSIS; rHold; SM_l_QueryMode; vAct1; vAct2)
	C_LONGINT:C283(vAct3; vAct4; vAct5; vNo1; vNo2; vNo3; vNo4; vNo5; VrStateL)
	C_REAL:C285($_r_DiscountF; $_r_DiscountT; $_r_ValueF; $_r_ValueT; VDiscountF; vDiscountT; VValueF; VvalueT)
	C_TEXT:C284($_t_Area; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContractCode; $_t_Country; $_t_County; $_t_Desc1; $_t_Desc2; $_t_Desc3; $_t_Desc4)
	C_TEXT:C284($_t_Desc5; $_t_Location; $_t_oldMethodName; $_t_Omit; $_t_PostCode; $_t_ProblemCode; $_t_ProductCode; $_t_RecordState; $_t_Sales; $_t_Source; $_t_Status)
	C_TEXT:C284($_t_SubGroup1; $_t_SubGroup2; $_t_SubGroup3; $_t_SubGroup4; $_t_SubGroup5; $_t_Superior; $_t_Telephone; $_t_Title1; $_t_Title2; $_t_Title3; $_t_Title4)
	C_TEXT:C284($_t_Title5; $_t_Town; $_t_Type; dbtabText2; Varea; VComments; VcompCode; vCompName; vContrCode; VCountry; VCounty)
	C_TEXT:C284(vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; VLocation; VOmit; VpostCode; vProbCode; VProdCode; vrstate)
	C_TEXT:C284(Vsales; Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; VSuperior; Vtel; Vtele)
	C_TEXT:C284(vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB PERSONNEL].dJobPers_Sel.Tab Control"; Form event code:C388)


$_t_RecordState:=vrstate
$_l_RecordState:=VrStateL
$_t_CompanyCode:=VcompCode
$_t_CompanyName:=vCompName
$_t_Town:=Vtown
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
$_t_Telephone:=Vtele
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
SRCH_bo_ShowHold:=True:C214
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
SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); SM_l_QueryMode)
SRCH_bo_ShowHold:=False:C215
dbtabText2:=""
For ($_l_TabsWidth; 1; Size of array:C274(COM_at_CoTabChoices))
	dbtabText2:=dbtabText2+COM_at_CoTabChoices{$_l_TabsWidth}+(" "*8)
End for 

OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
If ($_l_bestWidth>552)
	$_l_TotalWidth:=$_l_bestWidth
Else 
	$_l_TotalWidth:=552
End if 

WS_AutoscreenSize(2; 375; $_l_TotalWidth)
vrstate:=$_t_RecordState
VrStateL:=$_l_RecordState
vCOmpCode:=$_t_CompanyCode
vCompName:=$_t_CompanyName
VTown:=$_t_Town
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
Vtele:=$_t_Telephone
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
vDesc5:=$_t_Desc5
vNo5:=$_l_No5
vAct5:=$_l_Act5
vDateF5:=$_d_DateF5
vDateT5:=$_d_DateT5


If ($_l_OK>0) & (Not:C34(rHold=1))
	ACCEPT:C269
	WS_bo_InsearchScreen:=False:C215
End if 
COM_at_CoTabChoices:=1
ERR_MethodTrackerReturn("OBJ [JOB PERSONNEL].dJobPers_Sel.Tab Control"; $_t_oldMethodName)
