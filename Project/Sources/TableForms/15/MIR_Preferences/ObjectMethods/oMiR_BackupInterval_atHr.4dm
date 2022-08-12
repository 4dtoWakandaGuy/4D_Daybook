If (False:C215)
	//object Name: [USER]MIR_Preferences.oMiR_BackupInterval_atHr
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
	//Array TEXT(MIR_at_BackupMin;0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>MIR_ti_BackupTimeInterval)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMiR_BackupInterval_atHr"; Form event code:C388)

MIR_at_BackupMin:=1  // When minipulaing the hours reset the minutes to 0
<>MIR_ti_BackupTimeInterval:=Time:C179(Mir_at_BackupHr{MIR_at_BackupHr}+":"+MIR_at_BackupMin{MIR_at_BackupMin}+":00")
MIR_MirrorPreferences("ValidateBackupScheduling")
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMiR_BackupInterval_atHr"; $_t_oldMethodName)