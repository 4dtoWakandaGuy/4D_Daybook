//%attributes = {}
If (False:C215)
	//Project Method Name:      onBackupShutdown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 00:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $1)
	C_TEXT:C284($_t_Document; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("onBackupShutdown")

//...(theoretically we could check this value for manual user interuptions etc, or us deliberately stopping it in On backup startup)

CLEAR SEMAPHORE:C144("BackupinProgress")
CLEAR SEMAPHORE:C144("NoIndexing")
$_t_Document:=DOCUMENT

//Alert ("Halt 4D On Backup Shutdown Test 1")

$_l_Process:=New process:C317("BP_OnBackupShutdown"; 128*1024; "OnBackupShutdown Process"; $1)  //moved most code from this method to run in new process - kmw 09/10/08 v631b120
ERR_MethodTrackerReturn("onBackupShutdown"; $_t_oldMethodName)
