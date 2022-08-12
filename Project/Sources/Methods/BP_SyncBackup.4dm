//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_SyncBackup
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
	C_BOOLEAN:C305(<>SYS_bo_DelayedCopyofBackup; $_bo_Backup)
	C_DATE:C307($_d_BackupDate; BP_d_BackupDate)
	C_LONGINT:C283($_l_BackupTimeHour; $_l_BackupTimeMinute; $_l_CurrentTimeHour; $_l_CurrentTimeMinute; $_l_DifferenceHours; $_l_DifferenceMinutes; BP_lastAlerttimestamp)
	C_TEXT:C284($_t_oldMethodName; BP_t_BackupFrequency)
	C_TIME:C306($_ti_CurrentTime; BP_ti_BackupTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_SyncBackup")

$_ti_CurrentTime:=Current time:C178
$_d_BackupDate:=BP_d_BackupDate
BackgrounderSetDelay

If ($_d_BackupDate<=Current date:C33)  //BSW 21/01/03 Backup sync midnight process
	
	$_l_CurrentTimeHour:=($_ti_CurrentTime\3600)  //Current Hour
	$_l_BackupTimeHour:=(BP_ti_BackupTime\3600)  //Backup Hour
	$_l_CurrentTimeMinute:=(($_ti_CurrentTime\60)%60)  //Current Min
	$_l_BackupTimeMinute:=((BP_ti_BackupTime\60)%60)  //Backup Min
	$_l_DifferenceHours:=Abs:C99($_l_CurrentTimeHour-$_l_BackupTimeHour)
	$_l_DifferenceMinutes:=Abs:C99($_l_CurrentTimeMinute-$_l_BackupTimeMinute)
	
	Case of 
		: ($_l_DifferenceHours=1)  //Delay less 2 mins
			BackgrounderSetDelay(60*60*2)
		: ($_l_DifferenceMinutes<=10)  //Delay even less 30 seconds
			BackgrounderSetDelay(60*60)
	End case 
	
	$_bo_Backup:=(($_l_CurrentTimeHour=$_l_BackupTimeHour) & ($_l_CurrentTimeMinute>=$_l_BackupTimeMinute))
	
	If ($_bo_Backup)
		
		BP_LoadPrefs  //Get present backup var values for backup as well as re-saving
		BP_CopyDocuments  //Sync backup
		<>SYS_bo_DelayedCopyofBackup:=False:C215
		
		Case of 
			: (BP_t_BackupFrequency="Every Week")
				BP_d_BackupDate:=Current date:C33+7
			: (BP_t_BackupFrequency="Every Month")
				BP_d_BackupDate:=Current date:C33+30
			Else 
				BP_d_BackupDate:=Current date:C33+1
		End case 
		//save updated backup var values for next backup****
		BP_SavePrefs  //****otherwise backup is going to repeat again again and slow down the server
		
	End if 
	
End if 
ERR_MethodTrackerReturn("BP_SyncBackup"; $_t_oldMethodName)
