//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetMiniCalendar
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_Cal_GetMiniCalendar ($_ptr_PictVar;$_d_Date;$_l_Offset{;$Banner_P;$_ptr_Titles})
	// //
	// //  Written by Charles Vass - 03/02/2009, 14:39
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 16:30`Method: Cal4D_Cal_GetMiniCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_Dates; 0)
	//ARRAY DATE(CAL_ad_DatesWithEvents;0)
	ARRAY LONGINT:C221($_al_Days; 0)
	ARRAY LONGINT:C221($_al_Ordinals; 0)
	C_DATE:C307($_d_CurrentDate; $_d_Date; $_d_tempDate; $2; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_CurrentMonth; $_l_DateRow; $_l_DayHeight; $_l_DayIndex; $_l_Days; $_l_DayStartNumber; $_l_DayWidth; $_l_Month; $_l_ObjectLeft; $_l_ObjectTop; $_l_Offset)
	C_LONGINT:C283($_l_Params; $_l_RowHeight; $_l_WeekIndex; $_l_Weeks; $3)
	C_PICTURE:C286($_pic_MiniBanner; CAL_pic_MiniBanner2; CAL_pic_MiniBanner3; Cal_pic_MiniCols1; CAL_pic_MiniCols2; CAL_pic_MiniCols3; SD2_pic_MiniBanner)
	C_POINTER:C301($_ptr_PictVar; $_ptr_Titles; $1; $4; $5; CAL_Ptr_MiniBanner_1; SD2_ptr_MiniCalendar; SD2_ptr_MiniCalendarBanner)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_MethodName; $_t_oldMethodName; $_t_TmpID; $_t_XMLBannerRef; $_t_XMLSVGRef; Cal_t_BannerRef2; Cal_t_BannerRef3; CAL_t_CalWeekStart; Cal_t_SelectedMiniCellRef)
	C_TEXT:C284(Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3; SD2_t_SVG_Mini)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetMiniCalendar")
$_ptr_PictVar:=$1
$_d_Date:=$2
$_l_Offset:=$3

If ($_l_Offset>0)
	$_d_Date:=Add to date:C393($_d_Date; 0; $_l_Offset; 0)
Else 
	Cal_D_TopMiniDate:=$_d_Date
End if 
$_l_Params:=Count parameters:C259
$_l_Month:=Month of:C24($_d_Date)
$_d_CurrentDate:=Current date:C33
$_l_CurrentMonth:=Month of:C24($_d_CurrentDate)

// //  So that I can get a hairline
//{
$_l_DayWidth:=26  // //  25.4 is mm per inch
$_l_DayHeight:=13  // //  25.4 is mm per inch
$_l_ObjectTop:=0
//}

Case of 
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
		$_l_DayStartNumber:=2
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
		$_l_DayStartNumber:=7
	Else 
		
End case 

Case of 
	: ($_l_Offset=0)
		OBJECT GET COORDINATES:C663(SD2_pic_MiniBanner; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight)
		If (SD2_t_SVG_Mini#"")
			SVG_CLEAR(SD2_t_SVG_Mini)
		End if 
		SD2_t_SVG_Mini:=SVG_New
		SVG_New_text(SD2_t_SVG_Mini; Get indexed string:C510(14001; $_l_Month)+" "+String:C10(Year of:C25($_d_Date)); 60; 0; "Arial"; 12; Bold:K14:2; Align center:K42:3)
		If ($_l_Params>3)
			SD2_ptr_MiniCalendarBanner:=$4
		Else 
			SD2_ptr_MiniCalendarBanner:=(->SD2_pic_MiniBanner)
		End if 
		SD2_ptr_MiniCalendarBanner->:=SVG_Export_to_picture(SD2_t_SVG_Mini)
		SD2_ptr_MiniCalendar:=$_ptr_PictVar
		
		// //  Create the month grid
		//{
		If (True:C214)  //(Picture size($_ptr_PictVar->)=0)
			$_l_DayWidth:=26  // //  25.4 is mm per inch
			$_l_DayHeight:=13  // //  25.4 is mm per inch
			$_l_ObjectTop:=0
			$_l_ObjectLeft:=0
			$_t_XMLBannerRef:=SVG_New
			For ($_l_DayIndex; 1; 7)
				Case of 
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
						If ($_l_DayIndex=7)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
						If ($_l_DayIndex=2)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					Else 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; DB_GetIndexedString(15002; $_l_DayIndex); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						
				End case 
				$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
			End for 
			If ($_l_Params>3)
				$_ptr_Titles:=$5
				$_ptr_Titles->:=SVG_Export_to_picture($_t_XMLBannerRef)
			Else 
				Cal_pic_MiniCols1:=SVG_Export_to_picture($_t_XMLBannerRef)
			End if 
		End if 
		//}
		
	: ($_l_Offset=1)
		OBJECT GET COORDINATES:C663(CAL_pic_MiniBanner2; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight)
		If (Cal_t_BannerRef2#"")
			SVG_CLEAR(Cal_t_BannerRef2)
		End if 
		Cal_t_BannerRef2:=SVG_New
		SVG_New_text(Cal_t_BannerRef2; DB_GetIndexedString(14001; $_l_Month)+" "+String:C10(Year of:C25($_d_Date)); $_l_DayWidth/2; 0; "Arial"; 12; Bold:K14:2; Align center:K42:3)
		CAL_pic_MiniBanner2:=SVG_Export_to_picture(Cal_t_BannerRef2)
		
		// //  Create the month grid
		//{
		If (True:C214)  //(Picture size(Mini_Month_2_G)=0)
			$_l_DayWidth:=26  // //  25.4 is mm per inch
			$_l_DayHeight:=13  // //  25.4 is mm per inch
			$_l_ObjectTop:=0
			$_l_ObjectLeft:=0
			$_t_XMLBannerRef:=SVG_New
			For ($_l_DayIndex; 1; 7)
				Case of 
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
						If ($_l_DayIndex=7)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
						If ($_l_DayIndex=2)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					Else 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayIndex); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						
				End case 
				$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
			End for 
			CAL_pic_MiniCols2:=SVG_Export_to_picture($_t_XMLBannerRef)
		End if 
		//}
		
	: ($_l_Offset=2)
		OBJECT GET COORDINATES:C663(CAL_pic_MiniBanner3; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight)
		If (Cal_t_BannerRef3#"")
			SVG_CLEAR(Cal_t_BannerRef3)
		End if 
		Cal_t_BannerRef3:=SVG_New
		SVG_New_text(Cal_t_BannerRef3; DB_GetIndexedString(14001; $_l_Month)+" "+String:C10(Year of:C25($_d_Date)); $_l_DayWidth/2; 0; "Arial"; 12; Bold:K14:2; Align center:K42:3)
		CAL_pic_MiniBanner3:=SVG_Export_to_picture(Cal_t_BannerRef3)
		
		// //  Create the month grid
		//{
		If (True:C214)  // (Picture size(Mini_Month_3_G)=0)
			$_l_DayWidth:=26  // //  25.4 is mm per inch
			$_l_DayHeight:=13  // //  25.4 is mm per inch
			$_l_ObjectTop:=0
			$_l_ObjectLeft:=0
			$_t_XMLBannerRef:=SVG_New
			For ($_l_DayIndex; 1; 7)
				Case of 
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
						If ($_l_DayIndex=7)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; DB_GetIndexedString(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
						If ($_l_DayIndex=2)
							$_l_DayStartNumber:=1
						End if 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayStartNumber); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						$_l_DayStartNumber:=$_l_DayStartNumber+1
						
					Else 
						$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLBannerRef; Get indexed string:C510(15002; $_l_DayIndex); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+6; "Arial"; 10; Plain:K14:1; Align center:K42:3)
						
				End case 
				$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
			End for 
			CAL_pic_MiniCols3:=SVG_Export_to_picture($_t_XMLBannerRef)
		End if 
		//}
		
End case 

// //  Create three arrays, one with Ordinal dates for a Unique cell ID,
// //  One for the day of the month, and
// //  One for the dates displayed on the calendar, needed to ID those cell
// //  that do not belong to the current month
//{
$_l_Weeks:=Cal4D_Cal_WeeksToDisplay($_d_Date; CAL_t_CalWeekStart)
If ($_l_Weeks<5)
	$_l_Weeks:=5
End if 
$_l_Days:=$_l_Weeks*7
ARRAY LONGINT:C221($_al_Ordinals; $_l_Days)
ARRAY LONGINT:C221($_al_Days; $_l_Days)
ARRAY DATE:C224($_ad_Dates; $_l_Days)
Cal4D_Cal_MonthOfDays($_d_Date; ->$_al_Ordinals; ->$_al_Days; ->$_ad_Dates; CAL_t_CalWeekStart)
//}

Case of 
	: ($_l_Offset=0)
		$_t_XMLSVGRef:=Cal_t_SVGRefMini1
	: ($_l_Offset=1)
		$_t_XMLSVGRef:=Cal_t_SVGRefMini2
	: ($_l_Offset=2)
		$_t_XMLSVGRef:=Cal_t_SVGRefMini3
End case 

// //  Create the month object
//{
If ($_t_XMLSVGRef#"")
	SVG_CLEAR($_t_XMLSVGRef)
End if 
$_t_XMLSVGRef:=SVG_New
//}

// //  So that I can get a hairline
//{
$_l_DayWidth:=24*25.4  // //  25.4 is mm per inch
$_l_DayHeight:=24*25.4  // //  25.4 is mm per inch
$_l_ObjectTop:=34*25.4
SVG_SET_DIMENSIONS($_t_XMLSVGRef; -1; -1; "mm")
//}

//========================    Method Actions    ==================================
$_l_RowHeight:=$_l_DayHeight
$_l_DayStartNumber:=0
For ($_l_WeekIndex; 1; $_l_Weeks)
	$_l_ObjectLeft:=0
	For ($_l_DayIndex; 1; 7)
		// //  Increment my arrays index
		//{
		$_l_DayStartNumber:=$_l_DayStartNumber+1
		//}
		
		// //  Create day cell rectangle and assign it a unique ID
		//{
		Case of 
			: (($_l_Month=$_l_CurrentMonth) & ($_ad_Dates{$_l_DayStartNumber}=$_d_CurrentDate))
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DayStartNumber})+"_Cell_Today_Mini"
				$_t_Day_Cell_Ref:=SVG_New_rect($_t_XMLSVGRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Mini_Today"); 2)
				SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
				
			: (($_l_Month=Month of:C24(Cal4D_Cal_SelectedDate)) & (Month of:C24($_ad_Dates{$_l_DayStartNumber})=Month of:C24(Cal4D_Cal_SelectedDate)))
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DayStartNumber})+"_Cell_Day_Mini"
				$_t_Day_Cell_Ref:=SVG_New_rect($_t_XMLSVGRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"); 2)
				SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
				
			Else 
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DayStartNumber})+"_Cell_Day_Mini"
				$_t_Day_Cell_Ref:=SVG_New_rect($_t_XMLSVGRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Mini_OutMonth"); 2)
				
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		If (Month of:C24($_d_Date)=Month of:C24(Cal4D_Cal_SelectedDate))
			If ($_ad_Dates{$_l_DayStartNumber}=Cal4D_Cal_SelectedDate)
				Cal_t_SelectedMiniCellRef:=$_t_Day_Cell_Ref
				SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
			End if 
		End if 
		//}
		
		ARRAY DATE:C224(CAL_ad_DatesWithEvents; 0)
		If (False:C215)
			Cal4D_Cal_DaysWithEvents($_d_Date; ->CAL_ad_DatesWithEvents)
		End if 
		
		
		
		// //  Create the date text for the cell
		//{
		$_l_DateRow:=Find in array:C230(CAL_ad_DatesWithEvents; $_ad_Dates{$_l_DayStartNumber})
		If ($_ad_Dates{$_l_DayStartNumber}=$_d_CurrentDate)
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DayStartNumber})+"_Text_Today_Mini"
			If ($_l_DateRow>0)
				$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLSVGRef; String:C10($_al_Days{$_l_DayStartNumber}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 300; Bold:K14:2+Underline:K14:4; Align center:K42:3)
			Else 
				$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLSVGRef; String:C10($_al_Days{$_l_DayStartNumber}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 300; Bold:K14:2; Align center:K42:3)
			End if 
			SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
		Else 
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DayStartNumber})+"_Text_Day_Mini"
			If ($_l_DateRow>0)
				$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLSVGRef; String:C10($_al_Days{$_l_DayStartNumber}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 300; Plain:K14:1+Underline:K14:4; Align center:K42:3)
			Else 
				$_t_Day_Cell_Ref:=SVG_New_text($_t_XMLSVGRef; String:C10($_al_Days{$_l_DayStartNumber}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 300; Plain:K14:1; Align center:K42:3)
			End if 
		End if 
		
		Case of 
			: ($_l_Offset=0)
				Case of 
					: (Month of:C24($_ad_Dates{$_l_DayStartNumber})<$_l_Month)
						SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "rgb(150,150,150)")
					: (Month of:C24($_ad_Dates{$_l_DayStartNumber})>$_l_Month)
						SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
				End case 
				
				If ($_l_Month>Month of:C24($_ad_Dates{$_l_DayStartNumber}))
					//SVG_SET_FONT_COLOR ($_t_Day_Cell_Ref;"white")
				End if 
				
			: ($_l_Offset=1)
				If ($_l_Month#Month of:C24($_ad_Dates{$_l_DayStartNumber}))
					SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
				End if 
				
			: ($_l_Offset=2)
				Case of 
					: ($_l_Month>Month of:C24($_ad_Dates{$_l_DayStartNumber}))
						SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
					: ($_l_Month<Month of:C24($_ad_Dates{$_l_DayStartNumber}))
						SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "rgb(150,150,150)")
				End case 
				
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		//}
		
		// //  Adjust the X origin point for the next day cell
		//{
		$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
		//}
	End for 
	
	// //  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectTop:=$_l_ObjectTop+$_l_RowHeight
	//}
End for 
//}

//========================    Clean up and Exit    =================================

// //  Tranlate the SVG object to the Picture variable
//{
$_ptr_PictVar->:=SVG_Export_to_picture($_t_XMLSVGRef)
//}

Case of 
	: ($_l_Offset=0)
		Cal_t_SVGRefMini1:=$_t_XMLSVGRef
	: ($_l_Offset=1)
		Cal_t_SVGRefMini2:=$_t_XMLSVGRef
	: ($_l_Offset=2)
		Cal_t_SVGRefMini3:=$_t_XMLSVGRef
End case 
ERR_MethodTrackerReturn("Cal4D_Cal_GetMiniCalendar"; $_t_oldMethodName)