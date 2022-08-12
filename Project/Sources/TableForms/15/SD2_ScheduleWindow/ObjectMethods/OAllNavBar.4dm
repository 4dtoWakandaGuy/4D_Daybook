If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ScheduleWindow.OAllNavBar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2013 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_AvailableViews;0)
	//ARRAY TEXT(SD_at_NavTabs;0)
	C_DATE:C307($_d_CurrentlyDisplayedDate; SD2_d_CurrentDate)
	C_LONGINT:C283($_l_Dayof; $_l_event; $_l_Monthof)
	C_PICTURE:C286(CAL_pic_MainMonth)
	C_TEXT:C284($_t_oldMethodName; SD_t_AvailableView4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.OAllNavBar"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD_at_NavTabs=3)  //advance and reset-remember to leave 2 as current month/Day/Year
				Case of 
					: (SD_at_AvailableViews=1)  //Day
					: (SD_at_AvailableViews=2)  //Week
						
					: (SD_at_AvailableViews=3)  //MOnth
						$_d_CurrentlyDisplayedDate:=Cal4D_Cal_SelectedDate
						$_l_Monthof:=Month of:C24($_d_CurrentlyDisplayedDate)
						Repeat 
							$_d_CurrentlyDisplayedDate:=$_d_CurrentlyDisplayedDate+5
						Until (Month of:C24($_d_CurrentlyDisplayedDate)#$_l_Monthof)
						$_l_Dayof:=Day of:C23($_d_CurrentlyDisplayedDate)
						If ($_l_Dayof>1)
							Repeat 
								$_d_CurrentlyDisplayedDate:=$_d_CurrentlyDisplayedDate-1
							Until (Day of:C23($_d_CurrentlyDisplayedDate)=1)
							
						End if 
						Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth; $_d_CurrentlyDisplayedDate)
						
					: (SD_at_AvailableViews=4)  //Year
				End case 
				SD_at_NavTabs:=2
			: (SD_at_NavTabs=1)  //advance and reset-remember to leave 2 as current month/Day/Year
				Case of 
					: (SD_at_AvailableViews=1)  //Day
					: (SD_at_AvailableViews=2)  //Week
						
					: (SD_at_AvailableViews=3)  //MOnth
						$_d_CurrentlyDisplayedDate:=Cal4D_Cal_SelectedDate
						$_l_Monthof:=Month of:C24($_d_CurrentlyDisplayedDate)
						Repeat 
							$_d_CurrentlyDisplayedDate:=$_d_CurrentlyDisplayedDate-5
						Until (Month of:C24($_d_CurrentlyDisplayedDate)#$_l_Monthof)
						$_l_Dayof:=Day of:C23($_d_CurrentlyDisplayedDate)
						If ($_l_Dayof>1)
							Repeat 
								$_d_CurrentlyDisplayedDate:=$_d_CurrentlyDisplayedDate-1
							Until (Day of:C23($_d_CurrentlyDisplayedDate)=1)
							
						End if 
						Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth; $_d_CurrentlyDisplayedDate)
						
					: (SD_at_AvailableViews=4)  //Year
				End case 
				SD_at_NavTabs:=2
				
			: (SD_at_NavTabs=2)  //goto current month/date/year
				Case of 
					: (SD_at_AvailableViews=1)  //Day
					: (SD_at_AvailableViews=2)  //Week
						
					: (SD_at_AvailableViews=3)  //MOnth
						$_d_CurrentlyDisplayedDate:=Current date:C33(*)
						
						
						Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth; $_d_CurrentlyDisplayedDate)
						
					: (SD_at_AvailableViews=4)  //Year
				End case 
				SD_at_NavTabs:=2
				
				
		End case 
		SD2_d_CurrentDate:=Cal4D_Cal_SelectedDate
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.OAllNavBar"; $_t_oldMethodName)
