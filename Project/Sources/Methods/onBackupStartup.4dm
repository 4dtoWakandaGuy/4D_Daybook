//%attributes = {}
If (False:C215)
	//Project Method Name:      onBackupStartup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2012 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OpenWindow)
	C_LONGINT:C283($_l_Retries; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("onBackupStartup")

//
$_bo_OpenWindow:=True:C214
$_l_Retries:=0
While (Semaphore:C143("BackupinProgress"))
	Gen_Message("Backupalready in progress"; $_bo_OpenWindow)
	$_bo_OpenWindow:=False:C215
	$_l_Retries:=$_l_Retries+1
	DelayTicks(20*$_l_Retries)
End while 
CLOSE WINDOW:C154
$_bo_OpenWindow:=True:C214
$_l_Retries:=0
While (Semaphore:C143("Noindexing"))
	Gen_Message("Backup delayed till transactions are ended"; $_bo_OpenWindow)
	$_bo_OpenWindow:=False:C215
	$_l_Retries:=$_l_Retries+1
	DelayTicks(20*$_l_Retries)
End while 
CLOSE WINDOW:C154
//
$0:=0  //added kmw 09/10/08 v631b120, 0 means allow backup to be launched
ERR_MethodTrackerReturn("onBackupStartup"; $_t_oldMethodName)
