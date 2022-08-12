//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Qualities File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2010 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vA)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities File")
//DEFAULT TABLE([INFORMATION])
FORM SET INPUT:C55([INFORMATION:55]; "Qualities in13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Qualities in13"
FORM SET OUTPUT:C54([INFORMATION:55]; "Qualities Out")
WIN_t_CurrentOutputform:="Qualities Out"
vA:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
$0:=True:C214
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([INFORMATION:55])
End if 
If (MOD_l_CurrentModuleAccess<2)
	$0:=False:C215
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[INFORMATION:55]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Qualities/55/Qualities_Sel/")
	StatsView_ArF1S("1.1.2,5/2/4/5/6/7.2/")
End if 
ERR_MethodTrackerReturn("Qualities File"; $_t_oldMethodName)
