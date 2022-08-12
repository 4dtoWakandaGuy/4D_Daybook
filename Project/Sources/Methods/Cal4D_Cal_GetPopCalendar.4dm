//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetPopCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:48`Method: Cal4D_Cal_GetPopCalendar
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
	C_DATE:C307($_d_Date; $_d_Today; $2)
	C_LONGINT:C283($_l_DatesRow; $_l_DayHeight; $_l_DayIndex; $_l_Days; $_l_DayWidth; $_l_Month; $_l_ObjectLeft; $_l_ObjectTop; $_l_Params; $_l_RowHeight; $_l_WeekIndex)
	C_LONGINT:C283($_l_Weeks)
	C_POINTER:C301($_ptr_PictVar; $1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_oldMethodName; Cal4D_t_PopCalSVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetPopCalendar")

$_ptr_PictVar:=$1
$_d_Date:=$2
$_d_Today:=Current date:C33
$_l_Month:=Month of:C24($_d_Date)

////  So that I can get a hairline
//{
$_l_DayWidth:=26  ////  25.4 is mm per inch
$_l_DayHeight:=13  ////  25.4 is mm per inch
$_l_ObjectTop:=0
//}

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

////  Create the month object
//{
If (Cal4D_t_PopCalSVGref#"")
	SVG_CLEAR(Cal4D_t_PopCalSVGref)
End if 
Cal4D_t_PopCalSVGref:=SVG_New
//}

////  So that I can get a hairline
//{
$_l_DayWidth:=24*25.4  ////  25.4 is mm per inch
$_l_DayHeight:=24*25.4  ////  25.4 is mm per inch
$_l_ObjectTop:=0  //*25.4
SVG_SET_DIMENSIONS(Cal4D_t_PopCalSVGref; -1; -1; "mm")
//}

//========================    Method Actions    ==================================

$_l_RowHeight:=$_l_DayHeight
$_l_DatesRow:=0
For ($_l_WeekIndex; 1; $_l_Weeks)
	$_l_ObjectLeft:=0
	For ($_l_DayIndex; 1; 7)
		////  Increment my arrays index
		//{
		$_l_DatesRow:=$_l_DatesRow+1
		//}
		
		////  Create day cell rectangle and assign it a unique ID
		//{
		Case of 
			: ($_ad_Dates{$_l_DatesRow}=$_d_Date)
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DatesRow})+"_Cell_Today"
				$_t_Day_Cell_Ref:=SVG_New_rect(Cal4D_t_PopCalSVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_Today"); 2)
				
			: (Month of:C24($_d_Date)=Month of:C24($_ad_Dates{$_l_DatesRow}))
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DatesRow})+"_Cell_Day"
				$_t_Day_Cell_Ref:=SVG_New_rect(Cal4D_t_PopCalSVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Main_Day"); 2)
				
			Else 
				$_t_CellID:=String:C10($_al_Ordinals{$_l_DatesRow})+"_Cell_Day"
				$_t_Day_Cell_Ref:=SVG_New_rect(Cal4D_t_PopCalSVGref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Out_Day"); 2)
				
		End case 
		
		SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
		//}
		
		////  Create the date text for the cell
		//{
		If ($_ad_Dates{$_l_DatesRow}=$_d_Date)
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DatesRow})+"_Text_Today"
			$_t_Day_Cell_Ref:=SVG_New_text(Cal4D_t_PopCalSVGref; String:C10($_al_Days{$_l_DatesRow}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 280; Bold:K14:2; Align center:K42:3)
			SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")
		Else 
			$_t_CellID:=String:C10($_al_Ordinals{$_l_DatesRow})+"_Text_Day"
			$_t_Day_Cell_Ref:=SVG_New_text(Cal4D_t_PopCalSVGref; String:C10($_al_Days{$_l_DatesRow}); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 280; Plain:K14:1; Align center:K42:3)
		End if 
		
		Case of 
			: (Month of:C24($_ad_Dates{$_l_DatesRow})<$_l_Month)
				SVG_SET_FONT_COLOR($_t_Day_Cell_Ref; "white")  //"rgb(150,150,150)"
			: (Month of:C24($_ad_Dates{$_l_DatesRow})>$_l_Month)
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

//========================    Clean up and Exit    =================================

////  Tranlate the SVG object to the Picture variable
//{
$_ptr_PictVar->:=SVG_Export_to_picture(Cal4D_t_PopCalSVGref)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_GetPopCalendar"; $_t_oldMethodName)