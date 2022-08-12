//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vJ)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers File")

FORM SET INPUT:C55([JOB PERSONNEL:48]; "JobPers In13")  //NG April 2004 removed reference to ◊screen)
WIN_t_CurrentInputForm:="JobPers In13"
FORM SET OUTPUT:C54([JOB PERSONNEL:48]; "JobPers Out")
WIN_t_CurrentOutputform:="JobPers Out"
vJ:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
If (MOD_l_CurrentModuleAccess<2)
	vJ:=0
	OK:=0
	$0:=False:C215
	Gen_Alert("You do not have access to Job Personnel")
Else 
	$0:=True:C214
	
End if 

If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([JOB PERSONNEL:48])
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[JOB PERSONNEL:48]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Job Personnel/48/JobPers_Sel/")
	StatsView_ArF1S("1.26/2.45/3.11/")
End if 
ERR_MethodTrackerReturn("JobPers File"; $_t_oldMethodName)