//%attributes = {}

If (False:C215)
	//Project Method Name:      Start_inProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>LIC_bo_skipVersionControlOnExit; <>SYS_bo_AuditLogging; <>SYS_bo_QuitCalled)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_inProcess")


//ERR_ArchiveLogFile   `It moves object_access_log.txt into a archive folder
$_t_oldMethodName:=ERR_MethodTracker("Start_inProcess")


//ERR_ArchiveLogFile   `It moves object_access_log.txt into a archive folder
<>SYS_bo_QuitCalled:=False:C215  // 09/05/02 pb
<>SYS_bo_QuitCalled:=False:C215
<>SYS_bo_AuditLogging:=False:C215  // not needed unless server version ` 13/05/02 pb
<>LIC_bo_skipVersionControlOnExit:=False:C215  //BSW 27/05/03

//DB_LoadErrorTrackPrefs
StartBackgrounder
ERR_MethodTrackerReturn("Start_inProcess"; $_t_oldMethodName)