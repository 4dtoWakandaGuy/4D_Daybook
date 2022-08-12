//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ResetDataFilePath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/02/2013 13:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ResetDataFilePath")

While (Semaphore:C143("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
	DelayTicks(10)
End while 
TRACE:C157
//Login has completed.
//note that this is only called if we are swapping the data file to the one on the document
//it must wait a few seconds sp the on startup has finished
DelayTicks(60*10)
DB_ControlDataFilePath(True:C214)
ERR_MethodTrackerReturn("DB_ResetDataFilePath"; $_t_oldMethodName)