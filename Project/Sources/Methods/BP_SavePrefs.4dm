//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_SavePrefs
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
	C_BOOLEAN:C305(SYS_bo_BackupEnabled)
	C_DATE:C307(BP_d_BackupDate)
	C_LONGINT:C283($_l_BackgrounderServerProcess; $_l_ItemID; $_l_ResumeProcess; $_l_Retries; BP_but_EnableBackupSync; BP_l_DeleteArchives; BP_l_NumOfFile; BP_l_onlydoafterpecifiedTime)
	C_TEXT:C284($_t_oldMethodName; BP_t_BackupAdminEmail; BP_t_BackupFrequency; BP_t_LocalBackupPath; BP_t_RemoteBackupPath)
	C_TIME:C306(BP_ti_BackupTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_SavePrefs")
//this method load the prefs for a backup synchronization
$_l_Retries:=0
While (Semaphore:C143("EditSynchro"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Backup Synchronization")


If ($_l_ItemID>0)
	READ WRITE:C146([PREFERENCES:116])
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	End if 
	
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	
	SYS_bo_BackupEnabled:=BP_but_EnableBackupSync=1
	
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
	
	If (Application type:C494=4D Remote mode:K5:5)
		$_l_BackgrounderServerProcess:=Process number:C372("Backgrounder Process"; *)
		If ($_l_BackgrounderServerProcess#0)  //Is backgrounder running on server
			$_l_ResumeProcess:=Execute on server:C373("ResumeBackgrounder"; 64000; "Resume Backgrounder"; *)
		End if 
	End if 
End if 
CLEAR SEMAPHORE:C144("EditSynchro")
ERR_MethodTrackerReturn("BP_SavePrefs"; $_t_oldMethodName)
