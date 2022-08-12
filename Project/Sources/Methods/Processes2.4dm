//%attributes = {}
If (False:C215)
	//Project Method Name:      Processes2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_ProcessVisible; PM_Min)
	C_LONGINT:C283(<>MenuProc; <>ProcProc; $_l_ButtonsProcessNumber; $_l_CurrentWinRefOLD; $_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(<>_l_ProcPaletteWinSizeState)
	C_TEXT:C284($_t_MachineName; $_t_oldMethodName; $_t_ProcessName; $_t_VolumesMenuLabel; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Processes2")
//Processes2
$_t_VolumesMenuLabel:=Get localized string:C991("Menu_Volumes")
While (Test semaphore:C652("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
	DelayTicks
End while 
TRACE:C157
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Not:C34(VER_4DServer))
	
	
	<>_l_ProcPaletteWinSizeState:=0
	DB_t_CurrentFormUsage:=""
	OK:=1
	If (False:C215)
		If (<>menuProc>0)
			DB_MenuAction($_t_VolumesMenuLabel; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; <>menuProc; False:C215)
		End if 
		$_t_MachineName:=Current machine:C483
		$_t_ProcessName:="Modules_Palette"+$_t_MachineName  //see ZMenuModBar
		If (Process_No($_t_ProcessName)>0)
			DB_MenuAction($_t_VolumesMenuLabel; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; Process_No($_t_ProcessName); False:C215)
		End if 
		$_t_MachineName:=Current machine:C483
		$_l_ButtonsProcessNumber:=Process_No("Buttons_"+$_t_MachineName)
		If ($_l_ButtonsProcessNumber>0)
			DB_MenuAction($_t_VolumesMenuLabel; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; $_l_ButtonsProcessNumber; False:C215)
		End if 
	Else 
		If (<>menuProc>0)
			DB_MenuAction($_t_VolumesMenuLabel; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; <>menuProc; False:C215)
		End if 
	End if 
	While (OK=1) & (Not:C34(<>SYS_bo_QuitCalled) & (<>ProcProc>0))
		If (<>_l_ProcPaletteWinSizeState=0)  //®˙_l_ProcPaletteWinSizeState=0 is minimized
			
			//Rollo 25/11/2004 - was Screen width-32
			
			If (Is macOS:C1572)
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-31; 0; Screen width:C187-5; 0; -Palette window:K34:3; " "; "PM_Close")  //1988
			Else 
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-51; 0; Screen width:C187-25; 0; -Palette window:K34:3; " "; "PM_Close")  //1988
			End if 
			PM_Min:=True:C214
			DIALOG:C40([COMPANIES:2]; "dProcesses2")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			OK:=1
			
		Else   //ÄÄ  `®˙_l_ProcPaletteWinSizeState=1 is expanded
			
			//ÄÄ  `Rollo 25/11/2004 - was Screen width-122
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-120; 0; Screen width:C187-1; 0; -1984; "Windows"; "PM_Close")  //®˙WindowTop+32
			PM_Min:=False:C215
			DIALOG:C40([COMPANIES:2]; "dProcesses2")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			OK:=1
			
		End if 
	End while 
	
	PROCESS PROPERTIES:C336(Frontmost process:C327; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
	
	If ($_l_ProcessOrigin>0)
		DB_MenuAction($_t_VolumesMenuLabel; Get localized string:C991("MenuItem_WindowsPalette"); 4; ""; <>menuProc; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Processes2"; $_t_oldMethodName)