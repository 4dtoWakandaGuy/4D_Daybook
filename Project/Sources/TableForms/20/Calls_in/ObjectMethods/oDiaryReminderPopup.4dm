If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oDiaryReminderPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SC_at_TimeFrame;0)
	C_TEXT:C284($_t_oldMethodName; SC_t_TimeFrame)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oDiaryReminderPopup"; Form event code:C388)
If (SC_at_TimeFrame>0)
	SC_t_TimeFrame:=SC_at_TimeFrame{SC_at_TimeFrame}
	SD_Updatereminder
	
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oDiaryReminderPopup"; $_t_oldMethodName)
