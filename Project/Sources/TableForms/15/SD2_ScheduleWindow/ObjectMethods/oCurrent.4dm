If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ScheduleWindow.oCurrent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 08:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_AvailableViews;0)
	//ARRAY TEXT(SD_at_NavTabs;0)
	C_DATE:C307($_d_CurrentlyDisplayedDate; DB_d_SelectedDate; SD2_d_CurrentDate)
	C_LONGINT:C283($_l_event)
	C_PICTURE:C286(CAL_pic_MainMonth)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oCurrent"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		$_d_CurrentlyDisplayedDate:=DB_d_SelectedDate
		Case of 
			: (SD_at_AvailableViews=1)  //Day
			: (SD_at_AvailableViews=2)  //Week
				
			: (SD_at_AvailableViews=3)  //MOnth
				$_d_CurrentlyDisplayedDate:=Current date:C33(*)
				
				
				Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth; $_d_CurrentlyDisplayedDate)
				
			: (SD_at_AvailableViews=4)  //Year
		End case 
		SD_at_NavTabs:=2
		SD2_d_CurrentDate:=Cal4D_Cal_SelectedDate
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oCurrent"; $_t_oldMethodName)
