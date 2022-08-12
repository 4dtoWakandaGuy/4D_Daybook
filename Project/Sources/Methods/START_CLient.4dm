//%attributes = {}
If (False:C215)
	//Project Method Name:      START_CLient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: START_CLient
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR RELATIONS)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	//ARRAY TEXT(<>SYS_at_ModifiedText;0)
	C_BOOLEAN:C305(<>MenuFront; <>MOD_bo_InitIM; <>SYS_bo_Active; <>SYS_bo_CurrentWindowModal; <>SYS_bo_PWActive; <>SYS_bo_QuitCalled; $_bo_OK; SD_bo_AgendaEnabled; vFromIn)
	C_LONGINT:C283(<>AutoProc; <>Bar; <>MenuProc; <>PER_l_CurrentUserWorkGroupIDs; <>SD3_l_DiaryVersion; <>SYS_l_WorkflowProcess; $_l_Application_type; $_l_DiaryProcess; $_l_Process; $_l_RunReminders; $_l_ShowNothing)
	C_LONGINT:C283($_l_ShowSchedule; $_l_ShowWorkflow; $_l_Sr_Reg_Result; DB_l_ButtonPrefsSet; DB_l_UserIdentWindow; SD2_l_DiaryStartups; STARTUP_PROC1; vAdd)
	C_TEXT:C284(<>LOGIN_s255_FirstModuleName; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_MachineName; $_t_oldMethodName; $_t_ProcessName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("START_CLIENT")
//TRACE
$_bo_OK:=START_RegisterPlugins
If ($_bo_OK)
	SR RELATIONS(0; 0)
End if 

$_l_Application_type:=Application type:C494
ARRAY TEXT:C222(<>SYS_at_ModifiedText; 0)  //bsw 19/07/03 if client-server environment gives error if not defined
ARRAY LONGINT:C221(<>SYS_al_ModifiedTable; 0)

If (<>SYS_bo_PWActive)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=Current user:C182)
	If (Records in selection:C76([PERSONNEL:11])=1)
		<>PER_t_CurrentUserName:=Current user:C182
		<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
		<>PER_l_CurrentUserWorkGroupIDs:=[PERSONNEL:11]UserGroupIDs:39
	Else 
		<>PER_t_CurrentUserName:=Current user:C182
		<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
		<>PER_l_CurrentUserWorkGroupIDs:=0
	End if 
End if 
SPLASH_UPDATE("Starting up ...")

DB_SetMenuBar(""; 86)

If (Application type:C494=4D Remote mode:K5:5)
	While (Test semaphore:C652("StartingServer"))
		DelayTicks(10)
	End while 
	UserDetailsBLOB
	CLEAR SEMAPHORE:C144("StartingServer")
End if 



If ((DB_GetModuleSettingByNUM(34))>0)  //Demo Version
	SPLASH_HIDE  //bsw 29/07/04
	Start_Dialog
	SPLASH_SHOW  //bsw 29/07/04
End if 


//`This is temporarily going in here till i do th elist manager changes
//``


//``


SPLASH_UPDATE("Loading Users ...")
If (DB_l_UserIdentWindow>0) & (Not:C34(<>SYS_bo_QuitCalled))
	
	While (Process state:C330(DB_l_UserIdentWindow)>=0)
		$_t_ProcessName:=Process_Name(DB_l_UserIdentWindow)
		
		If ($_t_ProcessName="User Ident")
			DelayTicks(10)
		Else 
			DB_l_UserIdentWindow:=0
		End if 
	End while 
End if 

While (Current user:C182="Defaultuser") & (Not:C34(<>SYS_bo_QuitCalled))
	DelayTicks(10)
End while 
START_LoginUser
Start_Event
DB_t_CallOnCloseorSave:=""
vType:=""
DB_l_ButtonPrefsSet:=0
vAdd:=0
vFromIn:=False:C215
vProc:=<>MenuProc
<>AutoProc:=0
//Db_t_MenuType:=
If (<>Bar=0)
	//ALERT("19x4")
	Module_First(1)
Else 
	//ALERT("19x5")
	Module_First
	
End if 

<>SYS_bo_Active:=True:C214  //Currently used by CB_Deact & Act + ScrnSav_Proc
<>MenuFront:=True:C214
<>SYS_bo_CurrentWindowModal:=False:C215
SPLASH_UPDATE("Calculating ListboxSettings ...")

