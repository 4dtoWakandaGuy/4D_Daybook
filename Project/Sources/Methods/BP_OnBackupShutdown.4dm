//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_OnBackupShutdown
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
	C_BOOLEAN:C305(SYS_bo_BackupEnabled)
	C_LONGINT:C283($_l_Retries; $1; BP_l_onlydoafterpecifiedTime)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_OnBackupShutdown")

//BP_OnBackupShutdown

//Added kmw - 09/10/08 v631b120 and moved most of the code...
//... from 4D's "On Backup Shutdown" database method into this method.

//...This change was an attempt to deal with problem reported by Tim Quartley Watson...
//...According to him, even though normal 4D backup was finished, everything...
//...remained "frozen up" exactly as though 4D Backup was still running...
//...until the the secondary backup completed.

//NOTE: I couldn't even get this problem to repeat  - certainly not uncompiled anyway...
//...(tested by putting trace into "On Backup Shutdown" and seeing if still could do stuff...
//...Therefore most likely the problem is something else (e.g...as Nigel suspects that...
//...it is simply to do with the file transfer choking the network bandwidth and that what he's...
//...really got is a performence issue as opposed to a "backup lockup"). In that case...
//... this change won't help at all but can't see any harm in it.

//IMPORTANT: Obviously if this is to have ANY chance of helping then it needs to be...
//...called as a NEW process from "On Backup Shutdown".

//FURTHER NOTE: Further tests confirmed that even compiled there never seemed to be an issue with...
//...being in 4D's "On Backup Shutdown" causing a freeze up. The only minor difference...
//...is that the backup progress now window closes (the fact it was staying open may have...
//...been what led Tim to believe this was the source of the issue. As mentioned though...
//...I don't think leaving it running in its own process does any harm (Tim...
//...might be more open to alternative theories if we tell him for sure that it now runs in...
//...a seperate process and if he now sees the backup progress window close).


//Load the preferences and copy the document if desired

// Alert ("Halt NEW PROCESS On Backup Shutdown Test 1")
$_l_Retries:=0
// Alert ("Halt NEW PROCESS On Backup Shutdown Test 1")

While (<>PER_t_CurrentUserName="")  //Does not set semaphore just checks if we are still logging in and holds this as some vars may not be set
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 
While (Test semaphore:C652("$DuringLogin"))  //Does not set semaphore just checks if we are still logging in and holds this as some vars may not be set
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 
TRACE:C157
BP_LoadPrefs

If (SYS_bo_BackupEnabled)
	If (BP_l_onlydoafterpecifiedTime=1)
		BP_CopyDocuments(True:C214)  //Tell the process to check the timing
	Else 
		BP_CopyDocuments
	End if 
	
	BP_SavePrefs
End if 

// Alert ("Halt NEW PROCESS On Backup Shutdown Test 2")
ERR_MethodTrackerReturn("BP_OnBackupShutdown"; $_t_oldMethodName)