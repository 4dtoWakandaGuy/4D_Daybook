//%attributes = {}
If (False:C215)
	//Project Method Name:      SERVER_STARTUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: SERVER_STARTUP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_AuditLogging)
	C_LONGINT:C283(<>LIC_l_Seed; $MaxCache)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SERVER STARTUP")
ERR_ArchiveLogFile  //It moves object_access_log.txt into a archive folder
<>LIC_l_Seed:=7350  //this could be changed to an array of valid seeds
<>SYS_bo_AuditLogging:=False:C215  // not needed unless server version ` 31/07/02 pb

//DSPLY_LoadPrefs   `added 27/06/08 -kmw
//◊DSPLY_bo_DisplayProgressBars:=DSPLY_bo_DisplayProgressBars  `added 27/06/08 -kmw (progress bars check is done regularly so in this case for speed of access it is worth it to store the pref in an interprocess on startup and after change to pref)


$MaxCache:=Get database parameter:C643(9)
If (($MaxCache/1024)<120000)
	//ALERT("Cache memory is not set to recommended size. Please go to"+"the File menu then database properties menu item and then go to system settings "+" Set both minimum and maximum cache sizes to 120000 KB")
End if 
SPLASH_THERMO  //hide splash thermometer on server
STARTUP_SCREEN
ERR_MethodTrackerReturn("SERVER_STARTUP"; $_t_oldMethodName)