If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; <>SaturdayoN; <>SundayoN)
	C_DATE:C307(SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283(<>FloatingCalender; $_l_Difference; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; CAL_l_CallBackEventNo; SD_l_RECNEEDSSAVING)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable13"; Form event code:C388)
//◊SuperDiary
SD_l_RecNeedssaving:=1
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 
//CW_SetDate (◊DIARY_viewDate)
//CW_OpenCalDialog
<>SaturdayoN:=SD_bo_SaturdayWork
<>SundayoN:=SD_bo_SundayWork

If (<>FloatingCalender=0)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_Difference:=232-$_l_WindowLeft
	If (($_l_WindowRight+$_l_Difference)>Screen width:C187)
		$_l_WindowRight:=Screen width:C187
	Else 
		$_l_WindowRight:=$_l_WindowRight+$_l_Difference
	End if 
	<>FloatingCalender:=New process:C317("GEN_CalInProcess"; 32000; "Floating Calender"; Current process:C322; SD_D_CurrentViewDate; "SD_D_CurrentViewDate"; "SD3_l_DiaryActionNum"; 10)
Else 
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	If ($_l_WindowLeft<232)
		$_l_Difference:=232-$_l_WindowLeft
		If (($_l_WindowRight+$_l_Difference)>Screen width:C187)
			$_l_WindowRight:=Screen width:C187
		Else 
			$_l_WindowRight:=$_l_WindowRight+$_l_Difference
		End if 
		
		SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	End if 
	CAL_l_CallBackEventNo:=10
	SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_l_CallBackProcess; Current process:C322)
	SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_D_CurrentViewDate; SD_D_CurrentViewDate)
	SET PROCESS VARIABLE:C370(<>FloatingCalender; Cal_t_VariableName; "SD_D_CurrentViewDate")
	SET PROCESS VARIABLE:C370(<>FloatingCalender; Cal_t_VariableName2; "SD3_l_DiaryActionNum")
	SET PROCESS VARIABLE:C370(<>FloatingCalender; CAL_l_CallBackEventNo; CAL_l_CallBackEventNo)
	POST OUTSIDE CALL:C329(<>FloatingCalender)
	SHOW PROCESS:C325(<>FloatingCalender)
	BRING TO FRONT:C326(<>FloatingCalender)
	<>FloatingCALDisplayed:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Variable13"; $_t_oldMethodName)
