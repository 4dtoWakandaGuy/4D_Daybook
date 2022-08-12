//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:39`Method: Cal4D_Init
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal_al_iCalRefreshMinutes;0)
	//ARRAY LONGINT(<>Cal4D_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal4D_al_iCalRefreshMinutes;0)
	//ARRAY TEXT(Cal_at_1stDayOfWeek;0)
	//ARRAY TEXT(Cal4D_at_RefreshPopup;0)
	C_BOOLEAN:C305(<>Cal_bo_CalisVisible; <>Cal_bo_DisplayDaysOfTheWeek; <>Cal_bo_DisplayMonthYearText; <>Cal_bo_DisplayNavButtons; <>Cal_bo_DisplayOutermostLines; <>Cal_bo_EventUpdateNeeded; <>Cal_bo_FormUpdateNeeded; <>Cal_bo_Initialized; <>Cal_bo_MonthUpdateNeeded; <>Cal_bo_QuitNow; <>Cal_bo_ResizeWithWindow)
	C_BOOLEAN:C305(Cal_bo_Initialized; DB_bo_FontsInited)
	C_LONGINT:C283(<>CAL_l_BannerHeight; <>CAL_l_CalendarBottom; <>CAL_l_CalendarLeft; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; <>CAL_l_ColumnHeight; <>CAL_l_ColumnWidth; <>CAL_l_CurrentUserID; <>CAL_l_DisplayedMonthBoxColor; <>CAL_l_DividerLineColor; <>CAL_l_DOWHeight)
	C_LONGINT:C283(<>CAL_l_DOWVOffset; <>CAL_l_DragAreaWidth; <>CAL_l_FirstDayOfWeek; <>CAL_l_iCalLastStatusUpdate; <>CAL_l_iCalUpdateInterval; <>CAL_l_LastClientUpdateTime; <>CAL_l_MaxBannerObjects; <>CAL_l_MaxPictureObjects; <>CAL_l_MaxTextObjects; <>CAL_l_Month; <>CAL_l_OtherMonthBoxColor)
	C_LONGINT:C283(<>CAL_l_SelectedBoxColor; <>CAL_l_SemaphoreTimeout; <>CAL_l_ServerCheckInterval; <>CAL_l_SharedUserID; <>CAL_l_StackSize; <>CAL_l_TextEventSize; <>CAL_l_TextHeight; <>CAL_l_TodayBoxColor; <>CAL_l_UseGroupColor; <>CAL_l_Year; $_i_Count)
	C_LONGINT:C283($_l_Many; $_l_One)
	C_POINTER:C301(<>Cal_ptr_EventCatagoriesField; <>Cal_ptr_EventColorField; <>Cal_ptr_EventCommentsField; <>Cal_ptr_EventDescripField; <>Cal_ptr_EventDurationField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventiCalDateTimeField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventIDField)
	C_POINTER:C301(<>Cal_ptr_EventLastModifiedField; <>Cal_ptr_EventLEndDateField; <>Cal_ptr_EventLocationField; <>Cal_ptr_EventLStartDateField; <>Cal_ptr_EventLStartTimeField; <>Cal_ptr_EventLZoneField; <>Cal_ptr_EventNotesField; <>Cal_ptr_EventRecurranceField; <>Cal_ptr_EventSeqNoField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField)
	C_POINTER:C301(<>Cal_ptr_EventStatusField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_EventURLField; <>Cal_ptr_EventZoneField; <>Cal_ptr_FieldLEventStartField; <>Cal_ptr_GroupDescriptionField; <>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name)
	C_POINTER:C301(<>Cal_ptr_GroupicalLastupdateFiel; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalUpdateintField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupiCalUUIDField; <>Cal_ptr_GroupotherscanModField; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupPublishURLField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField)
	C_POINTER:C301(<>CAL_ptr_Nil; <>CAL_ptr_SelectedObject; Cal_ptr_UserIDField; Cal_ptr_UsernameField; Cal_ptr_UserTable)
	C_REAL:C285(<>Cal_r_IcalTIMEZONEOFFSET)
	C_TEXT:C284(<>CAL_t_BackgroundProcessName; <>CAL_t_CalendarProcessName; <>Cal_t_CallbackMethodforEvents; <>Cal_t_CallbackMethodforUpdates; <>CAL_t_CalWeekStart; <>Cal_t_CurrentUserName; <>Cal_t_DisplayFont; <>Cal_t_Event_DefaultTitle; <>CAL_t_FullAndMinisProcName; <>Cal_t_GroupDefaultTitle; <>CAL_t_GroupManageProcess)
	C_TEXT:C284(<>CAL_t_iCalRefreshProcessName; <>CAL_t_iCalStatus; <>Cal_t_iCalTimeZone; <>CAL_t_PositionObjectName; <>Cal_t_SelectedCellID; <>Cal_t_SelectedEvtUID; <>CAL_t_SemaphoreName; <>CAL_t_SharedUserName; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; $_t_ResourcesFolder)
	C_TEXT:C284(Cal_t_1stDayOfWeek; Cal_t_DisplayFont; Cal_t_TimeZone; CAL_T_UserTimeZone)
	C_TIME:C306($_ti_ResRefID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Init")

// //  Init Process Vars
//{
If (Not:C34(Cal_bo_Initialized))
	Compiler_Cal4D
	Cal4D_Cal_SelectedDate(Current date:C33)
	Cal4D_Cell_BG_MouseOver(Cal4D_Cal_Cell_BG("Pop_MouseOver"))
	
	Error:=0
	Cal_t_DisplayFont:="Arial Narrow"
	
	Cal_t_TimeZone:=Cal4D_iCal_GetTimezone
	Cal_t_1stDayOfWeek:=Get indexed string:C510(32000; 1)
	
	ARRAY TEXT:C222(Cal_at_1stDayOfWeek; 0)
	
	Cal_bo_Initialized:=True:C214
	
End if 
If (Not:C34(<>Cal_bo_Initialized))
	//Cal4D_CreateTables
	
	If (Error=0)
		Compiler_Cal4D
		
		$_t_ResourcesFolder:=Get 4D folder:C485(Current resources folder:K5:16)
		$_ti_ResRefID:=Open resource file:C497($_t_ResourcesFolder+"cursors.rsrc")
		
		// Set up pointers to the structure. The tables used by this component are not installed with the component.
		Cal_ptr_UserTable:=->[PERSONNEL:11]  //Cal4D_VerifyStructureItem("[Cal4D_User]")
		Cal_ptr_UserIDField:=->[PERSONNEL:11]Personnel_ID:48  //Cal4D_VerifyStructureItem("[Cal4D_User]ID";Is LongInt ;True)
		Cal_ptr_UsernameField:=->[PERSONNEL:11]Name:2  //Cal4D_VerifyStructureItem("[Cal4D_User]User_Name";Is Alpha Field ;True)
		//``◊Cal4D_UserDefaultGroupIDFld_ptr:=»Cal4D_VerifyStructureItem ("[Cal4D_User]Default_Group_ID";Is LongInt )
		<>Cal_ptr_GroupTable:=->[PERSONNEL_GROUPS:92]  //Cal4D_VerifyStructureItem ("[Cal4D_Group]")
		<>Cal_ptr_GroupFld_ID:=->[PERSONNEL_GROUPS:92]x_ID:12  //Cal4D_VerifyStructureItem ("[Cal4D_Group]ID";Is LongInt;True)
		//<>Cal_ptr_GroupUserIDField:=`[Cal4D_VerifyStructureItem("[Cal4D_Group]User_ID";Is LongInt;True)
		<>Cal_ptr_GroupFld_Name:=Cal4D_VerifyStructureItem("[Cal4D_Group]Group_Name"; Is alpha field:K8:1; True:C214)
		<>Cal_ptr_GroupFld_Colour:=Cal4D_VerifyStructureItem("[Cal4D_Group]Group_Color"; Is longint:K8:6)
		<>Cal_ptr_GroupotherscanviewField:=Cal4D_VerifyStructureItem("[Cal4D_Group]Other_Users_Can_View"; Is boolean:K8:9; True:C214)
		<>Cal_ptr_GroupotherscanModField:=Cal4D_VerifyStructureItem("[Cal4D_Group]Other_Users_Can_Modify"; Is boolean:K8:9; True:C214)
		<>Cal_ptr_GroupicalURLField:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_URL"; Is text:K8:3)
		<>Cal_ptr_GroupicaluserNameField:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_User_Name"; Is alpha field:K8:1)
		<>Cal_ptr_GroupicalPasswordField:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_Password"; Is alpha field:K8:1)
		<>Cal_ptr_GroupicalUpdateintField:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_Update_Interval_Minutes"; Is integer:K8:5)
		<>Cal_ptr_GroupicalLastupdateFiel:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_Last_Update"; Is longint:K8:6)
		<>Cal_ptr_GroupiCalUUIDField:=Cal4D_VerifyStructureItem("[Cal4D_Group]iCal_UUID"; Is alpha field:K8:1)
		<>Cal_ptr_GroupDescriptionField:=Cal4D_VerifyStructureItem("[Cal4D_Group]Group_Description"; Is text:K8:3)
		<>Cal_ptr_GroupPublishURLField:=Cal4D_VerifyStructureItem("[Cal4D_Group]Group_Publish_URL"; Is text:K8:3)
		
		<>Cal_ptr_EventTable:=Cal4D_VerifyStructureItem("[Cal4D_Event]")
		<>Cal_ptr_EventIDField:=Cal4D_VerifyStructureItem("[Cal4D_Event]ID"; Is longint:K8:6; True:C214)
		<>Cal_ptr_EventGroupIDField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Group_ID"; Is longint:K8:6; True:C214)
		<>Cal_ptr_EventTitleField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Title"; Is alpha field:K8:1; True:C214)
		<>Cal_ptr_EventTypeFldField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Type"; Is alpha field:K8:1; True:C214)
		<>Cal_ptr_EventColorField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Color"; Is longint:K8:6)
		<>Cal_ptr_EventNotesField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Notes"; Is text:K8:3)
		<>Cal_ptr_EventLocationField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Location"; Is alpha field:K8:1)
		<>Cal_ptr_EventiCalUIDField:=Cal4D_VerifyStructureItem("[Cal4D_Event]iCal_UID"; Is alpha field:K8:1; False:C215)
		<>Cal_ptr_EventiCalDateTimeField:=Cal4D_VerifyStructureItem("[Cal4D_Event]iCal_Date_Time_Stamp"; Is alpha field:K8:1)
		
		<>CAL_ptr_EventStartDateFld:=Cal4D_VerifyStructureItem("[Cal4D_Event]Ori_Start_Date"; Is date:K8:7; True:C214)
		<>Cal_ptr_EventStartTimeField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Ori_Start_Time"; Is time:K8:8; True:C214)
		<>CAL_ptr_EventEndDateFld:=Cal4D_VerifyStructureItem("[Cal4D_Event]Ori_End_Date"; Is date:K8:7; True:C214)
		<>Cal_ptr_EventEndTimeField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Ori_End_Time"; Is time:K8:8; True:C214)
		<>Cal_ptr_EventZoneField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Ori_TimeZone"; Is alpha field:K8:1)
		
		<>Cal_ptr_EventLStartDateField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Loc_Start_Date"; Is date:K8:7; True:C214)
		<>Cal_ptr_EventLStartTimeField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Loc_Start_Time"; Is time:K8:8; True:C214)
		<>Cal_ptr_EventLEndDateField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Loc_End_Date"; Is date:K8:7; True:C214)
		<>Cal_ptr_FieldLEventStartField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Loc_End_Time"; Is time:K8:8; True:C214)
		<>Cal_ptr_EventLZoneField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Loc_TimeZone"; Is alpha field:K8:1)
		
		<>Cal_ptr_EventSeqNoField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_SeqNo"; Is longint:K8:6)
		<>Cal_ptr_EventURLField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_URL"; Is text:K8:3)
		<>Cal_ptr_EventCommentsField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Comments"; Is text:K8:3)
		<>Cal_ptr_EventDescripField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Description"; Is text:K8:3)
		
		<>Cal_ptr_EventStatusField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Status"; Is alpha field:K8:1)
		<>Cal_ptr_EventDurationField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Duration"; Is alpha field:K8:1)
		<>Cal_ptr_EventRecurranceField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Recurrance"; Is alpha field:K8:1)
		<>Cal_ptr_EventCatagoriesField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_Categories"; Is alpha field:K8:1)
		<>Cal_ptr_EventLastModifiedField:=Cal4D_VerifyStructureItem("[Cal4D_Event]Event_LastModified"; Is alpha field:K8:1)
		
		GET FIELD RELATION:C920(<>Cal_ptr_EventGroupIDField->; $_l_One; $_l_Many)
		If (($_l_One=0) & ($_l_Many=0))
			Cal4D_Alert("The Cal4D component requires a many-to-one relationship: "+Field name:C257(<>Cal_ptr_EventGroupIDField))
		End if 
		
		GET FIELD RELATION:C920(<>Cal_ptr_GroupUserIDField->; $_l_One; $_l_Many)
		If (($_l_One=0) & ($_l_Many=0))
			Cal4D_Alert("The Cal4D component requires a many-to-one relationship: "+Field name:C257(<>Cal_ptr_GroupUserIDField))
		End if 
		
		// All of the other IP variables are defined in Compiler_Cal4D.  But this one
		//   needs to be defined here for this to work in interpreted mode.
		
		<>Cal_t_Event_DefaultTitle:="untitled event"  // Localize
		<>Cal_t_GroupDefaultTitle:="untitled calendar"  // Localize
		
		<>CAL_l_CurrentUserID:=0  // Holds the ID of the current user.
		<>CAL_l_SharedUserID:=-1  // Holds the "Cal4D_System" user ID. Always -1.
		<>CAL_t_SharedUserName:="Cal4D_SharedUser"
		
		<>Cal_t_SelectedCellID:=""
		<>Cal_t_SelectedEvtUID:=""
		
		// These are the options that the developer can enable/disable.
		<>Cal_bo_DisplayMonthYearText:=True:C214
		<>Cal_bo_DisplayDaysOfTheWeek:=True:C214  // Draw "Sunday".."Saturday" at the top.
		<>Cal_bo_DisplayNavButtons:=True:C214
		<>Cal_bo_DisplayOutermostLines:=True:C214  // Draw the outermost divider lines?
		<>Cal_bo_ResizeWithWindow:=True:C214  // Should the calendar resize with the window?
		<>Cal_t_CallbackMethodforEvents:=""  // The callback method for events.
		<>Cal_t_CallbackMethodforUpdates:=""  // The callback method for updating the events.
		
		<>Cal_bo_CalisVisible:=True:C214  // See Cal4D_Cal_SetVisible.
		<>CAL_l_UseGroupColor:=-1  // This event color means use the group color.
		<>CAL_l_DisplayedMonthBoxColor:=0x00FFFFFF
		<>CAL_l_OtherMonthBoxColor:=0x00F6F6F6
		<>CAL_l_TodayBoxColor:=0x00FFFFDD
		<>CAL_l_SelectedBoxColor:=0x00EDF3FA
		<>CAL_l_DividerLineColor:=0x00DDDDDD
		
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		
		If (Is Windows:C1573)
			<>Cal_t_DisplayFont:=<>SYS_t_DefaultFontPlain
			<>CAL_l_TextEventSize:=11
		Else 
			<>Cal_t_DisplayFont:=<>SYS_t_DefaultFontPlain
			<>CAL_l_TextEventSize:=11
		End if 
		
		<>CAL_l_CalendarLeft:=0  // The calendar coordinates within the window.
		<>CAL_l_CalendarTop:=0  // These can be set by calling Cal4D_SetPosition.
		<>CAL_l_CalendarRight:=0  // We actually set the default in Cal4D_Cal_FormMethod.
		<>CAL_l_CalendarBottom:=0
		<>CAL_t_PositionObjectName:=""
		
		<>CAL_l_DOWHeight:=17  // The height of the day of the week boxes. Width is automatic.
		<>CAL_l_DOWVOffset:=1  // The vertical offset for the day of the week labels. Centered, so no HOffset.
		
		<>CAL_l_ColumnWidth:=1
		<>CAL_l_ColumnHeight:=1
		<>CAL_l_TextHeight:=<>CAL_l_TextEventSize*1.2
		<>CAL_l_BannerHeight:=<>CAL_l_TextHeight+1
		<>CAL_l_DragAreaWidth:=10  // The width of the draggable area on banners.
		
		<>CAL_l_MaxTextObjects:=150  // The number of variables set aside to display text information.
		<>CAL_l_MaxBannerObjects:=30  // The number of variables set aside to display banners.
		<>CAL_l_MaxPictureObjects:=50  // The number of variables set aside to display pictures (works out to 1 per calendar square).
		
		<>CAL_l_ServerCheckInterval:=10  // How often, in seconds, we check the server for calendar updates.
		<>CAL_l_LastClientUpdateTime:=0  // The last time we updated the calendar. We compare this to the value stored in [Cal4D_User]Default_Group_ID for the system user record.
		
		<>Cal_bo_QuitNow:=False:C215  // We'll set this to True when it's time to quit the calendar stuff.
		
		<>Cal_bo_EventUpdateNeeded:=False:C215  // We set this to True when the calendar events need updating.
		<>Cal_bo_FormUpdateNeeded:=False:C215  // We set this to True when the calendar objects need redrawing.
		<>Cal_bo_MonthUpdateNeeded:=False:C215  // Gets set to True when the month needs to be recalculated.
		
		<>CAL_t_CalendarProcessName:="Cal4D_Calendar"
		<>CAL_t_GroupManageProcess:="Cal4D_ManageGroups"
		<>CAL_t_SemaphoreName:="$Cal4D_Semaphore"
		<>CAL_l_SemaphoreTimeout:=30*60  // 30 seconds
		<>CAL_t_FullAndMinisProcName:=""
		
		<>CAL_l_FirstDayOfWeek:=Sunday:K10:19  // So it can grow up to be a preference someday.
		
		//◊Cal4D_SelectedDate:=
		<>CAL_l_Month:=Month of:C24(CAL_d_SelectedDate)
		<>CAL_l_Year:=Year of:C25(CAL_d_SelectedDate)
		
		<>CAL_l_StackSize:=128*1024
		
		<>CAL_ptr_SelectedObject:=<>CAL_ptr_Nil
		
		// We use an array (one element per box on the calendar) to track what boxes
		//   already have banners in them. This allows us to stack banner items, rather
		//   than just draw them all on top of each other.
		ARRAY LONGINT:C221(<>Cal_al_BoxBannerLevels; 42)
		
		// Build the picture popup control displayed on the [Calendar].Input form.
		//   Ideally we'd update this image any time a change was made to the folder of
		//   images, but that would be overkill for this example database.
		// Why do we do this _after_ displaying the calendar? Because chances are the user
		//   isn't going to use the control in the first few seconds when the database
		//   starts up.  But they will notice the delay if it holds up the display of the
		//  opening of the calendar window.  Since the calendar window will be opened in a
		//   new process, this is harmless.  But it "feels" faster.
		//Cal4D_PictPopupLoadPicts
		
		<>CAL_t_iCalStatus:="Idle"  // Localize
		<>CAL_l_iCalUpdateInterval:=5*60  // In seconds. We do our update background loop every 5 minutes.
		<>CAL_t_BackgroundProcessName:="Cal4D_BackgroundProcess"  // Must be a server process.
		<>CAL_t_iCalRefreshProcessName:="Cal4D_iCalRefresher"
		<>CAL_l_iCalLastStatusUpdate:=0  // The last time we updated the status message.
		
		// //  Get time zone and offset from GMT
		//{
		Cal4D_TimeZone_LoadFromDisk(Cal4D_User_Name)
		
		
		If (CAL_T_UserTimeZone="")
			Cal4D_TiZone_WeekStart_Init
			
			
			
		Else 
			<>Cal_r_IcalTIMEZONEOFFSET:=Num:C11(CAL4D_STR_Parse(CAL_T_UserTimeZone; 5; ":"))/100
			
			
			<>Cal_t_iCalTimeZone:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":")
			
			
			
			
			<>Cal_t_iCalTimeZone:=Cal4D_iCal_GetTimezone
			<>Cal_r_IcalTIMEZONEOFFSET:=Num:C11(Substring:C12(<>Cal_t_iCalTimeZone; Position:C15(":"; <>Cal_t_iCalTimeZone)+1))/100
			<>Cal_t_iCalTimeZone:=Substring:C12(<>Cal_t_iCalTimeZone; 1; Position:C15(":"; <>Cal_t_iCalTimeZone)-1)
			//}
			
			Cal4D_WeekStart_LoadFromDisk(Cal4D_User_Name)
			
		End if 
		
		If (<>CAL_t_CalWeekStart="")
			<>CAL_t_CalWeekStart:="Sun"
		End if 
		
		ARRAY TEXT:C222(Cal4D_at_RefreshPopup; 6)  // Localize
		Cal4D_at_RefreshPopup{1}:="Off"
		Cal4D_at_RefreshPopup{2}:="Every 15 Minutes"
		Cal4D_at_RefreshPopup{3}:="Ever Hour"
		Cal4D_at_RefreshPopup{4}:="Every Day"
		Cal4D_at_RefreshPopup{5}:="Every Week"
		Cal4D_at_RefreshPopup{6}:="Every Month"
		
		ARRAY LONGINT:C221(<>Cal_al_iCalRefreshMinutes; 6)
		<>Cal_al_iCalRefreshMinutes{1}:=0
		<>Cal_al_iCalRefreshMinutes{2}:=15
		<>Cal_al_iCalRefreshMinutes{3}:=60
		<>Cal_al_iCalRefreshMinutes{4}:=60*24
		<>Cal_al_iCalRefreshMinutes{5}:=60*24*7
		<>Cal_al_iCalRefreshMinutes{6}:=60*24*7*30
		
		// Create a set of arrays to store RAM-based events. See Cal4D_Event_Display.
		Cal4D_ClearEventArrays
		
		
		<>Cal_bo_Initialized:=True:C214  // This must be done before we save the records below which will trigger the trigger.
		
		//If (Shell_SysDocFileName (Structure file)#"Cal4Dv11SQL.4DB")
		// We use negative numbers for our [Cal4D_Event] records to distinguish them from
		//   the ID numbers of temporary events added by the user of the component
		//   (which are stored in arrays). But we still want to be able to pass 4D's New Record
		//   constant to the Cal4D_Event_Edit routine to create a new record. So here we
		//   make sure we won't be creating a [Cal4D_Event] record with an ID of -3.
		If (Sequence number:C244(<>Cal_ptr_EventTable->)<=3)
			SET DATABASE PARAMETER:C642(<>Cal_ptr_EventTable->; Table sequence number:K37:31; 4)
		End if 
		//While (Sequence number(◊Cal_Po_EventTable->)<=3)
		//CREATE RECORD(◊Cal_Po_EventTable->)  ` The trigger will assign a sequence number, so we don't need to do it here too.
		//SAVE RECORD(◊Cal_Po_EventTable->)
		//DELETE RECORD(◊Cal_Po_EventTable->)
		//End while
		
		//End if
		
		<>CAL_l_CurrentUserID:=Cal4D_User_ID(<>Cal_t_CurrentUserName)
		
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Init"; $_t_oldMethodName)