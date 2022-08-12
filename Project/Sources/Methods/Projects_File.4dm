//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_File
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vA)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_File")

FORM SET INPUT:C55([PROJECTS:89]; "Projects_In")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Projects_In"
FORM SET OUTPUT:C54([PROJECTS:89]; "Projects_Out")
WIN_t_CurrentOutputform:="Projects_Out"
vA:=1
$0:=True:C214
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([PROJECTS:89])
	READ WRITE:C146([JOBS:26])
	READ WRITE:C146([JOB PERSONNEL:48])
	READ WRITE:C146([JOB_STAGES:47])
	READ WRITE:C146([ORDER_ITEMS:25])
End if 
If (MOD_l_CurrentModuleAccess<2)
	$0:=False:C215
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[PROJECTS:89]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Projects_SVCF"
	StatsView_ArFiS("Projects/89/Projects_Sel/Jobs/26/Jobs_Sel/")
	StatsView_ArF1S("3.2/4.1.2,5/7.65/9.90.4,2/")
End if 
ERR_MethodTrackerReturn("Projects_File"; $_t_oldMethodName)