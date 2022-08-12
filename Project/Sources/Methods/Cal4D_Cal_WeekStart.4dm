//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_WeekStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_WindowReference)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; Cal_pic_MainWeek; Cal_pic_MiniMonth2; CAL_pic_MiniMonth3; CAL_pic_weekBanner)
	C_POINTER:C301(Cal_ptr_MiniCalender1)
	C_TEXT:C284(<>CAL_t_CalWeekStart; $_t_MethodName; $_t_oldMethodName; $_t_WeekStart; $_t_Zone; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_WeekStart")

If (Count parameters:C259=1)
	$_t_WeekStart:=$1
	
	$_l_WindowReference:=Open form window:C675("Cal4D_Cal_WeekStart_d"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("Cal4D_Cal_WeekStart_d")
	CLOSE WINDOW:C154($_l_WindowReference)
	
	//========================    Method Actions    ==================================
	
	If (OK=1)
		<>CAL_t_CalWeekStart:=Substring:C12(Cal_at_1stDayOfWeek{Cal_at_1stDayOfWeek}; 1; 3)
		Cal_t_1stDayOfWeek:=<>CAL_t_CalWeekStart
		Cal4D_WeekStart_SaveToDisk(Cal4D_User_Name)
		
		
		Cal4D_UpdateEvents
		Cal4D_Cal_GetMiniCalendar(Cal_ptr_MiniCalender1; Cal_D_TopMiniDate; 0)  //->Mini_Month_1_G
		Cal4D_Cal_GetMiniCalendar(->Cal_pic_MiniMonth2; Cal_D_TopMiniDate; 1)
		Cal4D_Cal_GetMiniCalendar(->CAL_pic_MiniMonth3; Cal_D_TopMiniDate; 2)
		
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
	End if 
	
	//========================    Clean up and Exit    =================================
	
Else 
	
	// //  If this is set after startup it will not actually read the XLIFF file
	//{
	//$_t_WeekStart:=Get indexed string(32000;1)
	//}
	
	$0:=<>CAL_t_CalWeekStart
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_WeekStart"; $_t_oldMethodName)