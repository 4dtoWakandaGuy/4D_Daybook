//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetFullCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:16`Method: Cal4D_Cal_GetFullCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD2_ad_Dates;0)
	//ARRAY LONGINT(SD2_al_Days;0)
	//ARRAY LONGINT(SD2_al_Ordinals;0)
	//ARRAY TEXT(SD2_at_Names;0)
	//ARRAY TEXT(SD2_at_Refs;0)
	//ARRAY TEXT(SD2_at_Types;0)
	//ARRAY TEXT(Tmp_at_RefID;0)
	C_DATE:C307($_d_CurrentDate; $_d_Date; $_d_SelectedDate; $2; $3; SD2_D_Date)
	C_LONGINT:C283($_l_BannerWidth; $_l_CalendarBottom; $_l_CalendarLeft; $_l_CalendarRight; $_l_CalendarTop; $_l_CountParameters; $_l_DayHeight; $_l_DayIndex; $_l_Days; $_l_DayWidth; $_l_Idx)
	C_LONGINT:C283($_l_Month; $_l_MonthNumber; $_l_ObjectLeft; $_l_ObjectTop; $_l_Params; $_l_RowHeight; $_l_WeekIndex; $_l_Weeks; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; CAL_pic_MainMonth; Cal_pic_MainWeek; Cal_pic_MonthBanner; CAL_pic_weekBanner; SD2_P_MonthMiniBanner; SD2_pic_MonthMini)
	C_POINTER:C301($1; $4; SD2_ptr_CalendarBanner; SD2_ptr_FullCalendar)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; $_t_CellID; $_t_Day_Cell_Ref; $_t_Day_Cell_Sym; $_t_MethodName; $_t_oldMethodName; $_t_Today_Cell_Ref; Cal_t_BannerRef; Cal_t_BannerRef2; CAL_t_CalWeekStart; CAl_t_SelectedCellRef)
	C_TEXT:C284(CAL_t_SVGref; SD2_t_Selected_Evt_Ref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetFullCalendar")
$_t_MethodName:="Cal4D_Cal_GetFullCalendar"
CAl_t_SelectedCellRef:=""
//Selected_Evt_UID_T:=""
//Selected_Evt_Ref_T:=""

$_d_CurrentDate:=Current date:C33(*)

Cal4D_Cal_GetEventsForOneDay(!00-00-00!)

// //  Assign initial variables from parameters
//{
SD2_ptr_FullCalendar:=$1
$_d_SelectedDate:=!00-00-00!
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>=2)
	Cal4D_Cal_SelectedDate($2)
	//Date_D:=$2
	If ($_l_CountParameters>=3)
		Cal4D_Cal_SelectedDate($3)
		//$_d_SelectedDate:=$3
	End if 
End if 

$_l_MonthNumber:=Month of:C24(Cal4D_Cal_SelectedDate)

// //  If Cal_t_BannerRef is null, then this is the first time through
// //  else destroy the existing SVG object and create anew
// //
If (Cal_t_BannerRef="")
	If ($_l_CountParameters>=4)
		SD2_ptr_CalendarBanner:=$4
	Else 
		SD2_ptr_CalendarBanner:=(->Cal_pic_MonthBanner)
	End if 
Else 
	SVG_CLEAR(Cal_t_BannerRef)
End if 
//}

// //  Create the banner for the Full Calendar
//{
Cal_t_BannerRef:=SVG_New
//TRACE
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
OBJECT GET COORDINATES:C663(*; "oMonth_Detail"; $_l_CalendarLeft; $_l_CalendarTop; $_l_CalendarRight; $_l_CalendarBottom)

$_l_BannerWidth:=($_l_WindowRight-$_l_WindowLeft)-160
SVG_New_text(Cal_t_BannerRef; Get indexed string:C510(14001; $_l_MonthNumber)+" "+String:C10(Year of:C25(Cal4D_Cal_SelectedDate)); 20; 0; <>SYS_t_DefaultFontBold; 24; Plain:K14:1; Align left:K42:2)
SD2_ptr_CalendarBanner->:=SVG_Export_to_picture(Cal_t_BannerRef)
//}

// //  Create three arrays, one with Ordinal dates for a Unique cell ID,
// //  One for the day of the month, and
// //  One for the dates displayed on the calendar, needed to ID those cell
// //  that do not belong to the current month
//{
$_l_Weeks:=Cal4D_Cal_WeeksToDisplay(Cal4D_Cal_SelectedDate; CAL_t_CalWeekStart)

$_l_Days:=$_l_Weeks*7
ARRAY LONGINT:C221(SD2_al_Ordinals; $_l_Days)
ARRAY LONGINT:C221(SD2_al_Days; $_l_Days)
ARRAY DATE:C224(SD2_ad_Dates; $_l_Days)
Cal4D_Cal_MonthOfDays(Cal4D_Cal_SelectedDate; ->SD2_al_Ordinals; ->SD2_al_Days; ->SD2_ad_Dates; CAL_t_CalWeekStart)

//}

