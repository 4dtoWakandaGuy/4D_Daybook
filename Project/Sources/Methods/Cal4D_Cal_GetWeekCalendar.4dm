//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetWeekCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:47`Method: Cal4D_Cal_GetWeekCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SVG_Ref_Week_A16)
	//ARRAY DATE(CAL_ad_WeekDates;0)
	//ARRAY LONGINT(CAL_al_WeekOrdinals;0)
	//ARRAY TEXT(SD2_at_Types;0)
	//ARRAY TEXT(SD2_at_WkBnrNames;0)
	//ARRAY TEXT(SD2_at_WKBnrRefs;0)
	//ARRAY TEXT(SD2_at_WkBnrTypes;0)
	//ARRAY TEXT(SD2_at_WkEvtNames;0)
	//ARRAY TEXT(SD2_at_WkEvtRefs;0)
	//ARRAY TEXT(SD2_at_WkEvtTypes;0)
	//ARRAY TEXT(Tmp_at_Names;0)
	//ARRAY TEXT(Tmp_at_RefID;0)
	C_DATE:C307($_d_CurrentDate; $_d_Date; Cal_d_tempDate)
	C_LONGINT:C283($_l_AlldayCellHt; $_l_Alldays; $_l_BnrHeight; $_l_Bottom; $_l_Col; $_l_ColWidth; $_l_DayHeight; $_l_Days; $_l_DayWidth; $_l_Height; $_l_HrCol)
	C_LONGINT:C283($_l_HrHeight; $_l_Index; $_l_ItemOffset; $_l_Month; $_l_NumberofBanners; $_l_ObjectLeft; $_l_objectMove; $_l_ObjectRight; $_l_ObjectTop; $_l_Params; $_l_RowHeight)
	C_LONGINT:C283($_l_Weeks; $_l_Width; Cal_l_DateToday; Cal_l_WeekBnrHeight; Tmp_l_Count)
	C_PICTURE:C286(Cal_pic_MainWeek; CAL_pic_weekBanner)
	C_POINTER:C301($1; $2; CAL_ptr_4DCalendarWeek; CAL_ptr_BannerWeek)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_ObjRef; $_t_oldMethodName; $_t_path; $_t_SQL; $_t_Today_Cell_Ref; CAL_t_CalWeekStart; Cal_t_WeekRef; SVG_t_Ref_Week)
	C_TIME:C306($_ti_Hour)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetWeekCalendar")
CAL_ptr_4DCalendarWeek:=$1
CAL_ptr_BannerWeek:=$2

Case of 
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
		$_l_ItemOffset:=2
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
		$_l_ItemOffset:=7
	Else 
		
End case 

ARRAY LONGINT:C221(CAL_al_WeekOrdinals; 7)
ARRAY DATE:C224(CAL_ad_WeekDates; 7)
Cal4D_Cal_WeekOfDays(Cal4D_Cal_SelectedDate; ->CAL_al_WeekOrdinals; ->CAL_ad_WeekDates; CAL_t_CalWeekStart)

OBJECT GET COORDINATES:C663(CAL_pic_weekBanner; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)

// //  Always make sure we're working from the objects original positions
//{
If (Cal_l_WeekBnrHeight=0)
	Cal_l_WeekBnrHeight:=$_l_Bottom
Else 
	If ($_l_Bottom>Cal_l_WeekBnrHeight)
		$_l_objectMove:=Cal_l_WeekBnrHeight-$_l_Bottom
		OBJECT MOVE:C664(CAL_ptr_BannerWeek->; 0; 0; 0; $_l_objectMove)
		OBJECT MOVE:C664(CAL_ptr_4DCalendarWeek->; 0; $_l_objectMove; 0; -$_l_objectMove)
	End if 
End if 
//}

$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
$_l_Height:=$_l_Bottom-$_l_ObjectTop

$_l_AlldayCellHt:=18
$_l_ColWidth:=($_l_Width-66)/7
//$_l_ColWidth:=($_l_Width)/7
$_l_HrCol:=($_l_Width)-($_l_ColWidth*7)
If ($_l_HrCol>50)
	$_l_HrCol:=50
