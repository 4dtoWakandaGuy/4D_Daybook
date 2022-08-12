If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oFilterStatusPOP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	C_REAL:C285(SD2_at_StatusNM)
	C_TEXT:C284($_t_oldMethodName; SD2_t_StatusFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oFilterStatusPOP"; Form event code:C388)
If (SD2_at_StatusNM>0)
	SD2_t_StatusFIlter:=SD_at_StatusCodes{SD2_at_StatusNM}
	SD2_at_StatusNM:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oFilterStatusPOP"; $_t_oldMethodName)
