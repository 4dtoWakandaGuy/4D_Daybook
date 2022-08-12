//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 18/12/2009 13:40`Method: Compiler_Cal4D
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	
	
	//Nigel Greenlee18/12/2009 13:43
	
	//Nigel Greenlee20/12/2009 14:58
	
	//Nigel Greenlee22/12/2009 14:35
	
	//Nigel Greenlee22/12/2009 14:40
	
	//Nigel Greenlee22/12/2009 15:52
	
	//Nigel Greenlee24/12/2009 14:48
	
	//Nigel Greenlee24/12/2009 15:20
	
	//Nigel Greenlee24/12/2009 15:24
	
	//Nigel Greenlee24/12/2009 15:32
	
	//Nigel Greenlee24/12/2009 16:27
	
	//Nigel Greenlee24/12/2009 16:39
	
	//Nigel Greenlee24/12/2009 16:50
	
	//Nigel Greenlee24/12/2009 17:04
	
	//Nigel Greenlee26/12/2009 18:12
	
	//Nigel Greenlee26/12/2009 18:16
	
	//Nigel Greenlee26/12/2009 18:22
	
	//Nigel Greenlee09/01/2010 11:19
	
	//Nigel Greenlee09/01/2010 16:35
	
	//Nigel Greenlee11/01/2010 07:08
	
	//Nigel Greenlee11/01/2010 09:17
	
	//Nigel Greenlee11/01/2010 15:40
	
	//Nigel Greenlee11/01/2010 15:48
	
	//Nigel Greenlee12/01/2010 09:03
	
	//Nigel Greenlee12/01/2010 09:28
	
	//Nigel Greenlee12/01/2010 09:31
	
	//Nigel Greenlee12/01/2010 11:44
	
	//Nigel Greenlee12/01/2010 12:09
	
	//Nigel Greenlee12/01/2010 12:32
	
	//Nigel Greenlee12/01/2010 13:55
	
	//Nigel Greenlee2010/01/12 2:34 PM
	
	//Nigel Greenlee2010/01/12 3:04 PM
	
	//Nigel Greenlee2010/01/12 3:29 PM
	
	//Nigel Greenlee2010/01/12 3:55 PM
	
	//Nigel Greenlee2010/01/12 4:20 PM
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_Cal4D")
C_BOOLEAN:C305(Cal_bo_Initialized)
If (Not:C34(Cal_bo_Initialized))
	
	ARRAY TEXT:C222(CAL_at_iCalUserIDs; 0)
	ARRAY TEXT:C222(Cal4D_at_iCalDateTimeStamps; 0)
	ARRAY TEXT:C222(Cal4D_at_iCalSummaries; 0)
	ARRAY TEXT:C222(Cal4D_at_iCalDescriptions; 0)
	ARRAY DATE:C224(Cal4D_ad_CalStartDates; 0)
	ARRAY TIME:C1223(Cal4D_ati_iCalStartTimes; 0)
	ARRAY DATE:C224(Cal4D_ad_iCalEndDates; 0)
	ARRAY TIME:C1223(Cal4D_ati_iCalEndTimes; 0)
	ARRAY LONGINT:C221(Cal4D_al_iCalDurationSecs; 0)
	
	C_TEXT:C284(CAL_t_CalWeekStart; Cal4D_t_CalTimeZone)
	
	C_LONGINT:C283(Cal_l_CalImportElement; Cal4D_l_Day; Cal4D_l_Month; Cal4D_l_Year; Cal4d_l_OKFlag)
	C_LONGINT:C283(Cal4D_l_OKButton; Cal4D_l_CancelButton; Cal4D_l_SpinnerIncrement)
	C_LONGINT:C283(Cal4D_l_SelectPictureHeader)  // This is used in the listbox header in the Cal4D_Event_SelectPicture form.
	C_TEXT:C284(CAL_t_CalImportLastTag; Cal4D_t_Message; Cal4D_t_OKButtonLabel; Cal4D_t_CancelButtonLabel)
	C_TEXT:C284(Cal4D_t_iCalPassword; Cal4D_t_iCalCalendarName)
	C_TEXT:C284(Cal4D_t_EventTitle; Cal4D_t_EventNotes; Cal4D_t_GroupCalendarName; Cal4D_t_iCalURL; Cal4D_t_iCalUserName)
	C_TEXT:C284(Cal4D_t_Font)
	C_DATE:C307(Cal4D_d_EventStartDate; Cal4D_d_EventEndDate; CAL_d_iCalTempDate)
	C_TIME:C306(Cal4D_ti_iCalTempTime; Cal4D_ti_EventStartTime; Cal4D_ti_EventEndTime)
	C_PICTURE:C286(Cal4D_pi_EventImage)
	
	C_LONGINT:C283(Cal4D_l_Left; Cal4D_l_Top; Cal4D_l_SpinnerIncrement; Cal4D_l_SQLCnt)
	
	C_TEXT:C284(Cal_t_TimeZone; Cal_t_1stDayOfWeek; Cal4D_t_Description)
