If (False:C215)
	//Table Form Method Name: Object Name:      [USER].SD2_ScheduleWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_CalendersList;0)
	//ARRAY LONGINT(SD2_al_CurrentDiaryPerson;0)
	//ARRAY LONGINT(SD2_al_Priority;0)
	//ARRAY TEXT(SD_at_AvailableViews;0)
	//ARRAY TEXT(SD_at_MiniTabs;0)
	//ARRAY TEXT(SD_at_ShowCalenders;0)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	//ARRAY TEXT(SD_at_StatusNM;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryPersons;0)
	//ARRAY TEXT(SD2_at_IncludeExclude;0)
	//ARRAY TEXT(SD2_at_PriorityNM;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD2_bo_CalenderVisible; SD2_bo_DiaryListVisible; SD2_bo_FiltersOn; SD2_bo_FiltersVisible; SD2_bo_MultipleDiaries; SD2_bo_ShowCalenders; SD2_bo_ShowFilters; SD2_bo_ShowMonth)
	C_DATE:C307($_d_CurrentlyDisplayedDate; $_d_EndDate; SD2_d_CurrentDate; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_AgendaArea; $_l_CallID; $_l_CentreLeft; $_l_CentreWidth; $_l_CharLeftArrow; $_l_CharRightArrow; $_l_DayOf; $_l_event; $_l_Index; $_l_MonthBottom; $_l_MonthLeft)
	C_LONGINT:C283($_l_MonthNumber; $_l_MonthRight; $_l_MonthTop; $_l_NavigationBottom; $_l_NavigationLeft; $_l_NavigationRight; $_l_NavigationTop; $_l_NavigationWidth; $_l_ObjectBestHeight; $_l_ObjectBestWidth; $_l_ObjectBottom)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectWidth; $_l_SelectionLeft; $_l_StrapBottom; $_l_StrapLeft; $_l_StrapRight; $_l_StrapTop)
	C_LONGINT:C283($_l_ViewTypeBottom; $_l_ViewTypeLeft; $_l_ViewTypeRight; $_l_ViewTypeTabLeft; $_l_ViewTypeTabRight; $_l_ViewTypeTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth)
	C_LONGINT:C283(bD_MONTH; Cal_l_DateToday; SD_l_CurrentShowCalendersState; SD_l_priorityQuery; SD_l_TimeFlag; SD2_l_CalenderArea; SD2_l_CurrentScheduleView; SD2_l_DiaryInstanceUID; SD2_l_EventCall; SD2_l_IncludeCompleted; SD2_l_ShowDiaries)
	C_PICTURE:C286(CAL_pic_MainDay; CAL_pic_MainMonth; Cal_pic_MainWeek; SD_Pic_Today)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CellRef; $_t_DayCellRef; $_t_DayTextRef; $_t_oldMethodName; $_t_TextID; Cal_t_SelectedCellRef; CAL_t_SVGref; SD_t_AvailableView4; SD_t_CurrentDiaryInitials; SD_T_CurrentViewedDiary)
	C_TEXT:C284(SD2_S5_PriorityFIlter; SD2_T_DiaryInstanceUID; SD2_T_SearchValue; SD2_t_StatusFIlter; SRCH_t_SearchValue; SRCH_t_SearchValueOLD; VPeriod; VPeriod2)
	C_TIME:C306(SD2_Ti_DayEnd; SD2_ti_Daystart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_ScheduleWindow"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		WS_AutoscreenSize(1; 410; 1000)
		DB_SetnewToolBar
		ARRAY TEXT:C222(SD_at_AvailableViews; 4)
		
		SD_at_AvailableViews{1}:="Day"
		SD_at_AvailableViews{2}:="Week"
		SD_at_AvailableViews{3}:="Month"
		SD_at_AvailableViews{4}:="Year"
		ARRAY TEXT:C222(SD_at_ShowCalenders; 2)
		SD_at_ShowCalenders{1}:="Calendars"
		SD_at_ShowCalenders:=0
		SD_l_CurrentShowCalendersState:=0
		SD_at_AvailableViews:=3
		ARRAY LONGINT:C221(SD2_al_CurrentDiaryPerson; 0)  //The current viewed diaries
		ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
		
		If (SD_T_CurrentViewedDiary="")
			SD_T_CurrentViewedDiary:=<>PER_t_CurrentUserInitials
		End if 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_T_CurrentViewedDiary)
		APPEND TO ARRAY:C911(SD2_al_CurrentDiaryPerson; [PERSONNEL:11]Personnel_ID:48)
		APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_T_CurrentViewedDiary)
		UNLOAD RECORD:C212([PERSONNEL:11])
		SD_t_CurrentDiaryInitials:=SD_T_CurrentViewedDiary
		
		//note the above needs to be changed so we can open a diary with a different person
		
		//```
		ARRAY TEXT:C222(SD2_at_PriorityNM; 5)
		ARRAY LONGINT:C221(SD2_al_Priority; 5)
		SD2_at_PriorityNM{1}:="Highest"
		SD2_at_PriorityNM{2}:="High"
		SD2_at_PriorityNM{3}:="Normal"
		SD2_at_PriorityNM{4}:="Low"
		SD2_at_PriorityNM{5}:="Lowest"
		For ($_l_Index; 1; 5)
			SD2_al_Priority{$_l_Index}:=$_l_Index
		End for 
		ARRAY TEXT:C222(SD_at_StatusNM; 0)
		ARRAY TEXT:C222(SD_at_StatusCodes; 0)
		SD2_LoadDiaryStati(->SD_at_StatusCodes; ->SD_at_StatusNM; ->SD2_t_StatusFIlter)
		If (Size of array:C274(SD_at_StatusCodes)=0)
			OBJECT SET VISIBLE:C603(*; "oDiaryStatusFilterLabel"; False:C215)
			OBJECT SET VISIBLE:C603(SD2_t_StatusFIlter; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_StatusNM; False:C215)
		End if 
		SD2_S5_PriorityFIlter:="ALL"
		SD_l_priorityQuery:=0
		If (SD2_l_CurrentScheduleView=0)
			SD2_l_CurrentScheduleView:=1  //Daily view
		End if 
		If (SD2_D_CurrentDateStart=!00-00-00!)
			SD2_D_CurrentDateStart:=Current date:C33(*)
		End if 
		If (SD2_D_CurrentDateEnd=!00-00-00!)
			
			SD2_D_CurrentDateEnd:=Current date:C33(*)
			If (SD2_D_CurrentDateEnd<SD2_D_CurrentDateStart)
				SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
			End if 
		End if 
		If (SD2_D_CurrentHighlightDay=!00-00-00!)
			SD2_D_CurrentHighlightDay:=Current date:C33(*)
		End if 
		If (SD2_D_CurrentHighlightDay<SD2_D_CurrentDateStart) | (SD2_D_CurrentHighlightDay>SD2_D_CurrentDateEnd)
			SD2_D_CurrentHighlightDay:=Current date:C33(*)
		End if 
		
		SD2_T_DiaryInstanceUID:=Generate UUID:C1066
		//`````
		
		SD2_ti_Daystart:=?09:00:00?
		SD2_Ti_DayEnd:=?09:00:00?
		SD2_l_IncludeCompleted:=1  //event though the filter is hidden
		SD2_bo_FiltersOn:=False:C215
		ARRAY TEXT:C222(SD2_at_IncludeExclude; 2)
		SD2_at_IncludeExclude{1}:="Include.."
		SD2_at_IncludeExclude{2}:="Exclude.."
		SD2_at_IncludeExclude:=1
		//SD2_LoadSchedule (SD2_l_DiaryInstanceUID;0;SD2_D_CurrentDateStart;SD2_D_CurrentDateEnd;->SD2_al_CurrentDiaryPerson;SD2_l_IncludeCompleted;SD_l_priorityQuery)
		
		//Remember if we change
		//Remember to start with filters and users hidden
		//SD2_BuildDiaryDisplayRecords (SD2_l_DiaryInstanceUID;SD2_D_CurrentDateStart;SD2_D_CurrentDateEnd)
		SD2_SVGHandler("init")
		OBJECT GET BEST SIZE:C717(*; "OAllNavBar"; $_l_ObjectBestWidth; $_l_ObjectBestHeight)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
		$_l_NavigationWidth:=$_l_NavigationRight-$_l_NavigationLeft
		$_l_CentreWidth:=$_l_ObjectBestWidth-110
		$_l_CentreLeft:=$_l_NavigationLeft+55
		OBJECT MOVE:C664(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationLeft+$_l_ObjectBestWidth; $_l_NavigationBottom; *)
		OBJECT GET COORDINATES:C663(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
		OBJECT MOVE:C664(*; "oCurrent"; $_l_CentreLeft; $_l_NavigationTop+3; ($_l_NavigationLeft+$_l_ObjectBestWidth)-40; $_l_NavigationBottom; *)
		$_l_SelectionLeft:=($_l_NavigationLeft+$_l_ObjectBestWidth)
		OBJECT MOVE:C664(*; "oSelectCurrentButton"; $_l_SelectionLeft; $_l_NavigationTop+5; ($_l_SelectionLeft)+19; $_l_NavigationTop+5+16; *)
		Case of 
			: (SD_at_AvailableViews=1)
				OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
			: (SD_at_AvailableViews=2)
				OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
				
			: (SD_at_AvailableViews=3)  //Month
				OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oBanner_Month"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oMonth_Detail"; $_l_MonthLeft; $_l_MonthTop; $_l_MonthRight; $_l_MonthBottom)
				OBJECT MOVE:C664(*; "oBanner_Month"; $_l_MonthLeft; $_l_MonthTop-34; $_l_NavigationLeft-1; $_l_MonthTop-1; *)
				
				OBJECT MOVE:C664(*; "oMonth_Detail"; $_l_MonthLeft; $_l_MonthTop; $_l_WindowWidth-55; ($_l_WindowBottom-$_l_windowTop)-100; *)
			Else 
				
				OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
				
		End case 
		OBJECT GET BEST SIZE:C717(*; "OscheduleViewTypeTab"; $_l_ObjectBestWidth; $_l_ObjectBestHeight)
		$_l_ViewTypeTabLeft:=($_l_WindowWidth/2)-($_l_ObjectBestWidth/2)
		OBJECT GET COORDINATES:C663(*; "OscheduleViewTypeTab"; $_l_ViewTypeLeft; $_l_ViewTypeTop; $_l_ViewTypeRight; $_l_ViewTypeBottom)
		$_l_ViewTypeTabRight:=$_l_ViewTypeTabLeft+$_l_ObjectBestWidth
		OBJECT MOVE:C664(*; "OscheduleViewTypeTab"; $_l_ViewTypeTabLeft; $_l_ViewTypeTop; $_l_ViewTypeTabRight; $_l_ViewTypeBottom; *)
		OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
		OBJECT MOVE:C664(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapLeft+$_l_WindowWidth; $_l_StrapBottom; *)
		OBJECT GET COORDINATES:C663(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
		OBJECT MOVE:C664(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapLeft+$_l_WindowWidth; $_l_StrapBottom; *)
		
		SD2_d_CurrentDate:=Cal4D_Cal_SelectedDate
		OBJECT SET VISIBLE:C603(*; "oCalenders"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSelectedDiariesLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oMultipleDiaries"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSelectedActionsLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oActions"; False:C215)
		
		If (SD2_at_CurrentDiaryPersons{1}=<>PER_t_CurrentUserInitials)
			//only if this is the current logged in person diary
			SD_SetSchedDiaries(<>PER_t_CurrentUserInitials)
		Else   //hide the show persons button
			OBJECT SET VISIBLE:C603(SD2_l_ShowDiaries; False:C215)
		End if 
		$_l_CharRightArrow:=9654
		$_l_CharLeftArrow:=9664
		ARRAY TEXT:C222(SD_at_MiniTabs; 3)
		$_l_MonthNumber:=Month of:C24(Cal4D_Cal_SelectedDate)
		OBJECT SET TITLE:C194(*; "oMiniCalButtonNext"; Char:C90($_l_CharRightArrow))
		OBJECT SET TITLE:C194(*; "oMiniCalButtonPrevious"; Char:C90($_l_CharLeftArrow))
		
		
		SD_at_MiniTabs{1}:=Char:C90($_l_CharLeftArrow)
		SD_at_MiniTabs{2}:=Get indexed string:C510(14001; $_l_MonthNumber)
		SD_at_MiniTabs{3}:=Char:C90($_l_CharRightArrow)
		SD_at_MiniTabs:=2
		OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
		If (False:C215)
			
			//
			$_l_AgendaArea:=SD2_l_CalenderArea
			
			SD2_bo_ShowCalenders:=False:C215
			SD2_bo_ShowFilters:=False:C215
			SD2_bo_ShowMonth:=True:C214
			OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
			OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
			OBJECT MOVE:C664(*; "oSD2CalanderView"; 1; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
			OBJECT SET VISIBLE:C603(*; "OCalender@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OFilter@"; False:C215)
			//Even though the area is intially hidden we set up the objects
			//SD_SchedSetupMiniCal
			VPeriod2:=Replace string:C233(VPeriod; "January"; "Jan")
			VPeriod2:=Replace string:C233(VPeriod2; "February"; "Feb")
			VPeriod2:=Replace string:C233(VPeriod2; "September"; "Sept")
			VPeriod2:=Replace string:C233(VPeriod2; "October"; "Oct")
			vPeriod2:=Replace string:C233(VPeriod2; "November"; "Nov")
			vPeriod2:=Replace string:C233(VPeriod2; "December"; "Dec")
			OBJECT SET TITLE:C194(bD_MONTH; Vperiod2)
			OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
			OBJECT SET VISIBLE:C603(SD_Pic_Today; False:C215)
			
			If (SD2_at_CurrentDiaryPersons{1}=<>PER_t_CurrentUserInitials)
				//only if this is the current logged in person diary
				SD_SetSchedDiaries(<>PER_t_CurrentUserInitials)
			Else   //hide the show persons button
				OBJECT SET VISIBLE:C603(SD2_l_ShowDiaries; False:C215)
			End if 
		End if 
	: ($_l_event=On Timer:K2:25)
		If (False:C215)
			Case of 
				: (SD_l_TimeFlag=1)  //search value
					SRCH_r_Timer:=((Current time:C178*1)*60)
					//BEEP
					
					If (SRCH_r_TimerOLD>0)
						If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
							SET TIMER:C645(0)
							If (SRCH_t_SearchValue#"")
								
								
								SRCH_StandardSearch(Table:C252(->[DIARY:12]); SRCH_t_SearchValue)
								//Here open a new history window
								ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; SRCH_t_SearchValue)
								SRCH_t_SearchValue:=""
								SD2_T_SearchValue:=""
								
							Else 
								
							End if 
							
						Else 
							
							
							If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
								
								SRCH_r_TimerOLD:=SRCH_r_Timer
							End if 
						End if 
						SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
					Else 
						SRCH_r_TimerOLD:=SRCH_r_Timer
						SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
					End if 
					
			End case 
		End if 
		//_Cal4D_NavBar_OM ($_l_event)
		
	: ($_l_event=On Activate:K2:9)
		//TRACE
		If (False:C215)
			// //  We are coming to the front, check to see if the day has changed...
			// //  If it has, change the background fills.
			//{
			If (Cal_l_DateToday#Cal4D_Cal_DateToOrdinal(Current date:C33))
				// //  Get the cell and text coded as "today" and change the ID to "day"
				//{
				$_t_CellRef:=String:C10(Cal_l_DateToday)+"_Cell_Today"
				$_t_DayCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_CellRef)
				SVG_SET_ID($_t_DayCellRef; String:C10(Cal_l_DateToday)+"_Cell_Day")
				
				$_t_TextID:=String:C10(Cal_l_DateToday)+"_Text_Today"
				$_t_DayTextRef:=SVG_Find_ID(CAL_t_SVGref; $_t_TextID)
				SVG_SET_ID($_t_DayTextRef; String:C10(Cal_l_DateToday)+"_Text_Day")
				//}
				
				// //  If this is the selected day, leave the current background fill
				//{
				If ($_t_DayCellRef#Cal_t_SelectedCellRef)
					SVG_SET_ATTRIBUTES($_t_DayCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
				End if 
				//}
				
				// //  Get the cell and text coded as "day" and change the ID to "today"
				//{
				Cal_l_DateToday:=Cal4D_Cal_DateToOrdinal(Current date:C33)
				$_t_CellRef:=String:C10(Cal_l_DateToday)+"_Cell_Day"
				$_t_DayCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_CellRef)
				SVG_SET_ID($_t_DayCellRef; String:C10(Cal_l_DateToday)+"_Cell_Today")
				
				$_t_TextID:=String:C10(Cal_l_DateToday)+"_Text_Day"
				$_t_DayTextRef:=SVG_Find_ID(CAL_t_SVGref; $_t_TextID)
				SVG_SET_ID($_t_DayTextRef; String:C10(Cal_l_DateToday)+"_Text_Today")
				//}
				
				// //  If this is the selected day, leave the current background fill
				//{
				If ($_t_DayCellRef#Cal_t_SelectedCellRef)
					SVG_SET_ATTRIBUTES($_t_DayCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
				End if 
				//}
			End if 
			//}
			
			
			//Cal4D_NavBar_OM ($_l_event)
		End if 
		
	: ($_l_event=On Resize:K2:27)
		If (False:C215)
			If (SD2_bo_ShowCalenders=True:C214)
				If (SD2_bo_ShowMonth)  // we have a mini. Month view option switched on.
					OBJECT SET VISIBLE:C603(*; "oMiniCal@"; True:C214)
					OBJECT SET VISIBLE:C603(SD_Pic_Today; True:C214)
					OBJECT SET VISIBLE:C603(*; "oCalender@"; True:C214)
					OBJECT GET COORDINATES:C663(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					If ($_l_ObjectRight-$_l_ObjectLeft>150)
						//$_l_ObjectRight:=150
					End if 
					OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					//MOVE OBJECT(*;"oSD2CalanderView";$_l_ObjectRight+3;$_l_ObjectTop;$_l_ObjectRight2;$_l_ObjectBottom;*)
					OBJECT MOVE:C664(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop+16; $_l_ObjectRight; $_l_ObjectBottom-145; *)
					OBJECT MOVE:C664(*; "oMiniCalBorder"; $_l_ObjectLeft; $_l_ObjectBottom-143; $_l_ObjectRight; $_l_ObjectBottom; *)
					SD2_MoveMinCalObjects($_l_ObjectLeft; $_l_ObjectBottom-143; $_l_ObjectRight; $_l_ObjectBottom)
					
					SD2_bo_ShowCalenders:=True:C214
				Else 
					//Mini Month view not displayed
					OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
					OBJECT SET VISIBLE:C603(SD_Pic_Today; False:C215)
					OBJECT SET VISIBLE:C603(*; "oCalender@"; True:C214)
					OBJECT GET COORDINATES:C663(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					//GET OBJECT RECT(*;"oSD2CalanderView";$_l_ObjectLeft2;$_l_ObjectTop;$_l_ObjectRight2;$_l_ObjectBottom)
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					OBJECT MOVE:C664(*; "oSD2CalanderView"; $_l_ObjectRight+3; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
					SD2_bo_ShowCalenders:=True:C214
				End if 
				
			Else 
				SD2_bo_ShowCalenders:=False:C215
				
				OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
				OBJECT MOVE:C664(*; "oSD2CalanderView"; 1; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
				OBJECT SET VISIBLE:C603(*; "OCalender@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
				OBJECT SET VISIBLE:C603(SD_Pic_Today; False:C215)
			End if 
			Cal4D_OM_CalWithMinis_Week($_l_event; ->Cal_pic_MainWeek)
			Cal4D_OM_CalWithMinis_Day($_l_event; ->CAL_pic_MainDay)
			LBI_Scrollonresize(->SD2_lb_CalendersList)
		End if 
		If (False:C215)
			OBJECT GET BEST SIZE:C717(*; "OAllNavBar"; $_l_ObjectBestWidth; $_l_ObjectBestHeight)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			OBJECT GET COORDINATES:C663(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
			$_l_NavigationWidth:=$_l_NavigationRight-$_l_NavigationLeft
			$_l_CentreWidth:=$_l_ObjectBestWidth-110
			$_l_CentreLeft:=$_l_NavigationLeft+55
			OBJECT MOVE:C664(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationLeft+$_l_ObjectBestWidth; $_l_NavigationBottom; *)
			OBJECT GET COORDINATES:C663(*; "OAllNavBar"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
			OBJECT MOVE:C664(*; "oCurrent"; $_l_CentreLeft; $_l_NavigationTop+3; ($_l_NavigationLeft+$_l_ObjectBestWidth)-40; $_l_NavigationBottom; *)
			$_l_SelectionLeft:=($_l_NavigationLeft+$_l_ObjectBestWidth)
			OBJECT MOVE:C664(*; "oSelectCurrentButton"; $_l_SelectionLeft; $_l_NavigationTop+5; ($_l_SelectionLeft)+19; $_l_NavigationTop+5+16; *)
			Case of 
				: (SD_at_AvailableViews=1)
					OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
				: (SD_at_AvailableViews=2)
					OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
					
				: (SD_at_AvailableViews=3)  //Month
					OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oBanner_Month"; True:C214)
					OBJECT GET COORDINATES:C663(*; "oMonth_Detail"; $_l_MonthLeft; $_l_MonthTop; $_l_MonthRight; $_l_MonthBottom)
					OBJECT MOVE:C664(*; "oBanner_Month"; $_l_MonthLeft; $_l_MonthTop-34; $_l_NavigationLeft-1; $_l_MonthTop-1; *)
				Else 
					
					OBJECT SET VISIBLE:C603(*; "oMonth_Detail"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oBanner_Month"; False:C215)
					
			End case 
			OBJECT GET BEST SIZE:C717(*; "OscheduleViewTypeTab"; $_l_ObjectBestWidth; $_l_ObjectBestHeight)
			$_l_ViewTypeTabLeft:=($_l_WindowWidth/2)-($_l_ObjectBestWidth/2)
			OBJECT GET COORDINATES:C663(*; "OscheduleViewTypeTab"; $_l_ViewTypeLeft; $_l_ViewTypeTop; $_l_ViewTypeRight; $_l_ViewTypeBottom)
			$_l_ViewTypeTabRight:=$_l_ViewTypeTabLeft+$_l_ObjectBestWidth
			OBJECT MOVE:C664(*; "OscheduleViewTypeTab"; $_l_ViewTypeTabLeft; $_l_ViewTypeTop; $_l_ViewTypeTabRight; $_l_ViewTypeBottom; *)
			OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
			OBJECT MOVE:C664(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapLeft+$_l_WindowWidth; $_l_StrapBottom; *)
			OBJECT GET COORDINATES:C663(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
			OBJECT MOVE:C664(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapLeft+$_l_WindowWidth; $_l_StrapBottom; *)
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (False:C215)
			If (SD2_l_EventCall=0)
			Else 
				//Call back to this process
				$_l_CallID:=SD2_l_EventCall
				SD2_l_EventCall:=0
				Case of 
					: ($_l_CallID=11)
						//Go to date
						$_l_AgendaArea:=SD2_l_CalenderArea
						
						Case of 
							: (SD2_l_CurrentScheduleView=1)  // Day view
								SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
								SD2_D_CurrentHighlightDay:=SD2_D_CurrentDateStart
								Cal4D_OM_CalWithMinis_BTN("Day_Today"; SD2_D_CurrentDateStart)
							: (SD2_l_CurrentScheduleView=2)  // Week view
								SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart+1
								Cal4D_OM_CalWithMinis_BTN("Week_Today"; SD2_D_CurrentDateStart)
							: (SD2_l_CurrentScheduleView=3)  // Month view
								//The following is the code of the button 'Month'
								Cal4D_OM_CalWithMinis_BTN("Month_Today"; SD2_D_CurrentDateStart)
								$_l_DayOf:=Day of:C23(SD2_D_CurrentDateStart)
								SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-($_l_DayOf-1)
								$_d_EndDate:=SD2_D_CurrentDateStart+28
								Repeat 
									If (Month of:C24($_d_EndDate)=Month of:C24(SD2_D_CurrentDateStart))
										$_d_EndDate:=$_d_EndDate+1
									End if 
								Until (Month of:C24($_d_EndDate)#Month of:C24(SD2_D_CurrentDateStart))
								$_d_EndDate:=$_d_EndDate-1
								SD2_D_CurrentDateEnd:=$_d_EndDate
								$_l_AgendaArea:=SD2_l_CalenderArea
								SD2_l_CurrentScheduleView:=3
						End case 
				End case 
			End if 
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		
		Case of 
			: ($_ptr_FocusObject=(->SD2_d_CurrentDate))
				If (SD2_d_CurrentDate>!00-00-00!)
					$_d_CurrentlyDisplayedDate:=Cal4D_Cal_SelectedDate
					If (SD2_d_CurrentDate#$_d_CurrentlyDisplayedDate)
						$_d_CurrentlyDisplayedDate:=SD2_d_CurrentDate
						Case of 
							: (SD_at_AvailableViews=1)  //Day
							: (SD_at_AvailableViews=2)  //Week
								
							: (SD_at_AvailableViews=3)  //MOnth
								
								
								
								Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth; $_d_CurrentlyDisplayedDate)
								
							: (SD_at_AvailableViews=4)  //Year
						End case 
					End if 
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_ScheduleWindow"; $_t_oldMethodName)
