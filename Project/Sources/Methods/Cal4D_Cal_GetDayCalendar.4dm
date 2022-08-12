//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetDayCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:39`Method: Cal4D_Cal_GetDayCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Banner_Ref_Day_A16)
	//C_UNKNOWN(SVG_Ref_Day_A16)
	//ARRAY DATE(CAL_ad_WeekDates;0)
	//ARRAY LONGINT(CAL_al_WeekOrdinals;0)
	//ARRAY TEXT(CAL_at_DayBnrNames;0)
	//ARRAY TEXT(CAL_at_DayBnrRefs;0)
	//ARRAY TEXT(CAL_at_DayEvtNames;0)
	//ARRAY TEXT(CAL_at_DayEvtRefs;0)
	//ARRAY TEXT(SD2_at_Types;0)
	//ARRAY TEXT(Tmp_at_Names;0)
	//ARRAY TEXT(Tmp_at_RefID;0)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_AllDays; $_l_BnrHeight; $_l_Col; $_l_ColWidth; $_l_HrCol; $_l_HRHeight; $_l_Index; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_objectMove)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_OrdDate; Cal_l_DateToday; Cal_l_DayBnrHeight)
	C_PICTURE:C286(CAL_pic_DayBanner)
	C_POINTER:C301($1; $2; CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
	C_TEXT:C284($_t_CellID; $_t_ObjectReference; $_t_oldMethodName; CAL_t_Banner_Ref_Day; SVG_t_Ref_Day)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetDayCalendar")

CAL_Ptr_4DCalendarDay:=$1
CAL_ptr_BannerDay:=$2

ARRAY LONGINT:C221(CAL_al_WeekOrdinals; 7)
ARRAY DATE:C224(CAL_ad_WeekDates; 7)

$_d_Date:=Cal4D_Cal_SelectedDate
$_l_OrdDate:=Cal4D_Cal_SelectedOrdDate

OBJECT GET COORDINATES:C663(CAL_pic_DayBanner; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)

// //  Always make sure we're working from the objects original positions
//{
If (Cal_l_DayBnrHeight=0)
	Cal_l_DayBnrHeight:=$_l_ObjectBottom
Else 
	If ($_l_ObjectBottom>Cal_l_DayBnrHeight)
		$_l_objectMove:=Cal_l_DayBnrHeight-$_l_ObjectBottom
		OBJECT MOVE:C664(CAL_ptr_BannerDay->; 0; 0; 0; $_l_objectMove)
		OBJECT MOVE:C664(CAL_Ptr_4DCalendarDay->; 0; $_l_objectMove; 0; -$_l_objectMove)
	End if 
End if 
//}

$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop

$_l_ColWidth:=$_l_ObjectWidth-66
$_l_HrCol:=($_l_ObjectWidth-15)-$_l_ColWidth
If ($_l_HrCol>50)
	//$_l_HrCol:=50
End if 

//========================    Method Actions    ==================================

// //  Create the Week Calendar banner object
//{
$_l_AllDays:=1
$_l_Index:=Cal4D_Cal_CntAllDayAndBanners($_d_Date)
If ($_l_Index>$_l_AllDays)
	$_l_AllDays:=$_l_Index
End if 

If ($_l_AllDays>1)
	$_l_objectMove:=18*($_l_AllDays-1)
	OBJECT MOVE:C664(CAL_ptr_BannerDay->; 0; 0; 0; $_l_objectMove)
End if 

OBJECT GET COORDINATES:C663(CAL_ptr_BannerDay->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
$_l_BnrHeight:=$_l_ObjectBottom-$_l_ObjectTop
$_l_objectMove:=0
If ($_l_BnrHeight>45)
	$_l_objectMove:=$_l_BnrHeight-45
End if 

If ($_l_objectMove>0)
	OBJECT MOVE:C664(CAL_Ptr_4DCalendarDay->; 0; $_l_objectMove; 0; -$_l_objectMove)
End if 

//===============================================================

If (CAL_t_Banner_Ref_Day#"")
	SVG_CLEAR(CAL_t_Banner_Ref_Day)
End if 
CAL_t_Banner_Ref_Day:=SVG_New($_l_ObjectWidth; $_l_BnrHeight)
SVG_SET_VIEWBOX(Banner_Ref_Day_A16; 0; 0; $_l_ObjectWidth; $_l_BnrHeight; "xMinYMin")

// //  Draw the All-day box
//{
$_l_ObjectLeft:=$_l_HrCol
If ($_d_Date#SD_ORDINtoDate(Cal_l_DateToday))
	$_t_ObjectReference:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; 0; $_l_ColWidth; $_l_ObjectHeight-4; 0; 0; "white"; "white"; 0.1)
Else 
	$_t_ObjectReference:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; 0; $_l_ColWidth; $_l_ObjectHeight-4; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 0.1)
End if 
SVG_SET_ID($_t_ObjectReference; "BG_"+String:C10($_l_Index))
//}

// //  Draw the column title
//{
SVG_New_text(CAL_t_Banner_Ref_Day; String:C10(Year of:C25($_d_Date)); 8; 4; "Arial"; 12; Plain:K14:1; Align left:K42:2; "black")
$_t_CellID:=DB_GetIndexedString(32001; Day number:C114($_d_Date))+", "+DB_GetIndexedString(14002; Month of:C24($_d_Date))+" "+String:C10(Day of:C23($_d_Date))
If ($_d_Date=SD_ORDINtoDate(Cal_l_DateToday))
	$_t_ObjectReference:=SVG_New_textArea(CAL_t_Banner_Ref_Day; $_t_CellID; $_l_ObjectLeft; 4; $_l_ColWidth; 16; "Arial"; 12; Bold:K14:2; Align center:K42:3)
Else 
	$_t_ObjectReference:=SVG_New_textArea(CAL_t_Banner_Ref_Day; $_t_CellID; $_l_ObjectLeft; 4; $_l_ColWidth; 16; "Arial"; 12; Plain:K14:1; Align center:K42:3)
End if 
SVG_SET_ID($_t_ObjectReference; "WeekDay_"+String:C10($_l_Index))
//}

// //  Draw the All-day boxes
//{
$_t_ObjectReference:=SVG_New_rect(Banner_Ref_Day_A16; 0; 24; $_l_HrCol; $_l_ObjectHeight-4; 0; 0; "black"; "white"; 0.2)
SVG_New_text(CAL_t_Banner_Ref_Day; "All-day"; 8; 26; "Arial"; 11; Plain:K14:1; Align left:K42:2; SVG_Color_grey(60))
$_l_ObjectLeft:=$_l_HrCol
If ($_d_Date#SD_ORDINtoDate(Cal_l_DateToday))
	$_t_ObjectReference:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; 24; $_l_ColWidth; $_l_ObjectHeight-4; 0; 0; "black"; "white"; 0.2)
Else 
	$_t_ObjectReference:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; 24; $_l_ColWidth; $_l_ObjectHeight-4; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 0.2)
End if 
$_l_ObjectLeft:=$_l_ObjectLeft+$_l_ColWidth
SVG_SET_ID($_t_ObjectReference; "AllDay_"+String:C10($_l_Index))
//}

// //  Draw the separator
// //
$_t_ObjectReference:=SVG_New_rect(Banner_Ref_Day_A16; 0; $_l_BnrHeight-4; $_l_ObjectWidth; 4; 0; 0; "black"; SVG_Color_grey(20); 0.1)
SVG_SET_ID($_t_ObjectReference; "WkBannerSep")
//}

//===============================================================

OBJECT GET COORDINATES:C663(CAL_Ptr_4DCalendarDay->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop

$_l_HRHeight:=48
$_l_ObjectWidth:=$_l_ObjectWidth-16
$_l_ObjectHeight:=$_l_HRHeight*24

If (SVG_t_Ref_Day#"")
	SVG_CLEAR(SVG_t_Ref_Day)
End if 
SVG_t_Ref_Day:=SVG_New($_l_ObjectWidth; $_l_ObjectHeight)

// //  Set the viewbox to be var width minus 16 to allow for the scrollbar4
// //  Height is 48 px for easy quarter hour math, 15 min equals 12 px.
//{
SVG_SET_VIEWBOX(SVG_Ref_Day_A16; 0; 0; $_l_ObjectWidth; $_l_ObjectHeight; "xMinYMin")
//}

// //  Draw the "Hours" column
//{
$_t_ObjectReference:=SVG_New_rect(SVG_Ref_Day_A16; 0; 0; $_l_HrCol; $_l_ObjectHeight; 0; 0; "black"; "white"; 0.2)
SVG_SET_ID($_t_ObjectReference; "HrCol")
$_l_ObjectTop:=$_l_HRHeight-6
For ($_l_Index; 1; 23)
	If ($_l_Index<13)
		If ($_l_Index<12)
			$_t_CellID:=String:C10($_l_Index)+" AM"
		Else 
			$_t_CellID:=String:C10($_l_Index)+" PM"
		End if 
	Else 
		$_t_CellID:=String:C10($_l_Index-12)+" PM"
	End if 
	
	SVG_New_textArea(SVG_t_Ref_Day; $_t_CellID; 0; $_l_ObjectTop; $_l_HrCol-4; 12; "Arial"; 10; Plain:K14:1; Align right:K42:4)
	$_l_ObjectTop:=$_l_ObjectTop+$_l_HRHeight
End for 
//}

// //  Draw the one week hourly grid
//{
$_l_ObjectTop:=0
$_l_Col:=$_l_HrCol
For ($_l_Index; 0; 23)
	If (($_l_Index<8) | ($_l_Index>17))
		$_t_ObjectReference:=SVG_New_rect(SVG_t_Ref_Day; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HRHeight; 0; 0; "black"; SVG_Color_grey(3); 0.2)
	Else 
		$_t_ObjectReference:=SVG_New_rect(SVG_t_Ref_Day; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HRHeight; 0; 0; "black"; "white"; 0.2)
	End if 
	
	$_t_CellID:=String:C10(Cal4D_Cal_DateToOrdinal($_d_Date))+"_"+String:C10($_l_Index; "00")
	SVG_SET_ID($_t_ObjectReference; $_t_CellID)
	
	$_t_ObjectReference:=SVG_New_line(SVG_t_Ref_Day; $_l_Col; $_l_ObjectTop+($_l_HRHeight/2); $_l_Col+$_l_ColWidth; $_l_ObjectTop+($_l_HRHeight/2); "black"; 0.1)
	SVG_SET_ID($_t_ObjectReference; $_t_CellID+"_30min")
	$_l_ObjectTop:=$_l_ObjectTop+$_l_HRHeight
End for 
//}

Cal4D_Cal_PopulateDayEvents

CAL_ptr_BannerDay->:=SVG_Export_to_picture(CAL_t_Banner_Ref_Day)
CAL_Ptr_4DCalendarDay->:=SVG_Export_to_picture(SVG_t_Ref_Day)

//========================    Clean up and Exit    =================================

ARRAY TEXT:C222(CAL_at_DayEvtRefs; 0)
ARRAY TEXT:C222(CAL_at_DayEvtNames; 0)
ARRAY TEXT:C222(SD2_at_Types; 0)
SVG_ELEMENTS_TO_ARRAYS(SVG_t_Ref_Day; ->CAL_at_DayEvtRefs; ->SD2_at_Types; ->CAL_at_DayEvtNames)
ARRAY TEXT:C222(SD2_at_Types; 0)

ARRAY TEXT:C222(CAL_at_DayBnrRefs; 0)
ARRAY TEXT:C222(CAL_at_DayBnrNames; 0)
ARRAY TEXT:C222(SD2_at_Types; 0)
SVG_ELEMENTS_TO_ARRAYS(CAL_t_Banner_Ref_Day; ->CAL_at_DayBnrRefs; ->SD2_at_Types; ->CAL_at_DayBnrNames)
ARRAY TEXT:C222(SD2_at_Types; 0)

For ($_l_Index; 1; Tmp_at_RefID)
	INSERT IN ARRAY:C227(CAL_at_DayBnrRefs; $_l_Index)
	INSERT IN ARRAY:C227(CAL_at_DayBnrNames; $_l_Index)
	CAL_at_DayBnrRefs{$_l_Index}:=Tmp_at_RefID{$_l_Index}
	CAL_at_DayBnrNames{$_l_Index}:=Tmp_at_Names{$_l_Index}
End for 
ERR_MethodTrackerReturn("Cal4D_Cal_GetDayCalendar"; $_t_oldMethodName)