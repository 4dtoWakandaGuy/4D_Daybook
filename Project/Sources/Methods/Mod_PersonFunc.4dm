//%attributes = {}
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentNoButtGrey; <>PER_bo_CurrentNoButtHIDE; $_bo_ScreenSaverstate; $_bo_Toolstate; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>BUTTPROC; <>procProc; <>ScrnSavMin; $_bo_Tipstate; $_l_BarProcess; $_l_Status; $_l_TipState; $_l_WindowReferenceRow; bd20; DB_l_ButtonClickedFunction; SD3_l_CalendarStartDayNumber)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_MachineName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mod_PersonFunc")
//Ask_PersonFunctions

If (SD3_l_CalendarStartDayNumber=0) & (False:C215)
	bd20:=5
Else 
	READ WRITE:C146([PERSONNEL:11])
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	
	Open_Any_Window(258; 416)
	DIALOG:C40([PERSONNEL:11]; "dAsk_Function")
	
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	WS_KeepFocus
	
End if 

If ([PERSONNEL:11]Functionality:33=0)
	[PERSONNEL:11]Functionality:33:=[PERSONNEL:11]Functionality:33 ?? 5
End if 

DB_SaveRecord(->[PERSONNEL:11])
AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
//<>PER_l_CurrentPersFunctions:=[PERSONNEL]Functionality// april22
$_bo_Toolstate:=([PERSONNEL:11]Functionality:33 ?? 2)
$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
If ($_bo_Toolstate)
	
	If ($_l_BarProcess>0)
		$_l_Status:=Process state:C330($_l_BarProcess)
		If ($_l_Status=6)
			SHOW PROCESS:C325($_l_BarProcess)
			
		End if 
	Else 
		ZMenu_ModBar2
	End if 
Else 
	If ($_l_BarProcess>0)
		HIDE PROCESS:C324($_l_BarProcess)
	End if 
	
End if 
$_bo_Toolstate:=([PERSONNEL:11]Functionality:33 ?? 4)
If (False:C215)
	If ($_bo_Toolstate)
		If (False:C215)
			If (<>ButtProc=0)  //might have been launched by Startup_Page2
				DB_l_ButtonClickedFunction:=0
				$_t_MachineName:=Current machine:C483
				
				<>ButtProc:=New process:C317("Input_ButtonsWin"; DB_ProcessMemoryinit(8); "Buttons_"+$_t_MachineName; *)  //see In_ButtProc
			Else 
				//TRACE
				SHOW PROCESS:C325(<>ButtProc)
			End if 
		End if 
	Else 
		If (<>ButtProc>0)
			HIDE PROCESS:C324(<>ButtProc)
		End if 
	End if 
End if 

$_l_TipState:=Num:C11([PERSONNEL:11]Functionality:33 ?? 7)
//‘11999;31‘($_bo_Tipstate)
$_bo_ScreenSaverstate:=([PERSONNEL:11]Functionality:33 ?? 6)
//canturn it on
//cant turn it off
If (Not:C34($_bo_ScreenSaverstate))
	<>ScrnSavMin:=99999
	//that will stop it coming on!
End if 
//the others options are read dynamically anyway
<>PER_bo_CurrentNoButtGrey:=Not:C34(([PERSONNEL:11]Functionality:33 ?? 5))
<>PER_bo_CurrentNoButtHIDE:=Not:C34(([PERSONNEL:11]Functionality:33 ?? 8))
<>PER_bo_CurrentNoButtHIDE:=True:C214
READ ONLY:C145([PERSONNEL:11])
UNLOAD RECORD:C212([PERSONNEL:11])
LOAD RECORD:C52([PERSONNEL:11])
ERR_MethodTrackerReturn("Mod_PersonFunc"; $_t_oldMethodName)
