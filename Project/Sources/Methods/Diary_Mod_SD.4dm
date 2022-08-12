//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Mod_SD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/03/2010 08:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $_bo_OpenNewSchedule)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_WIndowID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_WIndowTitle; $1; SD_t_DiaryDefaultUser)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Mod_SD")
//Diary_Mod_NEW: SuperDiary_In

//$1:=0
//ALL RECORDS([PERSONNEL])`10/07/02 pb
If (Count parameters:C259>=1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	SD_t_DiaryDefaultUser:=$1
Else 
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	SD_t_DiaryDefaultUser:=<>PER_t_CurrentUserInitials
End if 

$_t_WIndowTitle:="Diary: "+[PERSONNEL:11]Name:2
Start_Process
$_bo_OK:=Execute_File("Diary_File")
If ($_bo_OK)  //NG JUne 2004 modified
	$_bo_OpenNewSchedule:=True:C214
	If (Not:C34(Is compiled mode:C492))
		//Gen_Confirm ("Open TestSched";"Yes";"No")
		
		If (OK=1)
			//$_bo_OpenNewSchedule:=True
		End if 
	End if 
	
	//SD_bo_AgendaEnabled:=SD_GetAgendaLicence
	FORM SET INPUT:C55([USER:15]; "SD2_ScheduleWindow")
	//If (SD_bo_AgendaEnabled)
	//If (Not(Compiled application)) & (True)  ` For testing
	//If ($_bo_OpenNewSchedule)
	//INPUT FORM([USER];"SD2_ScheduleWindow")
	//Else
	FORM SET INPUT:C55([PERSONNEL:11]; "Diary_ViewAG")
	//End if
	//Else
	//INPUT FORM([PERSONNEL];"Diary_View")
	//End if
	
	//Else
	//INPUT FORM([PERSONNEL];"Diary_View")
	//End if
	
	//Open_Pro_Window ("Diary VIew";5;1;->[PERSONNEL];"Diary_View")
	
	
	$_l_WIndowID:=Open window:C153(31; 76; 40; 90; 8; $_t_WIndowTitle; "SD_CLOSE")
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WIndowID
	PROC_SetProcess(Current process:C322; $_l_WIndowID)
	If ($_bo_OpenNewSchedule)
		ADD RECORD:C56([USER:15]; *)
	Else 
		//ADD RECORD([PERSONNEL];*)
	End if 
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
Process_End  //NG added Jun 2004
ERR_MethodTrackerReturn("Diary_Mod_SD"; $_t_oldMethodName)