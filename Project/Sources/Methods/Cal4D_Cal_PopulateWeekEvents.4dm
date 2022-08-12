//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_PopulateWeekEvents
	//------------------ Method Notes ------------------
	//local_variable_declarations
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:42`Method: Cal4D_Cal_PopulateWeekEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllDayEndDate; 0)
	ARRAY DATE:C224($_ad_AllDayStartDate; 0)
	ARRAY DATE:C224($_ad_BnrEndDate; 0)
	ARRAY DATE:C224($_ad_BnrStartDate; 0)
	//ARRAY DATE(CAL_ad_EndDate;0)
	//ARRAY DATE(CAL_ad_StartDate;0)
	//ARRAY DATE(CAL_ad_WeekDates;0)
	ARRAY LONGINT:C221($_al_AllDayColor; 0)
	ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
	ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
	ARRAY LONGINT:C221($_al_BnrColor; 0)
	ARRAY LONGINT:C221($_al_BnrEndTime; 0)
	ARRAY LONGINT:C221($_al_BnrStartTime; 0)
	//ARRAY LONGINT(CAL_al_Colour;0)
	//ARRAY LONGINT(CAL_al_WeekOrdinals;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD2_al_CurrentDiaryPerson;0)
	ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
	ARRAY TEXT:C222($_at_AllDayEventType; 0)
	ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
	ARRAY TEXT:C222($_at_AllDayTitle; 0)
	ARRAY TEXT:C222($_at_AttNames; 0)
	ARRAY TEXT:C222($_at_AttValues; 0)
	ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
	ARRAY TEXT:C222($_at_BnrEventType; 0)
	ARRAY TEXT:C222($_at_BnriCalUID; 0)
	ARRAY TEXT:C222($_at_BnrNames; 0)
	ARRAY TEXT:C222($_at_BnrRefs; 0)
	ARRAY TEXT:C222($_at_BnrTitle; 0)
	ARRAY TEXT:C222($_at_BnrTypes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	//ARRAY TEXT(CAL_at_ActionCode;0)
	//ARRAY TEXT(CAL_at_iCalUUID;0)
	//ARRAY TEXT(CAL_at_TimeZone;0)
	//ARRAY TEXT(CAL_at_Title;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_DiaryCode;0)
	//ARRAY TEXT(Tmp_at_Names;0)
	//ARRAY TEXT(Tmp_at_RefID;0)
	//ARRAY TIME(CAL_ati_StartTime;0)
	//ARRAY TIME(CAL_ati_TimeEnd;0)
	C_BLOB:C604($_blb_WorkingBLOB)
	C_BOOLEAN:C305(SD2_bo_ScheduleActionsInited)
	C_LONGINT:C283($_l_15MinIncrements; $_l_ActionCodeRow; $_l_ArraySize; $_l_Blue; $_l_CellRow; $_l_CharacterPosition; $_l_Colour; $_l_ColumnLeft; $_l_ColumnWIdth; $_l_DayIndex; $_l_Green)
	C_LONGINT:C283($_l_Height; $_l_Hour; $_l_Indents; $_l_Index; $_l_Index2; $_l_LastBottom; $_l_Minutes; $_l_ObjectLeft; $_l_ObjectTop; $_l_Offset; $_l_OffsetIndent)
	C_LONGINT:C283($_l_RecordsInSelection; $_l_Red; $_l_SizeofArray; $_l_Width; SD_l_priorityQuery; SD_l_SettingsTimeLen; SD2_l_DiaryInstanceUID; SD2_l_IncludeCompleted)
	C_TEXT:C284($_t_CellID; $_t_EventTitle; $_t_ObjRef; $_t_oldMethodName; $_t_RGBColor; $_t_SQL; CAL_t_DiaryCode; Cal_t_DisplayFont; Cal_t_WeekRef; SD2_t_ActionCodeTemp; SVG_t_Ref_Week)
	C_TIME:C306($_ti_EndTime; $_ti_InitialStartTime; $_ti_StartTime; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_PopulateWeekEvents")


If (True:C214)
	ARRAY TEXT:C222(Tmp_at_RefID; 0)
	Tmp_at_RefID:=0
	ARRAY TEXT:C222(Tmp_at_Names; 0)
	
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	SVG_ELEMENTS_TO_ARRAYS(SVG_t_Ref_Week; ->$_at_Refs; ->$_at_Types; ->$_at_Names)
	
	ARRAY TEXT:C222($_at_BnrRefs; 0)
	ARRAY TEXT:C222($_at_BnrTypes; 0)
	ARRAY TEXT:C222($_at_BnrNames; 0)
	SVG_ELEMENTS_TO_ARRAYS(Cal_t_WeekRef; ->$_at_BnrRefs; ->$_at_BnrTypes; ->$_at_BnrNames)
End if 

//========================    Method Actions    ==================================
SD2_LoadSchedule(SD2_l_DiaryInstanceUID; 0; CAL_ad_WeekDates{1}; CAL_ad_WeekDates{Size of array:C274(CAL_ad_WeekDates)}; ->SD2_al_CurrentDiaryPerson; SD2_l_IncludeCompleted; SD_l_priorityQuery)
CREATE SET:C116([SF_DiaryView:184]; "$CurrentWeek")

For ($_l_DayIndex; 1; 7)
	//Cal4D_Cal_GetEventsForOneDay (CAL_ad_WeekDates{$_l_DayIndex})
	USE SET:C118("$CurrentWeek")
	QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayDateStart:4=CAL_ad_WeekDates{$_l_DayIndex})
	//```
	If (Not:C34(SD2_bo_ScheduleActionsInited))
		SD2_GetActionsRangeByLocation("Schedule")
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
		SD2_bo_ScheduleActionsInited:=True:C214
	End if 
	
	SELECTION TO ARRAY:C260([SF_DiaryView:184]Diary_DisplayTimeStart:6; CAL_ati_StartTime; [SF_DiaryView:184]Diary_DisplayTimeEnd:7; CAL_ati_TimeEnd; [SF_DiaryView:184]DiaryView_UUID:1; CAL_at_iCalUUID; [SF_DiaryView:184]Diary_DisplayDateStart:4; CAL_ad_StartDate; [SF_DiaryView:184]Diary_DIsplayDateEnd:5; CAL_ad_EndDate; [SF_DiaryView:184]DiaryView_DiaryID:3; SD2_at_DiaryCode)
	$_ti_InitialStartTime:=SD_ti_SettingsTimeStart
	If ($_ti_InitialStartTime=?00:00:00?)
		$_ti_InitialStartTime:=?09:00:00?
	End if 
	For ($_l_Index; 1; Size of array:C274(CAL_ati_StartTime))
		
		If (CAL_ati_StartTime{$_l_Index}=0)
			CAL_ati_StartTime{$_l_Index}:=$_ti_InitialStartTime*1
			If ([DIARY:12]Diary_Code:3#SD2_at_DiaryCode{$_l_Index})
				
				CAL_t_DiaryCode:=SD2_at_DiaryCode{$_l_Index}
				SD2_t_ActionCodeTemp:=""
				$_t_SQL:="SELECT "+"Action_Code"
				$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
				$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code =:CAL_t_DiaryCode"
				$_t_SQL:=$_t_SQL+" INTO :SD2_t_ActionCodeTemp;"
				Begin SQL
					EXECUTE IMMEDIATE :$_t_SQL
				End SQL
				//ALL RECORDS([DIARY])
				//QUERY SELECTION([DIARY];[DIARY]Diary_Code=SD2_at_DiaryCode{$_l_Index})
			Else 
				SD2_t_ActionCodeTemp:=[DIARY:12]Action_Code:9
			End if 
			
			$_l_ActionCodeRow:=Find in array:C230(SD_at_ActionCodes; [DIARY:12]Action_Code:9)
			If ($_l_ActionCodeRow<0)
				CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStartTime+SD_l_SettingsTimeLen
			Else 
				If (SD_al_ActionTime{$_l_ActionCodeRow}>0)
					CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStartTime+SD_al_ActionTime{$_l_ActionCodeRow}
				Else 
					CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStartTime+SD_l_SettingsTimeLen
				End if 
			End if 
			$_ti_InitialStartTime:=CAL_ati_TimeEnd{$_l_Index}+1
		End if 
	End for 
	
	ARRAY LONGINT:C221(CAL_al_Colour; 0)
	ARRAY TEXT:C222(CAL_at_TimeZone; 0)
	ARRAY TEXT:C222(CAL_at_ActionCode; 0)
	ARRAY TEXT:C222(CAL_at_Title; 0)
	$_l_ArraySize:=Size of array:C274(CAL_ati_StartTime)
	ARRAY LONGINT:C221(CAL_al_Colour; $_l_ArraySize)
	ARRAY TEXT:C222(CAL_at_TimeZone; $_l_ArraySize)
	ARRAY TEXT:C222(CAL_at_ActionCode; $_l_ArraySize)
	ARRAY TEXT:C222(CAL_at_Title; $_l_ArraySize)
	For ($_l_Index; 1; Size of array:C274(CAL_ati_StartTime))
		If ([DIARY:12]Diary_Code:3#SD2_at_DiaryCode{$_l_Index})
			
			CAL_t_DiaryCode:=SD2_at_DiaryCode{$_l_Index}
			SD2_t_ActionCodeTemp:=""
			$_t_SQL:="SELECT "+"Action_Code"
			$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
			$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code =:CAL_t_DiaryCode"
			$_t_SQL:=$_t_SQL+" INTO :SD2_t_ActionCodeTemp"
			Begin SQL
				EXECUTE IMMEDIATE :$_t_SQL;
			End SQL
		Else 
			SD2_t_ActionCodeTemp:=[DIARY:12]Action_Code:9
		End if 
		$_l_ActionCodeRow:=Find in array:C230(SD2_at_ActionCodes; SD2_t_ActionCodeTemp)
		If ($_l_ActionCodeRow>0)
			CAL_at_ActionCode{$_l_Index}:=SD2_at_ActionNames{$_l_ActionCodeRow}
		Else 
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
			CAL_at_ActionCode{$_l_Index}:=[ACTIONS:13]Action_Name:2
		End if 
		$_l_Red:=[DIARY:12]AGFillColourRed:57
		$_l_Blue:=[DIARY:12]AGFillColourBlue:59
		$_l_Green:=[DIARY:12]AGFillColourGreen:58
		$_l_Colour:=0
		CAL_al_Colour{$_l_Index}:=0
		CAL_at_Title{$_l_Index}:=[DIARY:12]Subject:63
		If (CAL_at_Title{$_l_Index}="")
			CAL_at_Title{$_l_Index}:=Substring:C12([DIARY:12]Action_Details:10; 1; 64)
		End if 
		
	End for 
	
	If (True:C214)
		// //  Parse out Banner and All-Day events from the Appointments
		//{
		ARRAY LONGINT:C221($_al_BnrStartTime; 0)
		ARRAY LONGINT:C221($_al_BnrEndTime; 0)
		ARRAY TEXT:C222($_at_BnrTitle; 0)
		ARRAY TEXT:C222($_at_BnrEventType; 0)
		ARRAY TEXT:C222($_at_BnriCalUID; 0)
		ARRAY LONGINT:C221($_al_BnrColor; 0)
		ARRAY DATE:C224($_ad_BnrStartDate; 0)
		ARRAY DATE:C224($_ad_BnrEndDate; 0)
		ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
		
		ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
		ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
		ARRAY TEXT:C222($_at_AllDayTitle; 0)
		ARRAY TEXT:C222($_at_AllDayEventType; 0)
		ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
		ARRAY LONGINT:C221($_al_AllDayColor; 0)
		ARRAY DATE:C224($_ad_AllDayStartDate; 0)
		ARRAY DATE:C224($_ad_AllDayEndDate; 0)
		ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
		
		SET BLOB SIZE:C606($_blb_WorkingBLOB; 0)
		CAL4D_VarstoBlob(->$_blb_WorkingBLOB; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
		
		Cal4D_ParseArrays(->$_blb_WorkingBLOB)
		
		$_l_Offset:=0
		$_l_Offset:=CAL4D_GetVarsFromBlob($_l_Offset; ->$_blb_WorkingBLOB; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
		$_l_Offset:=CAL4D_GetVarsFromBlob($_l_Offset; ->$_blb_WorkingBLOB; ->$_al_BnrStartTime; ->$_al_BnrEndTime; ->$_at_BnrTitle; ->$_at_BnrEventType; ->$_at_BnriCalUID; ->$_al_BnrColor; ->$_ad_BnrStartDate; ->$_ad_BnrEndDate; ->$_at_BnrCALTimeZone)
		$_l_Offset:=CAL4D_GetVarsFromBlob($_l_Offset; ->$_blb_WorkingBLOB; ->$_al_AllDayStartTime; ->$_al_AllDayEndTime; ->$_at_AllDayTitle; ->$_at_AllDayEventType; ->$_at_AllDayiCalUID; ->$_al_AllDayColor; ->$_ad_AllDayStartDate; ->$_ad_AllDayEndDate; ->$_at_AllDayCALTimeZone)
		//}
	End if 
	
	$_t_CellID:="AllDay_"+String:C10($_l_DayIndex)
	ARRAY TEXT:C222($_at_AttNames; 0)
	ARRAY TEXT:C222($_at_AttValues; 0)
	$_l_CellRow:=Find in array:C230($_at_BnrNames; $_t_CellID)
	SVG_GET_ATTRIBUTES($_at_BnrRefs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
	$_l_ObjectLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})
	$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
	$_l_Width:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "width")})
	$_l_Height:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})
	
	// //  Process Banner events
	//{
	$_l_SizeofArray:=Size of array:C274($_al_BnrStartTime)
	If ($_l_SizeofArray>0)
		For ($_l_Index; 1; $_l_SizeofArray)
			$_t_RGBColor:=Cal4D_Util_RGBToRGBString($_al_BnrColor{$_l_Index})
			$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; 16; 0; 0; $_t_RGBColor; $_t_RGBColor; 1)
			SVG_SET_OPACITY($_t_ObjRef; Cal4D_Cal_SetOpacity("All-Day"); 0)
			$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+$_at_BnriCalUID{$_l_Index}
			SVG_SET_ID($_t_ObjRef; $_t_CellID)
			
			If (($_ad_BnrStartDate{$_l_Index}=CAL_ad_WeekDates{$_l_DayIndex}) | (Day number:C114(CAL_ad_WeekDates{$_l_DayIndex})=Sunday:K10:19))
				$_t_ObjRef:=SVG_New_textArea(Cal_t_WeekRef; $_at_BnrTitle{$_l_Index}; $_l_ObjectLeft; $_l_ObjectTop+1; $_l_Width; 16; Cal_t_DisplayFont; 13; Plain:K14:1; Align center:K42:3)
				$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Txt_"+$_at_BnriCalUID{$_l_Index}
				SVG_SET_ID($_t_ObjRef; $_t_CellID)
				SVG_SET_FONT_COLOR($_t_ObjRef; "white")
				
				Tmp_at_RefID:=Tmp_at_RefID+1
				INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
				INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
				Tmp_at_RefID{Tmp_at_RefID}:=$_t_ObjRef
				Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
			End if 
			
			$_l_ObjectTop:=$_l_ObjectTop+18
		End for 
	End if 
	//}
	
	// //  Process All-day events
	//{
	$_l_SizeofArray:=Size of array:C274($_al_AllDayStartTime)
	If ($_l_SizeofArray>0)
		For ($_l_Index; 1; $_l_SizeofArray)
			$_t_RGBColor:=Cal4D_Util_RGBToRGBString($_al_AllDayColor{$_l_Index})
			$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; 16; 6; 6; $_t_RGBColor; $_t_RGBColor; 1)
			SVG_SET_OPACITY($_t_ObjRef; Cal4D_Cal_SetOpacity("All-Day"); 0)
			$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+$_at_AllDayiCalUID{$_l_Index}
			SVG_SET_ID($_t_ObjRef; $_t_CellID)
			
			$_t_ObjRef:=SVG_New_textArea(Cal_t_WeekRef; $_at_AllDayTitle{$_l_Index}; $_l_ObjectLeft; $_l_ObjectTop+1; $_l_Width; 16; Cal_t_DisplayFont; 13; Plain:K14:1; Align center:K42:3)
			$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Txt_"+$_at_AllDayiCalUID{$_l_Index}
			SVG_SET_ID($_t_ObjRef; $_t_CellID)
			SVG_SET_FONT_COLOR($_t_ObjRef; "white")
			
			Tmp_at_RefID:=Tmp_at_RefID+1
			INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
			INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
			Tmp_at_RefID{Tmp_at_RefID}:=$_t_ObjRef
			Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
			
			$_l_ObjectTop:=$_l_ObjectTop+18
		End for 
	End if 
	//}
	
	// //  Process Appointment events
	//{
	$_l_SizeofArray:=Size of array:C274(CAL_ati_StartTime)
	If ($_l_SizeofArray>0)
		ARRAY TEXT:C222($_at_AttNames; 0)
		ARRAY TEXT:C222($_at_AttValues; 0)
		
		$_l_ColumnLeft:=0
		$_l_LastBottom:=0
		$_l_Index2:=0
		$_l_Indents:=0
		If ($_l_SizeofArray>0)
			$_l_Index:=1
			$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_00"
			$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
			SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
			$_l_ColumnLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})
			$_l_ColumnWIdth:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "width")})
			
			Repeat 
				$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_00"
				$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
				SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
				$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
				$_l_ObjectLeft:=$_l_ColumnLeft
				$_l_Width:=$_l_ColumnWIdth
				
				$_ti_StartTime:=CAL_ati_StartTime{$_l_Index}
				$_ti_EndTime:=CAL_ati_TimeEnd{$_l_Index}
				$_l_15MinIncrements:=($_ti_EndTime-$_ti_StartTime)/900
				$_l_Height:=(48/4)*$_l_15MinIncrements
				
				$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
				$_l_Minutes:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
				
				If ((CAL_ad_WeekDates{$_l_DayIndex}=!2009-10-09!) & ($_ti_StartTime=?07:45:00?))
					
				End if 
				USE SET:C118("$CurrentWeek")
				QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayTimeStart:6=CAL_ati_StartTime{$_l_Index})
				$_l_RecordsinSelection:=Records in selection:C76([SF_DiaryView:184])
				
				//$_l_RecordsinSelection:=Cal4D_Cal_GetEventsAtDateTime (CAL_ad_WeekDates{$_l_DayIndex};CAL_ati_StartTime{$_l_Index})
				If ($_l_RecordsinSelection>1)
					// //  More than one event at this start time
					//{
					$_l_Width:=$_l_Width/$_l_RecordsinSelection
					$_l_OffsetIndent:=$_l_Width
					For ($_l_Index2; 1; $_l_RecordsinSelection)
						$_ti_StartTime:=CAL_ati_StartTime{$_l_Index}
						$_ti_EndTime:=CAL_ati_TimeEnd{$_l_Index}
						$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
						$_l_Minutes:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
						
						$_l_15MinIncrements:=($_ti_EndTime-$_ti_StartTime)/900
						$_l_Height:=(48/4)*$_l_15MinIncrements
						
						$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_"+String:C10($_l_Hour; "00")
						$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
						SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
						$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
						Case of 
							: ($_l_Minutes>=45)
								$_l_ObjectTop:=$_l_ObjectTop+36
							: ($_l_Minutes>=30)
								$_l_ObjectTop:=$_l_ObjectTop+24
							: ($_l_Minutes>=15)
								$_l_ObjectTop:=$_l_ObjectTop+12
						End case 
						
						$_t_RGBColor:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_Index})
						$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; $_l_Height; 8; 8; $_t_RGBColor; $_t_RGBColor; 8)
						SVG_SET_OPACITY($_t_ObjRef; 30; 0)
						$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
						SVG_SET_ID($_t_ObjRef; $_t_CellID)
						
						$_t_EventTitle:=CAL_at_Title{$_l_Index}
						$_l_CharacterPosition:=Position:C15("] "; $_t_EventTitle)
						If ($_l_CharacterPosition>0)
							$_t_EventTitle:=Substring:C12($_t_EventTitle; $_l_CharacterPosition+2)
						End if 
						$_l_CharacterPosition:=Position:C15(" ("; $_t_EventTitle)
						If ($_l_CharacterPosition>0)
							$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; $_l_CharacterPosition-1)
						End if 
						If (Length:C16($_t_EventTitle)>25)
							$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; 28)+"..."
						End if 
						$_t_ObjRef:=SVG_New_textArea(SVG_t_Ref_Week; $_t_EventTitle; $_l_ObjectLeft+4; $_l_ObjectTop+2; $_l_Width; $_l_Height; "Lucida Grande, Tahoma"; 10; Plain:K14:1; Align left:K42:2)
						
						$_l_ObjectLeft:=$_l_ObjectLeft+$_l_OffsetIndent
						
						$_l_Index:=$_l_Index+1
					End for 
					//}
				Else 
					USE SET:C118("$CurrentWeek")
					QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayTimeStart:6>=CAL_ati_StartTime{$_l_Index}; *)
					QUERY SELECTION:C341([SF_DiaryView:184];  & ; [SF_DiaryView:184]Diary_DisplayTimeStart:6<CAL_ati_TimeEnd{$_l_Index})
					
					$_l_RecordsinSelection:=Records in selection:C76([SF_DiaryView:184])
					
					//$_l_RecordsinSelection:=Cal4D_Cal_GetEventsInDuration (CAL_ad_WeekDates{$_l_DayIndex};CAL_ati_StartTime{$_l_Index};CAL_ati_TimeEnd{$_l_Index})
					
					If ($_l_RecordsinSelection=1)
						// //  Only one event at this start time
						//{
						//$_l_Indents:=0
						//$_l_OffsetIndent:=$_l_ColumnWIdth*(0.08*$_l_Indents)
						$_l_Width:=$_l_ColumnWIdth
						
						$_ti_StartTime:=CAL_ati_StartTime{$_l_Index}
						$_ti_EndTime:=CAL_ati_TimeEnd{$_l_Index}
						$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
						$_l_Minutes:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
						
						$_l_15MinIncrements:=($_ti_EndTime-$_ti_StartTime)/900
						$_l_Height:=(48/4)*$_l_15MinIncrements
						
						$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_"+String:C10($_l_Hour; "00")
						$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
						SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
						$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
						Case of 
							: ($_l_Minutes>=45)
								$_l_ObjectTop:=$_l_ObjectTop+36
							: ($_l_Minutes>=30)
								$_l_ObjectTop:=$_l_ObjectTop+24
							: ($_l_Minutes>=15)
								$_l_ObjectTop:=$_l_ObjectTop+12
						End case 
						
						$_t_RGBColor:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_Index})
						$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; $_l_Height; 8; 8; $_t_RGBColor; $_t_RGBColor; 8)
						SVG_SET_OPACITY($_t_ObjRef; 30; 0)
						$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
						SVG_SET_ID($_t_ObjRef; $_t_CellID)
						
						$_t_EventTitle:=CAL_at_Title{$_l_Index}
						$_l_CharacterPosition:=Position:C15("] "; $_t_EventTitle)
						If ($_l_CharacterPosition>0)
							$_t_EventTitle:=Substring:C12($_t_EventTitle; $_l_CharacterPosition+2)
						End if 
						$_l_CharacterPosition:=Position:C15(" ("; $_t_EventTitle)
						If ($_l_CharacterPosition>0)
							$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; $_l_CharacterPosition-1)
						End if 
						$_t_ObjRef:=SVG_New_textArea(SVG_t_Ref_Week; $_t_EventTitle; $_l_ObjectLeft+4; $_l_ObjectTop+2; $_l_Width; $_l_Height; "Lucida Grande, Tahoma"; 10; Plain:K14:1; Align left:K42:2)
						
						$_l_ObjectLeft:=$_l_ObjectLeft+$_l_OffsetIndent
						
						$_l_Index:=$_l_Index+1
						//}
					Else 
						$_l_Indents:=$_l_RecordsinSelection
						$_l_OffsetIndent:=$_l_ColumnWIdth*(0.08*$_l_Indents)
						$_l_Width:=$_l_Width-$_l_OffsetIndent
						If ($_l_RecordsinSelection>0)
							For ($_l_Index2; 1; $_l_RecordsinSelection)
								$_ti_StartTime:=CAL_ati_StartTime{$_l_Index}
								$_ti_EndTime:=CAL_ati_TimeEnd{$_l_Index}
								$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
								$_l_Minutes:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
								
								$_l_15MinIncrements:=($_ti_EndTime-$_ti_StartTime)/900
								$_l_Height:=(48/4)*$_l_15MinIncrements
								
								//$_l_RecordsInSelection:=Cal4D_Cal_GetEventsAtDateTime (CAL_ad_WeekDates{$_l_DayIndex};CAL_ati_StartTime{$_l_Index})
								USE SET:C118("$CurrentWeek")
								QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayTimeStart:6=CAL_ati_StartTime{$_l_Index})
								$_l_RecordsInSelection:=Records in selection:C76([SF_DiaryView:184])
								
								If ($_l_RecordsInSelection>1)
									// //  More than one event at this start time
									//{
									$_l_ObjectLeft:=$_l_ColumnLeft
									$_l_Width:=$_l_ColumnWIdth/$_l_RecordsInSelection
									$_l_OffsetIndent:=$_l_Width
									
									For ($_l_Index2; 1; $_l_RecordsInSelection)
										$_ti_StartTime:=CAL_ati_StartTime{$_l_Index}
										$_ti_EndTime:=CAL_ati_TimeEnd{$_l_Index}
										$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
										$_l_Minutes:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
										
										$_l_15MinIncrements:=($_ti_EndTime-$_ti_StartTime)/900
										$_l_Height:=(48/4)*$_l_15MinIncrements
										
										$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_"+String:C10($_l_Hour; "00")
										$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
										SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
										$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
										Case of 
											: ($_l_Minutes>=45)
												$_l_ObjectTop:=$_l_ObjectTop+36
											: ($_l_Minutes>=30)
												$_l_ObjectTop:=$_l_ObjectTop+24
											: ($_l_Minutes>=15)
												$_l_ObjectTop:=$_l_ObjectTop+12
										End case 
										
										$_t_RGBColor:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_Index})
										$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; $_l_Height; 8; 8; $_t_RGBColor; $_t_RGBColor; 8)
										SVG_SET_OPACITY($_t_ObjRef; 30; 0)
										$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
										SVG_SET_ID($_t_ObjRef; $_t_CellID)
										
										$_t_EventTitle:=CAL_at_Title{$_l_Index}
										$_l_CharacterPosition:=Position:C15("] "; $_t_EventTitle)
										If ($_l_CharacterPosition>0)
											$_t_EventTitle:=Substring:C12($_t_EventTitle; $_l_CharacterPosition+2)
										End if 
										$_l_CharacterPosition:=Position:C15(" ("; $_t_EventTitle)
										If ($_l_CharacterPosition>0)
											$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; $_l_CharacterPosition-1)
										End if 
										If (Length:C16($_t_EventTitle)>25)
											$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; 28)+"..."
										End if 
										$_t_ObjRef:=SVG_New_textArea(SVG_t_Ref_Week; $_t_EventTitle; $_l_ObjectLeft+4; $_l_ObjectTop+2; $_l_Width; $_l_Height; "Lucida Grande, Tahoma"; 10; Plain:K14:1; Align left:K42:2)
										
										$_l_ObjectLeft:=$_l_ObjectLeft+$_l_OffsetIndent
										
										// //  Aviod skipping an appointment since $_l_Index will be incremented again below
										//{
										If ($_l_Index2<$_l_RecordsInSelection)
											$_l_Index:=$_l_Index+1
										End if 
										//}
									End for 
									//}
								Else 
									// //  Only one event at this start time
									//{
									$_l_Hour:=Cal4D_UTIL_HourOf($_ti_StartTime)
									$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_"+String:C10($_l_Hour; "00")
									$_l_CellRow:=Find in array:C230($_at_Names; $_t_CellID)
									SVG_GET_ATTRIBUTES($_at_Refs{$_l_CellRow}; ->$_at_AttNames; ->$_at_AttValues)
									$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
									Case of 
										: ($_l_Minutes>=45)
											$_l_ObjectTop:=$_l_ObjectTop+36
										: ($_l_Minutes>=30)
											$_l_ObjectTop:=$_l_ObjectTop+24
										: ($_l_Minutes>=15)
											$_l_ObjectTop:=$_l_ObjectTop+12
									End case 
									
									$_t_RGBColor:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_Index})
									$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; $_l_Height; 8; 8; $_t_RGBColor; $_t_RGBColor; 8)
									SVG_SET_OPACITY($_t_ObjRef; 30; 0)
									$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_DayIndex})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
									SVG_SET_ID($_t_ObjRef; $_t_CellID)
									
									$_t_EventTitle:=CAL_at_Title{$_l_Index}
									$_l_CharacterPosition:=Position:C15("] "; $_t_EventTitle)
									If ($_l_CharacterPosition>0)
										$_t_EventTitle:=Substring:C12($_t_EventTitle; $_l_CharacterPosition+2)
									End if 
									$_l_CharacterPosition:=Position:C15(" ("; $_t_EventTitle)
									If ($_l_CharacterPosition>0)
										$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; $_l_CharacterPosition-1)
									End if 
									If (Length:C16($_t_EventTitle)>25)
										$_t_EventTitle:=Substring:C12($_t_EventTitle; 1; 28)+"..."
									End if 
									$_t_ObjRef:=SVG_New_textArea(SVG_t_Ref_Week; $_t_EventTitle; $_l_ObjectLeft+4; $_l_ObjectTop+2; $_l_Width; $_l_Height; "Lucida Grande, Tahoma"; 10; Plain:K14:1; Align left:K42:2)
									
									$_l_ObjectLeft:=$_l_ObjectLeft+$_l_OffsetIndent
									//}
								End if 
								
								$_l_Index:=$_l_Index+1
							End for 
						Else 
							$_l_Index:=$_l_Index+1
						End if 
					End if 
				End if 
			Until ($_l_Index>$_l_SizeofArray)
		End if 
	End if 
	//}
End for 

//========================    Clean up and Exit    =================================

// //  Free the memory used
//{
Cal4D_Cal_GetEventsForOneDay(!00-00-00!)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_PopulateWeekEvents"; $_t_oldMethodName)