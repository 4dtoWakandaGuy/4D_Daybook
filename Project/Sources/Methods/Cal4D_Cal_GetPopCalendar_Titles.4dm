//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetPopCalendar_Titles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:50`Method: Cal4D_Cal_GetPopCalendar_Titles
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DayHeight; $_l_Days; $_l_DayWidth; $_l_Index; $_l_Month; $_l_ObjectLeft; $_l_ObjectTop; $_l_Params; $_l_RowHeight; $_l_WeekNo; $_l_Weeks)
	C_POINTER:C301($_ptr_PictVar; $1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_oldMethodName; $_t_Title; SVG_t_WkTitles_Ref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetPopCalendar_Titles")


$_ptr_PictVar:=$1

////  Create the Titles object
//{
If (SVG_t_WkTitles_Ref#"")
	SVG_CLEAR(SVG_t_WkTitles_Ref)
End if 
SVG_t_WkTitles_Ref:=SVG_New
//}

////  So that I can get a hairline
//{
$_l_DayWidth:=24*25.4  ////  25.4 is mm per inch
$_l_DayHeight:=18*25.4  ////  25.4 is mm per inch
$_l_ObjectTop:=0  //34*25.4
SVG_SET_DIMENSIONS(SVG_t_WkTitles_Ref; -1; -1; "mm")
//}

//========================    Method Actions    ==================================

$_l_ObjectLeft:=0
For ($_l_Index; 0; 7)
	Case of 
		: ($_l_Index=0)
			$_t_Title:="Wk"
		Else 
			$_t_Title:=DB_GetIndexedString(15002; $_l_Index)
	End case 
	
	$_t_CellID:="TitleCell_"+String:C10($_l_Index)
	$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_WkTitles_Ref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_WkNo"); 2)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	$_t_CellID:="TitleText_"+String:C10($_l_Index)
	$_t_Day_Cell_Ref:=SVG_New_text(SVG_t_WkTitles_Ref; $_t_Title; $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+50; "verdana"; 220; Plain:K14:1; Align center:K42:3)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	////  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_DayWidth
	//}
End for 

//========================    Clean up and Exit    =================================

////  Tranlate the SVG object to the Picture variable
//{
$_ptr_PictVar->:=SVG_Export_to_picture(SVG_t_WkTitles_Ref)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_GetPopCalendar_Titles"; $_t_oldMethodName)