//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_CalAct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateDoFrom; 0)
	ARRAY DATE:C224($_ad_DateDoneFrom; 0)
	ARRAY DATE:C224($_ad_DateDoneTo; 0)
	ARRAY DATE:C224($_ad_DateDoTo; 0)
	//ARRAY LONGINT(CAL_al_DiaryDays;0)
	ARRAY TIME:C1223($_ati_TimeDoFrom; 0)
	C_BOOLEAN:C305(<>SYS_bo_SDMonoCalendar)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_ActionDate; $_d_DateFrom; $_d_DateTo; vCalF; vCalT)
	C_LONGINT:C283($_l_BackgroundColour; $_l_CalendarIndex; $_l_CalenderDay; $_l_DayOffset; $_l_FontStyle; $_l_ForegroundColour; $_l_Index2; $_l_NumberofDays; $_l_RecordsInSelection; $_l_Today; $1)
	C_LONGINT:C283(SD3_l_CalendarStartDayNumber; vCalActions)
	C_POINTER:C301($_ptr_CalenderObject)
	C_TEXT:C284($_t_BackGroundColour; $_t_ForeGroundColour; $_t_oldMethodName; vUser2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CalAct")
//Diary_CalAct
If ((vCalActions=4) | ($1=1))
	Diary_CalActCl
	vCalActions:=2
End if 
If (vCalActions=1)
	Diary_CalActCl
Else 
	If (vCalActions=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=vUser2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=vCalF; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vCalT)
		CREATE SET:C116([DIARY:12]; "Master")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=vUser2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34>=vCalF; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vCalT)
		CREATE SET:C116([DIARY:12]; "Extra")
		UNION:C120("Master"; "Extra"; "Master")
		USE SET:C118("Master")
		$_l_RecordsInSelection:=Records in selection:C76([DIARY:12])
		ARRAY DATE:C224($_ad_DateDoFrom; $_l_RecordsInSelection)
		ARRAY DATE:C224($_ad_DateDoTo; $_l_RecordsInSelection)
		ARRAY DATE:C224($_ad_DateDoneFrom; $_l_RecordsInSelection)
		ARRAY DATE:C224($_ad_DateDoneTo; $_l_RecordsInSelection)
		ARRAY TIME:C1223($_ati_TimeDoFrom; $_l_RecordsInSelection)
		SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DateDoFrom; [DIARY:12]Date_Do_To:33; $_ad_DateDoTo; [DIARY:12]Date_Done_From:5; $_ad_DateDoneFrom; [DIARY:12]Date_Done_To:34; $_ad_DateDoneTo; [DIARY:12]Time_Do_From:6; $_ati_TimeDoFrom)
		
		For ($_l_CalendarIndex; 1; $_l_RecordsInSelection)
			If ($_ad_DateDoneFrom{$_l_CalendarIndex}>!00-00-00!)
				$_d_DateFrom:=$_ad_DateDoneFrom{$_l_CalendarIndex}
				$_d_DateTo:=$_ad_DateDoneTo{$_l_CalendarIndex}
			Else 
				$_d_DateFrom:=$_ad_DateDoFrom{$_l_CalendarIndex}
				$_d_DateTo:=$_ad_DateDoTo{$_l_CalendarIndex}
			End if 
			If ($_d_DateFrom=$_d_DateTo)
				$_d_ActionDate:=$_d_DateFrom
				If (($_d_ActionDate>=vCalF) & ($_d_ActionDate<=vCalT))
					$_l_DayOffset:=SD3_l_CalendarStartDayNumber+Day of:C23($_d_ActionDate)-1
					If (($_ati_TimeDoFrom{$_l_CalendarIndex}>(?00:00:00?)) & (CAL_al_DiaryDays{$_l_DayOffset}<100))
						CAL_al_DiaryDays{$_l_DayOffset}:=CAL_al_DiaryDays{$_l_DayOffset}+101
					Else 
						CAL_al_DiaryDays{$_l_DayOffset}:=CAL_al_DiaryDays{$_l_DayOffset}+1
					End if 
				End if 
			Else 
				$_l_NumberofDays:=$_d_DateTo-$_d_DateFrom+1
				For ($_l_Index2; 1; $_l_NumberofDays)
					$_d_ActionDate:=$_d_DateFrom+$_l_Index2-1
					If (($_d_ActionDate>=vCalF) & ($_d_ActionDate<=vCalT))
						$_l_DayOffset:=SD3_l_CalendarStartDayNumber+Day of:C23($_d_ActionDate)-1
						If (($_ati_TimeDoFrom{$_l_CalendarIndex}>(?00:00:00?)) & (CAL_al_DiaryDays{$_l_DayOffset}<100))
							
							CAL_al_DiaryDays{$_l_DayOffset}:=CAL_al_DiaryDays{$_l_DayOffset}+101
						Else 
							CAL_al_DiaryDays{$_l_DayOffset}:=CAL_al_DiaryDays{$_l_DayOffset}+1
						End if 
					End if 
				End for 
			End if 
		End for 
		vCalActions:=3
	End if 
	$_l_Today:=(Day of:C23(<>DB_d_CurrentDate))*Num:C11((Month of:C24(vCalF)=Month of:C24(<>DB_d_CurrentDate)) & (Year of:C25(vCalF)=Year of:C25(<>DB_d_CurrentDate)))
	$_l_CalendarIndex:=1
	While ($_l_CalendarIndex<38)
		IDLE:C311  // 03/04/03 pb
		If (CAL_al_DiaryDays{$_l_CalendarIndex}>0)
			$_l_CalenderDay:=CAL_al_DiaryDays{$_l_CalendarIndex}
			$_ptr_CalenderObject:=Get pointer:C304("vD"+String:C10($_l_CalendarIndex))
			If (<>SYS_bo_SDMonoCalendar)
				$_l_FontStyle:=0
				If ($_l_CalenderDay>100)
					$_l_CalenderDay:=$_l_CalenderDay-100
					$_l_FontStyle:=4
					OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle)
				End if 
				Case of 
					: ($_l_CalenderDay<6)
						OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle+1)
					: ($_l_CalenderDay<11)
						OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle+8)
					Else 
						OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle+16)
				End case 
			Else 
				If (($_l_CalendarIndex-SD3_l_CalendarStartDayNumber+1)=$_l_Today)
					$_l_FontStyle:=8
				Else 
					$_l_FontStyle:=0
				End if 
				If ($_l_CalenderDay>100)
					$_l_CalenderDay:=$_l_CalenderDay-100
					OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle+4)
				Else 
					OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; $_l_FontStyle)
				End if 
				Case of 
					: ($_l_CalenderDay<6)
						//_O_OBJECT SET COLOR($_ptr_CalenderObject->;-(9+61952))
						//OBJECT SET RGB COLORS($_ptr_CalenderObject->;9;(61952/256))
						$_t_ForeGroundColour:=UTIL_4DColorToRGB(9)
						$_t_BackGroundColour:=UTIL_4DColorToRGB(61952/256)
						OBJECT SET RGB COLORS:C628($_ptr_CalenderObject->; $_t_ForegroundColour; $_t_BackgroundColour)
						
					: ($_l_CalenderDay<11)
						//_O_OBJECT SET COLOR($_ptr_CalenderObject->;-(2+61952))
						//OBJECT SET RGB COLORS($_ptr_CalenderObject->;2;(61952/256))
						$_t_ForeGroundColour:=UTIL_4DColorToRGB(2)
						$_t_BackGroundColour:=UTIL_4DColorToRGB(61952/256)
						OBJECT SET RGB COLORS:C628($_ptr_CalenderObject->; $_t_ForegroundColour; $_t_BackgroundColour)
						
					Else 
						//_O_OBJECT SET COLOR($_ptr_CalenderObject->;-(3+61952))
						//OBJECT SET RGB COLORS($_ptr_CalenderObject->;3;(61952/256))
						$_t_ForeGroundColour:=UTIL_4DColorToRGB(3)
						$_t_BackGroundColour:=UTIL_4DColorToRGB(61952/256)
						OBJECT SET RGB COLORS:C628($_ptr_CalenderObject->; $_t_ForegroundColour; $_t_BackgroundColour)
						
				End case 
			End if 
		Else 
			If ($_l_Today#0)
				If (($_l_CalendarIndex-SD3_l_CalendarStartDayNumber+1)=$_l_Today)
					$_ptr_CalenderObject:=Get pointer:C304("vD"+String:C10($_l_CalendarIndex))
					OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; 8)
				End if 
			End if 
		End if 
		$_l_CalendarIndex:=$_l_CalendarIndex+1
	End while 
End if 
ERR_MethodTrackerReturn("Diary_CalAct"; $_t_oldMethodName)