If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oGotSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:55
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oGotSearch"; Form event code:C388)
GOTO OBJECT:C206(*; "oSearchvalue")
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oGotSearch"; $_t_oldMethodName)