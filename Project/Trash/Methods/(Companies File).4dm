//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	C_BOOLEAN:C305(<>SearchNewStyle; <>SYS_bo_StatsView; $0; COM_bo_TypesInited)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vC; WIN_CURRENTMENU)
	C_TEXT:C284($_t_oldMethodName; CUR_COMPANYTYPES; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies File")

Companies_FileI
If (<>SearchNewStyle)
	FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Out")
	WIN_t_CurrentOutputform:="Companies_Out"
Else 
	FORM SET OUTPUT:C54([COMPANIES:2]; "Companies Out")
	WIN_t_CurrentOutputform:="Companies Out"
End if 
WIN_t_CurrentOutputform:="Companies Out"
WIN_CURRENTMENU:=98
vC:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([COMPANIES:2])
	READ WRITE:C146([COMPANIES_RECORD_ANALYSIS:146])
	READ WRITE:C146([CONTACTS:1])
	READ WRITE:C146([CONTACTS_COMPANIES:145])
	READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
	READ WRITE:C146([INFORMATION:55])
End if 
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	$0:=False:C215
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Companies_SV
End if 

//Rollo 8/7/2004 - introduced the word individuals
If (Not:C34(COM_bo_TypesInited))
	ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
	COM_at_CompanyTypes{1}:="Show Companies only"
	COM_at_CompanyTypes{2}:="Show Private Individuals only"
	COM_at_CompanyTypes{3}:="-"
	COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
	COM_at_CompanyTypes:=4
	CUR_CompanyTypes:="Companies and Private Individuals"
	COM_bo_TypesInited:=True:C214
End if 
ERR_MethodTrackerReturn("Companies File"; $_t_oldMethodName)