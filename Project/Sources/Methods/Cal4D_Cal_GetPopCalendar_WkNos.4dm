//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetPopCalendar_WkNos
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:51`Method: Cal4D_Cal_GetPopCalendar_WkNos
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $2)
	C_LONGINT:C283($_l_DayHeight; $_l_Days; $_l_DayWidth; $_l_Index; $_l_Month; $_l_ObjectLeft; $_l_ObjectTop; $_l_Params; $_l_RowHeight; $_l_WeekNo; $_l_Weeks)
	C_POINTER:C301($_ptr_PictVar; $1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_oldMethodName; SVG_t_WkNos_Ref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetPopCalendar_WkNos")

$_ptr_PictVar:=$1
$_d_Date:=$2
$_l_Month:=Month of:C24($_d_Date)
////  Create the Week Number object
//{
If (SVG_t_WkNos_Ref#"")
	SVG_CLEAR(SVG_t_WkNos_Ref)
End if 
SVG_t_WkNos_Ref:=SVG_New
//}

////  So that I can get a hairline
//{
$_l_DayWidth:=24*25.4  ////  25.4 is mm per inch
$_l_DayHeight:=24*25.4  ////  25.4 is mm per inch
$_l_ObjectTop:=0  //34*25.4
SVG_SET_DIMENSIONS(SVG_t_WkNos_Ref; -1; -1; "mm")
//}

$_l_Weeks:=Cal4D_Cal_WeeksToDisplay($_d_Date)
If ($_l_Weeks<5)
	$_l_Weeks:=5
End if 

If (Day of:C23($_d_Date)#1)
	$_d_Date:=Add to date:C393($_d_Date; 0; 0; -(Day of:C23($_d_Date)-1))
End if 

//========================    Method Actions    ==================================


$_l_ObjectLeft:=0
For ($_l_Index; 1; $_l_Weeks)
	$_l_WeekNo:=Cal_ISOWeekNumber($_d_Date)
	$_d_Date:=Add to date:C393($_d_Date; 0; 0; 7)
	
	$_t_CellID:="WkNoCell_"+String:C10($_l_WeekNo)
	$_t_Day_Cell_Ref:=SVG_New_rect(SVG_t_WkNos_Ref; $_l_ObjectLeft; $_l_ObjectTop; $_l_DayWidth; $_l_DayHeight; 0; 0; "black"; Cal4D_Cal_Cell_BG("Pop_WkNo"); 2)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	$_t_CellID:="WkNoText_"+String:C10($_l_WeekNo)
	$_t_Day_Cell_Ref:=SVG_New_text(SVG_t_WkNos_Ref; String:C10($_l_WeekNo%100); $_l_ObjectLeft+($_l_DayWidth/2); $_l_ObjectTop+100; "verdana"; 280; Plain:K14:1; Align center:K42:3)
	SVG_SET_ID($_t_Day_Cell_Ref; $_t_CellID)
	
	
	////  Adjust the Y origin point for the next row of day cells
	//{
	$_l_ObjectTop:=$_l_ObjectTop+$_l_DayHeight
	//}
End for 

//========================    Clean up and Exit    =================================

////  Tranlate the SVG object to the Picture variable
//{
$_ptr_PictVar->:=SVG_Export_to_picture(SVG_t_WkNos_Ref)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_GetPopCalendar_WkNos"; $_t_oldMethodName)