End if 

//========================    Method Actions    ==================================

// //  Create the Week Calendar banner object
//{
$_l_Alldays:=1
For ($_l_Index; 1; 7)
	$_l_NumberofBanners:=Cal4D_Cal_CntAllDayAndBanners(CAL_ad_WeekDates{$_l_Index})
	If ($_l_NumberofBanners>$_l_Alldays)
		$_l_Alldays:=$_l_NumberofBanners
	End if 
End for 

If ($_l_Alldays>1)
	$_l_objectMove:=$_l_AlldayCellHt*($_l_Alldays-1)
	OBJECT MOVE:C664(CAL_ptr_BannerWeek->; 0; 0; 0; $_l_objectMove)
End if 

OBJECT GET COORDINATES:C663(CAL_ptr_BannerWeek->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
$_l_BnrHeight:=$_l_Bottom-$_l_ObjectTop
$_l_objectMove:=0
If ($_l_BnrHeight>45)
	$_l_objectMove:=$_l_BnrHeight-45
End if 

If ($_l_objectMove>0)
	OBJECT MOVE:C664(CAL_ptr_4DCalendarWeek->; 0; $_l_objectMove; 0; -$_l_objectMove)
End if 

//===============================================================

If (Cal_t_WeekRef#"")
	SVG_CLEAR(Cal_t_WeekRef)
End if 
Cal_t_WeekRef:=SVG_New($_l_Width; $_l_BnrHeight)
SVG_SET_VIEWBOX(Cal_t_WeekRef; 0; 0; $_l_Width; $_l_BnrHeight; "xMinYMin")
//xMinYMin
// //  Draw the All-day boxes
//{
$_l_ObjectLeft:=$_l_HrCol+1
For ($_l_Index; 1; 7)
	If (CAL_ad_WeekDates{$_l_Index}#SD_ORDINtoDate(Cal_l_DateToday))
		$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; 0; $_l_ColWidth+2; $_l_BnrHeight-4; 0; 0; "white"; "white"; 0.1)
	Else 
		$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; 0; $_l_ColWidth+2; $_l_BnrHeight-4; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 0.1)
	End if 
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_ColWidth+2
	SVG_SET_ID($_t_ObjRef; "BG_"+String:C10($_l_Index))
End for 
//}

// //  Draw the column titles
//{
Case of 
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
		$_l_ItemOffset:=2
	: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 7))
		$_l_ItemOffset:=7
	Else 
		
End case 

SVG_New_text(Cal_t_WeekRef; String:C10(Year of:C25(CAL_ad_WeekDates{1})); 8; 4; "Arial"; 12; Plain:K14:1; Align left:K42:2; "black")
For ($_l_Index; 1; 7)
	Case of 
		: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
			If ($_l_Index=7)
				$_l_ItemOffset:=1
			End if 
			$_t_CellID:=DB_GetIndexedString(15002; $_l_ItemOffset)+", "+DB_GetIndexedString(14002; Month of:C24(CAL_ad_WeekDates{$_l_Index}))+" "+String:C10(Day of:C23(CAL_ad_WeekDates{$_l_Index}))
			$_l_ItemOffset:=$_l_ItemOffset+1
			
		: (CAL_t_CalWeekStart=DB_GetIndexedString(32001; 2))
			If ($_l_Index=2)
				$_l_ItemOffset:=1
			End if 
			$_t_CellID:=DB_GetIndexedString(15002; $_l_ItemOffset)+", "+DB_GetIndexedString(14002; Month of:C24(CAL_ad_WeekDates{$_l_Index}))+" "+String:C10(Day of:C23(CAL_ad_WeekDates{$_l_Index}))
			$_l_ItemOffset:=$_l_ItemOffset+1
			
		Else 
			$_t_CellID:=DB_GetIndexedString(15002; $_l_Index)+", "+DB_GetIndexedString(14002; Month of:C24(CAL_ad_WeekDates{$_l_Index}))+" "+String:C10(Day of:C23(CAL_ad_WeekDates{$_l_Index}))
			
	End case 
	
	$_l_ObjectLeft:=$_l_HrCol+($_l_ColWidth*($_l_Index-1))
	If (CAL_ad_WeekDates{$_l_Index}=SD_ORDINtoDate(Cal_l_DateToday))
		$_t_ObjRef:=SVG_New_textArea(Cal_t_WeekRef; $_t_CellID; $_l_ObjectLeft; 4; $_l_ColWidth+2; 16; "Arial"; 12; Bold:K14:2; Align center:K42:3)
	Else 
		$_t_ObjRef:=SVG_New_textArea(Cal_t_WeekRef; $_t_CellID; $_l_ObjectLeft; 4; $_l_ColWidth+2; 16; "Arial"; 12; Plain:K14:1; Align center:K42:3)
	End if 
	SVG_SET_ID($_t_ObjRef; "WeekDay_"+String:C10($_l_Index))
	
