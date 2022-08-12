//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_PopulateMonthEvents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 16:19`Method: Cal4D_Cal_PopulateMonthEvents
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
	//ARRAY DATE(SD2_ad_Dates;0)
	ARRAY LONGINT:C221($_al_AllDayColor; 0)
	ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
	ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
	ARRAY LONGINT:C221($_al_BnrColor; 0)
	ARRAY LONGINT:C221($_al_BnrEndTime; 0)
	ARRAY LONGINT:C221($_al_BnrStartTime; 0)
	//ARRAY LONGINT(CAL_al_Colour;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD2_al_CurrentDiaryPerson;0)
	//ARRAY LONGINT(SD2_al_Ordinals;0)
	ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
	ARRAY TEXT:C222($_at_AllDayEventType; 0)
	ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
	ARRAY TEXT:C222($_at_AllDayTitle; 0)
	ARRAY TEXT:C222($_at_AttNames; 0)
	ARRAY TEXT:C222($_at_AttValues; 0)
	ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
	ARRAY TEXT:C222($_at_BnrEventType; 0)
	ARRAY TEXT:C222($_at_BnriCalUID; 0)
	ARRAY TEXT:C222($_at_BnrTitle; 0)
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
	C_BLOB:C604($_blb_CalenderBlob)
	C_BOOLEAN:C305($_bo_Continue; SD2_bo_ScheduleActionsInited)
	C_LONGINT:C283($_l_ActionRow; $_l_ArraySIze; $_l_CharacterPosition; $_l_Colour; $_l_ColourBlue; $_l_ColourGreen; $_l_ColourRed; $_l_DatesArraySIze; $_l_EndDayNumber; $_l_Height; $_l_HeightY)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_MonthNumber; $_l_ObjectLeft; $_l_Size; $_l_StartDayNumber; $_l_TextHeight; $_l_TopPosition; $_l_Width; SD_l_priorityQuery; SD_l_SettingsTimeLen)
	C_LONGINT:C283(SD2_l_DiaryInstanceUID; SD2_l_IncludeCompleted)
	C_REAL:C285($_r_CalenderScaler)
	C_TEXT:C284($_t_ActionCode; $_t_CellID; $_t_DateString; $_t_EventText; $_t_oldMethodName; $_t_RGBColour; $_t_SQL; $_t_TempCellReference; CAL_t_ActionDetails; CAL_t_DiaryCode; Cal_t_DisplayFont)
	C_TEXT:C284(CAL_t_Subject; CAL_t_SVGref)
	C_TIME:C306($_ti_InitialStarttime; $_ti_Time; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_PopulateMonthEvents")
ARRAY TEXT:C222(Tmp_at_RefID; 0)
Tmp_at_RefID:=0
ARRAY TEXT:C222(Tmp_at_Names; 0)

$_r_CalenderScaler:=24.5

ARRAY TEXT:C222($_at_Refs; 0)
ARRAY TEXT:C222($_at_Types; 0)
ARRAY TEXT:C222($_at_Names; 0)
SVG_ELEMENTS_TO_ARRAYS(CAL_t_SVGref; ->$_at_Refs; ->$_at_Types; ->$_at_Names)

$_l_DatesArraySIze:=Size of array:C274($_at_Names)
For ($_l_Index2; $_l_DatesArraySIze; 1; -1)
	If (($_at_Names{$_l_Index2}#"@_Cell_Day") & ($_at_Names{$_l_Index2}#"@_Cell_Today"))
		DELETE FROM ARRAY:C228($_at_Refs; $_l_Index2)
		DELETE FROM ARRAY:C228($_at_Types; $_l_Index2)
		DELETE FROM ARRAY:C228($_at_Names; $_l_Index2)
	End if 
End for 

$_l_MonthNumber:=Month of:C24(Cal4D_Cal_SelectedDate)
$_l_DatesArraySIze:=Size of array:C274(SD2_ad_Dates)
//Ng because of the minimized queries being implemented in Daybook here we have to make a change.
//Instead of getting the events day by day the monh is an entity (context) of its own. We will therefore get the events for the month..
SD2_LoadSchedule(SD2_l_DiaryInstanceUID; 0; SD2_ad_Dates{1}; SD2_ad_Dates{Size of array:C274(SD2_ad_Dates)}; ->SD2_al_CurrentDiaryPerson; SD2_l_IncludeCompleted; SD_l_priorityQuery)
CREATE SET:C116([SF_DiaryView:184]; "$CurrentMonth")
If ($_l_DatesArraySIze#Size of array:C274($_at_Refs))
	ALERT:C41("SOA mismatch: "+String:C10($_l_DatesArraySIze)+" vs "+String:C10(Size of array:C274($_at_Refs)))
	
Else 
	
	//========================    Method Actions    ==================================
	
	For ($_l_Index2; 1; $_l_DatesArraySIze)
		If ($_l_MonthNumber=Month of:C24(SD2_ad_Dates{$_l_Index2}))
			USE SET:C118("$CurrentMonth")
			QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayDateStart:4=SD2_ad_Dates{$_l_Index2})
			//```
			If (Not:C34(SD2_bo_ScheduleActionsInited))
				SD2_GetActionsRangeByLocation("Schedule")
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
				SD2_bo_ScheduleActionsInited:=True:C214
			End if 
			
			SELECTION TO ARRAY:C260([SF_DiaryView:184]Diary_DisplayTimeStart:6; CAL_ati_StartTime; [SF_DiaryView:184]Diary_DisplayTimeEnd:7; CAL_ati_TimeEnd; [SF_DiaryView:184]DiaryView_UUID:1; CAL_at_iCalUUID; [SF_DiaryView:184]Diary_DisplayDateStart:4; CAL_ad_StartDate; [SF_DiaryView:184]Diary_DIsplayDateEnd:5; CAL_ad_EndDate; [SF_DiaryView:184]DiaryView_DiaryID:3; SD2_at_DiaryCode)
			$_ti_InitialStarttime:=SD_ti_SettingsTimeStart
			If ($_ti_InitialStarttime=?00:00:00?)
				$_ti_InitialStarttime:=?09:00:00?
			End if 
			For ($_l_Index; 1; Size of array:C274(CAL_ati_StartTime))
				//$0
				//QUERY([DIARY];[DIARY]Diary_Code=SD2_at_DiaryCode{$_l_Index})
				If (CAL_ati_StartTime{$_l_Index}=0)
					$_t_ActionCode:=""
					CAL_t_DiaryCode:=SD2_at_DiaryCode{$_l_Index}
					$_t_SQL:="SELECT "+"Action_Code"
					$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
					$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code"+" = :CAL_t_DiaryCode"
					$_t_SQL:=$_t_SQL+" INTO "+":"+"$_t_ActionCode"
					Begin SQL
						EXECUTE IMMEDIATE :$_t_SQL
					End SQL
					CAL_ati_StartTime{$_l_Index}:=$_ti_InitialStarttime*1
					$_l_ActionRow:=Find in array:C230(SD_at_ActionCodes; $_t_ActionCode)
					If ($_l_ActionRow<0)
						CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStarttime+SD_l_SettingsTimeLen
					Else 
						If (SD_al_ActionTime{$_l_ActionRow}>0)
							CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStarttime+SD_al_ActionTime{$_l_ActionRow}
						Else 
							CAL_ati_TimeEnd{$_l_Index}:=$_ti_InitialStarttime+SD_l_SettingsTimeLen
						End if 
					End if 
					$_ti_InitialStarttime:=CAL_ati_TimeEnd{$_l_Index}+1
				End if 
			End for 
			If (Size of array:C274(CAL_ati_StartTime)>0)
				//TRACE
			End if 
			ARRAY LONGINT:C221(CAL_al_Colour; 0)
			ARRAY TEXT:C222(CAL_at_TimeZone; 0)
			ARRAY TEXT:C222(CAL_at_ActionCode; 0)
			ARRAY TEXT:C222(CAL_at_Title; 0)
			$_l_ArraySIze:=Size of array:C274(CAL_ati_StartTime)
			ARRAY LONGINT:C221(CAL_al_Colour; $_l_ArraySIze)
			ARRAY TEXT:C222(CAL_at_TimeZone; $_l_ArraySIze)
			ARRAY TEXT:C222(CAL_at_ActionCode; $_l_ArraySIze)
			ARRAY TEXT:C222(CAL_at_Title; $_l_ArraySIze)
			For ($_l_Index; 1; Size of array:C274(CAL_ati_StartTime))
				//QUERY([DIARY];[DIARY]Diary_Code=SD2_at_DiaryCode{$_l_Index})
				//TRACE
				$_t_ActionCode:=""
				$_l_ColourRed:=0
				$_l_ColourGreen:=0
				$_l_ColourBlue:=0
				CAL_t_Subject:=""
				CAL_t_ActionDetails:=""
				CAL_t_DiaryCode:=SD2_at_DiaryCode{$_l_Index}
				$_t_SQL:="SELECT "+"Action_Code"+","+"AGFillColourRed"+", "+"AGFillColourGreen"+", "
				$_t_SQL:=$_t_SQL+"AGFillColourBlue, Subject, Action_Details"
				$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
				$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code"+" = :CAL_t_DiaryCode"
				$_t_SQL:=$_t_SQL+" INTO "+":"+"$_t_ActionCode,"+":"+"$_l_ColourRed, :$_l_ColourGreen, :$_l_ColourBlue, :CAL_t_Subject, :CAL_t_ActionDetails"
				Begin SQL
					EXECUTE IMMEDIATE :$_t_SQL
				End SQL
				$_l_ActionRow:=Find in array:C230(SD2_at_ActionCodes; $_t_ActionCode)
				If ($_l_ActionRow>0)
					CAL_at_ActionCode{$_l_Index}:=SD2_at_ActionNames{$_l_ActionRow}
				Else 
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_ActionCode)
					CAL_at_ActionCode{$_l_Index}:=[ACTIONS:13]Action_Name:2
				End if 
				$_l_ColourRed:=$_l_ColourRed
				$_l_ColourBlue:=$_l_ColourBlue
				$_l_ColourGreen:=$_l_ColourGreen
				$_l_Colour:=0
				CAL_al_Colour{$_l_Index}:=0
				CAL_at_Title{$_l_Index}:=CAL_t_Subject
				If (CAL_at_Title{$_l_Index}="")
					CAL_at_Title{$_l_Index}:=Substring:C12(CAL_t_ActionDetails; 1; 20)
				End if 
				
			End for 
			
			//`````
			//Cal4D_Cal_GetEventsForOneDay (SD2_ad_Dates{$_l_Index2})
			
			$_l_ArraySize:=Size of array:C274(CAL_ati_StartTime)
			If ($_l_ArraySize>0)
				If (True:C214)
					// //  Parse out Banner and All-Day events from the Appointments
					// //  Order the elements so that the order is "Banner" events, "All-Day" events, then "Appointments"
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
					
					SET BLOB SIZE:C606($_blb_CalenderBlob; 0)
					CAL4D_VarstoBlob(->$_blb_CalenderBlob; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
					
					Cal4D_ParseArrays(->$_blb_CalenderBlob)
					
					$_l_Index:=0
					$_l_Index:=CAL4D_GetVarsFromBlob($_l_Index; ->$_blb_CalenderBlob; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
					$_l_Index:=CAL4D_GetVarsFromBlob($_l_Index; ->$_blb_CalenderBlob; ->$_al_BnrStartTime; ->$_al_BnrEndTime; ->$_at_BnrTitle; ->$_at_BnrEventType; ->$_at_BnriCalUID; ->$_al_BnrColor; ->$_ad_BnrStartDate; ->$_ad_BnrEndDate; ->$_at_BnrCALTimeZone)
					$_l_Index:=CAL4D_GetVarsFromBlob($_l_Index; ->$_blb_CalenderBlob; ->$_al_AllDayStartTime; ->$_al_AllDayEndTime; ->$_at_AllDayTitle; ->$_at_AllDayEventType; ->$_at_AllDayiCalUID; ->$_al_AllDayColor; ->$_ad_AllDayStartDate; ->$_ad_AllDayEndDate; ->$_at_AllDayCALTimeZone)
					
					For ($_l_Index; 1; Size of array:C274($_al_AllDayStartTime))
						INSERT IN ARRAY:C227(CAL_ati_StartTime; $_l_Index)
						CAL_ati_StartTime{$_l_Index}:=$_al_AllDayStartTime{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ati_TimeEnd; $_l_Index)
						CAL_ati_TimeEnd{$_l_Index}:=$_al_AllDayEndTime{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_Title; $_l_Index)
						CAL_at_Title{$_l_Index}:=$_at_AllDayTitle{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_ActionCode; $_l_Index)
						CAL_at_ActionCode{$_l_Index}:=$_at_AllDayEventType{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_iCalUUID; $_l_Index)
						CAL_at_iCalUUID{$_l_Index}:=$_at_AllDayiCalUID{$_l_Index}
						INSERT IN ARRAY:C227(CAL_al_Colour; $_l_Index)
						CAL_al_Colour{$_l_Index}:=$_al_AllDayColor{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ad_StartDate; $_l_Index)
						CAL_ad_StartDate{$_l_Index}:=$_ad_AllDayStartDate{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ad_EndDate; $_l_Index)
						CAL_ad_EndDate{$_l_Index}:=$_ad_AllDayEndDate{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_TimeZone; $_l_Index)
						CAL_at_TimeZone{$_l_Index}:=$_at_AllDayCALTimeZone{$_l_Index}
					End for 
					
					For ($_l_Index; 1; Size of array:C274($_al_BnrStartTime))
						INSERT IN ARRAY:C227(CAL_ati_StartTime; $_l_Index)
						CAL_ati_StartTime{$_l_Index}:=$_al_BnrStartTime{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ati_TimeEnd; $_l_Index)
						CAL_ati_TimeEnd{$_l_Index}:=$_al_BnrEndTime{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_Title; $_l_Index)
						CAL_at_Title{$_l_Index}:=$_at_BnrTitle{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_ActionCode; $_l_Index)
						CAL_at_ActionCode{$_l_Index}:=$_at_BnrEventType{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_iCalUUID; $_l_Index)
						CAL_at_iCalUUID{$_l_Index}:=$_at_BnriCalUID{$_l_Index}
						INSERT IN ARRAY:C227(CAL_al_Colour; $_l_Index)
						CAL_al_Colour{$_l_Index}:=$_al_BnrColor{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ad_StartDate; $_l_Index)
						CAL_ad_StartDate{$_l_Index}:=$_ad_BnrStartDate{$_l_Index}
						INSERT IN ARRAY:C227(CAL_ad_EndDate; $_l_Index)
						CAL_ad_EndDate{$_l_Index}:=$_ad_BnrEndDate{$_l_Index}
						INSERT IN ARRAY:C227(CAL_at_TimeZone; $_l_Index)
						CAL_at_TimeZone{$_l_Index}:=$_at_BnrCALTimeZone{$_l_Index}
					End for 
					//}
					
				End if 
				
				ARRAY TEXT:C222($_at_AttNames; 0)
				ARRAY TEXT:C222($_at_AttValues; 0)
				SVG_GET_ATTRIBUTES($_at_Refs{$_l_Index2}; ->$_at_AttNames; ->$_at_AttValues)
				$_l_ObjectLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})+(2*$_r_CalenderScaler)
				$_l_TopPosition:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
				$_l_Width:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "width")})-(2*$_r_CalenderScaler)
				$_l_Height:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})
				$_l_TextHeight:=(16*$_r_CalenderScaler)
				$_l_HeightY:=$_l_TopPosition+$_l_TextHeight
				
				For ($_l_Index; 1; $_l_ArraySize)
					$_t_RGBColour:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_Index})
					Case of 
						: (CAL_at_ActionCode{$_l_Index}="Banner")
							$_l_Size:=14*$_r_CalenderScaler
							If ((SD2_ad_Dates{$_l_Index2}>=CAL_ad_StartDate{$_l_Index}) & (SD2_ad_Dates{$_l_Index2}<=CAL_ad_EndDate{$_l_Index}))
								$_t_TempCellReference:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_HeightY; $_l_Width+($_l_Width*0.015); $_l_TextHeight; 0; 0; $_t_RGBColour; $_t_RGBColour; 0)
								SVG_SET_OPACITY($_t_TempCellReference; Cal4D_Cal_SetOpacity(CAL_at_ActionCode{$_l_Index}); 0)
								$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
								SVG_SET_ID($_t_TempCellReference; $_t_CellID)
								SVG_GET_ATTRIBUTES($_t_TempCellReference; ->$_at_AttNames; ->$_at_AttValues)
								
								If ((CAL_ad_StartDate{$_l_Index}=SD2_ad_Dates{$_l_Index2}) | (Day number:C114(SD2_ad_Dates{$_l_Index2})=Sunday:K10:19))
									$_t_EventText:=CAL_at_Title{$_l_Index}
									$_t_TempCellReference:=SVG_New_textArea(CAL_t_SVGref; $_t_EventText; $_l_ObjectLeft+($_l_Width*0.025); $_l_HeightY-($_l_TextHeight*0.05); $_l_Width; $_l_TextHeight; Cal_t_DisplayFont; $_l_Size; Bold:K14:2; Align center:K42:3)
									$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Txt_"+CAL_at_iCalUUID{$_l_Index}
									SVG_SET_ID($_t_TempCellReference; $_t_CellID)
									SVG_SET_FONT_COLOR($_t_TempCellReference; "white")
									
									Tmp_at_RefID:=Tmp_at_RefID+1
									INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
									INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
									Tmp_at_RefID{Tmp_at_RefID}:=$_t_TempCellReference
									Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
								End if 
								
								$_l_HeightY:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})+Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})
							End if 
							
						: (CAL_at_ActionCode{$_l_Index}="All-Day")
							$_l_Size:=14*$_r_CalenderScaler
							$_t_TempCellReference:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_HeightY; $_l_Width-($_l_TextHeight/4); $_l_TextHeight; $_l_TextHeight/2; $_l_TextHeight/2; $_t_RGBColour; $_t_RGBColour; 0)
							SVG_SET_OPACITY($_t_TempCellReference; Cal4D_Cal_SetOpacity(CAL_at_ActionCode{$_l_Index}); 0)
							$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
							SVG_SET_ID($_t_TempCellReference; $_t_CellID)
							SVG_GET_ATTRIBUTES($_t_TempCellReference; ->$_at_AttNames; ->$_at_AttValues)
							
							$_t_EventText:=CAL_at_Title{$_l_Index}
							$_t_TempCellReference:=SVG_New_textArea(CAL_t_SVGref; $_t_EventText; $_l_ObjectLeft; $_l_HeightY; $_l_Width; $_l_TextHeight; Cal_t_DisplayFont; $_l_Size; Bold:K14:2; Align center:K42:3)
							$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Txt_"+CAL_at_iCalUUID{$_l_Index}
							SVG_SET_ID($_t_TempCellReference; $_t_CellID)
							SVG_SET_FONT_COLOR($_t_TempCellReference; "white")
							
							Tmp_at_RefID:=Tmp_at_RefID+1
							INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
							INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
							Tmp_at_RefID{Tmp_at_RefID}:=$_t_TempCellReference
							Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
							
							$_l_HeightY:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})+Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})
							
						: (CAL_at_ActionCode{$_l_Index}="Appointment") | (True:C214)
							$_l_Size:=12*$_r_CalenderScaler
							$_bo_Continue:=True:C214
							If ($_l_ArraySize>9)
								Case of 
									: ($_l_Index=9)
										$_t_TempCellReference:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_HeightY; $_l_Width; $_l_TextHeight; 0; 0; "white"; "white"; 0)
										SVG_SET_OPACITY($_t_TempCellReference; Cal4D_Cal_SetOpacity(CAL_at_ActionCode{$_l_Index}); 0)
										$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_NoEvt_"
										SVG_SET_ID($_t_TempCellReference; $_t_CellID)
										
										$_t_EventText:="... Plus "+String:C10(($_l_ArraySize-$_l_Index)+1)+" more"
										
										$_t_TempCellReference:=SVG_New_textArea(CAL_t_SVGref; $_t_EventText; $_l_ObjectLeft; $_l_HeightY; $_l_Width; $_l_TextHeight; Cal_t_DisplayFont; $_l_Size; Plain:K14:1; Align left:K42:2)
										SVG_SET_FONT_COLOR($_t_TempCellReference; $_t_RGBColour)
										
										$_bo_Continue:=False:C215
										
									: ($_l_Index>9)
										$_bo_Continue:=False:C215
										
								End case 
							End if 
							
							If ($_bo_Continue)
								$_ti_Time:=CAL_ati_StartTime{$_l_Index}
								
								$_t_TempCellReference:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_HeightY; $_l_Width; $_l_TextHeight; 0; 0; "white"; "white"; 0)
								SVG_SET_OPACITY($_t_TempCellReference; 10; 0)
								$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Evt_"+CAL_at_iCalUUID{$_l_Index}
								SVG_SET_ID($_t_TempCellReference; $_t_CellID)
								SVG_GET_ATTRIBUTES($_t_TempCellReference; ->$_at_AttNames; ->$_at_AttValues)
								
								// //$_t_EventText:="• "+String($_ti_Time;HH MM AM PM )+" "+CAL_at_Title{$_l_Index}
								$_t_EventText:=CAL_at_Title{$_l_Index}
								$_l_CharacterPosition:=Position:C15("] "; $_t_EventText)
								If ($_l_CharacterPosition>0)
									$_t_EventText:=Substring:C12($_t_EventText; $_l_CharacterPosition+2)
								End if 
								$_l_CharacterPosition:=Position:C15(" ("; $_t_EventText)
								If ($_l_CharacterPosition>0)
									$_t_EventText:=Substring:C12($_t_EventText; 1; $_l_CharacterPosition-1)
								End if 
								If (Length:C16($_t_EventText)>25)
									$_t_EventText:=Substring:C12($_t_EventText; 1; 28)+"..."
								End if 
								
								$_t_EventText:="• "+$_t_EventText
								
								$_t_TempCellReference:=SVG_New_textArea(CAL_t_SVGref; $_t_EventText; $_l_ObjectLeft; $_l_HeightY; $_l_Width; $_l_TextHeight; Cal_t_DisplayFont; $_l_Size; Plain:K14:1; Align left:K42:2)
								$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Index2})+"_Txt_"+CAL_at_iCalUUID{$_l_Index}
								//SVG_SET_ID ($_t_TempCellReference;$_t_CellID)
								SVG_SET_FONT_COLOR($_t_TempCellReference; $_t_RGBColour)
								
								$_l_HeightY:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})+Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})-30
							End if 
							
					End case 
					
				End for 
				
			End if 
		End if 
	End for 
	
	//========================    Clean up and Exit    =================================
	
	// //  Free the memory used
	//{
	Cal4D_Cal_GetEventsForOneDay(!00-00-00!)
	//}
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_PopulateMonthEvents"; $_t_oldMethodName)