//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Quit 2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_LoqateAddressing)
	C_LONGINT:C283(<>AutoProc; <>IACTIVPROC; <>IACTIVSAVE; <>Mod_l_MenuBarPaletteProcess; <>ProcessSeen; <>ProcProc; <>SCPT_l_PlayerActive; <>ScrnSavMin; <>SD3_l_DiaryMessageProcess; $_l_Process; QA_l_Search)
	C_TEXT:C284(<>Splash_t_SplashProgressMessage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Quit 2")

FLUSH CACHE:C297
If (<>SCPT_l_PlayerActive#0)
	$_l_Process:=<>SCPT_l_PlayerActive
	<>SCPT_l_PlayerActive:=0
	RESUME PROCESS:C320($_l_Process)
End if 
If (<>SD3_l_DiaryMessageProcess#0)
	$_l_Process:=<>SD3_l_DiaryMessageProcess
	<>SD3_l_DiaryMessageProcess:=0
	RESUME PROCESS:C320($_l_Process)
End if 
If (<>ProcessSeen#0)
	$_l_Process:=<>ProcessSeen
	<>ProcessSeen:=0
	RESUME PROCESS:C320($_l_Process)
End if 
If (<>ProcProc#0)
	$_l_Process:=<>ProcProc
	<>ProcProc:=0
	POST OUTSIDE CALL:C329($_l_Process)
End if 
If (<>Mod_l_MenuBarPaletteProcess#0)
	$_l_Process:=<>Mod_l_MenuBarPaletteProcess
	<>Mod_l_MenuBarPaletteProcess:=0
	POST OUTSIDE CALL:C329($_l_Process)
End if 
//If (◊ButtProcV#0)
// $_l_Process:=◊ButtProcV
// ◊ButtProcV:=0
// CALL PROCESS($_l_Process)
//End if
If (<>ScrnSavMin>0)
	<>ScrnSavMin:=0
	$_l_Process:=Process_No("$ScreenSaver")
	If ($_l_Process>0)
		RESUME PROCESS:C320($_l_Process)
	End if 
End if 
$_l_Process:=Process_No("$_l_Progress")
If ($_l_Process>0)
	<>Splash_t_SplashProgressMessage:="10: Quitting ..."
	RESUME PROCESS:C320($_l_Process)
End if 
<>AutoProc:=999999999  //Quits the Process_Manager
If ((DB_GetModuleSettingByNUM(34))>0)
	DB_t_CurrentFormUsage:="Quit"
	Start_Dialog
End if 
If ((DB_GetModuleSettingByNUM(32))>1)
	Tel_Quit
End if 
If (<>SYS_bo_LoqateAddressing) & (Is Windows:C1573)
	
	QA_l_Search:=0
	PLUGCALL_QuickAddress("Init"; QA_l_Search)
End if 
If (<>iActivSave>0)
	<>iActivSave:=3
	RESUME PROCESS:C320(<>iActivProc)
	DelayTicks(20)
End if 
If (<>iActivProc>0)
	$_l_Process:=<>iActivProc
	<>iActivProc:=0
	RESUME PROCESS:C320($_l_Process)
End if 
QUIT 4D:C291
ERR_MethodTrackerReturn("Quit 2"; $_t_oldMethodName)