If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oMiniCalButtonNext
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2013 17:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_CalendarDisplayedDate; $_d_CalendarFromDate; $_d_CalendarToDate; CAL_D_CurrentViewDate)
	C_LONGINT:C283($_l_DayNumber; $_l_Dayof; $_l_event; $_l_Monthof)
	C_PICTURE:C286(SD2_pic_MonthMini)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oMiniCalButtonNext"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (CAL_D_CurrentViewDate=!00-00-00!)
			CAL_D_CurrentViewDate:=Current date:C33(*)
		End if 
		
		$_l_Monthof:=Month of:C24(CAL_D_CurrentViewDate)
		$_d_CalendarDisplayedDate:=CAL_D_CurrentViewDate
		Repeat 
			$_d_CalendarDisplayedDate:=$_d_CalendarDisplayedDate+5
		Until (Month of:C24($_d_CalendarDisplayedDate)#$_l_Monthof)
		$_l_Dayof:=Day of:C23($_d_CalendarDisplayedDate)
		If ($_l_Dayof>1)
			Repeat 
				$_d_CalendarDisplayedDate:=$_d_CalendarDisplayedDate-1
			Until (Day of:C23($_d_CalendarDisplayedDate)=1)
			
		End if 
		CAL_D_CurrentViewDate:=$_d_CalendarDisplayedDate
		$_d_CalendarFromDate:=CAL_D_CurrentViewDate
		$_l_Monthof:=Month of:C24(CAL_D_CurrentViewDate)
		If (Day of:C23($_d_CalendarFromDate)>1)
			$_l_DayNumber:=Day of:C23($_d_CalendarFromDate)-1
			$_d_CalendarFromDate:=$_d_CalendarFromDate-$_l_DayNumber
		End if 
		Repeat 
			$_d_CalendarFromDate:=$_d_CalendarFromDate-1
		Until (Month of:C24($_d_CalendarFromDate)#$_l_Monthof)
		$_d_CalendarFromDate:=$_d_CalendarFromDate+1
		$_d_CalendarToDate:=CAL_D_CurrentViewDate
		If (Day of:C23($_d_CalendarToDate)<28)
			$_l_DayNumber:=28-Day of:C23($_d_CalendarToDate)
			$_d_CalendarToDate:=$_d_CalendarToDate+$_l_DayNumber
		End if 
		Repeat 
			$_d_CalendarToDate:=$_d_CalendarToDate+1
		Until (Month of:C24($_d_CalendarToDate)#$_l_Monthof)
		$_d_CalendarToDate:=$_d_CalendarToDate-1
		Cal4D_Cal_GetMiniCalendar(->SD2_pic_MonthMini; CAL_D_CurrentViewDate; 0)
		ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oMiniCalButtonNext"; $_t_oldMethodName)
End case 
ERR_MethodTrackerReturn("OBJ [USER]SD2_ScheduleWindow.oMiniCalButtonNext"; $_t_oldMethodName)
