//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vAB; vJ; vProcaMod; vST)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_File")

Jobs_FileI
FORM SET OUTPUT:C54([JOBS:26]; "Jobs_Out")
WIN_t_CurrentOutputform:="Jobs_Out"
vJ:=1
vAB:=0  //Used to store the current Component display level
vST:=0  //Used to count the number of levels in the OrderI_LevelCr proc
vProcaMod:=Module_JobCosting

$0:=True:C214
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
If (MOD_l_CurrentModuleAccess#3)
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
	vFilePtr:=->[JOBS:26]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Jobs_SVCF"
	StatsView_ArFiS("Jobs/26/Jobs_Sel/Job Stages/47/JobStages_Sel/Job Personnel/48/JobPers_Sel/"+"Cost Items/25/OrderI_Sel/")
	StatsView_ArF1S("3.2/4.1.2,5/9.90.4,2/18.45/19.11/21.65/24.36/25.71/26.76/27.89/")
End if 
ERR_MethodTrackerReturn("Jobs_File"; $_t_oldMethodName)