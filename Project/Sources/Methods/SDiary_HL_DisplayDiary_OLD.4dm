//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_HL_DisplayDiary_OLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2010 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_DoneStatus;0)
	ARRAY DATE:C224($_ad_DayDates; 0)
	//ARRAY DATE(SD_ad_DateStampValues;0)
	//ARRAY DATE(SD_ad_SortDate;0)
	//ARRAY LONGINT(SD_al_AppointmentRecordIDs;0)
	//ARRAY LONGINT(SD_al_DateStamp;0)
	//ARRAY LONGINT(SD_al_EventRecordIDs;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY LONGINT(SD_al_Time;0)
	//ARRAY LONGINT(SD_al_Time2;0)
	//ARRAY LONGINT(SD_al_ToDoRecordIDs;0)
	ARRAY TEXT:C222($_at_DayStrings; 0)
	ARRAY TEXT:C222($_at_StartDayName; 0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_AppointmentSort;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_EventSort;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ItemPerson;0)
	//ARRAY TEXT(SD_at_ToDoSort;0)
	C_DATE:C307($1; $2; $SD_DateVar; SD_D_CurrentviewDate; SD_d_GetDate; SD_d_MonthBeginDate; SD_d_MonthEndDate; vDateGet2; vDateGetTest; WS_d_DiaryDate1; WS_d_DiaryDate2)
	C_DATE:C307(WS_d_DiaryDate3; WS_d_DiaryDate4; WS_d_DiaryDate5; WS_d_DiaryDate6; WS_d_DiaryDate7)
	C_LONGINT:C283($_l_AppointmentElement; $_l_CountMonthTime; $_l_CountMonthTimeItems; $_l_CountQuery; $_l_CountQueryItems; $_l_CountTask; $_l_CountTaskItems; $_l_CountTodo; $_l_CountTodoItems; $_l_CurrentElement; $_l_CurrentElement2)
	C_LONGINT:C283($_l_CurrentTime; $_l_DateRow; $_l_DayRow; $_l_EventElement; $_l_Index; $_l_Index2; $_l_ListCount; $_l_Section; $_l_TOdoElement; $s; SD_l_AppointmentsortDirection)
	C_LONGINT:C283(SD_l_AppointmentSortOrder; SD_l_CurrentMonth; SD_l_DayTaskItems; SD_l_DiaryQuery; SD_l_DiaryView1; SD_l_DiaryView2; SD_l_DiaryView3; SD_l_DiaryView4; SD_l_EventSortDirection; SD_l_EventSortOrder; SD_l_FirstRun)
	C_LONGINT:C283(SD_l_HLDays2; SD_l_HLDayTime; SD_l_HLDayToDoItems; SD_l_HLMonthRefNUM; SD_l_StartOfPeriod; SD_l_ToSortDirection; SD_l_ToSortOrder; SD3_l_DiaryActionNum)
	C_TEXT:C284($_t_ApplicationVersion; $_t_EmailTextValues; $_t_EmailTextValues2; $_t_ItemText; $_t_oldMethodName; $_t_PersonText; SD_t_CurrentDiaryInitials; SD_t_DiaryCode; SD_t_DiaryDefaultUser; WS_t_DiaryDate2)
	C_TIME:C306(SD_ti_GetTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDiary_HL_DisplayDiary_OLD")
//If (False)
//SDIARY_HL_DisplayDiary
//$1= Start Date
//$2= End Date
//here test if we are looking at current week/month day


If (Is a list:C621(SD_l_HLDayToDoItems))
	CLEAR LIST:C377(SD_l_HLDayToDoItems; *)
End if 
If (Is a list:C621(SD_l_HLDayTime))
	CLEAR LIST:C377(SD_l_HLDayTime; *)
End if 
If (Is a list:C621(SD_l_DayTaskItems))
	CLEAR LIST:C377(SD_l_DayTaskItems; *)
End if 
If (Is a list:C621(SD_l_DiaryQuery))
	CLEAR LIST:C377(SD_l_DiaryQuery; *)
End if 
If (Is a list:C621(SD_l_HLDays2))
	CLEAR LIST:C377(SD_l_HLDays2; *)
End if 
If (Is a list:C621(SD_l_HLDayToDoItems))
	CLEAR LIST:C377(SD_l_HLDayToDoItems; *)
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
$_l_CurrentTime:=((Current time:C178*1)*60)



ARRAY TEXT:C222($_at_StartDayName; 7)
$_at_StartDayName{1}:="Sunday"
$_at_StartDayName{2}:="Monday"
$_at_StartDayName{3}:="Tuesday"
$_at_StartDayName{4}:="Wednesday"
$_at_StartDayName{5}:="Thursday"
$_at_StartDayName{6}:="Friday"
$_at_StartDayName{7}:="Saturday"
If (SD_l_FirstRun=0)
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

ARRAY LONGINT:C221(SD_al_EventRecordIDs; 0)
ARRAY LONGINT:C221(SD_al_AppointmentRecordIDs; 0)
ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; 0)
ARRAY LONGINT:C221(SD_al_EventRecordIDs; 100)
ARRAY LONGINT:C221(SD_al_AppointmentRecordIDs; 100)
ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; 100)

