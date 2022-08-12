//%attributes = {}
If (False:C215)
	//Project Method Name:      zDiary_InCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2010 14:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DiaryType; SD2_l_ProcessReady)
	C_TEXT:C284($_t_InputForm; $_t_oldMethodName; $_t_ProcessParameter)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("zDiary_InCalendar")
If (False:C215)
	SD2_l_ProcessReady:=0
	$_l_DiaryType:=8
	$_t_ProcessParameter:="Schedule"
	$_t_InputForm:=""
	SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Calendar"; Current process:C322; $_l_DiaryType; $_t_ProcessParameter)
Else 
	ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary")
End if 
ERR_MethodTrackerReturn("zDiary_InCalendar"; $_t_oldMethodName)