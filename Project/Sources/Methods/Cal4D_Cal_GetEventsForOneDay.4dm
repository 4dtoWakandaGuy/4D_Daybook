//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetEventsForOneDay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:17`Method: Cal4D_Cal_GetEventsForOneDay
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY DATE(CAL_ad_EndDate;0)
	//ARRAY DATE(CAL_ad_StartDate;0)
	//ARRAY DATE(EndDate_aD;0)
	//ARRAY LONGINT(CAL_al_Colour;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	//ARRAY TIME(CAL_ati_StartTime;0)
	//ARRAY TIMe(CAL_ati_TimeEnd;0)
	//ARRAY LONGINT(SD2_al_CurrentDiaryPerson;0)
	//ARRAY TEXT(CAL_at_ActionCode;0)
	//ARRAY TEXT(CAL_at_iCalUUID;0)
	//ARRAY TEXT(CAL_at_TimeZone;0)
	//ARRAY TEXT(CAL_at_Title;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_DiaryCode;0)
	C_BOOLEAN:C305($_bo_FirstPass; SD2_bo_ScheduleActionsInited)
	C_DATE:C307($1; Cal_d_tempDate; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart)
	C_LONGINT:C283($_l_ActionRow; $_l_ArraySize; $_l_Blue; $_l_ColourBlue; $_l_ColourGreen; $_l_ColourRed; $_l_Green; $_l_Index; $_l_RecordsinSelection; $_l_Red; SD_l_priorityQuery)
	C_LONGINT:C283(SD2_l_DiaryInstanceUID; SD2_l_IncludeCompleted)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventLEndDateField; <>Cal_ptr_EventLStartDateField; <>Cal_ptr_EventLStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_EventZoneField; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284($_t_ActionCode; $_t_oldMethodName; $_t_SQL; SD2_t_DiaryCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetEventsForOneDay")

Cal_d_tempDate:=$1
$_bo_FirstPass:=True:C214
//TRACE
ARRAY TIME:C1223(CAL_ati_StartTime; 0)
ARRAY TIME:C1223(CAL_ati_TimeEnd; 0)
ARRAY TEXT:C222(CAL_at_Title; 0)
ARRAY TEXT:C222(CAL_at_ActionCode; 0)
ARRAY TEXT:C222(CAL_at_iCalUUID; 0)
ARRAY LONGINT:C221(CAL_al_Colour; 0)
ARRAY DATE:C224(CAL_ad_StartDate; 0)
ARRAY DATE:C224(EndDate_aD; 0)
ARRAY TEXT:C222(CAL_at_TimeZone; 0)

//========================    Method Actions    ==================================

$_l_RecordsinSelection:=0
$_l_ArraySize:=Size of array:C274(Cal_lb_ListboxCalender)
For ($_l_Index; 1; $_l_ArraySize)
	If (Cal_lb_ListboxCalender{$_l_Index})
		$_l_RecordsinSelection:=$_l_Index
	End if 
End for 

If ((Cal_d_tempDate#!00-00-00!) & ($_l_RecordsinSelection>0))
	////  To use standard 4D Relations instead of SQL change the If (True) to If (False)
	//{
	If (False:C215)
		////  Get events of the day
		//{
		
		$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_EventLStartTimeField)+", "+Field name:C257(<>Cal_ptr_FieldLEventStartField)+", "
		$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventTitleField)+", "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+", "
		$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventColorField)+", "+Field name:C257(<>Cal_ptr_EventTypeFldField)+", "
		$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventLStartDateField)+", "+Field name:C257(<>Cal_ptr_EventLEndDateField)+", "
		$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventZoneField)
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		
		$_t_SQL:=$_t_SQL+" WHERE ("+Field name:C257(<>Cal_ptr_EventLStartDateField)+" = :Cal_d_tempDate"
		$_t_SQL:=$_t_SQL+" OR ("+Field name:C257(<>Cal_ptr_EventLStartDateField)+" < :Cal_d_tempDate"
		$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_EventLEndDateField)+" >= :Cal_d_tempDate)"
		
		If ($_l_RecordsinSelection>0)
			$_t_SQL:=$_t_SQL+") AND ("
			For ($_l_Index; 1; Size of array:C274(Cal_lb_ListboxCalender))
				If (Cal_lb_ListboxCalender{$_l_Index})
					If ($_l_Index<=Size of array:C274(Cal_al_GroupID))
						If ($_bo_FirstPass)
							$_bo_FirstPass:=False:C215
							$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventGroupIDField)+" = "+String:C10(Cal_al_GroupID{$_l_Index})
						Else 
							$_t_SQL:=$_t_SQL+" OR "+Field name:C257(<>Cal_ptr_EventGroupIDField)+" = "+String:C10(Cal_al_GroupID{$_l_Index})
						End if 
					End if 
				End if 
			End for 
			$_t_SQL:=$_t_SQL+")"
		End if 
		
		$_t_SQL:=$_t_SQL+" ORDER BY "+Field name:C257(<>Cal_ptr_EventTypeFldField)+", "+Field name:C257(<>Cal_ptr_EventLStartTimeField)+" ASC"+", "+Field name:C257(<>Cal_ptr_FieldLEventStartField)+" DESC"
		$_t_SQL:=$_t_SQL+" INTO :CAL_ati_StartTime, :CAL_ati_TimeEnd, :CAL_at_Title, :CAL_at_iCalUUID, :CAL_al_Colour, :CAL_at_ActionCode, :CAL_ad_StartDate, :EndDate_aD, :CAL_at_TimeZone;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL;
		End SQL
		//}
		
	End if 
	//}
	If ($1=!00-00-00!)
		REDUCE SELECTION:C351([SF_DiaryView:184]; 0)
	Else 
		
		SD2_LoadSchedule(SD2_l_DiaryInstanceUID; 0; SD2_D_CurrentDateStart; SD2_D_CurrentDateEnd; ->SD2_al_CurrentDiaryPerson; SD2_l_IncludeCompleted; SD_l_priorityQuery)
	End if 
	If (Not:C34(SD2_bo_ScheduleActionsInited))
		SD2_GetActionsRangeByLocation("Schedule")
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
		SD2_bo_ScheduleActionsInited:=True:C214
	End if 
	
	SELECTION TO ARRAY:C260([SF_DiaryView:184]Diary_DisplayTimeStart:6; CAL_ati_StartTime; [SF_DiaryView:184]Diary_DisplayTimeEnd:7; CAL_ati_TimeEnd; [SF_DiaryView:184]DiaryView_UUID:1; CAL_at_iCalUUID; [SF_DiaryView:184]Diary_DisplayDateStart:4; CAL_ad_StartDate; [SF_DiaryView:184]Diary_DIsplayDateEnd:5; EndDate_aD; [SF_DiaryView:184]DiaryView_DiaryID:3; SD2_at_DiaryCode)
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
		$_l_ColourRed:=0
		$_l_ColourGreen:=0
		$_l_ColourBlue:=0
		//QUERY([DIARY];[DIARY]Diary_Code=SD2_at_DiaryCode{$_l_Index})
		$_t_ActionCode:=""
		SD2_t_DiaryCode:=SD2_at_DiaryCode{$_l_Index}
		$_t_SQL:="SELECT "+"Action_Code, AGFillColourRed"+", "+"AGFillColourGreen"+", "
		$_t_SQL:=$_t_SQL+"AGFillColourBlue"
		$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
		$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code"+" = :SD2_t_DiaryCode"
		$_t_SQL:=$_t_SQL+" INTO "+":"+"$_t_ActionCode,  :$_l_ColourRed, :$_l_ColourGreen, :$_l_ColourBlue"
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
		$_l_Red:=$_l_ColourRed
		$_l_Blue:=$_l_ColourBlue
		$_l_Green:=$_l_ColourGreen
		$_l_ColourRed:=0
		CAL_al_Colour{$_l_Index}:=0
		CAL_at_Title{$_l_Index}:=[DIARY:12]Subject:63
		If (CAL_at_Title{$_l_Index}="")
			CAL_at_Title{$_l_Index}:=Substring:C12([DIARY:12]Action_Details:10; 1; 64)
		End if 
		
	End for 
	
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_GetEventsForOneDay"; $_t_oldMethodName)