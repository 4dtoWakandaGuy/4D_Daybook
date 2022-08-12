//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_LoadPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CanRecreate; $_bo_FailureToLoad; SYS_bo_BackupEnabled)
	C_DATE:C307(BP_d_BackupDate; BP_d_FormBackupDate)
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_Retries; BP_but_EnableBackupSync; BP_l_DeleteArchives; BP_l_NumOfFile; BP_l_onlydoafterpecifiedTime)
	C_TEXT:C284($_t_oldMethodName; BP_t_BackupAdminEmail; BP_t_BackupFrequency; BP_t_LocalBackupPath; BP_t_RemoteBackupPath)
	C_TIME:C306(BP_ti_BackupTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("BP_LoadPrefs")

//this method load the prefs for a BACKUP SYNC

$_l_Retries:=0
While (Semaphore:C143("EditSynchro"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Backup Synchronization")
If ($_l_ItemID>0)
	SYS_bo_BackupEnabled:=False:C215
	
	
	
	
	
	$_bo_CanRecreate:=((Current user:C182="Designer") | (Current user:C182="Administrator"))
	
	If (($_bo_CanRecreate) & (Shift down:C543) & (False:C215))
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			Gen_Confirm("Are you sure you want to recreate the Backup Synchronization preferences?")
			If (OK=1)
				READ WRITE:C146([PREFERENCES:116])
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				DELETE SELECTION:C66([PREFERENCES:116])
			End if 
		Else 
			Gen_Alert("Sorry there is no record for Backup Synchronization pref!")
		End if 
	End if 
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		$_t_oldMethodName:=ERR_MethodTracker("BP_LoadPrefs"; 0; "No Existing Pref")
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		
		VARIABLE TO BLOB:C532(SYS_bo_BackupEnabled; [PREFERENCES:116]DataBlob:2)
		VARIABLE TO BLOB:C532(BP_t_BackupAdminEmail; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_t_LocalBackupPath; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_t_RemoteBackupPath; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_l_NumOfFile; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_d_BackupDate; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_ti_BackupTime; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_t_BackupFrequency; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_l_DeleteArchives; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BP_l_onlydoafterpecifiedTime; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		
		$_l_offset:=0
		$_bo_FailureToLoad:=True:C214
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SYS_bo_BackupEnabled; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_t_BackupAdminEmail; $_l_offset)
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_t_LocalBackupPath; $_l_offset)
				If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_t_RemoteBackupPath; $_l_offset)
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_l_NumOfFile; $_l_offset)
						If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_d_BackupDate; $_l_offset)
							If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_ti_BackupTime; $_l_offset)
								If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_t_BackupFrequency; $_l_offset)
									//$_bo_FailureToLoad:=FALSE.  `System can run with the other prefs as defaults
									$_bo_FailureToLoad:=False:C215  //kmw 07/10/08 v631b120, fixed typo (although it doesn't look like $_bo_FailureToLoad is currently used anyway)
									BP_l_DeleteArchives:=1
									BP_l_onlydoafterpecifiedTime:=0
									If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_l_DeleteArchives; $_l_offset)
										If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BP_l_onlydoafterpecifiedTime; $_l_offset)
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		
		
		If (Undefined:C82(BP_t_BackupFrequency))
			BP_t_BackupFrequency:=""
		End if 
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	
	BP_d_FormBackupDate:=BP_d_BackupDate
	
	If (SYS_bo_BackupEnabled)
		BP_but_EnableBackupSync:=1
	Else 
		BP_but_EnableBackupSync:=0
	End if 
Else 
	SYS_bo_BackupEnabled:=False:C215
	
	BP_but_EnableBackupSync:=0
	
End if 
CLEAR SEMAPHORE:C144("EditSynchro")
ERR_MethodTrackerReturn("BP_LoadPrefs"; $_t_oldMethodName)
