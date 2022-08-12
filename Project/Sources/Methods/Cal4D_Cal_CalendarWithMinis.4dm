//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_CalendarWithMinis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:54`Method: Cal4D_Cal_CalendarWithMinis
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	//ARRAY LONGINT(Cal_al_RowFontColor;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	C_DATE:C307(Cal_D_TopMiniDate; Cal4D_d_Date)
	C_LONGINT:C283(<>CAL_l_CalendarWindowRef; $_l_Index; $_l_RecordsinSelection; Cal_l_DateToday; Cal_l_DayBnrHeight; Cal_l_SelectedDate; Cal_l_WeekBnrHeight; RB_No; RB_Yes)
	C_PICTURE:C286(Cal_pi_MiniBanner1; Cal_pic_MainWeek; CAL_pic_MiniBanner2; CAL_pic_MiniBanner3; Cal_pic_MiniCols1; CAL_pic_MiniCols2; CAL_pic_MiniCols3; Cal_pic_MiniMonth1; Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; Cal_pic_Month)
	C_PICTURE:C286(Cal_pic_MonthBanner)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupTable; Cal_ptr_MiniCalender1)
	C_TEXT:C284(<>Cal_t_CurrentUserName; <>CAL_t_FullAndMinisProcName; $_t_ErrorMethod; $_t_oldMethodName; Cal_t_BannerRef1; Cal_t_BannerRef2; Cal_t_BannerRef3; Cal_t_SelectedCellRef; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID; Cal_t_SelectedMiniCellRef)
	C_TEXT:C284(CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_CalendarWithMinis")

If (Application type:C494#4D Server:K5:6)  // This shouldn't be called from 4D Server.
	
	//========================    Method Actions    ==================================
	
	// // Modified by: Charles Vass (02/26/2009, 18:33)
	// // Moving to a process self start method
	// //
	//If (Shell_SelfStart($_t_MethodName;Current method name))
	Cal4D_Init
	
	<>CAL_t_FullAndMinisProcName:=Current method name:C684
	
	BRING TO FRONT:C326(Current process:C322)
	READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.
	
	ARRAY BOOLEAN:C223(Cal_lb_ListboxCalender; 0)
	ARRAY TEXT:C222(Cal_at_Calendar; 0)
	ARRAY LONGINT:C221(Cal_al_RowFontColor; 0)
	ARRAY LONGINT:C221(Cal_al_GroupID; 0)
	
	
	Cal_l_WeekBnrHeight:=0
	Cal_l_DayBnrHeight:=0
	Cal_pic_Month:=Cal_pic_Month*0
	Cal_pic_MiniMonth1:=Cal_pic_MiniMonth1*0
	Cal_pic_MiniMonth2:=Cal_pic_MiniMonth2*0
	CAL_pic_MiniMonth3:=CAL_pic_MiniMonth3*0
	Cal_ptr_MiniCalender1:=(->Cal_pic_MiniMonth1)
	
	Cal_t_BannerRef1:=""
	Cal_t_BannerRef2:=""
	Cal_t_BannerRef3:=""
	
	CAL_t_SVGref:=""
	Cal_t_SVGRefMini1:=""
	Cal_t_SVGRefMini2:=""
	Cal_t_SVGRefMini3:=""
	
	Cal_t_SelectedCellRef:=""
	Cal_t_SelectedMiniCellRef:=""
	
	Cal4D_Cal_ClearSelectedEvent
	
	Cal4D_d_Date:=Current date:C33
	Cal_D_TopMiniDate:=Cal4D_d_Date
	
	Cal_l_DateToday:=Cal4D_Cal_DateToOrdinal(Cal4D_d_Date)
	Cal_l_SelectedDate:=-1
	
	$_l_RecordsinSelection:=Cal4D_Cal_GetUserCalendars(<>Cal_t_CurrentUserName)
	ARRAY BOOLEAN:C223(Cal_lb_ListboxCalender; $_l_RecordsinSelection)
	ARRAY TEXT:C222(Cal_at_Calendar; $_l_RecordsinSelection)
	ARRAY LONGINT:C221(Cal_al_RowFontColor; $_l_RecordsinSelection)
	ARRAY LONGINT:C221(Cal_al_GroupID; $_l_RecordsinSelection)
	
	Cal4D_Cal_GetEventsForOneDay(!00-00-00!)
	
	$_l_RecordsinSelection:=Records in selection:C76(<>Cal_ptr_GroupTable->)
	For ($_l_Index; 1; $_l_RecordsinSelection)  //NG why can this not be selection to array and just set Cal_lb_ListboxCalender to true for all?
		GOTO SELECTED RECORD:C245(<>Cal_ptr_GroupTable->; $_l_Index)
		Cal_lb_ListboxCalender{$_l_Index}:=True:C214
		Cal_at_Calendar{$_l_Index}:=<>Cal_ptr_GroupFld_Name->
		Cal_al_RowFontColor{$_l_Index}:=<>Cal_ptr_GroupFld_Colour->
		Cal_al_GroupID{$_l_Index}:=<>Cal_ptr_GroupFld_ID->
	End for 
	UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
	
	Cal4D_Cal_GetTimezoneProcVars
	Cal4D_Cal_SelectedDate(Current date:C33)
	
	$_t_ErrorMethod:=SVG_Set_error_handler("SVG_ErrorHandler")
	
	//Cal4D_MenuBar   ` Update the menu bar.
	
	<>CAL_l_CalendarWindowRef:=Open form window:C675("Cal4D_Cal_CalendarWithMinis_d"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("Cal4D_Cal_CalendarWithMinis_d")
	CLOSE WINDOW:C154(<>CAL_l_CalendarWindowRef)
	
	<>CAL_l_CalendarWindowRef:=0
	
	// // Modified by: Charles Vass (02/26/2009, 18:34)
	//$processNumber_i:=New Process("Cal4D_Cal_Calendar2";◊Cal4D_StackSize_i;"Cal4D_Calendar";*)
	//BRING TO FRONT($processNumber_i)
	
	SVG_Set_error_handler
	//End if
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_CalendarWithMinis"; $_t_oldMethodName)