//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetDateWidget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:30`Method: Cal4D_Cal_GetDateWidget
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY LONGINT:C221($_al_Days; 0)
	ARRAY LONGINT:C221($_al_Ordinals; 0)
	C_DATE:C307($_d_Date; $_d_DateOfFirst; $_d_Today; $2)
	C_LONGINT:C283($_l_Bottom; $_l_ColWidth; $_l_DateRow; $_l_DayHeight; $_l_Days; $_l_DayWidth; $_l_Height; $_l_Index; $_l_Month; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_Params; $_l_RowHeight; $_l_WeekIndex; $_l_WeekNo; $_l_Weeks; $_l_Width)
	C_POINTER:C301($_ptr_PictVar; $1)
	C_TEXT:C284($_t_CellID; $_t_DateString; $_t_Day_Cell_Ref; $_t_oldMethodName; $_t_Title; $_t_TitlesObj; CAL_t_HeaderObj; CAL_t_HeaderObject; SVG_t_XMLDateWigetRef; SVG_t_XMLFooterObj)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetDateWidget")

$_ptr_PictVar:=$1
$_d_Date:=$2
$_d_Today:=Current date:C33
$_l_Month:=Month of:C24($_d_Date)
Cal4D_Cal_SelectedDate($_d_Date)

////  Create three arrays, one with Ordinal dates for a Unique cell ID,
////  One for the day of the month, and
////  One for the dates displayed on the calendar, needed to ID those cell
////  that do not belong to the current month
//{
$_l_Weeks:=Cal4D_Cal_WeeksToDisplay($_d_Date)
If ($_l_Weeks<5)
	$_l_Weeks:=5
End if 
$_l_Days:=$_l_Weeks*7
ARRAY LONGINT:C221($_al_Ordinals; $_l_Days)
ARRAY LONGINT:C221($_al_Days; $_l_Days)
ARRAY DATE:C224($_ad_Dates; $_l_Days)
Cal4D_Cal_MonthOfDays($_d_Date; ->$_al_Ordinals; ->$_al_Days; ->$_ad_Dates)
//}

