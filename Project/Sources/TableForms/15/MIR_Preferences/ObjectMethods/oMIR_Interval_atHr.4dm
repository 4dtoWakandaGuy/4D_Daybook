If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_Interval_atHr
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
	//Array TEXT(MIR_at_BackupMode;0)
	//Array TEXT(MIR_at_Min;0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>MiR_ti_TimeInterval)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_Interval_atHr"; Form event code:C388)


MIR_at_Min:=1  // When minipulating the hours reset the minutes to 0
<>MiR_ti_TimeInterval:=Time:C179(MIR_at_Hr{MIR_at_Hr}+":"+MIR_at_Min{MIR_at_Min}+":00")
If (MIR_at_BackupMode#1)
	MIR_MirrorPreferences("ValidateBackupScheduling")
End if 
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_Interval_atHr"; $_t_oldMethodName)