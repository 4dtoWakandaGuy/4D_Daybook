//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_HL_DisplayDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ScheduleBuilt; 0)
	//ARRAY BOOLEAN(SD_abo_DoneStatus;0)
	ARRAY DATE:C224($_ad_DateStampValues; 0)
	ARRAY DATE:C224($_ad_DateStampValues2; 0)
	ARRAY DATE:C224($_ad_DayStringDates; 0)
	//ARRAY DATE(SD_ad_DateStampValues;0)
	//ARRAY DATE(SD_ad_DateStampValues2;0)
	//ARRAY DATE(SD_ad_SortDate;0)
	//ARRAY DATE(SD_ad_TaskDate;0)
	ARRAY LONGINT:C221($_al_AppointmentRecordIDs; 0)
	ARRAY LONGINT:C221($_al_KeepAppointments; 0)
	//ARRAY LONGINT(SD_al_AgendaNumbers;0)
	//ARRAY LONGINT(SD_al_DateStamp;0)
	//ARRAY LONGINT(SD_al_EventRecordIDs;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY LONGINT(SD_al_Time;0)
	//ARRAY LONGINT(SD_al_Time2;0)
	//ARRAY LONGINT(SD_al_ToDoRecordIDs;0)
	ARRAY TEXT:C222($_at_DayStrings; 0)
	ARRAY TEXT:C222($_at_StartDays; 0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_AppointmentSort;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_EventSort;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ItemCodeValues;0)
	//ARRAY TEXT(SD_at_ItemPerson;0)
	//ARRAY TEXT(SD_at_Query;0)
	//ARRAY TEXT(SD_at_TaskActionCode;0)
	//ARRAY TEXT(SD_at_TaskCoCode;0)
	//ARRAY TEXT(SD_at_TaskCode;0)
	//ARRAY TEXT(SD_at_TaskCompanyData;0)
	//ARRAY TEXT(SD_at_TaskData;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	//ARRAY TEXT(SD_at_ToDoList2;0)
	//ARRAY TEXT(SD_at_ToDoSort;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_Daybuilt; $_bo_Insert; $_bo_ListBuilt; $_bo_ShowSchedule; SD_bo_AgendaEnabled; SD_bo_AgendaQueryDone; SD_bo_AgendaSetup; SD_bo_InAgendaHandler; SD_bo_NoAgendaEvent; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_DATE:C307($_d_DateVar; $_d_StartDate; $1; $2; SD_D_CurrentviewDate; SD_D_DateStampValue; SD_d_EndDate; SD_d_GetDate; SD_d_MonthBeginDate; SD_d_MonthEndDate; SD_d_StartDate)
	C_DATE:C307(SD_d_TestDate; vDateGet2; vDateGetTest; WS_d_DiaryDate1; WS_d_DiaryDate2; WS_d_DiaryDate3; WS_d_DiaryDate4; WS_d_DiaryDate5; WS_d_DiaryDate6; WS_d_DiaryDate7)
	C_LONGINT:C283($_l_AgendaArea; $_l_AppointmentElement; $_l_BlueAccent; $_l_BlueFill; $_l_CurrentElement; $_l_DateElemement; $_l_DateReferenceID; $_l_DateStamp; $_l_DateStampElement; $_l_DateStringElement; $_l_DayNumber)
	C_LONGINT:C283($_l_EventElement; $_l_GreenAccent; $_l_GreenFill; $_l_Hour; $_l_Hour1; $_l_Index; $_l_Index2; $_l_ItemReference; $_l_ItemsIndex; $_l_LastTimeNumber; $_l_ListCount)
	C_LONGINT:C283($_l_MonthTimeCount; $_l_MonthTimeItems; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_QueryElement; $_l_RedAccent; $_l_RedFill; $_l_Section)
	C_LONGINT:C283($_l_Section2Count; $_l_SizeofArray; $_l_StartDateElement; $_l_TabNumber; $_l_TimeEnd; $_l_TimeReference; $_l_TimeSlots; $_l_TimeSpace; $_l_TimeSpaceperHour; $_l_ToDoElement; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WorkTimeEnd; $SD_l_AGendaView; AG_l_AccentColor_blue; AG_l_AccentColor_Green; AG_l_AccentColor_Red; AG_l_FillColor_Blue; AG_l_FillColor_Green)
	C_LONGINT:C283(AG_l_FillColor_Red; CB_l_ScheduleFullPage; SD_l_AGENDA; SD_l_AGENDA2; SD_l_AgendaEndTime; SD_l_AgendaStartTime; SD_l_AGendaTable; SD_l_AppointmentsortDirection; SD_l_AppointmentSortOrder; SD_l_ChangeSortEvent; SD_l_CurrentMonth)
	C_LONGINT:C283(SD_l_DataWidth; SD_l_DayTaskItems; SD_l_DIaryPage; SD_l_DiaryView1; SD_l_DiaryView2; SD_l_DiaryView3; SD_l_DiaryView4; SD_l_DiaryVIewType; SD_l_endSlider; SD_l_EventSortDirection; SD_l_EventSortOrder)
	C_LONGINT:C283(SD_l_FirstRun; SD_l_HLDays2; SD_l_HLDays3; SD_l_HLDayTime; SD_l_HLDayToDoItems; SD_l_HLMonthRefNUM; SD_l_IncAppointmentCo; SD_l_IncEventCo; SD_l_IncQueryCo; SD_l_IncTodoCo; SD_l_OthersWidth)
	C_LONGINT:C283(SD_l_StartOfPeriod; SD_l_StartSlider; SD_l_TimeSpace2; SD_l_ToSortDirection; SD_l_ToSortOrder; SD3_l_DiaryActionNum; WS_l_SELECTEDDIARYVIEWTAB)
	C_PICTURE:C286(SD_Pic_EventSort; SD_pic_sort1)
	C_TEXT:C284($_t_ApplicationVersion; $_t_CompanyName; $_t_DateString; $_t_EmailTextValues; $_t_EmailTextValues2; $_t_ItemText; $_t_ItemTextOLD; $_t_oldMethodName; $_t_PersonText; SD_t_AgendaEndTime; SD_t_AgendaStartTime)
	C_TEXT:C284(SD_t_CurrentDiaryInitials; SD_t_DiaryCode; SD_t_DiaryDefaultUser; SD_t_EventLabel; SD_t_ScheduleLabel; WS_t_DiaryDate2)
	C_TIME:C306($_ti_DisplayTimeTo; $_ti_SetEndTime; $_ti_SetTime; SD_ti_GetTime; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; SD_ti_TestTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDiary_HL_DisplayDiary")

$_bo_ListBuilt:=False:C215
CREATE EMPTY SET:C140([DIARY:12]; "AGTempSet_"+String:C10(Current process:C322))
If (SD3_l_DiaryActionNum=0)
	$_bo_ShowSchedule:=True:C214
Else 
	$_bo_ShowSchedule:=False:C215
End if 
$_ti_SetTime:=SD_ti_SettingsTimeStart
$_ti_SetEndTime:=SD_ti_SettingsTimeEnd
ARRAY TEXT:C222(SD_at_Events; 0)
$_l_EventElement:=0
ARRAY TEXT:C222(SD_at_ToDoList; 0)
ARRAY TEXT:C222(SD_at_ToDoList2; 0)
$_l_ToDoElement:=0
ARRAY TEXT:C222(SD_at_Query; 0)


$_l_QueryElement:=0
ARRAY TEXT:C222(SD_at_TaskCode; 0)
ARRAY TEXT:C222(SD_at_TaskData; 0)
ARRAY TEXT:C222(SD_at_TaskCoCode; 0)
ARRAY TEXT:C222(SD_at_TaskActionCode; 0)
ARRAY TEXT:C222(SD_at_TaskCompanyData; 0)

ARRAY DATE:C224(SD_ad_TaskDate; 0)
If (Not:C34(SD_bo_AgendaEnabled))
	OBJECT SET VISIBLE:C603(SD_l_AGENDA; False:C215)
End if 
If (True:C214)
	//TRACE
	
	If (Is a list:C621(SD_l_HLDayTime))
		CLEAR LIST:C377(SD_l_HLDayTime; *)
	End if 
	$_t_ApplicationVersion:=Application version:C493
	If (SD_l_ToSortOrder=0)
		SD_l_ToSortOrder:=1
		SD_l_ToSortDirection:=1  //reverse(newest first)
	End if 
	If (SD_l_AppointmentSortOrder=0)
		SD_l_AppointmentSortOrder:=1
		SD_l_AppointmentsortDirection:=1
	End if 
	If (SD_l_EventSortOrder=0)
		SD_l_EventSortOrder:=1
		SD_l_EventSortDirection:=0  //oldest first
	End if 
	ARRAY TEXT:C222($_at_StartDays; 7)
	$_at_StartDays{1}:="Sunday"
	$_at_StartDays{2}:="Monday"
	$_at_StartDays{3}:="Tuesday"
	$_at_StartDays{4}:="Wednesday"
	$_at_StartDays{5}:="Thursday"
	$_at_StartDays{6}:="Friday"
	$_at_StartDays{7}:="Saturday"
	ARRAY LONGINT:C221(SD_al_AgendaNumbers; 0)
	
	If (SD_l_FirstRun=0)
		SD_l_HLDayTime:=New list:C375  // Create a new empty hierarchical list for Day Headers
		SD_l_FirstRun:=1
		
		ARRAY TEXT:C222(SD_at_ToDoSort; 5)
		SD_at_ToDoSort{1}:="Date/Time"
		SD_at_ToDoSort{2}:="Priority"
		SD_at_ToDoSort{3}:="Action Code"
		SD_at_ToDoSort{4}:="-"
		SD_at_ToDoSort{5}:="Custom"
		ARRAY TEXT:C222(SD_at_EventSort; 5)
		SD_at_EventSort{1}:="Date/Time"
		SD_at_EventSort{2}:="Priority"
		SD_at_EventSort{3}:="Action Code"
		SD_at_EventSort{4}:="-"
		SD_at_EventSort{5}:="Custom"
		ARRAY TEXT:C222(SD_at_AppointmentSort; 17)
		SD_at_AppointmentSort{1}:="Date/Time"
		SD_at_AppointmentSort{2}:="Priority"
		SD_at_AppointmentSort{3}:="Action Code"
		SD_at_AppointmentSort{4}:="Result Code"
		SD_at_AppointmentSort{5}:="Diary item Owner"
		SD_at_AppointmentSort{6}:="Company Code"
		SD_at_AppointmentSort{7}:="Contact Code"
		SD_at_AppointmentSort{8}:="Product Code"
		SD_at_AppointmentSort{9}:="Order Code"
		SD_at_AppointmentSort{10}:="Job Code"
		SD_at_AppointmentSort{11}:="Stage Code"
		SD_at_AppointmentSort{12}:="Document Code"
		SD_at_AppointmentSort{13}:="Result Code"
		SD_at_AppointmentSort{14}:="-"
		SD_at_AppointmentSort{15}:="Custom"
	End if 
	$_l_EventElement:=0
	$_l_ToDoElement:=0
	$_l_QueryElement:=0
	SD_l_HLDayTime:=New list:C375  // Create a new empty hierarchical list for Day Headers
	ARRAY TEXT:C222(SD_at_Events; 0)
	ARRAY LONGINT:C221(SD_al_EventRecordIDs; 0)
	ARRAY LONGINT:C221($_al_AppointmentRecordIDs; 0)
	ARRAY TEXT:C222(SD_at_Query; 0)
	ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; 0)
	ARRAY TEXT:C222(SD_at_ToDoList; 0)
	ARRAY TEXT:C222(SD_at_ToDoList2; 0)
	ARRAY LONGINT:C221(SD_al_EventRecordIDs; 100)
	
	ARRAY TEXT:C222(SD_at_Events; 100)
	ARRAY LONGINT:C221($_al_AppointmentRecordIDs; 100)
	ARRAY TEXT:C222(SD_at_Query; 100)
	ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; 100)
	ARRAY TEXT:C222(SD_at_ToDoList; 100)
	ARRAY TEXT:C222(SD_at_ToDoList2; 100)
	ARRAY TEXT:C222(SD_at_TaskCode; 100)
	ARRAY TEXT:C222(SD_at_TaskData; 100)
	ARRAY TEXT:C222(SD_at_TaskCoCode; 100)
	ARRAY TEXT:C222(SD_at_TaskActionCode; 100)
	ARRAY DATE:C224(SD_ad_TaskDate; 100)
	ARRAY TEXT:C222(SD_at_TaskCompanyData; 100)
	
	$_l_EventElement:=0
	$_l_AppointmentElement:=0
	$_l_ToDoElement:=0
	OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
	OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
	OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; False:C215)
	If ($_bo_ShowSchedule)
		//   SD_l_HLDays3:=New list
		// SD_BuildDay (SD_l_HLDays3)
	End if 
	
	ARRAY LONGINT:C221($_al_KeepAppointments; 0)
	ARRAY TEXT:C222($_at_DayStrings; 0)
	ARRAY TEXT:C222($_at_DayStrings; 1000)
	ARRAY DATE:C224($_ad_DayStringDates; 0)
	ARRAY DATE:C224($_ad_DayStringDates; 1000)
	$_l_CurrentElement:=0
	SD_d_GetDate:=!00-00-00!
	$_l_Section2Count:=0
	ARRAY DATE:C224($_ad_DateStampValues; 0)
	ARRAY DATE:C224($_ad_DateStampValues2; 0)
	If ($_bo_ShowSchedule)
		COPY ARRAY:C226(SD_ad_DateStampValues; $_ad_DateStampValues)
		SD_D_DateStampValue:=!00-00-00!
		For ($_l_Index; 1; Size of array:C274($_ad_DateStampValues))
			Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_D_DateStampValue; ->SD_ti_GetTime)
			$_ad_DateStampValues{$_l_Index}:=SD_D_DateStampValue
		End for 
		
		ARRAY DATE:C224($_ad_DateStampValues2; Size of array:C274($_ad_DateStampValues))
		ARRAY BOOLEAN:C223($_abo_ScheduleBuilt; Size of array:C274($_ad_DateStampValues))
		//$_ad_DateStampValues2  only contains dates in the show shedule range
		$_d_StartDate:=SD_d_StartDate
		$_l_DayNumber:=Day number:C114($_d_StartDate)
		Case of 
			: ($_l_DayNumber=7)  //saturday
				If (Not:C34(SD_bo_SaturdayWork))
					If (SD_bo_SundayWork)
						$_d_StartDate:=$_d_StartDate+1
					Else 
						$_d_StartDate:=$_d_StartDate+2
					End if 
				End if 
			: ($_l_DayNumber=1)  //sunday
				If (Not:C34(SD_bo_SundayWork))
					$_d_StartDate:=$_d_StartDate+1
				End if 
		End case 
		Repeat 
			$_l_StartDateElement:=Find in array:C230($_ad_DateStampValues; $_d_StartDate)
			If ($_d_StartDate<=SD_d_EndDate)
				If ($_l_StartDateElement<0)
					$_bo_Insert:=False:C215
					If (Size of array:C274($_ad_DateStampValues)=0)
						INSERT IN ARRAY:C227($_ad_DateStampValues; 2; 1)
						INSERT IN ARRAY:C227($_ad_DateStampValues2; 2; 1)
						INSERT IN ARRAY:C227($_abo_ScheduleBuilt; 2; 1)
						$_ad_DateStampValues{1}:=$_d_StartDate
						$_ad_DateStampValues2{1}:=$_d_StartDate
						$_l_Index:=Size of array:C274($_ad_DateStampValues)
					End if 
					For ($_l_Index; 1; Size of array:C274($_ad_DateStampValues))
						Case of 
							: ($_l_Index=1) & ($_l_Index<Size of array:C274($_ad_DateStampValues))
								If ($_ad_DateStampValues{$_l_Index}>$_d_StartDate)
									INSERT IN ARRAY:C227($_ad_DateStampValues; 1; 1)
									INSERT IN ARRAY:C227($_ad_DateStampValues2; 1; 1)
									INSERT IN ARRAY:C227($_abo_ScheduleBuilt; 1; 1)
									$_ad_DateStampValues{1}:=$_d_StartDate
									$_ad_DateStampValues2{1}:=$_d_StartDate
									$_l_Index:=Size of array:C274($_ad_DateStampValues)
								End if 
							: ($_l_Index=Size of array:C274($_ad_DateStampValues))
								Case of 
									: ($_ad_DateStampValues{$_l_Index}<$_d_StartDate)
										INSERT IN ARRAY:C227($_ad_DateStampValues; Size of array:C274($_ad_DateStampValues)+1; 1)
										INSERT IN ARRAY:C227($_ad_DateStampValues2; Size of array:C274($_ad_DateStampValues2)+1; 1)
										INSERT IN ARRAY:C227($_abo_ScheduleBuilt; Size of array:C274($_ad_DateStampValues2)+1; 1)
										
										$_ad_DateStampValues{Size of array:C274($_ad_DateStampValues)}:=$_d_StartDate
										$_ad_DateStampValues2{Size of array:C274($_ad_DateStampValues)}:=$_d_StartDate
										$_l_Index:=Size of array:C274($_ad_DateStampValues)
									: ($_ad_DateStampValues{$_l_Index}>$_d_StartDate)
										INSERT IN ARRAY:C227($_ad_DateStampValues; $_l_Index; 1)
										INSERT IN ARRAY:C227($_ad_DateStampValues2; $_l_Index; 1)
										INSERT IN ARRAY:C227($_abo_ScheduleBuilt; $_l_Index; 1)
										
										$_ad_DateStampValues{$_l_Index}:=$_d_StartDate
										$_ad_DateStampValues2{$_l_Index}:=$_d_StartDate
										$_l_Index:=Size of array:C274($_ad_DateStampValues)
								End case 
								
							Else 
								If ($_ad_DateStampValues{$_l_Index-1}<$_d_StartDate) & ($_ad_DateStampValues{$_l_Index}>$_d_StartDate)
									INSERT IN ARRAY:C227($_ad_DateStampValues; $_l_Index; 1)
									INSERT IN ARRAY:C227($_ad_DateStampValues2; $_l_Index; 1)
									INSERT IN ARRAY:C227($_abo_ScheduleBuilt; $_l_Index; 1)
									
									$_ad_DateStampValues{$_l_Index}:=$_d_StartDate
									$_ad_DateStampValues2{$_l_Index}:=$_d_StartDate
									$_l_Index:=Size of array:C274($_ad_DateStampValues)
								Else 
									If ($_ad_DateStampValues{$_l_Index}>$_d_StartDate)
										//gone too far?
										
									End if 
									
								End if 
						End case 
					End for 
					$_l_StartDateElement:=Find in array:C230($_ad_DateStampValues; $_d_StartDate)
					If ($_l_StartDateElement<0)
						INSERT IN ARRAY:C227($_ad_DateStampValues; Size of array:C274($_ad_DateStampValues)+1; 1)
						INSERT IN ARRAY:C227($_ad_DateStampValues2; Size of array:C274($_ad_DateStampValues2)+1; 1)
						INSERT IN ARRAY:C227($_abo_ScheduleBuilt; Size of array:C274($_abo_ScheduleBuilt)+1; 1)
						
						$_ad_DateStampValues{Size of array:C274($_ad_DateStampValues)}:=$_d_StartDate
						$_ad_DateStampValues2{Size of array:C274($_ad_DateStampValues2)}:=$_d_StartDate
					End if 
					
					
				Else 
					$_ad_DateStampValues2{$_l_StartDateElement}:=$_d_StartDate
				End if 
			End if 
			$_l_DayNumber:=Day number:C114($_d_StartDate)
			Case of 
				: ($_l_DayNumber=6)  //friday
					If (SD_bo_SaturdayWork)
						$_d_StartDate:=$_d_StartDate+1
					Else 
						If (SD_bo_SundayWork)
							$_d_StartDate:=$_d_StartDate+2
						Else 
							$_d_StartDate:=$_d_StartDate+3
						End if 
					End if 
				: ($_l_DayNumber=7)  //saturday
					If (SD_bo_SundayWork)
						$_d_StartDate:=$_d_StartDate+1
					Else 
						$_d_StartDate:=$_d_StartDate+2
					End if 
				Else 
					$_d_StartDate:=$_d_StartDate+1
			End case 
		Until ($_d_StartDate>SD_d_EndDate)
		
	Else 
		COPY ARRAY:C226(SD_ad_DateStampValues; $_ad_DateStampValues)
		SD_D_DateStampValue:=!00-00-00!
		For ($_l_Index; 1; Size of array:C274($_ad_DateStampValues))
			Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_D_DateStampValue; ->SD_ti_GetTime)
			$_ad_DateStampValues{$_l_Index}:=SD_D_DateStampValue
		End for 
		ARRAY DATE:C224($_ad_DateStampValues2; Size of array:C274($_ad_DateStampValues))
		ARRAY BOOLEAN:C223($_abo_ScheduleBuilt; Size of array:C274($_ad_DateStampValues))
		
	End if 
	For ($_l_Index; 1; Size of array:C274(SD_ad_DateStampValues))
		Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_ad_SortDate{$_l_Index}; ->SD_ti_GetTime)
	End for 
	If (Size of array:C274(SD_ad_DateStampValues)>0)
		vDateGetTest:=SD_ad_DateStampValues{Size of array:C274(SD_ad_DateStampValues)}
		SD_l_CurrentMonth:=Month of:C24(SD_D_CurrentviewDate)
		For ($_l_Index; 1; Size of array:C274($_ad_DateStampValues))
			SD_l_HLDays2:=0
			$_l_DateStampElement:=Find in array:C230(SD_ad_SortDate; $_ad_DateStampValues{$_l_Index})
			If ($_l_DateStampElement>0)
				SD_ad_SortDate{$_l_DateStampElement}:=SD_ad_DateStampValues{$_l_DateStampElement}
				Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_DateStampElement}; ->SD_ad_SortDate{$_l_DateStampElement}; ->SD_ti_GetTime)
				$_l_DateStringElement:=0
				If (SD_ad_SortDate{$_l_DateStampElement}#!00-00-00!)
					$_l_StartDateElement:=Find in array:C230($_ad_DayStringDates; SD_ad_SortDate{$_l_DateStampElement})
					If ($_l_StartDateElement<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						If ($_l_CurrentElement>Size of array:C274($_at_DayStrings))
							INSERT IN ARRAY:C227($_at_DayStrings; $_l_CurrentElement; 1000)
							INSERT IN ARRAY:C227($_ad_DayStringDates; $_l_CurrentElement; 1000)
						End if 
						$_at_DayStrings{$_l_CurrentElement}:=String:C10(Day of:C23(SD_ad_SortDate{$_l_DateStampElement}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114(SD_ad_SortDate{$_l_DateStampElement})})  //day number (01) and day name (sunday)=01 SUNDAY
						$_ad_DayStringDates{$_l_CurrentElement}:=SD_ad_SortDate{$_l_DateStampElement}
						$_l_DateReferenceID:=Gen_DateStamp($_ad_DayStringDates{$_l_CurrentElement})
						$_l_DateStringElement:=$_l_CurrentElement
					Else 
						$_l_DateStringElement:=0
						$_l_DateReferenceID:=0
					End if 
				End if 
				If ($_l_DateStringElement>0)
					
					
					$_l_DateElemement:=Find in array:C230(SD_ad_SortDate; $_ad_DayStringDates{$_l_DateStringElement})
					//check this
					For ($_l_Index2; $_l_DateElemement; Size of array:C274(SD_ad_DateStampValues))
						
						
						Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index2}; ->SD_ad_SortDate{$_l_Index2}; ->SD_ti_GetTime)
						If (SD_ad_SortDate{$_l_Index2}=$_ad_DayStringDates{$_l_DateStringElement})
							If ($_l_Index2>$_l_DateStampElement)
								$_l_DateStampElement:=$_l_Index2
							End if 
							
							SD_d_GetDate:=SD_ad_SortDate{$_l_Index2}
							WS_t_DiaryDate2:=String:C10(Day of:C23(SD_ad_SortDate{$_l_Index2}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114(SD_ad_SortDate{$_l_Index2})})  //day number (01) and day name (sunday)=01 SUNDAY
							Case of 
									//SD_l_DiaryVIewType
								: (SD_l_DiaryVIewType#0)  //for the QUERY list
									$_l_AppointmentElement:=$_l_AppointmentElement+1
									If (Size of array:C274($_al_AppointmentRecordIDs)<$_l_AppointmentElement)
										INSERT IN ARRAY:C227($_al_AppointmentRecordIDs; Size of array:C274($_al_AppointmentRecordIDs)+1; 100)
										INSERT IN ARRAY:C227(SD_at_Query; Size of array:C274(SD_at_Query)+1; 100)
									End if 
									$_al_AppointmentRecordIDs{$_l_AppointmentElement}:=SD_al_RecordNumbers{$_l_Index2}
									$_t_ItemText:=""
									
									If (Length:C16(SD_at_ItemPerson{$_l_Index2})<3)
										$_t_PersonText:=SD_at_ItemPerson{$_l_Index2}+(" "*(3-Length:C16(SD_at_ItemPerson{$_l_Index2})))+" "
									Else 
										$_t_PersonText:=SD_at_ItemPerson{$_l_Index2}
									End if 
									If (SD_l_IncQueryCo>0)
										$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_Index2}; SD_at_ContactCodes{$_l_Index2})
									Else 
										$_t_CompanyName:=""
									End if 
									
									If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
										SD_at_Query{$_l_AppointmentElement}:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_CompanyName+" "+$_t_PersonText+": "+SD_at_ItemActionCode{$_l_Index2}+" :"+SD_at_ActionDetails2{$_l_Index2}  //create: diary item time and description
									Else 
										SD_at_Query{$_l_AppointmentElement}:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_CompanyName+" "+$_t_PersonText+" :"+SD_at_ItemActionCode{$_l_Index2}+" :"+SD_at_ActionDetails{$_l_Index2}  //create: diary item time and description
									End if 
									SD_at_Query{$_l_AppointmentElement}:=Replace string:C233(SD_at_Query{$_l_AppointmentElement}; Char:C90(13); " ")
									SD_at_Query{$_l_AppointmentElement}:=Replace string:C233(SD_at_Query{$_l_AppointmentElement}; Char:C90(10); " ")
									If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
										SD_l_DiaryView4:=1
									End if 
								Else 
									$_l_Section:=2
									$_l_StartDateElement:=Find in array:C230(SD_at_DiaryOwners; SD_t_CurrentDiaryInitials)
									If ($_l_StartDateElement<0)
										$_l_StartDateElement:=0
									End if 
									Case of 
										: (SD_al_PersonClass{$_l_StartDateElement}=3)
											$_l_Section:=2
											FORM GOTO PAGE:C247(2)
										: (SD_at_ItemActionCode{$_l_Index2}="EVENT") & (SD_al_DateStamp{$_l_Index2}>=SD_l_StartOfPeriod) & (SD_abo_DoneStatus{$_l_Index2}=False:C215)
											$_l_Section:=1
										: (SD_at_ItemActionCode{$_l_Index2}="EVENT") & (SD_al_DateStamp{$_l_Index2}>=SD_l_StartOfPeriod) & (SD_abo_DoneStatus{$_l_Index2}=True:C214)
											$_l_Section:=2
										: (SD_at_ItemActionCode{$_l_Index2}="EVENT") & (SD_al_DateStamp{$_l_Index2}<=SD_l_StartOfPeriod)
											$_l_Section:=2  //it is done
										: (SD_at_ItemActionCode{$_l_Index2}="TASK") & (SD_abo_DoneStatus{$_l_Index2}=False:C215)
											$_l_Section:=3
										: (SD_at_ItemActionCode{$_l_Index2}="TASK") & (SD_abo_DoneStatus{$_l_Index2}=True:C214)
											$_l_Section:=2
										Else 
											If (SD_t_CurrentDiaryInitials=SD_t_DiaryDefaultUser)
												Case of 
													: (SD_al_Time{$_l_Index2}=0) & (SD_abo_DoneStatus{$_l_Index2}=False:C215)
														$_l_Section:=3
													: (SD_al_Time{$_l_Index2}=0) & (SD_abo_DoneStatus{$_l_Index2}=True:C214)
														$_l_Section:=2
													: (SD_al_DateStamp{$_l_Index2}>=SD_l_StartOfPeriod)
														$_l_Section:=2
													: (SD_al_DateStamp{$_l_Index2}<=SD_l_StartOfPeriod) & (SD_abo_DoneStatus{$_l_Index2}=False:C215)
														$_l_Section:=3
													: (SD_al_DateStamp{$_l_Index2}<=SD_l_StartOfPeriod) & (SD_abo_DoneStatus{$_l_Index2}=True:C214)
														$_l_Section:=2
													Else 
														$_l_Section:=2
												End case 
												
											Else 
												$_l_Section:=2
											End if 
									End case 
									Case of 
										: ($_l_Section=1)  //if an EVENT item: add item to "SD_l_HLDayToDoItems" list
											
											If (Not:C34(SD_bo_AgendaEnabled))
												$_l_EventElement:=$_l_EventElement+1
												If (Size of array:C274(SD_al_EventRecordIDs)<$_l_EventElement)
													INSERT IN ARRAY:C227(SD_al_EventRecordIDs; Size of array:C274(SD_al_EventRecordIDs)+1; 100)
													INSERT IN ARRAY:C227(SD_at_Events; Size of array:C274(SD_at_Events)+1; 100)
												End if 
												SD_al_EventRecordIDs{$_l_EventElement}:=SD_al_RecordNumbers{$_l_Index2}
												$_t_ItemText:=""
												If (SD_l_IncEventCo>0)
													$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_Index2}; SD_at_ContactCodes{$_l_Index2})
												Else 
													$_t_CompanyName:=""
												End if 
												$_t_DateString:=""
												If (SD_d_StartDate#SD_d_EndDate)
													If (SD_ad_DateStampValues2{$_l_Index2}>SD_ad_DateStampValues{$_l_Index2})
														$_t_DateString:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+"-"+String:C10(SD_ad_DateStampValues2{$_l_Index2}; 4)+"  "
													Else 
														$_t_DateString:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+"  "
													End if 
												Else 
													If (SD_ad_DateStampValues2{$_l_Index2}>SD_ad_DateStampValues{$_l_Index2})
														$_t_DateString:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+"-"+String:C10(SD_ad_DateStampValues2{$_l_Index2}; 4)+"  "
													Else 
														$_t_DateString:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+" "
													End if 
												End if 
												
												If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
													SD_at_Events{$_l_EventElement}:=$_t_DateString+Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+$_t_CompanyName+" "+SD_at_ActionDetails2{$_l_Index2}  //create: diary item time and description
												Else 
													SD_at_Events{$_l_EventElement}:=$_t_DateString+Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+$_t_CompanyName+" "+SD_at_ActionDetails{$_l_Index2}  //create: diary item time and description
												End if 
												SD_at_Events{$_l_EventElement}:=Replace string:C233(SD_at_Events{$_l_EventElement}; Char:C90(13); " ")
												SD_at_Events{$_l_EventElement}:=Replace string:C233(SD_at_Events{$_l_EventElement}; Char:C90(10); " ")
												If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
													SD_l_DiaryView1:=1
												End if 
											Else 
												INSERT IN ARRAY:C227(SD_al_AgendaNumbers; Size of array:C274(SD_al_AgendaNumbers)+1; 1)
												SD_al_AgendaNumbers{Size of array:C274(SD_al_AgendaNumbers)}:=SD_al_RecordNumbers{$_l_Index2}
											End if 
											
										: ($_l_Section=2)
											If (Not:C34(SD_bo_AgendaEnabled))
												$_l_Section2Count:=$_l_Section2Count+1
												$_bo_ListBuilt:=True:C214
												$_l_DateStamp:=Gen_DateStamp(SD_d_StartDate)
												If (SD_l_HLDays2=0)
													SD_l_HLDays2:=New list:C375
													$_bo_Daybuilt:=False:C215
												End if 
												If ($_bo_Daybuilt=False:C215) & ($_bo_ShowSchedule)
													//SD_ad_SortDate{$_l_DateStampElement}
													SD_BuildDay(SD_l_HLDays2; SD_ad_SortDate{$_l_DateStampElement})
													$_bo_Daybuilt:=True:C214
												End if 
												If (Num:C11($_t_ApplicationVersion)<670)
													If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
														$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Replace string:C233(Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 25); Char:C90(13); "")  //create: diary item time and description
													Else 
														$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Replace string:C233(Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 25); Char:C90(13); "")  //create: diary item time and description
													End if 
													
													
												Else 
													If (SD_l_IncAppointmentCo>0)
														$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_Index2}; SD_at_ContactCodes{$_l_Index2})
													Else 
														$_t_CompanyName:=""
													End if 
													If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
														$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+$_t_CompanyName+" "+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; (220-Length:C16($_t_CompanyName)))  //create: diary item time and description
													Else 
														$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+$_t_CompanyName+" "+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; (220-Length:C16($_t_CompanyName)))  //create: diary item time and description
													End if 
													$_t_ItemText:=Replace string:C233($_t_ItemText; Char:C90(13); "")
												End if 
												$_t_ItemText:=Replace string:C233($_t_ItemText; Char:C90(10); " ")
												$_l_TimeReference:=SD_ti_GetTime*1
												// $TimeFound:=
												If ($_bo_ShowSchedule)
													For ($_l_ItemsIndex; 1; Count list items:C380(SD_l_HLDays2))
														GET LIST ITEM:C378(SD_l_HLDays2; $_l_ItemsIndex; $_l_ItemReference; $_t_ItemTextOLD)
														SD_d_TestDate:=!00-00-00!
														SD_ti_TestTime:=?00:00:00?
														Gen_TimeStamp2Date(Abs:C99($_l_ItemReference); ->SD_d_TestDate; ->SD_ti_TestTime)  //just here for check
														Case of 
															: (SD_ti_TestTime>$_l_TimeReference)
																INSERT IN LIST:C625(SD_l_HLDays2; $_l_ItemReference; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2})
																$_l_ItemsIndex:=Count list items:C380(SD_l_HLDays2)+1
															: (SD_ti_TestTime=$_l_TimeReference)
																SET LIST ITEM:C385(SD_l_HLDays2; $_l_ItemReference; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2})
																$_l_ItemsIndex:=Count list items:C380(SD_l_HLDays2)+1
																
														End case 
														
													End for 
												Else 
													
													APPEND TO LIST:C376(SD_l_HLDays2; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2})  //add to the Diary Items List
												End if 
												
												
												
												
												$_l_ListCount:=$_l_ListCount+1
												If ($_t_ItemText#"")
													SET LIST ITEM PROPERTIES:C386(SD_l_HLDays2; 0; False:C215; Plain:K14:1; 0)
												End if 
												If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
													SD_l_DiaryView2:=1
												End if 
											Else 
												If ($_ti_SetTime=?00:00:00?)
													$_ti_SetTime:=SD_ti_SettingsTimeStart
												End if 
												If ($_ti_SetEndTime=?00:00:00?)
													$_ti_SetEndTime:=SD_ti_SettingsTimeEnd
												End if 
												
												If (SD_ti_GetTime<$_ti_SetTime)
													$_ti_SetTime:=SD_ti_GetTime
													
												End if 
												If (SD_ti_GetTime>$_ti_SetEndTime)
													$_ti_SetEndTime:=SD_ti_GetTime
													
												End if 
												INSERT IN ARRAY:C227(SD_al_AgendaNumbers; Size of array:C274(SD_al_AgendaNumbers)+1; 1)
												SD_al_AgendaNumbers{Size of array:C274(SD_al_AgendaNumbers)}:=SD_al_RecordNumbers{$_l_Index2}
												
											End if 
											
										: ($_l_Section=3)  //if date, but no time: add item to "SD_l_DayTaskItems" list
											$_l_ToDoElement:=$_l_ToDoElement+1
											If (Size of array:C274(SD_al_ToDoRecordIDs)<$_l_ToDoElement)
												INSERT IN ARRAY:C227(SD_al_ToDoRecordIDs; Size of array:C274(SD_al_ToDoRecordIDs)+1; 100)
												INSERT IN ARRAY:C227(SD_at_ToDoList; Size of array:C274(SD_at_ToDoList)+1; 100)
												INSERT IN ARRAY:C227(SD_at_TaskCode; Size of array:C274(SD_at_TaskCode)+1; 100)
												INSERT IN ARRAY:C227(SD_at_TaskData; Size of array:C274(SD_at_TaskData)+1; 100)
												INSERT IN ARRAY:C227(SD_at_TaskCoCode; Size of array:C274(SD_at_TaskCoCode)+1; 100)
												INSERT IN ARRAY:C227(SD_at_TaskCompanyData; Size of array:C274(SD_at_TaskCompanyData)+1; 100)
												INSERT IN ARRAY:C227(SD_at_TaskActionCode; Size of array:C274(SD_at_TaskActionCode)+1; 100)
												INSERT IN ARRAY:C227(SD_ad_TaskDate; Size of array:C274(SD_ad_TaskDate)+1; 100)
											End if 
											
											SD_al_ToDoRecordIDs{$_l_ToDoElement}:=SD_al_RecordNumbers{$_l_Index2}
											$_t_ItemText:=""
											If (SD_l_IncTodoCo>0)
												$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_Index2}; SD_at_ContactCodes{$_l_Index2})
												SD_at_TaskCompanyData{$_l_ToDoElement}:=$_t_CompanyName
												SD_at_TaskCoCode{$_l_ToDoElement}:=SD_at_CompanyCodes{$_l_Index2}
											Else 
												
												$_t_CompanyName:=""
											End if 
											SD_at_TaskCode{$_l_ToDoElement}:=SD_at_ItemCodeValues{$_l_Index2}
											SD_at_TaskActionCode{$_l_ToDoElement}:=SD_at_ItemActionCode{$_l_Index2}
											SD_ad_TaskDate{$_l_ToDoElement}:=SD_ad_DateStampValues{$_l_Index2}
											If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
												SD_at_TaskData{$_l_ToDoElement}:=SD_at_ActionDetails2{$_l_Index2}
												SD_at_ToDoList{$_l_ToDoElement}:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+$_t_CompanyName+" "+SD_at_ActionDetails2{$_l_Index2}  //create: diary item time and description
											Else 
												SD_at_TaskData{$_l_ToDoElement}:=SD_at_ActionDetails{$_l_Index2}
												SD_at_ToDoList{$_l_ToDoElement}:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+$_t_CompanyName+" "+SD_at_ActionDetails{$_l_Index2}  //create: diary item time and description
											End if 
											SD_at_ToDoList{$_l_ToDoElement}:=Replace string:C233(SD_at_ToDoList{$_l_ToDoElement}; Char:C90(13); " ")
											SD_at_ToDoList{$_l_ToDoElement}:=Replace string:C233(SD_at_ToDoList{$_l_ToDoElement}; Char:C90(10); " ")
											SD_at_TaskData{$_l_ToDoElement}:=Replace string:C233(SD_at_TaskData{$_l_ToDoElement}; Char:C90(13); " ")
											SD_at_TaskData{$_l_ToDoElement}:=Replace string:C233(SD_at_TaskData{$_l_ToDoElement}; Char:C90(10); " ")
											
											
											If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
												SD_l_DiaryView3:=1
											End if 
									End case 
							End case 
							
						Else 
							//  $_l_Index:=$_l_Index2
							$_l_Index2:=Size of array:C274(SD_ad_DateStampValues)+1
						End if 
						
					End for 
					If ($_l_ListCount=0) & ($_bo_ShowSchedule)
						
					End if 
					SET LIST PROPERTIES:C387(SD_l_HLDayTime; 1; 0; 14; 0)
					
					If ($_l_ListCount>0)
						
						$_t_DateString:=String:C10(Day of:C23(SD_ad_SortDate{$_l_DateStampElement}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114(SD_ad_SortDate{$_l_DateStampElement})})  //day number (01) and day name (sunday)=01 SUNDAY
						$_l_DateStamp:=Gen_DateStamp(SD_ad_SortDate{$_l_DateStampElement})
						If (SD_d_StartDate=SD_d_EndDate)
							APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays2; True:C214)
						Else 
							APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays2; False:C215)
						End if 
						$_l_ListCount:=0
						SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; $_l_DateStamp; False:C215; 1; 0)
						
					Else 
						If ($_l_ListCount=0) & ($_bo_ShowSchedule) & ($_bo_ListBuilt=False:C215) & (($_ad_DateStampValues2{$_l_Index}>=SD_d_StartDate))
							If ($_abo_ScheduleBuilt{$_l_Index}=False:C215)
								$_abo_ScheduleBuilt{$_l_Index}:=True:C214
								$_bo_ListBuilt:=False:C215
								$_t_DateString:=String:C10(Day of:C23(SD_ad_DateStampValues{$_l_DateStampElement}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114(SD_ad_DateStampValues{$_l_DateStampElement})})  //day number (01) and day name (sunday)=01 SUNDAY
								$_l_DateStamp:=Gen_DateStamp(SD_ad_DateStampValues{$_l_DateStampElement})
								SD_l_HLDays3:=New list:C375
								SD_BuildDay(SD_l_HLDays3; SD_ad_DateStampValues{$_l_DateStampElement})
								If (SD_d_StartDate=SD_d_EndDate)
									
									APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; True:C214)
								Else 
									APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; False:C215)
								End if 
							End if 
						Else 
							If (Is a list:C621(SD_l_HLDays2))
								CLEAR LIST:C377(SD_l_HLDays2; *)
							End if 
						End if 
						
					End if 
				End if 
				$_bo_ListBuilt:=False:C215
				
			Else 
				If ($_bo_ShowSchedule)
					If ($_abo_ScheduleBuilt{$_l_Index}=False:C215)
						$_abo_ScheduleBuilt{$_l_Index}:=True:C214
						$_t_DateString:=String:C10(Day of:C23($_ad_DateStampValues{$_l_Index}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114($_ad_DateStampValues{$_l_Index})})  //day number (01) and day name (sunday)=01 SUNDAY
						$_l_DateStamp:=Gen_DateStamp($_ad_DateStampValues{$_l_Index})
						SD_l_HLDays3:=New list:C375
						SD_BuildDay(SD_l_HLDays3; $_ad_DateStampValues{$_l_Index})
						If (SD_d_StartDate=SD_d_EndDate)
							APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; True:C214)
						Else 
							APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; False:C215)
						End if 
					End if 
				End if 
				
			End if 
			
		End for 
		
		ARRAY TEXT:C222($_at_DayStrings; $_l_CurrentElement)
		
		Case of 
			: (SD_l_DiaryView1=1)
				
			: (SD_l_DiaryView2=1)
				
			: (SD_l_DiaryView3=1)
				
				
			: (SD_l_DiaryView4=1)
				
			Else 
				SD_l_DiaryView1:=0
				SD_l_DiaryView2:=0
				SD_l_DiaryView3:=0
				SD_l_DiaryView4:=0
		End case 
		ARRAY LONGINT:C221(SD_al_EventRecordIDs; $_l_EventElement)
		ARRAY LONGINT:C221($_al_AppointmentRecordIDs; $_l_AppointmentElement)
		ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_Events; $_l_EventElement)
		ARRAY TEXT:C222(SD_at_Query; $_l_AppointmentElement)
		ARRAY TEXT:C222(SD_at_ToDoList; $_l_ToDoElement)
		COPY ARRAY:C226(SD_at_ToDoList; SD_at_ToDoList2)
		
		ARRAY TEXT:C222(SD_at_TaskCode; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskData; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskCoCode; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskCompanyData; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskActionCode; $_l_ToDoElement)
		ARRAY DATE:C224(SD_ad_TaskDate; $_l_ToDoElement)
		If (Size of array:C274(SD_at_Events)=0)
			//ARRAY TEXT(SD_at_Events;1)
			//ARRAY LONGINT(SD_al_EventRecordIDs;1)
			//SD_at_Events{1}:="No Events..."
			//SD_al_EventRecordIDs{1}:=-1
			
		End if 
		$_l_MonthTimeItems:=Count list items:C380(SD_l_HLDayTime)
		If ($_l_MonthTimeItems<1)
			// $_l_MonthTimeCount:=-1
			//  APPEND TO LIST(SD_l_HLDayTime;"No Appointments...";$_l_MonthTimeCount;0;False)
			// SET LIST ITEM PROPERTIES(SD_l_HLDayTime;0;False;Plain +Italic ;0)
		Else 
			
		End if 
		
		If (Size of array:C274(SD_al_ToDoRecordIDs)=0)
			//ARRAY LONGINT(SD_al_ToDoRecordIDs;1)
			//  ARRAY TEXT(SD_at_ToDoList;1)
			// SD_at_ToDoList{1}:="No To-do list items..."
			//  SD_al_ToDoRecordIDs{1}:=-1
		End if 
		
		If (Size of array:C274(SD_at_Events)=0)
			// ARRAY TEXT(SD_at_Query;1)
			//  ARRAY LONGINT($_al_AppointmentRecordIDs;1)
			
			//   SD_at_Query{1}:="No Query Matches..."
			//  $_al_AppointmentRecordIDs{1}:=-1
			
			
		End if 
		SD_l_HLDays2:=0
		
		//////////_o_REDRAW LIST(SD_l_HLDayTime)
		
	Else 
		ARRAY LONGINT:C221(SD_al_EventRecordIDs; $_l_EventElement)
		ARRAY LONGINT:C221($_al_AppointmentRecordIDs; $_l_AppointmentElement)
		ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_Events; $_l_EventElement)
		ARRAY TEXT:C222(SD_at_Query; $_l_AppointmentElement)
		ARRAY TEXT:C222(SD_at_ToDoList; $_l_ToDoElement)
		COPY ARRAY:C226(SD_at_ToDoList; SD_at_ToDoList2)
		
		ARRAY TEXT:C222(SD_at_TaskCode; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskData; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskCoCode; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskCompanyData; $_l_ToDoElement)
		ARRAY TEXT:C222(SD_at_TaskActionCode; $_l_ToDoElement)
		ARRAY DATE:C224(SD_ad_TaskDate; $_l_ToDoElement)
		If (Is a list:C621(SD_l_HLDayTime))
			CLEAR LIST:C377(SD_l_HLDayTime; *)
		End if 
		SD_l_HLDayTime:=0
		SD_l_HLDayTime:=New list:C375  // Create a new empty hierarchical list for Day Headers
		If ($_bo_ShowSchedule) & (SD_d_StartDate>=Current date:C33(*))
			For ($_l_Index; 1; Size of array:C274($_ad_DateStampValues))
				// $_bo_ListBuilt:=True
				SD_l_HLDays2:=New list:C375
				
				$_t_DateString:=String:C10(Day of:C23($_ad_DateStampValues{$_l_Index}); "00")+"  "+Uppercase:C13($_at_StartDays{Day number:C114($_ad_DateStampValues{$_l_Index})})  //day number (01) and day name (sunday)=01 SUNDAY
				$_l_DateStamp:=Gen_DateStamp($_ad_DateStampValues{$_l_Index})
				SD_l_HLDays3:=New list:C375
				SD_BuildDay(SD_l_HLDays3; $_ad_DateStampValues{$_l_Index})
				If (SD_d_StartDate=SD_d_EndDate)
					APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; True:C214)
				Else 
					APPEND TO LIST:C376(SD_l_HLDayTime; $_t_DateString; $_l_DateStamp; SD_l_HLDays3; False:C215)
				End if 
			End for 
			
		End if 
		
		
		ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; 0)
		ARRAY TEXT:C222(SD_at_ToDoList; 0)
		ARRAY TEXT:C222(SD_at_ToDoList2; 0)
		$_l_MonthTimeCount:=-1
		SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Plain:K14:1; 0)
		ARRAY TEXT:C222(SD_at_Query; 1)
		ARRAY LONGINT:C221($_al_AppointmentRecordIDs; 1)
		SD_at_Query{1}:="No Query Matches..."
		$_al_AppointmentRecordIDs{1}:=-1
		ARRAY TEXT:C222(SD_at_Events; 0)
		ARRAY LONGINT:C221(SD_al_EventRecordIDs; 0)
		//////////_o_REDRAW LIST(SD_l_HLDayTime)
	End if 
