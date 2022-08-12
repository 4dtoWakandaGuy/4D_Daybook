If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_View.oDiaryDateFromCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; <>SaturdayoN; <>SundayoN)
	C_DATE:C307(SD_D_Date)
	C_LONGINT:C283(<>FloatingCalender; $_l_CalendarProcess; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; CAL_l_CallBackEventNo)
	C_POINTER:C301(SD_ptr_Date1)
	C_TEXT:C284($_t_oldMethodName; SD_t_DiaryDefaultUser)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oDiaryDateFromCalendar"; Form event code:C388)
//◊SuperDiary


If (Not:C34(Is nil pointer:C315(SD_ptr_Date1)))
	
	<>SaturdayoN:=SD_bo_SaturdayWork
	<>SundayoN:=SD_bo_SundayWork
	SD_D_Date:=SD_ptr_Date1->
	//GEN_CalInProcess (0;SD_D_Date;"SD_D_Date")
	If (<>FloatingCalender=0)
		<>FloatingCalender:=New process:C317("GEN_CalInProcess"; DB_ProcessMemoryinit(1); "Floating Calender"; Current process:C322; SD_D_Date; "SD_D_Date"; "SD3_l_DiaryActionNum"; 11)
	Else 
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_WindowLeft<232)
			SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		End if 
		CAL_l_CallBackEventNo:=11
		SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_l_CallBackProcess; Current process:C322)
		SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_D_CurrentViewDate; SD_D_Date)
		SET PROCESS VARIABLE:C370(<>FloatingCalender; Cal_t_VariableName; "SD_D_Date")
		SET PROCESS VARIABLE:C370(<>FloatingCalender; Cal_t_VariableName2; "SD3_l_DiaryActionNum")
		SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_l_CallBackEventNo; CAL_l_CallBackEventNo)
		POST OUTSIDE CALL:C329(<>FloatingCalender)
		SHOW PROCESS:C325(<>FloatingCalender)
		BRING TO FRONT:C326(<>FloatingCalender)
		<>FloatingCALDisplayed:=True:C214
	End if 
	
	If (SD_D_Date#SD_ptr_Date1->)
		SD_ptr_Date1->:=SD_D_Date
		Diary_InD
	End if 
	
	If (False:C215)
		$_l_CalendarProcess:=Process number:C372("Calendar")
		If ($_l_CalendarProcess=0)
			ZProc("SD_Diary_CalM"; DB_ProcessMemoryinit(4); "Calendar"; String:C10([DIARY:12]Date_Do_From:4); SD_t_DiaryDefaultUser; "6")
			
		Else 
			SHOW PROCESS:C325($_l_CalendarProcess)
			BRING TO FRONT:C326($_l_CalendarProcess)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oDiaryDateFromCalendar"; $_t_oldMethodName)
