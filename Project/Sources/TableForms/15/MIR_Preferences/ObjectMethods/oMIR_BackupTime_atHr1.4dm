If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_BackupTime_atHr1
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
	//Array TEXT(MIR_at_BackupTimeMin;0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>MIR_ti_BackupTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_BackupTime_atHr1"; Form event code:C388)


MIR_at_BackupTimeMin:=1  // When minipulating the hours reset the minutes to 0
<>MIR_ti_BackupTime:=Time:C179(MIR_at_BackupTimeHr{MIR_at_BackupTimeHr}+":"+MIR_at_BackupTimeMin{MIR_at_BackupTimeMin}+":00")
MIR_MirrorPreferences("ValidateBackupScheduling")

//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_BackupTime_atHr1"; $_t_oldMethodName)