If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_Time_atHr
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
	//Array TEXT(MIR_at_TimeMin;0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>MIR_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_Time_atHr"; Form event code:C388)



MIR_at_TimeMin:=1  // When minipulating the hours reset the minutes to 0
<>MIR_ti_Time:=Time:C179(MIR_at_TimeHr{MIR_at_TimeHr}+":"+MIR_at_TimeMin{MIR_at_TimeMin}+":00")
If (MIR_at_BackupMode#1)
	MIR_MirrorPreferences("ValidateBackupScheduling")
End if 

//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_Time_atHr"; $_t_oldMethodName)