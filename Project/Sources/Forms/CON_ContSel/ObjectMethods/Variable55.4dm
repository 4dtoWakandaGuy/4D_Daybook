If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable55
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/07/2012 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(CON_at_SearchTab;0)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_DATE:C307($_d_DateF1; $_d_DateF2; $_d_DateF3; $_d_DateF4; $_d_DateF5; $_d_DateT1; $_d_DateT2; $_d_DateT3; $_d_DateT4; $_d_DateT5; $_d_EntryDateFrom)
	C_DATE:C307($_d_EntryDateTo; $_d_sDateF; $_d_SDateT; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1)
	C_DATE:C307(vDateT2; vDateT3; vDateT4; vDateT5; VsDateF; VsDateT)
	C_LONGINT:C283($_l_Act1; $_l_Act2; $_l_Act3; $_l_Act4; $_l_Act5; $_l_cSetAdd; $_l_cSetMod; $_l_NAA; $_l_NAL; $_l_No1; $_l_No2)
	C_LONGINT:C283($_l_No3; $_l_No4; $_l_No5; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA; cNAL; cSetAdd; cSetMod; cSIS)
	C_LONGINT:C283(rHold; SM_l_QueryMode; vAct1; vAct2; vAct3; vAct4; vAct5; vNo1; vNo2; vNo3; vNo4)
	C_LONGINT:C283(vNo5)
	C_TEXT:C284($_t_accountCode; $_t_AccountName; $_t_Analysis; $_t_Area; $_t_CalYr; $_t_Charge; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_ContactTelephone; $_t_ContCode)
	C_TEXT:C284($_t_Country; $_t_County; $_t_Desc1; $_t_Desc2; $_t_Desc3; $_t_Desc4; $_t_Desc5; $_t_email; $_t_ForeName; $_t_JobTitle; $_t_oldMethodName)
	C_TEXT:C284($_t_Omit; $_t_person; $_t_PostCode; $_t_ProductCode; $_t_Role; $_t_Sales; $_t_Source; $_t_Status; $_t_SubGroup1; $_t_SubGroup2; $_t_SubGroup3)
	C_TEXT:C284($_t_SubGroup4; $_t_SubGroup5; $_t_Surname; $_t_Title; $_t_Title1; $_t_Title2; $_t_Title3; $_t_Title4; $_t_Title5; $_t_town; $_t_Type)
	C_TEXT:C284($_t_Type_; vAccName; Vaccount; vAnalysis; Varea; vCalYr; VCharge; Vcomments; vCompCode; VCompName; VContCode)
	C_TEXT:C284(vCountry; vCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vemail; VForeName; VJobTitle; Vomit)
	C_TEXT:C284(Vperson; VPostCode; vProdCode; Vrole; VSales; Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4)
	C_TEXT:C284(vSubGroup5; Vsurname; vTele; Vtitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
	C_TEXT:C284(VType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable55")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable55"; Form event code:C388)


$_t_CompanyCode:=vCompCode
$_t_Title:=Vtitle
$_t_ForeName:=VForeName
$_t_Surname:=Vsurname
$_t_JobTitle:=VJobTitle
$_t_Status:=Vstatus
$_t_Type:=Vtype
$_t_Source:=Vsource
$_d_EntryDateFrom:=ACC_d_EntryDateFrom
$_d_EntryDateTo:=SRCH_d_EntryDateTo
$_d_sDateF:=VsDateF
$_d_SDateT:=VsDateT
$_t_CompanyName:=VCompName
$_t_town:=Vtown
$_t_County:=vCounty
$_t_Country:=vCountry
$_t_Status:=VStatus
$_t_Type_:=VType_
$_t_Source:=VSource
$_t_ContCode:=VContCode
$_t_Role:=Vrole
$_t_Omit:=Vomit
$_t_Charge:=VCharge
$_t_person:=Vperson
$_t_CalYr:=vCalYr
$_t_AccountName:=vAccName
$_t_accountCode:=vAccName
$_t_email:=vemail  // 01/09/03 pb
$_t_Analysis:=vAnalysis
$_t_Comments:=Vcomments
$_t_PostCode:=VPostCode
$_t_ProductCode:=vProdCode
$_t_Area:=Varea
$_t_Sales:=VSales
$_t_ContactTelephone:=vTele
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
If (SM_l_QueryMode=0)
	
	$_l_OK:=Cont_SelLP(CON_at_SearchTab)
Else 
	$_l_QueryMode:=SM_l_QueryMode
	//note that the arrays below are declared in the method Comp_SelP
	$_l_OK:=Cont_SelLP(CON_at_SearchTab; SM_l_QueryMode; Table:C252(->[CONTACTS:1]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
	SM_l_QueryMode:=$_l_QueryMode
End if 

SM_LoadSearchParameterNames(Table:C252(->[CONTACTS:1]); SM_l_QueryMode)
CON_at_SearchTab:=0
vCompCode:=$_t_CompanyCode
VTitle:=$_t_Title
VForeName:=$_t_ForeName
VSurname:=$_t_Surname
VJobtitle:=$_t_JobTitle
vStatus:=$_t_Status
Vtype:=$_t_Type
VType_:=$_t_Type_
VSource:=$_t_Source
ACC_d_EntryDateFrom:=$_d_EntryDateFrom
SRCH_d_EntryDateTo:=$_d_EntryDateTo
VsDateF:=$_d_sDateF
VsdateT:=$_d_SDateT
VCOmpName:=$_t_CompanyName
VTown:=$_t_town
VCounty:=$_t_County
Vcountry:=$_t_Country
Vstatus:=$_t_Status

Vsource:=$_t_Source
VContCode:=$_t_ContCode
Vrole:=$_t_Role
Vomit:=$_t_Omit
vCharge:=$_t_Charge
VPerson:=$_t_person
VCalYr:=$_t_CalYr
vAccName:=$_t_AccountName
Vaccount:=$_t_AccountCode
vemail:=$_t_email  // 01/09/03 pb
VAnalysis:=$_t_Analysis
VComments:=$_t_Comments
VPostCode:=$_t_PostCode
vProdCOde:=$_t_ProductCode
VArea:=$_t_Area
Vsales:=$_t_Sales
Vtele:=$_t_ContactTelephone
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
If ($_l_OK>0) & (Not:C34(rHold=1))
	ACCEPT:C269
	WS_bo_InsearchScreen:=False:C215
Else 
	
	
End if 
rHold:=0
CON_at_SearchTab:=0
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable55"; $_t_oldMethodName)