End if 


C_BOOLEAN:C305(Cal_bo_Initialized)
If (Not:C34(Cal_bo_Initialized))
	ARRAY TEXT:C222(Cal4D_at_RefreshPopup; 6)
	ARRAY LONGINT:C221(<>Cal_al_iCalRefreshMinutes; 6)
	ARRAY LONGINT:C221(<>Cal_al_BoxBannerLevels; 0)
	
	ARRAY LONGINT:C221(SD2_al_EventIDs; 0)
	ARRAY TEXT:C222(SD2_at_FormVarNames; 0)
	ARRAY LONGINT:C221(SD2_al_BoxNumber; 0)
	ARRAY LONGINT:C221(SD2_al_EventColours; 0)
	
	ARRAY PICTURE:C279(<>Cal_api_EventPictures; 0)
	ARRAY LONGINT:C221(<>Cal_al_iCalIDs; 0)
	ARRAY TEXT:C222(<>Cal_at_GroupPopupMenu; 0)
	ARRAY LONGINT:C221(<>Cal_al_GroupPopupIDs; 0)
	ARRAY BOOLEAN:C223(<>Cal_abo_SelectPictureListbox; 0)
	
	ARRAY LONGINT:C221(<>Cal_al_MoreEventIDs; 0)
	ARRAY TEXT:C222(<>Cal_at_MoreEventTitles; 0)
	ARRAY LONGINT:C221(<>Cal_al_MoreEventColors; 0)
	
	ARRAY LONGINT:C221(<>Cal_al_EventIDS; 0)
	ARRAY TEXT:C222(<>Cal_at_EventTypes; 0)
	ARRAY TEXT:C222(<>Cal_at_EventTitles; 0)
	ARRAY DATE:C224(<>Cal_ad_EventOStartDates; 0)
	ARRAY TIME:C1223(<>Cal_ati_EventOStartTimes; 0)
	ARRAY DATE:C224(<>Cal_ad_EventOEndDates; 0)
	ARRAY TIME:C1223(<>Cal_ati_EventOEndTimes; 0)
	ARRAY LONGINT:C221(<>Cal_al_EventColors; 0)
	ARRAY LONGINT:C221(<>Cal_al_EventGroupIDs; 0)
	ARRAY TEXT:C222(<>Cal_at_EventNotes; 0)
	
	ARRAY BOOLEAN:C223(<>Cal_Lb_CalenderList; 0)
	
	C_POINTER:C301(<>CAL_ptr_Field)
	C_POINTER:C301(<>CAL_ptr_SelectedObject; <>CAL_ptr_Nil; <>CAL_ptr_DragBanner; <>CAL_ptr_DragBttn)
	C_POINTER:C301(Cal_ptr_UserTable; Cal_ptr_UserIDField; Cal_ptr_UsernameField; <>CAL_ptr_UserDefaultGroupIDFld)
	C_POINTER:C301(<>Cal_ptr_GroupTable; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupUserIDField; <>Cal_ptr_GroupFld_Name)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupotherscanModField)
	C_POINTER:C301(<>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupPublishURLField)
	C_POINTER:C301(<>Cal_ptr_GroupicalUpdateintField; <>Cal_ptr_GroupicalLastupdateFiel; <>CAL_ptr_GroupiCalUUIDField; <>Cal_ptr_GroupDescriptionField)
	
	C_POINTER:C301(<>Cal_ptr_EventTable; <>Cal_ptr_EventIDField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventTitleField)
	C_POINTER:C301(<>Cal_ptr_EventTypeFldField; <>Cal_ptr_EventColorField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField)
	C_POINTER:C301(<>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventNotesField; <>CAL_ptr_EventPictureFld; <>Cal_ptr_EventLocationField)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventiCalDateTimeField; <>Cal_ptr_EventSeqNoField; <>Cal_ptr_EventURLField)
	C_POINTER:C301(<>Cal_ptr_EventCommentsField; <>Cal_ptr_EventDescripField)
	C_POINTER:C301(<>Cal_ptr_EventStatusField; <>Cal_ptr_EventDurationField; <>Cal_ptr_EventRecurranceField; <>Cal_ptr_EventCatagoriesField)
	
	C_BOOLEAN:C305(<>Cal_bo_DragStart; <>Cal_bo_DisplayMonthYearText; <>Cal_bo_DisplayDaysOfTheWeek)
	C_BOOLEAN:C305(<>Cal_bo_DisplayNavButtons; <>Cal_bo_DisplayOutermostLines; <>Cal_bo_ResizeWithWindow)
	C_BOOLEAN:C305(<>Cal_bo_QuitNow; <>Cal_bo_EventUpdateNeeded; <>Cal_bo_FormUpdateNeeded)
	C_BOOLEAN:C305(<>Cal_bo_MonthUpdateNeeded; <>Cal_bo_CalisVisible)
	C_BOOLEAN:C305(<>Cal_bo_CanViewCheckbox; <>Cal_bo_CanModifyCheckbox)
	C_BOOLEAN:C305(<>Cal_bo_RandomWarmed)
	
	C_LONGINT:C283(<>CAL_l_CurrentUserID; <>CAL_l_SharedUserID; <>CAL_l_NextPictRightOffset; <>CAL_l_MoreEventTitlesHdr; <>CAL_l_MoreEventIDsHdr)
	C_LONGINT:C283(<>CAL_l_DeleteButton; <>CAL_l_iCalLinkButton; <>CAL_l_iCalNewButton; <>CAL_l_Platform)
	C_LONGINT:C283(<>CAL_l_MoreStuffButtonWidth; <>CAL_l_MoreStuffButtonHeight)
	C_LONGINT:C283(<>Cal_rb1; <>Cal_rb2; <>Cal_rb3)
	C_LONGINT:C283(<>CAL_l_ColorButton1; <>CAL_l_ColorButton2; <>CAL_l_ColorButton3; <>CAL_l_ColorButton4; <>CAL_l_ColorButton5; <>CAL_l_ColorButton6; <>CAL_l_ColorButton7; <>CAL_l_ColorButton8)
	C_LONGINT:C283(<>CAL_l_CalendarLeft; <>CAL_l_CalendarTop; <>CAL_l_CalendarRight; <>CAL_l_CalendarBottom; <>CAL_l_BoxHeight; <>CAL_l_BoxWidth)
	C_LONGINT:C283(<>CAL_l_ColumnHeight; <>CAL_l_ColumnWidth)
	C_LONGINT:C283(<>CAL_l_FirstBox; <>CAL_l_LastBox; <>CAL_l_CalendarLeft; <>CAL_l_MaxBannerObjects; <>CAL_l_MaxTextObjects; <>CAL_l_MaxPictureObjects)
	C_LONGINT:C283(<>CAL_l_NextObjectNum; <>CAL_l_NextTextTop; <>CAL_l_TextHeight; <>CAL_l_CalendarRight; <>CAL_l_Year; <>CAL_l_Month)
	C_LONGINT:C283(<>CAL_l_PictPopupControl; <>CAL_l_BannerHeight; <>CAL_l_DragAreaWidth)
	C_LONGINT:C283(<>CAL_l_DragBannerLeft; <>CAL_l_DragBannerTop; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerBottom; <>CAL_l_DragBannerOffset)
	C_LONGINT:C283(<>CAL_l_DragRightLimit; <>CAL_l_PictPopupRows; <>CAL_l_PictPopupCols; <>CAL_l_DragSelectL; <>CAL_l_DragSelectR)
	C_LONGINT:C283(<>CAL_l_OffscreenButton; <>CAL_l_PictureButton)
	C_LONGINT:C283(<>CAL_l_SpinUpButton; <>CAL_l_SpinDownButton)
	C_LONGINT:C283(<>CAL_l_UseGroupColor; <>CAL_l_ColorPopupMenu; <>CAL_l_LastClientUpdateTime)
	
	C_LONGINT:C283(<>CAL_l_DisplayedMonthBoxColor; <>CAL_l_OtherMonthBoxColor; <>CAL_l_TodayBoxColor)
	C_LONGINT:C283(<>CAL_l_SelectedBoxColor; <>CAL_l_DividerLineColor; <>CAL_l_NavPrevButton; <>CAL_l_NavNextButton; <>CAL_l_NavJumpButton)
	C_LONGINT:C283(<>CAL_l_TextEventSize)
	
	C_LONGINT:C283(<>CAL_l_DOWHeight; <>CAL_l_DOWVOffset; <>CAL_l_FirstDayOfWeek; <>CAL_l_iCalLastStatusUpdate)
	
	C_LONGINT:C283(<>CAL_l_GroupNewButton; <>CAL_l_GroupEditButton; <>CAL_l_GroupDeleteButton; <>CAL_l_GroupSetDefaultButton)
	C_LONGINT:C283(<>CAL_l_GroupDeleteButton; <>CAL_l_GroupDeleteButton; <>CAL_l_GroupHlist)
	
	C_LONGINT:C283(<>CAL_l_SelectPictureButton; <>CAL_l_StackSize; <>CAL_l_SemaphoreTimeout)
	
	C_TEXT:C284(<>CAL_t_PositionObjectName; <>Cal_t_CurrentUserName; <>CAL_t_SharedUserName; <>CAL_t_CalendarName; <>Cal_t_DisplayFont)
	C_TEXT:C284(<>Cal_t_GroupDefaultTitle; <>Cal_t_Event_DefaultTitle)
	C_TEXT:C284(<>CAL_t_GroupManageProcess; <>CAL_t_SemaphoreName)
	C_TEXT:C284(<>Cal_t_CallbackMethodforEvents; <>Cal_t_CallbackMethodforUpdates)
	
	C_TEXT:C284(<>CAL_t_MonthYear; <>CAL_t_GroupInfo)
	
	C_TEXT:C284(<>CAL_t_iCalStatus; <>CAL_t_iCal_UpdateProcess)
	C_TEXT:C284(<>CAL_t_CalendarProcessName; <>CAL_t_FullAndMinisProcName; <>CAL_t_iCalRefreshProcessName; <>CAL_t_BackgroundProcessName)
	
	C_TEXT:C284(<>CAL_t_DOWLabel001; <>CAL_t_DOWLabel002; <>CAL_t_DOWLabel003; <>CAL_t_DOWLabel004; <>CAL_t_DOWLabel005; <>CAL_t_DOWLabel006; <>CAL_t_DOWLabel007)
	
	C_LONGINT:C283(<>CAL_l_iCalUpdateInterval; <>CAL_l_ServerCheckInterval; <>CAL_l_CalendarWindowRef)
	
	C_BLOB:C604(<>CAL_blb_iCalWDAVBody; <>CAL_blb_iCalWDAVReceived)
	
	C_TEXT:C284(CAL_t_CalWeekStart)
	C_DATE:C307(CAL_d_SelectedDate)
	
