//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_Mini
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_OM_CalWithMinis_Mini
	// //
	// //  Written by Charles Vass - 03/09/2009, 09:15
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:31`Method: Cal4D_OM_CalWithMinis_Mini
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(CAL_ad_WeekDates;0)
	C_DATE:C307($_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Month; $_l_MonthNumber; $_l_Week)
	C_PICTURE:C286(Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; Cal_pic_Month)
	C_POINTER:C301($_ptr_Self; $_ptr_TempPicture; $1; CAL_Ptr_4DCalendarDay; CAL_ptr_4DCalendarWeek; CAL_ptr_4DFullCalendar; CAL_ptr_BannerDay; CAL_ptr_BannerWeek; Cal_ptr_MiniCalender1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_Mini_Ref; $_t_ObjRef; $_t_oldMethodName; $_t_Ordinal; $_t_TmpID; $_t_TmpRef; $_t_value; Cal_t_SelectedCellRef; Cal_t_SelectedMiniCellRef)
	C_TEXT:C284(CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_Mini")

$_ptr_Self:=$1
$_t_CellID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)

// //  Get the cell ID, XML Ref, and Date of the minicell clicked on
//{
Case of 
	: ($_ptr_Self=Cal_ptr_MiniCalender1)
		$_t_Mini_Ref:=Cal_t_SVGRefMini1
	: ($_ptr_Self=(->Cal_pic_MiniMonth2))
		$_t_Mini_Ref:=Cal_t_SVGRefMini2
	: ($_ptr_Self=(->CAL_pic_MiniMonth3))
		$_t_Mini_Ref:=Cal_t_SVGRefMini3
End case 

$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")

$_t_Day_Cell_Ref:=SVG_Find_ID($_t_Mini_Ref; $_t_CellID)
$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
//}

//========================    Method Actions    ==================================

If (Cal_t_SelectedMiniCellRef#$_t_Day_Cell_Ref)
	
	// //  Is there a previously selected Mini cell? If so return it to unselected
	//{
	If (Cal_t_SelectedMiniCellRef#"")
		// //  Get the ID, XML Ref, and pointer to Picture Var of the priviously Selected mini cell
		//{
		$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
		$_t_TmpID:=SVG_Get_ID(Cal_t_SelectedMiniCellRef)
		Case of 
			: ($_l_Month=Month of:C24(Cal_D_TopMiniDate))
				$_t_TmpRef:=Cal_t_SVGRefMini1
				$_ptr_TempPicture:=Cal_ptr_MiniCalender1
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
				$_t_TmpRef:=Cal_t_SVGRefMini2
				$_ptr_TempPicture:=(->Cal_pic_MiniMonth2)
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
				$_t_TmpRef:=Cal_t_SVGRefMini3
				$_ptr_TempPicture:=(->CAL_pic_MiniMonth3)
		End case 
		//}
		
		// //  Reset the background color of the previously selected mini cell
		//{
		Case of 
			: ($_t_TmpRef=Cal_t_SVGRefMini1)
				Cal4D_Cal_SetMiniCell_BG(Cal_D_TopMiniDate; $_t_TmpID)
			: ($_t_TmpRef=Cal_t_SVGRefMini2)
				Cal4D_Cal_SetMiniCell_BG(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0); $_t_TmpID)
			: ($_t_TmpRef=Cal_t_SVGRefMini3)
				Cal4D_Cal_SetMiniCell_BG(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0); $_t_TmpID)
		End case 
		
		$_ptr_TempPicture->:=SVG_Export_to_picture($_t_TmpRef)
		//}
	End if 
	//}
	
	// //  Determine if the click was in the mini that matches the current month or not
	//{
	If (Month of:C24($_d_Date)#Month of:C24(Cal4D_Cal_SelectedDate))
		// //  In a change of month
		//{
		$_l_MonthNumber:=Month of:C24($_d_Date)-Month of:C24(Cal4D_Cal_SelectedDate)
		Cal4D_Cal_SelectedDate(Add to date:C393(Cal4D_Cal_SelectedDate; 0; $_l_MonthNumber; 0))
		Cal4D_Cal_GetFullCalendar(->Cal_pic_Month; Cal4D_Cal_SelectedDate; $_d_Date)
		Cal4D_Cal_GetWeekCalendar(CAL_ptr_4DCalendarWeek; CAL_ptr_BannerWeek)
		Cal4D_Cal_GetDayCalendar(CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
		Cal4D_Cal_RecolorMinis
		
		If ($_d_Date=Current date:C33)
			$_t_CellID:=Replace string:C233($_t_CellID; "_Day_"; "_Today_")
		End if 
		//}
		
	Else 
		Cal4D_Cal_SelectedDate($_d_Date)
		
		If (True:C214)
			// //  Redraw the day calendar grid
			//{
			Cal4D_Cal_GetDayCalendar(CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
			//}
		End if 
		
		If (True:C214)
			$_l_Week:=Cal_ISOWeekNumber($_d_Date)
			// //  Redraw the week calendar grid
			//{
			If (Cal_ISOWeekNumber($_d_Date)=Cal_ISOWeekNumber(CAL_ad_WeekDates{1}))
				// //  In the same week so return selected day to default coloring
				//{
				If (Cal4D_Cal_SelectedOrdDate>0)
					$_t_Ordinal:=String:C10(Cal4D_Cal_SelectedOrdDate)
					Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "default")
				End if 
				//}
				
				// //  Record and highlight the new selected date
				//{
				$_t_Ordinal:=Substring:C12($_t_CellID; 1; Position:C15("_"; $_t_CellID)-1)
				Cal4D_Cal_SelectedOrdDate(Num:C11($_t_Ordinal))
				Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "select")
				//}
				
			Else 
				Cal4D_Cal_GetWeekCalendar(CAL_ptr_4DCalendarWeek; CAL_ptr_BannerWeek)
				
			End if 
			//}
		End if 
		
		If (True:C214)
			// //  Redraw the month calendar grid
			//{
			If (Cal_t_SelectedCellRef#"")
				$_t_TmpID:=SVG_Get_ID(Cal_t_SelectedCellRef)
				$_d_Date:=CAL4D_Cal_DateFromCellID($_t_TmpID)
				Case of 
					: ($_d_Date#Current date:C33)
						SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
						
					Else 
						SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
						
				End case 
			End if 
			
			// //  Set the new selected day on the Full calendar
			//{
			$_t_TmpID:=Replace string:C233($_t_CellID; "_Mini"; "")
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_TmpID)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			CAL_ptr_4DFullCalendar->:=SVG_Export_to_picture(CAL_t_SVGref)
			//}
		End if 
		//}
		
		// //  Set the background color of the selected mini cell & refresh the picture
		//{
		Cal4D_Cal_RecolorMinis
		//}
		
	End if 
	//}
	
	//========================    Clean up and Exit    =================================
	
End if 
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_Mini"; $_t_oldMethodName)