//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 12:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vCalls; vD; vProcaMod)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls File")

FORM SET INPUT:C55([SERVICE_CALLS:20]; "Calls_In13")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Calls_In13"
FORM SET OUTPUT:C54([SERVICE_CALLS:20]; "Calls Out")
WIN_t_CurrentOutputform:="Calls Out"
vCalls:=1
vProcaMod:=Module_ServiceCentre


$0:=True:C214
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(vProcaMod))

If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Service Control Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT NG JUne 2004 removed
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([SERVICE_CALLS:20])
		READ WRITE:C146([ORDER_ITEMS:25])
	End if 
End if 
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[SERVICE_CALLS:20]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Calls_SVCF"
	StatsView_ArFiS("Service Calls/20/Calls_Sel/Diary/12/Diary_Sel/")
	StatsView_ArF1S("1.2/2.1.2,5/8/9/10/11.11/13.11/14.22/16.23/")
End if 
ERR_MethodTrackerReturn("Calls File"; $_t_oldMethodName)