//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_UpdateBackupSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BP_at_Frequency;0)
	C_BOOLEAN:C305($_bo_CanChangeSettings)
	C_DATE:C307(BP_d_BackupDate; BP_d_FormBackupDate)
	C_TEXT:C284($_t_oldMethodName; $_t_SelectedFrequency; BP_t_BackupFrequency)
	C_TIME:C306(BP_ti_BackupTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_UpdateBackupSettings")
$_bo_CanChangeSettings:=BP_IsUserAuthorized

If ($_bo_CanChangeSettings)
	
	If (BP_d_FormBackupDate=!00-00-00!)  //First time setting up propably
		BP_d_FormBackupDate:=Current date:C33
	End if 
	
	$_t_SelectedFrequency:=BP_at_Frequency{BP_at_Frequency}
	
	If (BP_t_BackupFrequency#$_t_SelectedFrequency)
		
		BP_t_BackupFrequency:=$_t_SelectedFrequency
		
		Case of 
			: (BP_t_BackupFrequency="Every Day")
				If (Current time:C178>BP_ti_BackupTime)
					BP_d_FormBackupDate:=Current date:C33+1
				Else 
					BP_d_FormBackupDate:=Current date:C33
				End if 
			: (BP_t_BackupFrequency="Every Week")
				BP_d_FormBackupDate:=Current date:C33+7
			: (BP_t_BackupFrequency="Every Month")
				BP_d_FormBackupDate:=Current date:C33+30
		End case 
		
		If (BP_d_FormBackupDate>=Current date:C33)
			BP_d_BackupDate:=BP_d_FormBackupDate
		Else 
			BP_d_FormBackupDate:=BP_d_BackupDate
			Gen_Alert("Invalid Date!")
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("BP_UpdateBackupSettings"; $_t_oldMethodName)