End for 
//}

// //  Draw the All-day boxes
//{
$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; 0; 24; $_l_HrCol; $_l_BnrHeight-4; 0; 0; "black"; "white"; 0.2)
SVG_New_text(Cal_t_WeekRef; "All-day"; 8; 26; "Arial"; 11; Plain:K14:1; Align left:K42:2; SVG_Color_grey(60))
$_l_ObjectLeft:=$_l_HrCol+1
For ($_l_Index; 1; 7)
	If (CAL_ad_WeekDates{$_l_Index}#SD_ORDINtoDate(Cal_l_DateToday))
		$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; 24; $_l_ColWidth+2; ($_l_AlldayCellHt*$_l_Alldays); 0; 0; "black"; "white"; 0.2)
	Else 
		$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; $_l_ObjectLeft; 24; $_l_ColWidth+2; ($_l_AlldayCellHt*$_l_Alldays); 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 0.2)
	End if 
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_ColWidth+2
	SVG_SET_ID($_t_ObjRef; "AllDay_"+String:C10($_l_Index))
End for 
//}

// //  Draw the separator
// //
$_t_ObjRef:=SVG_New_rect(Cal_t_WeekRef; 0; $_l_BnrHeight-4; $_l_Width; 4; 0; 0; "black"; SVG_Color_grey(20); 0.1)
SVG_SET_ID($_t_ObjRef; "WkBannerSep")
//}

//===============================================================