//What we are going to do here now is first divide up the selection
//then sort the selection for each section
//then build the list
$_l_EventElement:=0
$_l_AppointmentElement:=0
$_l_TOdoElement:=0


//*****************************************************
//*****************************************************
OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
OBJECT SET VISIBLE:C603(*; "Text25"; False:C215)
OBJECT SET VISIBLE:C603(*; "Text26"; False:C215)
OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)



If (Size of array:C274(SD_ad_DateStampValues)>0)
	vDateGetTest:=SD_ad_DateStampValues{Size of array:C274(SD_ad_DateStampValues)}
	//-- Monthly View List (hlMONTH) -------------------------
	SD_l_CurrentMonth:=Month of:C24(SD_D_CurrentviewDate)
	//-- Daily List 2 (hlMONTHS) -------------------------
	SD_l_HLDayToDoItems:=0
	
	
	SD_l_HLDayToDoItems:=New list:C375  //Create a new empty hierarchical list for Diary Todo Items
	SD_l_HLDayTime:=0
	SD_l_HLDayTime:=New list:C375  // Create a new empty hierarchical list for Day Headers
	SD_l_DayTaskItems:=0
	SD_l_DayTaskItems:=New list:C375  //Create a new empty hierarchical list for Diary Task
	SD_l_DiaryQuery:=0
	SD_l_DiaryQuery:=New list:C375
	ARRAY TEXT:C222($_at_DayStrings; 0)
	ARRAY TEXT:C222($_at_DayStrings; 1000)
	ARRAY DATE:C224($_ad_DayDates; 0)
	ARRAY DATE:C224($_ad_DayDates; 1000)
	$_l_CurrentElement:=0
	If (False:C215)
		For ($_l_Index; 1; Size of array:C274(SD_ad_DateStampValues))
			Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_d_GetDate; ->SD_ti_GetTime)
			If (SD_ad_DateStampValues{$_l_Index}#!00-00-00!)
				$_l_DayRow:=Find in array:C230($_ad_DayDates; SD_d_GetDate)
				If ($_l_DayRow<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					If ($_l_CurrentElement>Size of array:C274($_at_DayStrings))
						INSERT IN ARRAY:C227($_at_DayStrings; $_l_CurrentElement; 1000)
						INSERT IN ARRAY:C227($_ad_DayDates; $_l_CurrentElement; 1000)
					End if 
					$_at_DayStrings{$_l_CurrentElement}:=String:C10(Day of:C23(SD_d_GetDate); "00")+"  "+Uppercase:C13($_at_StartDayName{Day number:C114(SD_d_GetDate)})  //day number (01) and day name (sunday)=01 SUNDAY
					$_ad_DayDates{$_l_CurrentElement}:=SD_d_GetDate
				End if 
			End if 
		End for 
	End if 
	// ARRAY STRING(100;$_at_DayStrings;$_l_CurrentElement)
	SD_d_GetDate:=!00-00-00!
	For ($_l_Index; 1; Size of array:C274(SD_ad_DateStampValues))
		
		SD_l_HLDays2:=0
		SD_l_HLDays2:=New list:C375  //Create a new empty hierarchical list for Diary Item descr
		Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_ad_SortDate{$_l_Index}; ->SD_ti_GetTime)
		$_l_CurrentElement2:=0
		If (SD_ad_DateStampValues{$_l_Index}#!00-00-00!)
			$_l_DayRow:=Find in array:C230($_ad_DayDates; SD_ad_SortDate{$_l_Index})
			If ($_l_DayRow<0)
				$_l_CurrentElement:=$_l_CurrentElement+1
				If ($_l_CurrentElement>Size of array:C274($_at_DayStrings))
					INSERT IN ARRAY:C227($_at_DayStrings; $_l_CurrentElement; 1000)
					INSERT IN ARRAY:C227($_ad_DayDates; $_l_CurrentElement; 1000)
				End if 
				$_at_DayStrings{$_l_CurrentElement}:=String:C10(Day of:C23(SD_ad_SortDate{$_l_Index}); "00")+"  "+Uppercase:C13($_at_StartDayName{Day number:C114(SD_ad_SortDate{$_l_Index})})  //day number (01) and day name (sunday)=01 SUNDAY
				$_ad_DayDates{$_l_CurrentElement}:=SD_ad_SortDate{$_l_Index}
				$_l_CurrentElement2:=$_l_CurrentElement
			Else 
				$_l_CurrentElement2:=0
			End if 
		End if 
		If ($_l_CurrentElement2>0)
			
			
			$_l_DateRow:=Find in array:C230(SD_ad_SortDate; $_ad_DayDates{$_l_CurrentElement2})
			For ($_l_Index2; $_l_DateRow; Size of array:C274(SD_ad_DateStampValues))
				Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index2}; ->SD_ad_SortDate{$_l_Index2}; ->SD_ti_GetTime)
				If (SD_ad_SortDate{$_l_Index2}=$_ad_DayDates{$_l_CurrentElement2})
					If ($_l_Index2>$_l_Index)
						$_l_Index:=$_l_Index2
					End if 
					
					SD_d_GetDate:=SD_ad_SortDate{$_l_Index2}
					WS_t_DiaryDate2:=String:C10(Day of:C23(SD_ad_SortDate{$_l_Index2}); "00")+"  "+Uppercase:C13($_at_StartDayName{Day number:C114(SD_ad_SortDate{$_l_Index2})})  //day number (01) and day name (sunday)=01 SUNDAY
					Case of 
						: (SD3_l_DiaryActionNum#0)  //for the QUERY list
							$_l_AppointmentElement:=$_l_AppointmentElement+1
							If (Size of array:C274(SD_al_AppointmentRecordIDs)<$_l_AppointmentElement)
								INSERT IN ARRAY:C227(SD_al_AppointmentRecordIDs; Size of array:C274(SD_al_AppointmentRecordIDs)+1; 100)
							End if 
							SD_al_AppointmentRecordIDs{$_l_AppointmentElement}:=SD_al_RecordNumbers{$_l_Index2}
							$_t_ItemText:=""
							If (Length:C16(SD_at_ItemPerson{$_l_Index2})<3)
								$_t_PersonText:=SD_at_ItemPerson{$_l_Index2}+(" "*(3-Length:C16(SD_at_ItemPerson{$_l_Index2})))+" "
							Else 
								$_t_PersonText:=SD_at_ItemPerson{$_l_Index2}
							End if 
							If (Num:C11($_t_ApplicationVersion)<670)
								If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
									$_t_ItemText:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_PersonText+" :"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 20)  //create: diary item time and description
								Else 
									$_t_ItemText:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_PersonText+" :"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 20)  //create: diary item time and description
								End if 
							Else 
								If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
									$_t_ItemText:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_PersonText+" :"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 240)  //create: diary item time and description
								Else 
									$_t_ItemText:=String:C10(SD_ad_SortDate{$_l_Index2}; 4)+" :"+$_t_PersonText+" :"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 240)  //create: diary item time and description
								End if 
							End if 
							APPEND TO LIST:C376(SD_l_DiaryQuery; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2}; 0; False:C215)
							If ($_t_ItemText#"")
								SET LIST ITEM PROPERTIES:C386(SD_l_DiaryQuery; 0; False:C215; Plain:K14:1; 0)
							End if 
							If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
								SD_l_DiaryView4:=1
							End if 
						Else 
							$_l_Section:=2
							$_l_DayRow:=Find in array:C230(SD_at_DiaryOwners; SD_t_CurrentDiaryInitials)
							If ($_l_DayRow<0)
								$_l_DayRow:=0
							End if 
							Case of 
								: (SD_al_PersonClass{$_l_DayRow}=3)
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
									$_l_EventElement:=$_l_EventElement+1
									If (Size of array:C274(SD_al_EventRecordIDs)<$_l_EventElement)
										INSERT IN ARRAY:C227(SD_al_EventRecordIDs; Size of array:C274(SD_al_EventRecordIDs)+1; 100)
									End if 
									SD_al_EventRecordIDs{$_l_EventElement}:=SD_al_RecordNumbers{$_l_Index2}
									$_t_ItemText:=""
									If (Num:C11($_t_ApplicationVersion)<670)
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 25)  //create: diary item time and description
										Else 
											$_t_ItemText:=Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 25)  //create: diary item time and description
										End if 
									Else 
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 240)  //create: diary item time and description
										Else 
											$_t_ItemText:=Time string:C180(SD_al_Time{$_l_Index2})+"-"+Time string:C180(SD_al_Time2{$_l_Index2})+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 240)  //create: diary item time and description
										End if 
									End if 
									APPEND TO LIST:C376(SD_l_HLDayToDoItems; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2}; 0; False:C215)
									If ($_t_ItemText#"")
										SET LIST ITEM PROPERTIES:C386(SD_l_HLDayToDoItems; 0; False:C215; Plain:K14:1; 0)
									End if 
									If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
										SD_l_DiaryView1:=1
									End if 
								: ($_l_Section=2)
									$_t_ItemText:=""
									If (Num:C11($_t_ApplicationVersion)<670)
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 25)  //create: diary item time and description
										Else 
											$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 25)  //create: diary item time and description
										End if 
									Else 
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 240)  //create: diary item time and description
										Else 
											$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 240)  //create: diary item time and description
										End if 
									End if 
									APPEND TO LIST:C376(SD_l_HLDays2; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2})  //add to the Diary Items List
									$_l_ListCount:=$_l_ListCount+1
									If ($_t_ItemText#"")
										SET LIST ITEM PROPERTIES:C386(SD_l_HLDays2; 0; False:C215; Plain:K14:1; 0)
									End if 
									If (SD_t_DiaryCode=SD_at_ItemActionCode{$_l_Index2})
										SD_l_DiaryView2:=1
									End if 
								: ($_l_Section=3)  //if date, but no time: add item to "SD_l_DayTaskItems" list
									$_l_TOdoElement:=$_l_TOdoElement+1
									If (Size of array:C274(SD_al_ToDoRecordIDs)<$_l_TOdoElement)
										INSERT IN ARRAY:C227(SD_al_ToDoRecordIDs; Size of array:C274(SD_al_ToDoRecordIDs)+1; 100)
									End if 
									SD_al_ToDoRecordIDs{$_l_TOdoElement}:=SD_al_RecordNumbers{$_l_Index2}
									$_t_ItemText:=""
									If (Num:C11($_t_ApplicationVersion)<670)
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 25)  //create: diary item time and description
										Else 
											$_t_ItemText:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 25)  //create: diary item time and description
										End if 
									Else 
										If ((SD_abo_DoneStatus{$_l_Index2}) & (SD_at_ActionDetails2{$_l_Index2}#"")) | (SD_at_ActionDetails{$_l_Index2}="")
											$_t_ItemText:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails2{$_l_Index2}; 1; 240)  //create: diary item time and description
										Else 
											$_t_ItemText:=String:C10(SD_ad_DateStampValues{$_l_Index2}; 4)+":"+SD_at_ItemActionCode{$_l_Index2}+" :"+Substring:C12(SD_at_ActionDetails{$_l_Index2}; 1; 240)  //create: diary item time and description
										End if 
									End if 
									APPEND TO LIST:C376(SD_l_DayTaskItems; $_t_ItemText; SD_al_RecordNumbers{$_l_Index2}; 0; False:C215)
									If ($_t_ItemText#"")
										SET LIST ITEM PROPERTIES:C386(SD_l_DayTaskItems; 0; False:C215; Plain:K14:1; 0)
									End if 
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
			If ($_l_ListCount>0)
				SD_l_HLMonthRefNUM:=SD_l_HLDays2+$_l_CurrentElement2
				APPEND TO LIST:C376(SD_l_HLDayTime; $_at_DayStrings{$_l_CurrentElement2}; SD_l_HLMonthRefNUM; SD_l_HLDays2; True:C214)
				SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Bold:K14:2; 0)
				$_l_ListCount:=0
			Else 
				If (Is a list:C621(SD_l_HLDays2))
					CLEAR LIST:C377(SD_l_HLDays2; *)
				End if 
				
			End if 
		End if 
		
	End for 
	
	ARRAY TEXT:C222($_at_DayStrings; $_l_CurrentElement)
	
	Case of 
		: (SD_l_DiaryView1=1)
			$_l_DayRow:=Find in array:C230(SD_at_ItemActionCode{$_l_Index2}; SD_t_DiaryCode)
			If ($_l_DayRow>0)
				If (Is a list:C621(SD_l_HLDayToDoItems))
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayToDoItems; SD_al_RecordNumbers{$_l_DayRow})
				End if 
			End if 
			
		: (SD_l_DiaryView2=1)
			$_l_DayRow:=Find in array:C230(SD_at_ItemActionCode; SD_t_DiaryCode)
			If ($_l_DayRow>0)
				If (Is a list:C621(SD_l_HLDays2))
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDays2; SD_al_RecordNumbers{$_l_DayRow})
				End if 
			End if 
		: (SD_l_DiaryView3=1)
			$_l_DayRow:=Find in array:C230(SD_at_ItemActionCode; SD_t_DiaryCode)
			If ($_l_DayRow>0)
				If (Is a list:C621(SD_l_DayTaskItems))
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_DayTaskItems; SD_al_RecordNumbers{$_l_DayRow})
				End if 
			End if 
			
		: (SD_l_DiaryView4=1)
			$_l_DayRow:=Find in array:C230(SD_at_ItemActionCode; SD_t_DiaryCode)
			If ($_l_DayRow>0)
				If (Is a list:C621(SD_l_DiaryQuery))
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_DiaryQuery; SD_al_RecordNumbers{$_l_DayRow})
				End if 
			End if 
			
		Else 
			SD_l_DiaryView1:=0
			SD_l_DiaryView2:=0
			SD_l_DiaryView3:=0
			SD_l_DiaryView4:=0
	End case 
	$_l_CountTodoItems:=Count list items:C380(SD_l_HLDayToDoItems)
	If ($_l_CountTodoItems<1)
		$_l_CountTodo:=$_l_CountTodoItems+1
		APPEND TO LIST:C376(SD_l_HLDayToDoItems; "No Events..."; $_l_CountTodo; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_HLDayToDoItems; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
	Else 
		SORT LIST:C391(SD_l_HLDayToDoItems; >)
	End if 
	$_l_CountMonthTimeItems:=Count list items:C380(SD_l_HLDayTime)
	If ($_l_CountMonthTimeItems<1)
		$_l_CountMonthTime:=$_l_CountMonthTimeItems+1
		APPEND TO LIST:C376(SD_l_HLDayTime; "No Appointments..."; $_l_CountMonthTime; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
	Else 
		
	End if 
	$_l_CountTaskItems:=Count list items:C380(SD_l_DayTaskItems)
	If ($_l_CountTaskItems<1)
		$_l_CountTask:=$_l_CountTaskItems+1
		APPEND TO LIST:C376(SD_l_DayTaskItems; "No Tasks..."; $_l_CountTask; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_DayTaskItems; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
	Else 
		SORT LIST:C391(SD_l_DayTaskItems; <)
		
		
	End if 
	$_l_CountQueryItems:=Count list items:C380(SD_l_DiaryQuery)
	If ($_l_CountQueryItems<1)
		$_l_CountQuery:=$_l_CountQueryItems+1
		APPEND TO LIST:C376(SD_l_DiaryQuery; "No Query Matches..."; $_l_CountQuery; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_DiaryQuery; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
	Else 
		
	End if 
	//////////_o_REDRAW LIST(SD_l_HLDayToDoItems)
	//////////_o_REDRAW LIST(SD_l_HLDayTime)
	//////////_o_REDRAW LIST(SD_l_DayTaskItems)
	//////////_o_REDRAW LIST(SD_l_DiaryQuery)
	
Else 
	
	
	SD_l_HLDayToDoItems:=0
	SD_l_HLDayToDoItems:=New list:C375  //Create a new empty hierarchical list for Diary Todo Items
	SD_l_HLDayTime:=0
	SD_l_HLDayTime:=New list:C375  // Create a new empty hierarchical list for Day Headers
	SD_l_DayTaskItems:=0
	SD_l_DayTaskItems:=New list:C375  //Create a new empty hierarchical list for Diary Task
	SD_l_DiaryQuery:=0
	SD_l_DiaryQuery:=New list:C375  //Create a new empty hierarchical list for Querys List
	$_l_CountTodoItems:=Count list items:C380(SD_l_HLDayToDoItems)
	If ($_l_CountTodoItems<1)
		$_l_CountTodo:=$_l_CountTodoItems+1
		APPEND TO LIST:C376(SD_l_HLDayToDoItems; "No Events..."; $_l_CountTodo; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_HLDayToDoItems; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
		
	End if 
	$_l_CountMonthTimeItems:=Count list items:C380(SD_l_HLDayTime)
	If ($_l_CountMonthTimeItems<1)
		$_l_CountMonthTime:=$_l_CountMonthTimeItems+1
		APPEND TO LIST:C376(SD_l_HLDayTime; "No Appointments..."; $_l_CountMonthTime; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
		
	End if 
	$_l_CountTaskItems:=Count list items:C380(SD_l_DayTaskItems)
	If ($_l_CountTaskItems<1)
		$_l_CountTask:=$_l_CountTaskItems+1
		APPEND TO LIST:C376(SD_l_DayTaskItems; "No Tasks..."; $_l_CountTask; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_DayTaskItems; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
		
	End if 
	$_l_CountQueryItems:=Count list items:C380(SD_l_DiaryQuery)
	If ($_l_CountQueryItems<1)
		$_l_CountQuery:=$_l_CountQueryItems+1
		APPEND TO LIST:C376(SD_l_DiaryQuery; "No Query Matches..."; $_l_CountQuery; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SD_l_DiaryQuery; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
		
	End if 
	//////////_o_REDRAW LIST(SD_l_HLDayToDoItems)
	//////////_o_REDRAW LIST(SD_l_HLDayTime)
	//////////_o_REDRAW LIST(SD_l_DayTaskItems)
	//////////_o_REDRAW LIST(SD_l_DiaryQuery)
End if 

ARRAY LONGINT:C221(SD_al_EventRecordIDs; $_l_EventElement)
ARRAY LONGINT:C221(SD_al_AppointmentRecordIDs; $_l_AppointmentElement)
ARRAY LONGINT:C221(SD_al_ToDoRecordIDs; $_l_TOdoElement)

//$t2:=((Current time*1)*60)
//MESSAGE("display arrays took"+String($t2-$_l_CurrentTime)+" MIlliseconds")
//SD_Display_Array (SD_d_StartDate;SD_d_EndDate)
If (False:C215)
	SD_HL_Sort
	
End if 

//$t3:=((Current time*1)*60)
//MESSAGE("Sorting took"+String($t3-$t2)+" MIlliseconds")
//Else
//SD_DiaryDisplay_setupHL
//End if
ERR_MethodTrackerReturn("SDiary_HL_DisplayDiary_OLD"; $_t_oldMethodName)