End if 

If (False:C215)
	C_LONGINT:C283(Cal4D_AddTrackingElement; $1; $3; $4)
	C_TEXT:C284(Cal4D_AddTrackingElement; $2)
	
	C_TEXT:C284(Cal4D_Alert; $1)
	C_LONGINT:C283(Cal4D_Alert; $2)
	
	C_POINTER:C301(Cal4D_BannerObjectMethod; $1)
	
	C_LONGINT:C283(Cal4D_BoxObjectMethod; $0)
	C_POINTER:C301(Cal4D_BoxObjectMethod; $1)
	
	C_DATE:C307(Cal4D_Cal_SelectedDate; $0; $1)
	
	C_POINTER:C301(Cal4D_SetObjectColor; $1)
	C_TEXT:C284(Cal4D_SetObjectColor; $2)
	C_DATE:C307(Cal4D_SetObjectColor; $3)
	C_LONGINT:C283(Cal4D_SetObjectColor; $4)
	
	C_BOOLEAN:C305(Cal4D_Cal_DisplayDayOfWeek; $0; $1)
	
	C_DATE:C307(Cal4D_Cal_DisplayedDate; $0; $1)
	
	C_BOOLEAN:C305(Cal4D_Cal_DisplayMonthYear; $0; $1)
	
	C_BOOLEAN:C305(Cal4D_Cal_DisplayNavButtons; $0; $1)
	
	C_DATE:C307(Cal4D_Cal_SelectedDate; $0; $1)
	
	C_LONGINT:C283(Cal4D_Cal_SetPosition; $1; $2; $3; $4)
	
	C_TEXT:C284(Cal4D_Cal_SetPositionByObject; $1)
	
	C_BOOLEAN:C305(Cal4D_Cal_SetVisible; $1)
	
	C_DATE:C307(Cal4D_EndOfMonth; $0; $1)
	
	C_LONGINT:C283(Cal4D_Cal_Color; $0; $2)
	C_TEXT:C284(Cal4D_Cal_Color; $1)
	
	C_LONGINT:C283(Cal4D_Cal_Color2; $0; $2)
	C_POINTER:C301(Cal4D_Cal_Color2; $1)
	
	C_BOOLEAN:C305(Cal4D_CallCallbackMethod; $0)
	C_LONGINT:C283(Cal4D_CallCallbackMethod; $1; $2)
	C_DATE:C307(Cal4D_CallCallbackMethod; $3; $4)
	
	C_LONGINT:C283(Cal4D_CenterWindow; $0; $2)
	C_TEXT:C284(Cal4D_CenterWindow; $1)
	
	C_TEXT:C284(Cal4D_Confirm; $1)
	
	C_POINTER:C301(Cal4D_DateFilter; $1)
	
	C_POINTER:C301(Cal4D_DeselectObject; $1)
	
	C_POINTER:C301(Cal4D_DragObjectMethod; $1)
	
	C_LONGINT:C283(Cal4D_Event_Trigger; $0)
	
	C_LONGINT:C283(Cal4D_Event_Color; $0; $1; $2)
	
	C_LONGINT:C283(Cal4D_Event_Create; $0; $6)
	C_TEXT:C284(Cal4D_Event_Create; $1)
	C_DATE:C307(Cal4D_Event_Create; $2; $4)
	C_TIME:C306(Cal4D_Event_Create; $3; $5)
	
	C_LONGINT:C283(Cal4D_Event_Delete; $1)
	
	C_LONGINT:C283(Cal4D_Event_Display; $0; $1; $7)
	C_TEXT:C284(Cal4D_Event_Display; $2)
	C_DATE:C307(Cal4D_Event_Display; $3; $5)
	C_TIME:C306(Cal4D_Event_Display; $4; $6)
	
	C_LONGINT:C283(Cal4D_Event_GetData; $1)
	C_POINTER:C301(Cal4D_Event_GetData; $2; $3; $4; $5; $6; $7; $8; $9)
	
	C_TEXT:C284(Cal4D_Event_Notes; $0; $2)
	C_LONGINT:C283(Cal4D_Event_Notes; $1)
	
	C_LONGINT:C283(Cal4D_Event_Edit; $1)
	
	C_LONGINT:C283(Cal4D_Event_Edit2; $1)
	
	C_TEXT:C284(Cal4D_Event_GuessEventType; $0)
	C_DATE:C307(Cal4D_Event_GuessEventType; $1; $3)
	C_TIME:C306(Cal4D_Event_GuessEventType; $2; $4)
	
	C_BOOLEAN:C305(Cal4D_Event_IsLocked; $0)
	
	C_BOOLEAN:C305(Cal4D_Event_IsSubscribed; $0)
	
	C_LONGINT:C283(Cal4D_Event_LoadRecord; $1)
	
	C_TEXT:C284(Cal4D_Event_UID; $0; $2)
	C_LONGINT:C283(Cal4D_Event_UID; $1)
	
	C_BOOLEAN:C305(Cal4D_Event_UserOwnsEvent; $0)
	
	C_BOOLEAN:C305(Cal4D_Event_UserOwnsEvent; $0)
	
	C_LONGINT:C283(Cal4D_Event_View; $1)
	
	C_TEXT:C284(Cal4D_FormatEventDisplay; $0; $1; $2)
	C_TIME:C306(Cal4D_FormatEventDisplay; $3)
	
	C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $0)
	C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $1)
	C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $2)
	
	C_LONGINT:C283(Cal4D_GetBoxNumberByDate; $0)
	C_DATE:C307(Cal4D_GetBoxNumberByDate; $1)
	
	C_DATE:C307(Cal4D_GetDateByBoxNumber; $0)
	C_LONGINT:C283(Cal4D_GetDateByBoxNumber; $1)
	
	C_TEXT:C284(Cal4D_GetDayOfWeek; $0)
	C_LONGINT:C283(Cal4D_GetDayOfWeek; $1)
	
	C_LONGINT:C283(Cal4D_GetEventIDfromFormObject; $0)
	C_POINTER:C301(Cal4D_GetEventIDfromFormObject; $1)
	
	C_LONGINT:C283(Cal4D_GetFormObjectsFromEventID; $1)
	C_POINTER:C301(Cal4D_GetFormObjectsFromEventID; $2)
	
	C_LONGINT:C283(Cal4D_GetObjectNumber; $0)
	C_POINTER:C301(Cal4D_GetObjectNumber; $1)
	
	C_TEXT:C284(Cal4D_GetSimpleVarName; $0; $1)
	
	C_POINTER:C301(Cal4D_iCal_AddSecondsToDateTime; $1; $2)
	C_LONGINT:C283(Cal4D_iCal_AddSecondsToDateTime; $3)
	
	C_TEXT:C284(Cal4D_iCal_DataToArrays; $1)
	C_POINTER:C301(Cal4D_iCal_DataToArrays; $2; $3; $4; $5; $6; $7; $8; $9; $10)
	
	C_LONGINT:C283(Cal4D_DateAndTimeToLongint; $0)
	C_BOOLEAN:C305(Cal4D_DateAndTimeToLongint; $1)
	
	C_TEXT:C284(Cal4D_iCal_DeleteCalendarFile; $1)
	
	C_LONGINT:C283(Cal4D_iCal_DurationToSeconds; $0)
	C_TEXT:C284(Cal4D_iCal_DurationToSeconds; $1)
	
	C_TEXT:C284(Cal4D_iCal_DownloadCalendarFile; $0; $1; $2; $3)
	
	C_LONGINT:C283(Cal4D_iCal_Edit; $1)
	
	C_TEXT:C284(Cal4D_iCal_GetCalendarName; $0; $1; $2)
	
	C_TEXT:C284(Cal4D_iCal_GetDate; $0)
	C_DATE:C307(Cal4D_iCal_GetDate; $1)
	
	C_TEXT:C284(Cal4D_iCal_GetDTSTAMP; $0)
	
	C_TEXT:C284(Cal4D_iCal_GetErrorMessage; $0)
	C_LONGINT:C283(Cal4D_iCal_GetErrorMessage; $1)
	
	C_TEXT:C284(Cal4D_iCal_GetFileName; $0; $1)
	
	C_TEXT:C284(Cal4D_iCal_GetTime; $0)
	C_TIME:C306(Cal4D_iCal_GetTime; $1)
	
	C_LONGINT:C283(Cal4D_Group_Trigger; $0)
	
	C_LONGINT:C283(Cal4D_Group_ID; $0)
	C_TEXT:C284(Cal4D_Group_ID; $1; $2)
	
	C_LONGINT:C283(Cal4D_Group_Import; $0)
	C_TEXT:C284(Cal4D_Group_Import; $1)
	
	C_TEXT:C284(Cal4D_iCal_ImportCalendarFile; $1)
	C_LONGINT:C283(Cal4D_iCal_ImportCalendarFile; $2)
	
	C_TEXT:C284(Cal4D_iCal_ParseDateTimeStamp; $1)
	C_POINTER:C301(Cal4D_iCal_ParseDateTimeStamp; $2; $3)
	
	C_TEXT:C284(Cal4D_iCal_ReadSubscription; $1)
	C_POINTER:C301(Cal4D_iCal_ReadSubscription; $2; $3; $4; $5; $6; $7; $8; $9; $10)
	
	C_LONGINT:C283(Cal4D_iCal_Refresh; $1)
	
	C_LONGINT:C283(Cal4D_iCal_Refresh2; $1)
	
	C_LONGINT:C283(Cal4D_iCal_RefreshOne; $1)
	
	C_TEXT:C284(Cal4D_iCal_StatusMessage; $1)
	
	C_LONGINT:C283(Cal4D_Group_Subscribe; $0)
	C_TEXT:C284(Cal4D_Group_Subscribe; $1; $2; $3)
	
	C_LONGINT:C283(Cal4D_HeaderHeight; $0)
	
	C_LONGINT:C283(Cal4D_iCal_UpdateCalendar; $1)
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_base64enc; $1; $0)
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_DownloadFile; $0)
	C_TEXT:C284(Cal4D_iCal_WDAV_DownloadFile; $1; $2; $3)
	
	C_TEXT:C284(Cal4D_iCal_WDAV_EncodeB64; $0; $1)
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_GetHTTP; $0; $2)
	C_TEXT:C284(Cal4D_iCal_WDAV_GetHTTP; $1; $3; $4)
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_PUT; $0; $2)
	C_TEXT:C284(Cal4D_iCal_WDAV_PUT; $1; $3; $5)
	C_BLOB:C604(Cal4D_iCal_WDAV_PUT; $4)
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_SendRequest; $2)
	
	C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $1; $3; $4; $5; $6; $7; $8)
	
	
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_SendUpload; $0; $2)
	
	C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $1; $3; $5; $6; $7; $8)
	
	C_BLOB:C604(Cal4D_iCal_WDAV_SendUpload; $4)
	
	
	C_LONGINT:C283(Cal4D_iCal_WDAV_UploadFile; $0)
	
	C_TEXT:C284(Cal4D_iCal_WDAV_UploadFile; $1; $2; $3)
	
	
	C_TEXT:C284(Cal4D_iCal_WDAV_URLEncoder; $0; $1)
	
	
	C_TEXT:C284(Cal4D_Info; $0; $1)
	
	
	C_POINTER:C301(Cal4D_ListBox_SetFonts; $1)
	C_LONGINT:C283(Cal4D_ListBox_SetFonts; $2)
	
	C_LONGINT:C283(Cal4D_Group_Color; $0; $1; $2)
	
	C_LONGINT:C283(Cal4D_Group_Delete; $1)
	
	C_LONGINT:C283(Cal4D_Group_Create; $0; $2)
	C_TEXT:C284(Cal4D_Group_Create; $1)
	C_BOOLEAN:C305(Cal4D_Group_Create; $3; $4)
	
	C_LONGINT:C283(Cal4D_Group_CreateShared; $0; $2)
	C_TEXT:C284(Cal4D_Group_CreateShared; $1)
	C_BOOLEAN:C305(Cal4D_Group_CreateShared; $3)
	
	C_LONGINT:C283(Cal4D_Group_DefaultGroupID; $0; $1)
	
	C_LONGINT:C283(Cal4D_Group_DeleteEvents; $1)
	
	C_LONGINT:C283(Cal4D_Group_Edit; $0; $1)
	
	C_TEXT:C284(Cal4D_Group_GetInfo; $0)
	C_LONGINT:C283(Cal4D_Group_GetInfo; $1)
	
	C_LONGINT:C283(Cal4D_Group_LoadRecord; $1)
	
	C_POINTER:C301(Cal4D_LoadAssociatedRecord; $1)
	C_LONGINT:C283(Cal4D_LoadAssociatedRecord; $2)
	
	C_TEXT:C284(Cal4D_LongNameToPathName; $0; $1)
	
	C_TEXT:C284(Cal4D_MonthName; $0)
	C_LONGINT:C283(Cal4D_MonthName; $1)
	
	C_POINTER:C301(Cal4D_MoreStuffObjectMethod; $1)
	
	C_POINTER:C301(Cal4D_PictObjectMethod; $1)
	
	C_LONGINT:C283(Cal4D_PlaceBannerObject; $1; $5)
	C_TEXT:C284(Cal4D_PlaceBannerObject; $2)
	C_DATE:C307(Cal4D_PlaceBannerObject; $3; $4)
	C_BOOLEAN:C305(Cal4D_PlaceBannerObject; $6)
	
	C_LONGINT:C283(Cal4D_PlacePictureObject; $1)
	C_DATE:C307(Cal4D_PlacePictureObject; $2)
	C_PICTURE:C286(Cal4D_PlacePictureObject; $3)
	
	C_LONGINT:C283(Cal4D_PlaceTextObject; $1; $8)
	C_TEXT:C284(Cal4D_PlaceTextObject; $2; $3)
	C_DATE:C307(Cal4D_PlaceTextObject; $4; $6)
	C_TIME:C306(Cal4D_PlaceTextObject; $5; $7)
	
	//C_TEXT(Cal4D_Quit;$1)
	
	//C_TEXT(Cal4D_Quit2;$1)
	
	C_POINTER:C301(Cal4D_RecalcBanner; $1)
	
	C_TEXT:C284(Cal4D_ReplaceSpecialCharacters; $0; $1)
	
	C_DATE:C307(Cal4D_RequestDate; $0; $2)
	C_TEXT:C284(Cal4D_RequestDate; $1; $3; $4)
	
	C_POINTER:C301(Cal4D_SelectObject; $1)
	
	C_TEXT:C284(Cal4D_Startup; $1)
	
	C_DATE:C307(Cal4D_StringToDate; $0)
	C_TEXT:C284(Cal4D_StringToDate; $1)
	
	C_POINTER:C301(Cal4D_TextObjectMethod; $1)
	
	C_TEXT:C284(Cal4D_Cal_CallbackMethods; $1; $2)
	
	C_LONGINT:C283(Cal4D_User_ID; $0)
	C_TEXT:C284(Cal4D_User_ID; $1)
	
	C_LONGINT:C283(Cal4D_User_Delete; $0)
	C_TEXT:C284(Cal4D_User_Delete; $1)
	
	C_LONGINT:C283(Cal4D_Util_IndexedColorToRGB; $0; $1)
	
	C_LONGINT:C283(Cal4D_Util_ModifyColor; $0; $1; $2)
	
	C_LONGINT:C283(Cal4D_Util_RGBToIndexedColor; $0; $1)
	
	
	C_POINTER:C301(Cal4D_Util_ScaleImage; $1)
	C_TEXT:C284(Cal4D_Util_ScaleImage; $2)
	
	C_POINTER:C301(Cal4D_VerifyStructureItem; $0)
	C_TEXT:C284(Cal4D_VerifyStructureItem; $1)
	C_LONGINT:C283(Cal4D_VerifyStructureItem; $2)
	C_BOOLEAN:C305(Cal4D_VerifyStructureItem; $3)
	
	C_DATE:C307(Cal4D_YearMonthDayToDate; $0)
	C_LONGINT:C283(Cal4D_YearMonthDayToDate; $1; $2; $3)
End if 

ERR_MethodTrackerReturn("Compiler_Cal4D"; $_t_oldMethodName)