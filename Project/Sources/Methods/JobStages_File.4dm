//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_File
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
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vJ)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_File")

FORM SET INPUT:C55([JOB_STAGES:47]; "JobStage_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="JobStage_in"
FORM SET OUTPUT:C54([JOB_STAGES:47]; "JobStages_Out")
vJ:=1
WIN_t_CurrentOutputform:="JobStages_Out"

MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
If (MOD_l_CurrentModuleAccess>=2)
	$0:=True:C214  // added NG June 2004
Else 
	Gen_Alert("You do not have access to the Job Stages")
	$0:=False:C215
	vJ:=0
	OK:=0
End if 

ARRAY POINTER:C280(JST_aptr_LBSettings; 0)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([JOB_STAGES:47])
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[JOB_STAGES:47]
	SYS_bo_StatsView:=True:C214
	vSVCF:="JobStages_SVCF"
	StatsView_ArFiS("Job Stages/47/JobStages_Sel/Job Personnel/48/JobPers/"+"Cost Items/25/OrderI_Sel/")
	StatsView_ArF1S("1.26/2.45/")
End if 
ERR_MethodTrackerReturn("JobStages_File"; $_t_oldMethodName)