LBi_Startup

SPLASH_UPDATE("Launching Palettes ...")
$_t_MachineName:=Current machine:C483
//Process_Manager launch was here
//$toolstate:=(<>PER_l_CurrentPersFunctions ?? 4)
//see copies of these Process-launching lines in IME Minimize and Maximize
//$prostate:=(<>PER_l_CurrentPersFunctions ?? 3)

//If ($prostate)
//<>ProcProc:=New process("Processes2";DB_ProcessMemoryinit(8);"$Processes")
//End if

$_l_Process:=New process:C317("Process_Manager"; DB_ProcessMemoryinit(8); "$Process_Manager")



SD_bo_AgendaEnabled:=SD_GetAgendaLicence
//ALERT("holding")
If (SD2_l_DiaryStartups>0)
	$_l_ShowWorkflow:=0
	$_l_ShowSchedule:=0
	$_l_RunReminders:=0
	$_l_ShowNothing:=0
	Case of 
		: (SD2_l_DiaryStartups=0)
			$_l_ShowNothing:=1
		: (SD2_l_DiaryStartups=1)
			$_l_ShowSchedule:=1  // Value 1
		: (SD2_l_DiaryStartups=2)
			$_l_ShowWorkflow:=1  //Value 2
		: (SD2_l_DiaryStartups=3)
			$_l_ShowWorkflow:=1
			$_l_ShowSchedule:=1
		: (SD2_l_DiaryStartups=4)  // reminders only=show nothing is set
			$_l_ShowWorkflow:=0  //
			$_l_ShowSchedule:=0
			$_l_RunReminders:=1  //Value 4
			$_l_ShowNothing:=1
		: (SD2_l_DiaryStartups=5)  //Schedule and reminders
			$_l_ShowWorkflow:=0  Value 1
			$_l_ShowSchedule:=1
			$_l_RunReminders:=1  //Value 4
		: (SD2_l_DiaryStartups=6)  //WorkFlow and reminders
			$_l_ShowWorkflow:=1
			$_l_ShowSchedule:=0  // Value 2
			$_l_RunReminders:=1  //Value 4
		: (SD2_l_DiaryStartups=7)  //WorkFlow  Schedule and reminders
			$_l_ShowWorkflow:=1  //Value 1
			$_l_ShowSchedule:=1  //Value 2
			$_l_RunReminders:=1  //Value 4
	End case 
	If ($_l_RunReminders=1)
	End if 
	If ($_l_ShowSchedule=1)
		//ZDiary_Mod
	End if 
	If ($_l_ShowWorkflow=1)
		
		If (False:C215)  //TILL THE MENUS DONE
			<>SYS_l_WorkflowProcess:=ZProc_withReply("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
		End if 
		
	End if 
	
	
End if 

If (False:C215)
	If (((DB_t_CurrentFormUsage="1") | (DB_t_CurrentFormUsage="2")) & ((DB_GetModuleSettingByNUM(2))>1))
		Case of 
			: (<>SD3_l_DiaryVersion=0)
				If (DB_t_CurrentFormUsage="1")
					ZDiary_DiaryT1
				Else 
					ZDiary_DiaryT
				End if 
			Else 
				//new style diary
				ZDiary_Mod
				
		End case 
		
	End if 
Else 
	//ALERT("START-before process")
	
	
	$_l_DiaryProcess:=New process:C317("Start_Diary"; DB_ProcessMemoryinit(5); "Starting_Diary"; DB_t_CurrentFormUsage)
End if 
DB_t_CurrentFormUsage:=""
If (User in group:C338(Current user:C182; "ADMINISTRATOR"))
	
	Licence_CheckIfEmailed  // 27/03/03 pb
End if 
If (False:C215)  //THis method was to eliminate crashing due to invalid font-seems not to be needed
	DB_CheckUserFonts
End if 

//Rollo 10/9/2004 - move some of these inits out of this IF if you want to use the modules
//independently of the web servin

//TRACE

If ((DB_GetModuleSettingByNUM(43))>1) & (<>MOD_bo_InitIM)  // if access to Internet Module and set to init on startup
	$_l_Process:=New process:C317("IME_Startup"; DB_ProcessMemoryinit(5); "Start Internet manager"; *)
End if 
//```

//Credit Card Prefs(even if not licenced)
ERR_MethodTrackerReturn("START_CLient"; $_t_oldMethodName)
