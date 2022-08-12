If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oMiniCalSelCurrent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2013 23:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_CalendarFromDate; $_d_CalendarToDate; CAL_D_CurrentViewDate; DB_d_SelectedDate)
	C_LONGINT:C283($_l_DifferenceDays; $_l_event; $_l_Monthof)
	C_PICTURE:C286(SD2_pic_MonthMini)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oMiniCalSelCurrent"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		CAL_D_CurrentViewDate:=Current date:C33(*)
		$_d_CalendarFromDate:=CAL_D_CurrentViewDate
		$_l_Monthof:=Month of:C24(CAL_D_CurrentViewDate)
		If (Day of:C23($_d_CalendarFromDate)>1)
			$_l_DifferenceDays:=Day of:C23($_d_CalendarFromDate)-1
			$_d_CalendarFromDate:=$_d_CalendarFromDate-$_l_DifferenceDays
		End if 
		Repeat 
			$_d_CalendarFromDate:=$_d_CalendarFromDate-1
		Until (Month of:C24($_d_CalendarFromDate)#$_l_Monthof)
		$_d_CalendarFromDate:=$_d_CalendarFromDate+1
		$_d_CalendarToDate:=CAL_D_CurrentViewDate
		If (Day of:C23($_d_CalendarToDate)<28)
			$_l_DifferenceDays:=28-Day of:C23($_d_CalendarToDate)
			$_d_CalendarToDate:=$_d_CalendarToDate+$_l_DifferenceDays
		End if 
		Repeat 
			$_d_CalendarToDate:=$_d_CalendarToDate+1
		Until (Month of:C24($_d_CalendarToDate)#$_l_Monthof)
		$_d_CalendarToDate:=$_d_CalendarToDate-1
		Cal4D_Cal_GetMiniCalendar(->SD2_pic_MonthMini; CAL_D_CurrentViewDate; 0)
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oMiniCalSelCurrent"; $_t_oldMethodName)
