If (False:C215)
	//object Method Name: Object Name:      [DIARY].Diary_InNEW.oDiaryDateCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; <>SaturdayoN; <>SundayoN)
	C_DATE:C307(SD_D_Date)
	C_LONGINT:C283(<>FloatingCalender; $_l_CalanderProcess; $_l_DetailsBottom; $_l_DetailsLeft; $_l_DetailsRight; $_l_DetailsTop; $_l_Margin; $_l_ObJWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; CAL_l_CallBackEventNo)
	C_POINTER:C301(SD_ptr_Date2)
	C_TEXT:C284($_t_oldMethodName; SD_t_DiaryDefaultUser)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDiaryDateCalendar"; Form event code:C388)
//◊SuperDiary

If (Not:C34(Is nil pointer:C315(SD_ptr_Date2)))
	
	<>SaturdayoN:=SD_bo_SaturdayWork
	<>SundayoN:=SD_bo_SundayWork
	If (True:C214)
		SD_D_Date:=SD_ptr_Date2->
		//GEN_CalInProcess (0;SD_D_Date;"SD_D_Date")
		If (<>FloatingCalender=0)
			
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_WindowLeft<232)
				SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			End if 
			<>FloatingCalender:=New process:C317("GEN_CalInProcess"; DB_ProcessMemoryinit(1); "Floating Calender"; Current process:C322; SD_D_Date; "SD_D_Date"; "SD3_l_DiaryActionNum"; 12)
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_WindowLeft<232)
				
				OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_DetailsLeft; $_l_DetailsTop; $_l_DetailsRight; $_l_DetailsBottom)
				$_l_Margin:=$_l_WindowRight-$_l_DetailsRight
				$_l_ObJWidth:=$_l_DetailsRight-$_l_DetailsLeft
				SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT MOVE:C664([DIARY:12]Action_Details:10; $_l_DetailsLeft; $_l_DetailsTop; ($_l_WindowRight-232)-20; $_l_DetailsBottom; *)
				OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_DetailsLeft; $_l_DetailsTop; $_l_DetailsRight; $_l_DetailsBottom)
				OBJECT MOVE:C664([DIARY:12]Result_Description:12; $_l_DetailsLeft; $_l_DetailsTop; ($_l_WindowRight-232)-20; $_l_DetailsBottom; *)
			End if 
			CAL_l_CallBackEventNo:=12
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
		
		If (SD_D_Date#SD_ptr_Date2->)
			SD_ptr_Date2->:=SD_D_Date
			Diary_InD
		End if 
	Else 
		
		$_l_CalanderProcess:=Process number:C372("Calendar")
		If ($_l_CalanderProcess=0)
			ZProc("SD_Diary_CalM"; DB_ProcessMemoryinit(4); "Calendar"; String:C10([DIARY:12]Date_Do_From:4); SD_t_DiaryDefaultUser; "7")
			
		Else 
			SHOW PROCESS:C325($_l_CalanderProcess)
			BRING TO FRONT:C326($_l_CalanderProcess)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDiaryDateCalendar"; $_t_oldMethodName)
