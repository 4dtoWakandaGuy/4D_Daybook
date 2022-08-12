//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_FM_CalWithMinis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:31`Method: Cal4D_FM_CalWithMinis
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_EventUpdateNeeded; <>Cal_bo_QuitNow; <>SYS_bo_QuitCalled; DB_bo_NoLoad)
	C_DATE:C307($_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Bottom; $_l_FormEvent; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $1; Cal_l_DateToday)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; Cal_pic_MainWeek; Cal_pic_MiniMonth1; Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; Cal_pic_Month; CAL_pic_weekBanner)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventTable; $_ptr_Self; $2; CAL_Ptr_4DCalendarDay; CAL_ptr_4DCalendarWeek; CAL_ptr_4DFullCalendar)
	C_TEXT:C284($_t_DateTextRef; $_t_Day_Cell_Ref; $_t_Day_Cell_Sym; $_t_Day_Rect_Ref; $_t_MethodName; $_t_Msg; $_t_oldMethodName; $_t_RefID; $_t_SelectedEventRef; $_t_TextID; $_t_TmpID)
	C_TEXT:C284(Cal_t_SelectedCellRef; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID; CAL_t_SVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_FM_CalWithMinis")

$_t_MethodName:=Current method name:C684
//===========================    Declare Variables     ===========================
//method_parameters_declarations
//--------------------------------------------------------------------------------
//method_wide_constants_declarations
//--------------------------------------------------------------------------------
//local_variable_declarations

//===========================    Initialize and Setup    ===========================
$_l_FormEvent:=$1
$_ptr_Self:=$2


//===========================      Method Actions      ===========================


Case of 
	: (<>Cal_bo_QuitNow) | (<>SYS_bo_QuitCalled)  // See Cal4D_Quit2.
		CANCEL:C270
		
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Cal4D_NavBar_Handler
		
		// //  Initialize the calendars on the form
		//{
		
		Cal4D_Cal_GetFullCalendar(->Cal_pic_Month)
		Cal4D_Cal_GetMiniCalendar(->Cal_pic_MiniMonth1; Cal_D_TopMiniDate; 0)  //->Cal_Pi_MiniMonth1
		Cal4D_Cal_GetMiniCalendar(->Cal_pic_MiniMonth2; Cal_D_TopMiniDate; 1)
		Cal4D_Cal_GetMiniCalendar(->CAL_pic_MiniMonth3; Cal_D_TopMiniDate; 2)
		
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
		//}
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Unload:K2:2)
		// //  Free the memory
		//{
		Cal4D_Cal_CalendarWithMinis_Clr
		//}
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Outside Call:K2:11)
		If (<>Cal_bo_EventUpdateNeeded)
			// //  Redraw the calendars
			//{
			Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
			Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
			Cal4D_Cal_RedrawMinis
			//}
			
		Else 
			// //  Initialize the calendars on the form
			//{
			If (Cal_t_SelectedEventUID#"")
				SVG_SET_OPACITY(Cal_t_SelectedEventRef; 0; 0)
			End if 
			If (Cal_t_SelectedCellRef#"")
				$_t_RefID:=SVG_Get_ID(Cal_t_SelectedCellRef)
				$_d_Date:=CAL4D_Cal_DateFromCellID($_t_RefID)
			End if 
			
			Cal4D_Cal_GetFullCalendar(->Cal_pic_Month)
			//Cal4D_Cal_GetMiniCalendar (Cal4D_MiniCal_1_P;Cal_D_TopMiniDate;0)  `->Cal_Pi_MiniMonth1
			//Cal4D_Cal_GetMiniCalendar (->Cal_pi_MiniMonth2;Cal_D_TopMiniDate;1)
			//Cal4D_Cal_GetMiniCalendar (->CAL_pi_MiniMonth3;Cal_D_TopMiniDate;2)
			
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			
			Cal_pic_Month:=SVG_Export_to_picture(CAL_t_SVGref)
		End if 
		
		//DISABLE BUTTON(HighlightButton)
		//}
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Clicked:K2:4)
		
		OBJECT GET COORDINATES:C663(Cal_pic_Month; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		If (UTIL_PointInRect($_l_MouseX; $_l_MouseY; ->Cal_pic_Month))
			// //  Get the ID to the object just clicked on
			//{
			$_t_RefID:=SVG Find element ID by coordinates:C1054(Cal_pic_Month; MouseX; MouseY)
			//}
			
			If (Contextual click:C713 & ($_t_RefID="@_Evt_@"))
				$_t_SelectedEventRef:=Substring:C12($_t_RefID; Position:C15("_Evt_"; $_t_RefID)+5)
				If ($_t_SelectedEventRef=Cal_t_SelectedEventUID)
					QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventiCalUIDField->=Cal_t_SelectedEventUID)
					Cal4D_Event_Delete_Handler
				End if 
			End if 
		End if 
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Activate:K2:9)
		// //  We are coming to the front, check to see if the day has changed...
		// //  If it has, change the background fills.
		//{
		If (Cal_l_DateToday#Cal4D_Cal_DateToOrdinal(Current date:C33))
			// //  Get the cell and text coded as "today" and change the ID to "day"
			//{
			$_t_RefID:=String:C10(Cal_l_DateToday)+"_Cell_Today"
			$_t_Day_Cell_Ref:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
			SVG_SET_ID($_t_Day_Cell_Ref; String:C10(Cal_l_DateToday)+"_Cell_Day")
			
			$_t_TextID:=String:C10(Cal_l_DateToday)+"_Text_Today"
			$_t_DateTextRef:=SVG_Find_ID(CAL_t_SVGref; $_t_TextID)
			SVG_SET_ID($_t_DateTextRef; String:C10(Cal_l_DateToday)+"_Text_Day")
			//}
			
			// //  If this is the selected day, leave the current background fill
			//{
			If ($_t_Day_Cell_Ref#Cal_t_SelectedCellRef)
				SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
			End if 
			//}
			
			// //  Get the cell and text coded as "day" and change the ID to "today"
			//{
			Cal_l_DateToday:=Cal4D_Cal_DateToOrdinal(Current date:C33)
			$_t_RefID:=String:C10(Cal_l_DateToday)+"_Cell_Day"
			$_t_Day_Cell_Ref:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
			SVG_SET_ID($_t_Day_Cell_Ref; String:C10(Cal_l_DateToday)+"_Cell_Today")
			
			$_t_TextID:=String:C10(Cal_l_DateToday)+"_Text_Day"
			$_t_DateTextRef:=SVG_Find_ID(CAL_t_SVGref; $_t_TextID)
			SVG_SET_ID($_t_DateTextRef; String:C10(Cal_l_DateToday)+"_Text_Today")
			//}
			
			// //  If this is the selected day, leave the current background fill
			//{
			If ($_t_Day_Cell_Ref#Cal_t_SelectedCellRef)
				SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
			End if 
			//}
		End if 
		//}
		
		//_Cal4D_NavBar_OM ($_l_FormEvent)
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Deactivate:K2:10)
		//_Cal4D_NavBar_OM ($_l_FormEvent)
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Timer:K2:25)
		//_Cal4D_NavBar_OM ($_l_FormEvent)
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Resize:K2:27)
		Cal4D_OM_CalWithMinis_Week($_l_FormEvent; CAL_ptr_4DCalendarWeek)
		Cal4D_OM_CalWithMinis_Day($_l_FormEvent; CAL_Ptr_4DCalendarDay)
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("Cal4D_FM_CalWithMinis"; $_t_oldMethodName)