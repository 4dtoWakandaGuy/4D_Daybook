If (False:C215)
	//object Name: [USER]MIR_Preferences.Popup Drop down List3
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
	C_TEXT:C284(<>MIR_t_BackupScheduleMode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.Popup Drop down List3"; Form event code:C388)


<>MIR_t_BackupScheduleMode:=MIR_at_BackupMode{MIR_at_BackupMode}
MIR_MirrorPreferences("HandleBackupModePopup")
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.Popup Drop down List3"; $_t_oldMethodName)