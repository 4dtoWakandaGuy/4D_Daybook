//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_PUM
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_OM_CalWithMinis_PUM
	// //
	// //  Written by Charles Vass - 03/10/2009, 11:03
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:32`Method: Cal4D_OM_CalWithMinis_PUM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Month; $_l_SelectedItem)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; Cal_pic_MainWeek; Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; Cal_pic_Month; CAL_pic_weekBanner)
	C_POINTER:C301($_ptr_Mini_Ref; $_ptr_PictVar; Cal_ptr_MiniCalender1)
	C_TEXT:C284($_t_CellID; $_t_Items; $_t_oldMethodName; Cal_t_SelectedCellRef; Cal_t_SelectedMiniCellRef; CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3; CAL_t_TimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_PUM")

$_t_Items:="(-;Today;New Event...;(-;Import iCalendar File...;Set Timezone...;Set Week Start Day..."
$_t_Items:=$_t_Items+""
$_l_SelectedItem:=Pop up menu:C542($_t_Items)

//========================    Method Actions    ==================================

Case of 
	: ($_l_SelectedItem=2)  // //  Today
		// //  Adjust the date
		//{
		Cal4D_Cal_SelectedDate(Current date:C33)
		//Date_D:=
		//}
		
		// //  Adjust the "selected" date for the next month
		//{
		If (Cal_t_SelectedCellRef#"")
			$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
			$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
			$_d_Date:=Cal4D_Cal_SelectedDate
			$_t_CellID:=String:C10(Cal4D_Cal_DateToOrdinal($_d_Date))+"_Cell_Today"
			
			Cal_t_SelectedCellRef:=""
		End if 
		//}
		
		// //  Redraw the main calendar
		//{
		Cal4D_Cal_GetFullCalendar(->Cal_pic_Month)
		//}
		
		// //  Highlight the newly adjusted "selected" date
		//{
		If ($_t_CellID#"")
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_CellID)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			Cal_pic_Month:=SVG_Export_to_picture(CAL_t_SVGref)
		End if 
		//}
		
		$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
		// //  Adjust the date of the top mini calendar
		//{
		If (($_l_Month<Month of:C24(Cal_D_TopMiniDate)) | ($_l_Month>(Month of:C24(Cal_D_TopMiniDate)+2)))
			Cal_D_TopMiniDate:=Cal4D_Cal_SelectedDate
		End if 
		//}
		
		// //  Redraw the minis
		//{
		Cal4D_Cal_RedrawMinis
		//}
		
		// //  Which mini matches the current month
		//{
		Case of 
			: ($_l_Month=Month of:C24(Cal_D_TopMiniDate))
				$_ptr_Mini_Ref:=(->Cal_t_SVGRefMini1)
				$_ptr_PictVar:=Cal_ptr_MiniCalender1  //(->Mini_Month_1_G)
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
				$_ptr_Mini_Ref:=(->Cal_t_SVGRefMini2)
				$_ptr_PictVar:=(->Cal_pic_MiniMonth2)
			: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
				$_ptr_Mini_Ref:=(->Cal_t_SVGRefMini3)
				$_ptr_PictVar:=(->CAL_pic_MiniMonth3)
		End case 
		//}
		
		// //  Get the ID and Ref for the new selected mini cell
		//{
		If (Cal_t_SelectedCellRef#"")
			$_t_CellID:=SVG_Get_ID(Cal_t_SelectedCellRef)
			$_t_CellID:=$_t_CellID+"_Mini"  //Replace string($_t_CellID;"Cell_";"MiniCell_")
			Cal_t_SelectedMiniCellRef:=SVG_Find_ID($_ptr_Mini_Ref->; $_t_CellID)
			
			// //  Set the cell fill color and redraw the picture
			//{
			SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
			$_ptr_PictVar->:=SVG_Export_to_picture($_ptr_Mini_Ref->)
			//}
		Else 
			Cal_t_SelectedMiniCellRef:=""
		End if 
		//}
		
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
		
	: ($_l_SelectedItem=3)  // //  New Event
		Cal4D_Event_Edit(New record:K29:1)
		If (OK=1)
			// //  Redraw the main calendar
			//{
			//Cal4D_Cal_GetFullCalendar (->Cal_pi_Month)
			//}
		End if 
		
	: ($_l_SelectedItem=5)  // //  Import iCalendar File
		Cal4D_Group_Import
		If (OK=1)
			// //  Redraw the main calendar
			//{
			Cal4D_Cal_GetFullCalendar(->Cal_pic_Month)
			Cal4D_Cal_RedrawMinis
			//}
		End if 
		
	: ($_l_SelectedItem=6)  // //  Timezone
		CAL_t_TimeZone:=Cal4D_iCal_TimeZone(CAL_t_TimeZone)
		
	: ($_l_SelectedItem=7)  // //  WeekStart
		Cal4D_Cal_WeekStart("XXX")
		
	Else 
		
End case 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_PUM"; $_t_oldMethodName)