OBJECT GET COORDINATES:C663(CAL_ptr_4DCalendarWeek->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
$_l_Height:=$_l_Bottom-$_l_ObjectTop

$_l_HrHeight:=48
$_l_Width:=$_l_Width-16
$_l_Height:=$_l_HrHeight*24

If (SVG_t_Ref_Week#"")
	SVG_CLEAR(SVG_t_Ref_Week)
End if 
SVG_t_Ref_Week:=SVG_New($_l_Width; $_l_Height)

// //  Set the viewbox to be var width minus 16 to allow for the scrollbar4
// //  Height is 48 px for easy quarter hour math, 15 min equals 12 px.
//{
SVG_SET_VIEWBOX(SVG_Ref_Week_A16; 0; 0; $_l_Width; $_l_Height; "xMinYMin")
//}

// //  Draw the "Hours" column
//{
$_t_ObjRef:=SVG_New_rect(SVG_Ref_Week_A16; 0; 0; $_l_HrCol; $_l_Height; 0; 0; "black"; "white"; 0.2)
SVG_SET_ID($_t_ObjRef; "HrCol")
$_l_ObjectTop:=$_l_HrHeight-6
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
	
	SVG_New_textArea(SVG_t_Ref_Week; $_t_CellID; 0; $_l_ObjectTop; $_l_HrCol-4; 12; "Arial"; 10; Plain:K14:1; Align right:K42:4)
	$_l_ObjectTop:=$_l_ObjectTop+$_l_HrHeight
End for 
//}

// //  Draw the one week hourly grid
//{
$_l_ObjectTop:=0
For ($_l_Index; 0; 23)
	$_l_Col:=$_l_HrCol
	For ($_l_ItemOffset; 1; 7)
		If (($_l_Index<8) | ($_l_Index>17))
			Case of 
				: (CAL_ad_WeekDates{$_l_ItemOffset}=Cal4D_Cal_SelectedDate)
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Selected"); 0.2)
				: (CAL_ad_WeekDates{$_l_ItemOffset}=SD_ORDINtoDate(Cal_l_DateToday))
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; "beige"; 0.2)  //"rgb(220,223,233)"
				Else 
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; SVG_Color_grey(3); 0.2)
			End case 
		Else 
			Case of 
				: (CAL_ad_WeekDates{$_l_ItemOffset}=Cal4D_Cal_SelectedDate)
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Selected"); 0.2)
				: (CAL_ad_WeekDates{$_l_ItemOffset}=SD_ORDINtoDate(Cal_l_DateToday))
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Today"); 0.2)  //"rgb(232,236,246)"
				Else 
					$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop; $_l_ColWidth; $_l_HrHeight; 0; 0; "black"; "white"; 0.2)
			End case 
		End if 
		$_t_CellID:=String:C10(CAL_al_WeekOrdinals{$_l_ItemOffset})+"_"+String:C10($_l_Index; "00")
		SVG_SET_ID($_t_ObjRef; $_t_CellID)
		
		$_t_ObjRef:=SVG_New_line(SVG_t_Ref_Week; $_l_Col; $_l_ObjectTop+($_l_HrHeight/2); $_l_Col+$_l_ColWidth; $_l_ObjectTop+($_l_HrHeight/2); "black"; 0.1)
		SVG_SET_ID($_t_ObjRef; $_t_CellID+"_30min")
		$_l_Col:=$_l_Col+$_l_ColWidth
	End for 
	$_l_ObjectTop:=$_l_ObjectTop+$_l_HrHeight
End for 
//}

Cal4D_Cal_PopulateWeekEvents

CAL_ptr_BannerWeek->:=SVG_Export_to_picture(Cal_t_WeekRef)
CAL_ptr_4DCalendarWeek->:=SVG_Export_to_picture(SVG_t_Ref_Week)

//First save the svg file
//{
$_t_path:=Get 4D folder:C485(Database folder:K5:14)+"Cal4D.svg"
SVG_SAVE_AS_TEXT(Cal_t_WeekRef; $_t_path)
//}

//========================    Clean up and Exit    =================================

ARRAY TEXT:C222(SD2_at_WkEvtRefs; 0)
ARRAY TEXT:C222(SD2_at_WkEvtNames; 0)
ARRAY TEXT:C222(SD2_at_WkEvtTypes; 0)
SVG_ELEMENTS_TO_ARRAYS(SVG_t_Ref_Week; ->SD2_at_WkEvtRefs; ->SD2_at_WkEvtTypes; ->SD2_at_WkEvtNames)
ARRAY TEXT:C222(SD2_at_Types; 0)

ARRAY TEXT:C222(SD2_at_WKBnrRefs; 0)
ARRAY TEXT:C222(SD2_at_WkBnrNames; 0)
ARRAY TEXT:C222(SD2_at_WkBnrTypes; 0)
SVG_ELEMENTS_TO_ARRAYS(Cal_t_WeekRef; ->SD2_at_WkBnrRefs; ->SD2_at_WkBnrTypes; ->SD2_at_WKBnrNames)
ARRAY TEXT:C222(SD2_at_Types; 0)

For ($_l_Index; 1; Tmp_at_RefID)
	INSERT IN ARRAY:C227(SD2_at_WKBnrRefs; $_l_Index)
	INSERT IN ARRAY:C227(SD2_at_WKBnrNames; $_l_Index)
	SD2_at_WkBnrRefs{$_l_Index}:=Tmp_at_RefID{$_l_Index}
	SD2_at_WKBnrNames{$_l_Index}:=Tmp_at_Names{$_l_Index}
End for 
ERR_MethodTrackerReturn("Cal4D_Cal_GetWeekCalendar"; $_t_oldMethodName)