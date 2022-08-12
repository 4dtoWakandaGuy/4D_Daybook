//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_BTN
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_OM_CalWithMinis_BTN ($_t_Msg)
	// //
	// //  Written by Charles Vass - 03/03/2009, 07:54
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:32`Method: Cal4D_OM_CalWithMinis_BTN
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_CurrentDate; $_d_Date; $2; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Month; $_l_ProcessState; $_l_ProcessTime; Cal_l_SelectedDate)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; Cal_pic_MainWeek; Cal_pic_MiniMonth1; Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; CAL_pic_weekBanner)
	C_POINTER:C301($_ptr_MiniCalender; $_ptr_MiniRef; CAL_ptr_4DFullCalendar; Cal_ptr_MiniCalender1)
	C_TEXT:C284($_t_CellID; $_t_Msg; $_t_oldMethodName; $_t_ProcessName; $1; Cal_t_SelectedCellRef; Cal_t_SelectedMiniCellRef; CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_BTN")

$_t_Msg:=$1
$_t_CellID:=""
$_d_CurrentDate:=Current date:C33
PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)


Case of 
		
	: (($_t_Msg="Day_Next") | ($_t_Msg="Day_Previous") | ($_t_Msg="Day_Today"))
		Cal4D_Cal_ClearSelectedEvent
		
		Case of 
			: ($_t_Msg="Day_Next")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; 0; 1))
			: ($_t_Msg="Day_Previous")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; 0; -1))
			: ($_t_Msg="Day_Todate")
				Cal4D_Cal_SelectedDate($2)
			Else 
				Cal4D_Cal_SelectedDate($_d_CurrentDate)
		End case 
		
		// //  Redraw the main calendar
		//{
		Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
		//}
		
	: (($_t_Msg="Week_Next") | ($_t_Msg="Week_Previous") | ($_t_Msg="Week_Today"))
		Cal4D_Cal_ClearSelectedEvent
		
		Case of 
			: ($_t_Msg="Week_Next")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; 0; 7))
			: ($_t_Msg="Week_Previous")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; 0; -7))
			: ($_t_Msg="Week_Today")
				Cal4D_Cal_SelectedDate($2)
			Else 
				Cal4D_Cal_SelectedDate($_d_CurrentDate)
		End case 
		
		// //  Redraw the main calendar
		//{
		Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
		//}
		
	: (($_t_Msg="Month_Next") | ($_t_Msg="Month_Previous") | ($_t_Msg="Month_Today"))
		
		Cal4D_Cal_ClearSelectedEvent
		
		// //  Adjust the date
		//{
		Case of 
			: ($_t_Msg="Month_Next")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; 1; 0))
			: ($_t_Msg="Month_Previous")
				Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; -1; 0))
			: ($_t_Msg="Month_Today")
				Cal4D_Cal_SelectedDate($2)
			Else 
				Cal4D_Cal_SelectedDate($_d_CurrentDate)
		End case 
		//}
		
		// //  Adjust the "selected" date for the next month
		//{
		If (Cal_t_SelectedCellRef#"")
			$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
			$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
			Case of 
				: ($_t_Msg="Month_Next")
					$_d_Date:=Add to date:C393($_d_Date; 0; 1; 0)
				: ($_t_Msg="Month_Previous")
					$_d_Date:=Add to date:C393($_d_Date; 0; -1; 0)
				Else 
					$_d_Date:=$_d_CurrentDate
			End case 
			
			If ($_d_Date#$_d_CurrentDate)
				$_t_CellID:=String:C10(Cal4D_Cal_DateToOrdinal($_d_Date))+"_Cell_Day"
			Else 
				$_t_CellID:=String:C10(Cal4D_Cal_DateToOrdinal($_d_Date))+"_Cell_Today"
			End if 
			
			Cal_t_SelectedCellRef:=""
			Cal4D_Cal_ClearSelectedEvent
		End if 
		//}
		
		// //  Redraw the main calendar
		//{
		Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		//}
		
		// //  Highlight the newly adjusted "selected" date
		//{
		If ($_t_CellID#"")
			Cal_l_SelectedDate:=Cal4D_Cal_DateToOrdinal($_d_Date)
			
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_CellID)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			CAL_ptr_4DFullCalendar->:=SVG_Export_to_picture(CAL_t_SVGref)
		End if 
		//}
		
		// //  Adjust the date of the top mini calendar
		//{
		If (False:C215)
			If ((Month of:C24(Cal4D_Cal_SelectedDate)<Month of:C24(Cal_D_TopMiniDate)) | (Month of:C24(Cal4D_Cal_SelectedDate)>(Month of:C24(Cal_D_TopMiniDate)+2)))
				Cal_D_TopMiniDate:=Cal4D_Cal_SelectedDate
			End if 
		End if 
		//}
		
	: (($_t_Msg="Mini_Next") | ($_t_Msg="Mini_Previous"))
		// //  Is there a selected cell?
		//{
		Case of 
			: (Cal_t_SelectedMiniCellRef#"")
				If ((Month of:C24(Cal4D_Cal_SelectedDate)>=Month of:C24(Cal_D_TopMiniDate)) & (Month of:C24(Cal4D_Cal_SelectedDate)<=(Month of:C24(Cal_D_TopMiniDate)+2)))
					$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)+"_Mini"
					$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
					Case of 
						: ($_l_Month=Month of:C24(Cal_D_TopMiniDate))
							Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini1; $_t_CellID)
						: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
							Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini2; $_t_CellID)
						: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
							Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini3; $_t_CellID)
					End case 
					
					$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
				Else 
					Cal_t_SelectedMiniCellRef:=""
				End if 
				
			: (Cal_t_SelectedCellRef#"")
				$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
				$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
		End case 
		//}
		
		// //  Adjust the date on the top mini
		//{
		If ($_t_Msg="Mini_Next")
			Cal_D_TopMiniDate:=Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)
		Else 
			Cal_D_TopMiniDate:=Add to date:C393(Cal_D_TopMiniDate; 0; -1; 0)
		End if 
		//}
		
		// //  If there is a selected date, sync the mini selected cell
		//{
		If (Cal_t_SelectedCellRef#"")
			Case of 
				: (($_d_Date>=Cal_D_TopMiniDate) & ($_d_Date<Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
					$_ptr_MiniRef:=(->Cal_t_SVGRefMini1)
					$_ptr_MiniCalender:=Cal_ptr_MiniCalender1  //(->Cal_Pi_MiniMonth1)
				: (($_d_Date>=Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)) & ($_d_Date<Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
					$_ptr_MiniRef:=(->Cal_t_SVGRefMini2)
					$_ptr_MiniCalender:=(->Cal_pic_MiniMonth2)
				: (($_d_Date>=Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)) & ($_d_Date<Add to date:C393(Cal_D_TopMiniDate; 0; 3; 0)))
					$_ptr_MiniRef:=(->Cal_t_SVGRefMini3)
					$_ptr_MiniCalender:=(->CAL_pic_MiniMonth3)
			End case 
		End if 
		//}
End case 

If ($_t_ProcessName="Cal4D_Cal_CalendarWithMinis")
	// //  Redraw the minis
	//{
	Cal4D_Cal_RedrawMinis
	//}
	
	// //  Highlight the selected mini cell
	// //  "_Cell_Today_Mini" from "_Cell_Today"
	// //  "_Cell_Day_Mini" from "_Cell_Day"
	//{
	If (Not:C34(Is nil pointer:C315($_ptr_MiniCalender)))
		$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
		$_t_CellID:=$_t_CellID+"_Mini"  //Replace string($_t_CellID;"_Cell_Day";"_Cell_Day_Mini")
		//Cal_t_SelectedMiniCellRef:=SVG_Find_ID ($_ptr_MiniRef->;$_t_CellID)
		//SVG_SET_ATTRIBUTES (Cal_t_SelectedMiniCellRef;"fill";Cal4D_Cal_Cell_BG ("Mini_Selected"))
		$_ptr_MiniCalender->:=SVG_Export_to_picture($_ptr_MiniRef->)
	Else 
		Cal_t_SelectedMiniCellRef:=""
	End if 
	//}
	
	// //  If there is a "selected" day, highlight the associated cell in the mini cal
	//{
	If ((($_t_Msg="Month_Next") | ($_t_Msg="Month_Previous")) & (Cal_t_SelectedCellRef#""))
		// //  Which mini matches the current month
		//{
		$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
		Case of 
			: ($_l_Month=Month of:C24(Cal_D_TopMiniDate))
				$_ptr_MiniRef:=(->Cal_t_SVGRefMini1)
				$_ptr_MiniCalender:=(->Cal_pic_MiniMonth1)
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
				$_ptr_MiniRef:=(->Cal_t_SVGRefMini2)
				$_ptr_MiniCalender:=(->Cal_pic_MiniMonth2)
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
				$_ptr_MiniRef:=(->Cal_t_SVGRefMini3)
				$_ptr_MiniCalender:=(->CAL_pic_MiniMonth3)
		End case 
		//}
		
		// //  Get the ID and Ref for the new selected mini cell
		// //  "_Cell_Today_Mini" from "_Cell_Today"
		// //  "_Cell_Day_Mini" from "_Cell_Day"
		//{
		$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
		$_t_CellID:=$_t_CellID+"_Mini"
		Cal_t_SelectedMiniCellRef:=SVG_Find_ID($_ptr_MiniRef->; $_t_CellID)
		//}
		
		// //  Set the cell fill color and redraw the picture
		//{
		SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
		$_ptr_MiniCalender->:=SVG_Export_to_picture($_ptr_MiniRef->)
		//}
		
	End if 
	//}
End if 
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_BTN"; $_t_oldMethodName)