OBJECT GET COORDINATES:C663($_ptr_PictVar->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
$_l_Height:=$_l_Bottom-$_l_ObjectTop

////  Create the Date Widget
//{
If (SVG_t_XMLDateWigetRef#"")
	SVG_CLEAR(SVG_t_XMLDateWigetRef)
End if 
SVG_t_XMLDateWigetRef:=SVG_New($_l_Width; $_l_Height)

////  Set the viewbox to be var width minus 16 to allow for the scrollbar4
////  Height is 48 px for easy quarter hour math, 15 min equals 12 px.
//{
SVG_SET_VIEWBOX(SVG_t_XMLDateWigetRef; 0; 0; $_l_Width; $_l_Height; "xMinYMin")
//}

////  So that I can get a hairline
//{
$_l_DayWidth:=$_l_Width/8
$_l_DayHeight:=19
$_l_ObjectTop:=0
//}

//========================    Method Actions    ==================================

////  Draw the header containing Month, Year
//{
SVG_Define_linear_gradient(SVG_t_XMLDateWigetRef; "HeaderBG"; "rgb(211,211,211)"; "rgb(243,243,243)"; -90)
SVG_New_rect(SVG_t_XMLDateWigetRef; -2; $_l_ObjectTop; $_l_Width+2; 20; 0; 0; "white"; "url(#FooterBG)"; 0.5)

$_t_DateString:=DB_GetIndexedString(14001; Month of:C24(Cal4D_Cal_SelectedDate))+", "+String:C10(Year of:C25(Cal4D_Cal_SelectedDate))
CAL_t_HeaderObject:=SVG_New_textArea(SVG_t_XMLDateWigetRef; $_t_DateString; 0; 0; $_l_Width; 20; "lucdia grande, verdana"; 15; Plain:K14:1; Align center:K42:3)
SVG_SET_ID(CAL_t_HeaderObj; "HeaderText")
//}

////  Draw the Navbar
//{
$_l_ObjectTop:=20
$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
$_l_RowHeight:=20

$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_XMLDateWigetRef; 33; $_l_ObjectTop; $_l_Width-66; $_l_RowHeight; 0; 0; "white"; "white"; 0.1)
SVG_SET_ID($_t_Day_Cell_Ref; "Today")
SVG_New_textArea(SVG_t_XMLDateWigetRef; "Today"; 33; $_l_ObjectTop+2; $_l_Width-66; 18; "lucdia grande, verdana"; 13; Bold:K14:2; Align center:K42:3)

$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/Left_2.jp2"; 0; $_l_ObjectTop+4)
SVG_SET_ID($_t_Day_Cell_Ref; "Prev_Yr")
$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/Left_1.jp2"; 17; $_l_ObjectTop+4)
SVG_SET_ID($_t_Day_Cell_Ref; "Prev_Mo")

$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/Right_1.jp2"; $_l_Width-32; $_l_ObjectTop+4)
SVG_SET_ID($_t_Day_Cell_Ref; "Next_Mo")
$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/Right_2.jp2"; $_l_Width-16; $_l_ObjectTop+4)
SVG_SET_ID($_t_Day_Cell_Ref; "Next_Yr")

$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/DropArrow.jp2"; 0; $_l_ObjectTop+$_l_RowHeight-7)
SVG_SET_ID($_t_Day_Cell_Ref; "Prev_Yrs")
$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/DropArrow.jp2"; 17; $_l_ObjectTop+$_l_RowHeight-7)
SVG_SET_ID($_t_Day_Cell_Ref; "Prev_Mos")

$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/DropArrow.jp2"; $_l_Width-26; $_l_ObjectTop+$_l_RowHeight-7)
SVG_SET_ID($_t_Day_Cell_Ref; "Next_Mos")
$_t_Day_Cell_Ref:=SVG_New_image(SVG_t_XMLDateWigetRef; "#Images/DropArrow.jp2"; $_l_Width-8; $_l_ObjectTop+$_l_RowHeight-7)
SVG_SET_ID($_t_Day_Cell_Ref; "Next_Yrs")
//}

////  Draw the columns title bar
//{
$_l_ObjectTop:=40
$_l_ObjectLeft:=0
For ($_l_Index; 0; 7)
	Case of 
		: ($_l_Index=0)
			$_t_Title:="Wk"
		Else 
			$_t_Title:=DB_GetIndexedString(15002; $_l_Index)
	End case 
	
	$_t_CellID:="TitleCell_"+String:C10($_l_Index)
	$_t_TitlesObj:=SVG_New_rect(SVG_t_XMLDateWigetRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_WkNo"); 0.1)
	SVG_SET_ID($_t_TitlesObj; $_t_CellID)
	
	$_t_CellID:="TitleText_"+String:C10($_l_Index)
	$_t_TitlesObj:=SVG_New_text(SVG_t_XMLDateWigetRef; $_t_Title; $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+1; "lucdia grande, verdana"; 13; Plain:K14:1; Align center:K42:3)
	SVG_SET_ID($_t_TitlesObj; $_t_CellID)
	
	////  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
	//}
End for 
SVG_New_line(SVG_t_XMLDateWigetRef; 0; $_l_ObjectTop; $_l_Width; $_l_ObjectTop; "black"; 0.2)
SVG_New_line(SVG_t_XMLDateWigetRef; 0; $_l_ObjectTop+$_l_DayHeight; $_l_Width; $_l_ObjectTop+$_l_DayHeight; "black"; 0.2)
//}

$_l_DayHeight:=24
$_l_ObjectTop:=60

////  Draw the Week Numbers column
//{
$_l_Weeks:=Cal4D_Cal_WeeksToDisplay($_d_Date)
If ($_l_Weeks<5)
	$_l_Weeks:=5
End if 

$_d_DateOfFirst:=$_d_Date
If (Day of:C23($_d_DateOfFirst)#1)
	$_l_Index:=Day of:C23($_d_DateOfFirst)
	$_d_DateOfFirst:=Add to date:C393($_d_DateOfFirst; 0; 0; -($_l_Index-1))
End if 


$_l_ObjectLeft:=0
For ($_l_Index; 1; $_l_Weeks)
	$_l_WeekNo:=Cal_ISOWeekNumber($_d_DateOfFirst)
	$_d_DateOfFirst:=Add to date:C393($_d_DateOfFirst; 0; 0; 7)
	
	$_t_CellID:="WkNoCell_"+String:C10($_l_WeekNo)
	$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_XMLDateWigetRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_WkNo"); 0.1)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	$_t_CellID:="WkNoText_"+String:C10($_l_WeekNo)
	$_t_Day_Cell_Ref:=SVG_New_text(SVG_t_XMLDateWigetRef; String:C10($_l_WeekNo%100); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+3; "lucdia grande, verdana"; 13; Plain:K14:1; Align center:K42:3)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	////  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectTop:=$_l_ObjectTop+$_l_DayHeight
	//}
End for 
//}

////  Draw the calendar
//{
$_l_RowHeight:=$_l_DayHeight
$_l_ObjectTop:=60
$_l_DateRow:=0
For ($_l_WeekIndex; 1; $_l_Weeks)
	$_l_ObjectLeft:=$_l_DayWidth
	For ($_l_Index; 1; 7)
		////  Increment my arrays index
		//{
		$_l_DateRow:=$_l_DateRow+1
		//}
		
		////  Create day cell rectangle and assign it a unique ID
		//{
		Case of 
			: ($_ad_Dates{$_l_DateRow}=$_d_Today)
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DateRow})+"_Cell_Today"
				$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_XMLDateWigetRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_Today"); 0.1)
				
			: ($_l_Month=Month of:C24($_ad_Dates{$_l_DateRow}))
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DateRow})+"_Cell_Day"
				$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_XMLDateWigetRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Day"); 0.1)
				
			Else 
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DateRow})+"_Cell_Day"
				$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_XMLDateWigetRef; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Out_Day"); 0.1)
				
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		
		If ($_ad_Dates{$_l_DateRow}=$_d_Date)
			SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cell_BG_Selected)
		End if 
		//}
		
		////  Create the date text for the cell
		//{
		If ($_ad_Dates{$_l_DateRow}=$_d_Today)
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DateRow})+"_Text_Today"
			$_t_Day_Cell_Ref:=SVG_New_text(SVG_t_XMLDateWigetRef; String:C10($_al_Days{$_l_DateRow}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+4; "lucdia grande, verdana"; 13; Bold:K14:2; Align center:K42:3)
			SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
		Else 
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DateRow})+"_Text_Day"
			$_t_Day_Cell_Ref:=SVG_New_text(SVG_t_XMLDateWigetRef; String:C10($_al_Days{$_l_DateRow}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+4; "lucdia grande, verdana"; 13; Plain:K14:1; Align center:K42:3)
		End if 
		
		Case of 
			: (Month of:C24($_ad_Dates{$_l_DateRow})<$_l_Month)
				SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")  //"rgb(150,150,150)"
			: (Month of:C24($_ad_Dates{$_l_DateRow})>$_l_Month)
				SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		//}
		
		////  Adjust the X origin point for the next day cell
		//{
		$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
		//}
	End for 
	
	////  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectTop:=$_l_ObjectTop+$_l_RowHeight
	//}
End for 
//}

////  Draw the footer
//{
SVG_Define_linear_gradient(SVG_t_XMLDateWigetRef; "FooterBG"; "rgb(211,211,211)"; "rgb(243,243,243)"; -90)
SVG_New_rect(SVG_t_XMLDateWigetRef; -2; $_l_Height-20; $_l_Width+2; 20; 0; 0; "white"; "url(#FooterBG)"; 0.5)

$_t_DateString:=DB_GetIndexedString(15002; Day number:C114($_d_Date))+", "+Get indexed string:C510(14002; Month of:C24($_d_Date))+" "+String:C10(Day of:C23($_d_Date))
SVG_t_XMLFooterObj:=SVG_New_textArea(SVG_t_XMLDateWigetRef; $_t_DateString; 0; $_l_Height-18; $_l_Width; 18; "lucdia grande, verdana"; 13; Plain:K14:1; Align center:K42:3)
SVG_SET_ID(SVG_t_XMLFooterObj; "FooterText")

SVG_New_line(SVG_t_XMLDateWigetRef; 0; $_l_Height-20; $_l_Width; $_l_Height-20; "black"; 0.2)
//}

//========================    Clean up and Exit    =================================

////  Tranlate the SVG object to the Picture variable
//{
$_ptr_PictVar->:=SVG_Export_to_picture(SVG_t_XMLDateWigetRef)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_GetDateWidget"; $_t_oldMethodName)