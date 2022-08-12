If (False:C215)
	//Table Form Method Name: [USER]CW_CalenderDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CW_CalenderDialog"; Form event code:C388)
//Form Method:  CalendarWindow
//Sets up calendar on loading the dialog
OpenHelp(Table:C252(->[USER:15]); "CW_CalenderDialog")
//Created:  3/11/98 - Pelican Software Incorporated

If (Form event code:C388=On Load:K2:1)
	CW_SetCalendar
	INT_SetDialog
End if 
ERR_MethodTrackerReturn("FM [USER].CW_CalenderDialog"; $_t_oldMethodName)
