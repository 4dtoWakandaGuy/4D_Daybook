//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_CLear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("SD_CLear")
READ WRITE:C146([SD_Settings:107])
ALL RECORDS:C47([SD_Settings:107])
DELETE SELECTION:C66([SD_Settings:107])
ERR_MethodTrackerReturn("SD_CLear"; $_t_oldMethodName)