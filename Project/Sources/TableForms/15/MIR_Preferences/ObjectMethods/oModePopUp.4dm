If (False:C215)
	//object Name: [USER]MIR_Preferences.oModePopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>MIR_t_ScheduleMode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oModePopUp"; Form event code:C388)


<>MIR_t_ScheduleMode:=MIR_at_Mode{MIR_at_Mode}
MIR_MirrorPreferences("HandleModePopup")
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oModePopUp"; $_t_oldMethodName)