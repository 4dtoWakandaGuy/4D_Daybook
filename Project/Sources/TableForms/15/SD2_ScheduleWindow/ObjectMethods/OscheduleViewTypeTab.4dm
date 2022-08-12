If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.OscheduleViewTypeTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 10:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.OscheduleViewTypeTab"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//SD_at_AvailableViews{1}:="Day"
		//SD_at_AvailableViews{2}:="Week"
		//SD_at_AvailableViews{3}:="Month"
		//SD_at_AvailableViews{4}:="Year"
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.OscheduleViewTypeTab"; $_t_oldMethodName)