// //  Create the month object
//{
If (CAL_t_SVGref#"")
	SVG_CLEAR(CAL_t_SVGref)
End if 
CAL_t_SVGref:=SVG_New
//}

// //  So that I can get a hairline
//{
$_l_DayWidth:=120*25.4  // //  25.4 is mm per inch
$_l_DayHeight:=20*25.4  // //  25.4 is mm per inch
$_l_ObjectTop:=0
SVG_SET_DIMENSIONS(CAL_t_SVGref; -1; -1; "mm")
//}

//========================    Method Actions    ==================================

// //  Create the month grid
//{
Case of 
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
		$_l_Idx:=2
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
		$_l_Idx:=7
	Else 
		
End case 

$_l_ObjectLeft:=0
For ($_l_DayIndex; 1; 7)
	$_t_Day_Cell_Ref:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Day"); 2)
	
	Case of 
		: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
			If ($_l_DayIndex=7)
				$_l_Idx:=1
			End if 
			$_t_Day_Cell_Ref:=SVG_New_text(CAL_t_SVGref; DB_GetIndexedString(32001; $_l_Idx); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+12; <>SYS_t_DefaultFontBold; 14*25.4; Plain:K14:1; Align center:K42:3)
			$_l_Idx:=$_l_Idx+1
			
		: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
			If ($_l_DayIndex=2)
				$_l_Idx:=1
			End if 
			$_t_Day_Cell_Ref:=SVG_New_text(CAL_t_SVGref; DB_GetIndexedString(32001; $_l_Idx); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+12; <>SYS_t_DefaultFontBold; 14*25.4; Plain:K14:1; Align center:K42:3)
			$_l_Idx:=$_l_Idx+1
			
		Else 
			$_t_Day_Cell_Ref:=SVG_New_text(CAL_t_SVGref; DB_GetIndexedString(32001; $_l_DayIndex); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+12; <>SYS_t_DefaultFontBold; 14*25.4; Plain:K14:1; Align center:K42:3)
			
	End case 
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
End for 
$_l_ObjectTop:=$_l_DayHeight

$_l_DayHeight:=150*25.4  // //  25.4 is mm per inch
$_l_RowHeight:=$_l_DayHeight
$_l_Idx:=0
For ($_l_WeekIndex; 1; $_l_Weeks)
	$_l_ObjectLeft:=0
	For ($_l_DayIndex; 1; 7)
		// //  Increment my arrays index
		//{
		$_l_Idx:=$_l_Idx+1
		//}
		
		// //  Create day cell rectangle and assign it a unique ID
		//{
		Case of 
			: (($_l_CountParameters=2) & (Cal4D_Cal_SelectedDate=SD2_ad_Dates{$_l_Idx}))
				If ($_d_CurrentDate=Cal4D_Cal_SelectedDate)
					$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Cell_Today"
				Else 
					$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Cell_Day"
				End if 
				$_t_Day_Cell_Ref:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Selected"); 2)
				
				CAl_t_SelectedCellRef:=$_t_Day_Cell_Ref
				
			: ($_d_CurrentDate=!00-00-00!)  //Dates_aD{$_l_Idx})
				$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Cell_Today"
				$_t_Day_Cell_Ref:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 2)
				
				
			Else 
				$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Cell_Day"
				$_t_Day_Cell_Ref:=SVG_New_rect(CAL_t_SVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Day"); 2)
				
				
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		If (SD2_ad_Dates{$_l_Idx}=Cal4D_Cal_SelectedDate)
			CAl_t_SelectedCellRef:=$_t_Day_Cell_Ref
			SVG_SET_ATTRIBUTES(CAl_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			
		End if 
		
		//}
		
		// //  Create the date text for the cell
		//{
		If (Cal4D_Cal_SelectedDate=SD2_ad_Dates{$_l_Idx})
			$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Text_Today"
		Else 
			$_t_CellID:=String:C10(SD2_al_Ordinals{$_l_Idx})+"_Text_Day"
		End if 
		
		$_t_Day_Cell_Ref:=SVG_New_text(CAL_t_SVGref; String:C10(SD2_al_Days{$_l_Idx}); $_l_ObjectLeft+($_l_DayWidth-20); $_l_ObjectTop+12; "verdana"; 360; Plain:K14:1; Align right:K42:4)
		If ($_l_Month#Month of:C24(SD2_ad_Dates{$_l_Idx}))
			SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "rgb(153,153,153")
		End if 
		
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

Cal4D_Cal_PopulateMonthEvents

//========================    Clean up and Exit    =================================

// //  Tranlate the SVG object to the Picture variable
//{
SD2_ptr_FullCalendar->:=SVG_Export_to_picture(CAL_t_SVGref)
//}


ARRAY TEXT:C222(SD2_at_Refs; 0)
ARRAY TEXT:C222(SD2_at_Names; 0)
ARRAY TEXT:C222(SD2_at_Types; 0)
SVG_ELEMENTS_TO_ARRAYS(CAL_t_SVGref; ->SD2_at_Refs; ->SD2_at_Types; ->SD2_at_Names)


ARRAY TEXT:C222(SD2_at_Types; 0)

For ($_l_DayIndex; 1; Tmp_at_RefID)
	INSERT IN ARRAY:C227(SD2_at_Refs; $_l_DayIndex)
	INSERT IN ARRAY:C227(SD2_at_Names; $_l_DayIndex)
	//SD2_at_Refs{$_l_DayIndex}:=Tmp_at_RefID{$_l_DayIndex}
	//SD2_at_Names{$_l_DayIndex}:=Tmp_at_Names{$_l_DayIndex}
End for 
ERR_MethodTrackerReturn("Cal4D_Cal_GetFullCalendar"; $_t_oldMethodName)