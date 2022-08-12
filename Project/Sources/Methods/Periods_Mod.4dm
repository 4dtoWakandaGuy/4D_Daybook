//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_StartProcess; $1)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_FormDefaultHeight; $_l_FormDefaultWidth; ACC_l_PerReadWrite; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Periods_Mod")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 




$_bo_StartProcess:=True:C214
If (Count parameters:C259>=1)
	$_bo_StartProcess:=$1
End if 
If ($_bo_StartProcess)
	Start_Process
End if 
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
If (((DB_GetModuleSettingByNUM(1))=5) & (MOD_l_CurrentModuleAccess<2))
	
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
Else 
	ACC_l_PerReadWrite:=0
	If (MOD_l_CurrentModuleAccess#3)
		ACC_l_PerReadWrite:=1
	End if 
	
	FORM GET PROPERTIES:C674([USER:15]; "ACC_PeriodControl"; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
	WIN_t_CurrentOutputform:="ACC_PeriodControl"
	WIN_t_CurrentInputForm:="ACC_PeriodControl"
	Open_Pro_Window("Years & Accounting Periods"; 0; 1; ->[USER:15]; "ACC_PeriodControl"; "ACC_ClosePeriods")
	
	//StartTransaction
	DIALOG:C40([USER:15]; "ACC_PeriodControl")
End if 
Close_ProWin
If ($_bo_StartProcess)
	Process_End
End if 
ERR_MethodTrackerReturn("Periods_Mod"; $_t_oldMethodName)