End if 
If (SD_bo_AgendaEnabled)
	//`````
	If (CB_l_ScheduleFullPage=1)
		//$TaskArea:=SD_l_AreaListEvents2
		$_l_AgendaArea:=SD_l_AGENDA2
		SD_l_DIaryPage:=3
	Else 
		//$TaskArea:=SD_l_AreaListEvents
		$_l_AgendaArea:=SD_l_AGENDA
		SD_l_DIaryPage:=1
	End if 
	If (SD_l_IncTodoCo>0)
		
	Else 
		
		
	End if 
	
	
	OBJECT SET VISIBLE:C603(SD_t_EventLabel; False:C215)
	OBJECT SET VISIBLE:C603(SD_pic_sort1; False:C215)
	OBJECT SET VISIBLE:C603(SD_at_EventSort; False:C215)
	OBJECT SET VISIBLE:C603(SD_l_ChangeSortEvent; False:C215)
	OBJECT SET VISIBLE:C603(SD_Pic_EventSort; False:C215)
	OBJECT SET VISIBLE:C603(SD_at_Events; False:C215)
	OBJECT SET VISIBLE:C603(SD_t_ScheduleLabel; False:C215)
	OBJECT SET VISIBLE:C603(CB_l_ScheduleFullPage; False:C215)
	OBJECT SET VISIBLE:C603(SD_l_HLDayTime; False:C215)
	SD_bo_AgendaQueryDone:=True:C214
	//Gen_Alert ("CrashTest-1")
	If (Not:C34(SD_bo_AgendaSetup))
		SD_bo_NoAgendaEvent:=True:C214
		
		SD_bo_AgendaSetup:=True:C214
		//Agenda is not setup
		If (WS_l_SELECTEDDIARYVIEWTAB<4)
		End if 
		SD_bo_AgendaSetup:=True:C214
		
		
		Case of 
			: (SD_l_AGendaTable=Table:C252(->[DIARY:12]))
				
				
		End case 
		SD_bo_NoAgendaEvent:=False:C215
		
	Else 
		SD_bo_NoAgendaEvent:=True:C214
		If (WS_l_SELECTEDDIARYVIEWTAB<4)
		End if 
		SD_bo_NoAgendaEvent:=False:C215
		
		
	End if 
	SD_bo_AgendaSetup:=True:C214
	$SD_l_AGendaView:=WS_at_DiaryVIewTab
	//$SD_l_AGendaView:=AG Get current view type ($_l_AgendaArea)
	If (WS_at_DiaryVIewTab<4) & ($SD_l_AGendaView#WS_at_DiaryVIewTab)
		$_l_TabNumber:=WS_at_DiaryVIewTab
		If (Not:C34(SD_bo_InAgendaHandler))
			SD_bo_NoAgendaEvent:=True:C214
			//$rror:=AG SET CURRENT VIEW TYPE ($_l_AgendaArea;$_l_TabNumber)
			SD_bo_NoAgendaEvent:=False:C215
		End if 
		
	End if 
	
	If (SD_l_AgendaStartTime=0)
		SD_bo_NoAgendaEvent:=True:C214  //added 15/8/8-kmw(fix problem if agenda start time set to 0 caused daybook crash because of infini)
		SD_bo_NoAgendaEvent:=False:C215
		$_l_Hour:=Int:C8(((Current time:C178(*)*1)/60)/60)
		
		If (SD_l_TimeSpace2=0)
			$_l_TimeSpace:=15
		Else 
			$_l_TimeSpace:=SD_l_TimeSpace2
			
		End if 
		SD_l_AgendaStartTime:=$_l_Hour
		SD_l_StartSlider:=SD_l_AgendaStartTime
		//10mm per time space
		ARRAY TEXT:C222(SD_at_Events; 0)
	Else 
		SD_l_StartSlider:=SD_l_AgendaStartTime
	End if 
	
	//Else
	If (Not:C34(SD_bo_InAgendaHandler))
		SD_bo_NoAgendaEvent:=True:C214
		SD_bo_NoAgendaEvent:=False:C215
	End if 
	
	$_l_Hour:=Int:C8(((Current time:C178(*)*1)/60)/60)
	
	If (SD_l_TimeSpace2=0)
		$_l_TimeSpace:=15
	Else 
		$_l_TimeSpace:=SD_l_TimeSpace2
		
	End if 
	SD_l_StartSlider:=$_l_Hour
	//10mm per time space
	ARRAY TEXT:C222(SD_at_Events; 0)
	
	If (SD_l_AgendaStartTime<10)
		SD_t_AgendaStartTime:="From 0"+String:C10(SD_l_AgendaStartTime)+"00 hrs"
	Else 
		SD_t_AgendaStartTime:="From "+String:C10(SD_l_AgendaStartTime)+"00 hrs"
	End if 
	
	
	//Gen_Alert ("CrashTest")
	//SD_HL_Sort
	If ((CB_l_ScheduleFullPage=0))
		SD_SETViews
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectRight:=$_l_WindowRight-$_l_WindowLeft-2
		$_l_ObjectWidth:=($_l_ObjectRight-$_l_ObjectLeft)
		
		//MOVE OBJECT(CB_ScheduleFullPage2;($_l_ObjectRight+10);($_l_ObjectTop+5);($_l_ObjectRight+5+80);($_l_ObjectBottom-5);*)
		SD_bo_NoAgendaEvent:=True:C214
		OBJECT MOVE:C664(SD_t_AgendaStartTime; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectLeft+($_l_ObjectWidth/2); $_l_ObjectBottom+1+(12); *)
		OBJECT MOVE:C664(SD_t_AgendaEndTime; $_l_ObjectRight-($_l_ObjectWidth/2); $_l_ObjectBottom+1; $_l_ObjectRight; $_l_ObjectBottom+1+(12); *)
		$_l_ObjectBottom:=$_l_ObjectBottom+12
		OBJECT MOVE:C664(SD_l_StartSlider; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectLeft+($_l_ObjectWidth/2); $_l_ObjectBottom+1+(12); *)
		OBJECT MOVE:C664(SD_l_endSlider; $_l_ObjectRight-($_l_ObjectWidth/2); $_l_ObjectBottom+1; $_l_ObjectRight; $_l_ObjectBottom+1+(12); *)
		$_l_ObjectBottom:=$_l_ObjectBottom+20
		SD_bo_NoAgendaEvent:=True:C214
		
		If (Size of array:C274(SD_ad_TaskDate)=0)
			OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_ObjectLeft; ($_l_ObjectBottom+1); (($_l_WindowRight-$_l_WindowLeft)-3); (($_l_WindowBottom-$_l_WindowTop)-10); *)
			//SET VISIBLE(SD_l_AreaListEvents2;False)
			OBJECT SET VISIBLE:C603(SD_at_ToDoList2; False:C215)
		Else 
			$_l_SizeofArray:=Size of array:C274(SD_ad_TaskDate)*18
			If ($_l_SizeofArray<100)
				$_l_SizeofArray:=100
			End if 
			If ($_l_SizeofArray>(($_l_WindowBottom-$_l_WindowTop)/2))
				//IT WILL TAKE UP MORE THAN HALF THE PAGE
				$_l_SizeofArray:=($_l_WindowBottom-$_l_WindowTop)/2
			End if 
			//SET VISIBLE(SD_l_AreaListEvents2;True)
			OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_ObjectLeft; ($_l_ObjectBottom+1); (($_l_WindowRight-$_l_WindowLeft)-3); (($_l_WindowBottom-$_l_WindowTop)-($_l_SizeofArray+20)); *)
			OBJECT GET COORDINATES:C663(*; "oAGENDAVIEW2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(SD_at_ToDoList2; $_l_ObjectLeft; ($_l_ObjectBottom+20); ($_l_ObjectRight); (($_l_WindowBottom-$_l_WindowTop)-2); *)
			
		End if 
		SD_bo_NoAgendaEvent:=False:C215
	End if 
	If (SD_bo_AgendaEnabled)
		
		If (SD_l_IncTodoCo>0)
			If (CB_l_ScheduleFullPage=1)
				//GET OBJECT RECT(SD_l_AreaListEvents2;$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
				OBJECT GET COORDINATES:C663(SD_at_ToDoList2; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			Else 
				//GET OBJECT RECT(SD_l_AreaListEvents;$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
				OBJECT GET COORDINATES:C663(SD_at_ToDoList; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			End if 
			
			SD_l_OthersWidth:=80+40+255
			SD_l_DataWidth:=($_l_WindowRight-$_l_WindowLeft)-SD_l_OthersWidth
			//AL_SetWidths ($TaskArea;1;4;80;40;255;SD_l_DataWidth)
			
		Else 
			If (CB_l_ScheduleFullPage=1)
				//GET OBJECT RECT(SD_l_AreaListEvents2;$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
				OBJECT GET COORDINATES:C663(SD_at_ToDoList2; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			Else 
				//GET OBJECT RECT(SD_l_AreaListEvents;$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
				OBJECT GET COORDINATES:C663(SD_at_ToDoList; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				
			End if 
			SD_l_OthersWidth:=80+25
			SD_l_DataWidth:=($_l_WindowRight-$_l_WindowLeft)-SD_l_OthersWidth
			//AL_SetWidths ($TaskArea;1;3;80;40;SD_l_DataWidth)
			
		End if 
		//AL_UpdateArrays ($TaskArea;-1)
		
		
		If (Size of array:C274(SD_al_AgendaNumbers)>0)
			CREATE SET FROM ARRAY:C641(Table:C252(SD_l_AGendaTable)->; SD_al_AgendaNumbers; "AGTempSet_"+String:C10(Current process:C322))
		Else 
			CREATE EMPTY SET:C140(Table:C252(SD_l_AGendaTable)->; "AGTempSet_"+String:C10(Current process:C322))
		End if 
		
		If (SD_l_AgendaEndTime=0) | (True:C214)
			If (CB_l_ScheduleFullPage=1)
				OBJECT GET COORDINATES:C663(SD_l_AGENDA2; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			Else 
				OBJECT GET COORDINATES:C663(SD_l_AGENDA; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				
			End if 
			
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			$_l_TimeSlots:=$_l_WindowHeight/10
			If (SD_l_TimeSpace2=0)
				$_l_TimeSpace:=15
			Else 
				$_l_TimeSpace:=SD_l_TimeSpace2
				
			End if 
			$_l_TimeSpaceperHour:=60/$_l_TimeSpace
			$_ti_SetEndTime:=Time:C179(Time string:C180(SD_l_AgendaStartTime*(60*60)))
			
			For ($_l_Index; 1; Int:C8($_l_TimeSlots/$_l_TimeSpaceperHour))
				$_ti_SetEndTime:=Time:C179(Time string:C180($_ti_SetEndTime+(60*60)))
				
				
			End for 
			USE SET:C118("AGTempSet_"+String:C10(Current process:C322))
			ORDER BY:C49([DIARY:12]; [DIARY:12]Display_Time_To:54; <)
			
			$_ti_DisplayTimeTo:=[DIARY:12]Display_Time_To:54
			$_l_LastTimeNumber:=(Int:C8((($_ti_DisplayTimeTo*1)/60)/60))+1
			If ($_l_LastTimeNumber>24)
				$_l_LastTimeNumber:=24
				
			End if 
			
			$_l_TimeEnd:=(Int:C8((($_ti_SetEndTime*1)/60)/60))+1
			If ($_l_TimeEnd>24)
				$_l_TimeEnd:=24
				$_ti_SetEndTime:=?24:00:00?
			End if 
			
			$_l_WorkTimeEnd:=(Int:C8(((SD_ti_SettingsTimeEnd*1)/60)/60))+1
			If ($_l_WorkTimeEnd>24)
				$_l_WorkTimeEnd:=24
			End if 
			
			Case of 
				: ($_l_LastTimeNumber<$_l_TimeEnd)
					If ($_l_WorkTimeEnd<$_l_LastTimeNumber)
						$_l_Hour:=Int:C8((($_ti_SetEndTime*1)/60)/60)
					Else 
						$_l_Hour:=Int:C8(((SD_ti_SettingsTimeEnd*1)/60)/60)
					End if 
					
				Else 
					$_l_Hour:=Int:C8((($_ti_DisplayTimeTo*1)/60)/60)
					
			End case 
			//$_l_Hour1:=AG Get agenda start hour ($_l_AgendaArea)
			$_l_Hour1:=8
			If ($_l_Hour<$_l_Hour1)
				$_l_Hour:=$_l_Hour1+1
			End if 
			
			If ($_l_Hour>24)
				$_l_Hour:=24
			End if 
			SD_l_AgendaEndTime:=$_l_Hour
			SD_l_EndSlider:=SD_l_AgendaEndTime
			
		Else 
			$_l_Hour:=SD_l_AgendaEndTime
			SD_l_EndSlider:=SD_l_AgendaEndTime
			
		End if 
		If (SD_l_AgendaEndTime<10)
			SD_t_AgendaEndTime:="To 0"+String:C10(SD_l_AgendaEndTime)+"00 hrs"
		Else 
			SD_t_AgendaEndTime:="To "+String:C10(SD_l_AgendaEndTime)+"00 hrs"
		End if 
		
		//USE SET("AGTempSet_"+String(Current process))
		SD_bo_AgendaQueryDone:=True:C214
		
		SD_bo_AgendaQueryDone:=True:C214
		If (Not:C34(SD_bo_InAgendaHandler)) | (False:C215)
			USE SET:C118("AGTempSet_"+String:C10(Current process:C322))
			SD_bo_AgendaQueryDone:=True:C214
			
		End if 
		SD_bo_AgendaQueryDone:=False:C215
	End if 
	SET LIST PROPERTIES:C387(SD_l_HLDayTime; 1; 0; 14; 0)
	CLEAR SET:C117("AGTempSet_"+String:C10(Current process:C322))
Else 
	SD_SETViews
End if 
ERR_MethodTrackerReturn("SDiary_HL_DisplayDiary"; $_t_oldMethodName)
