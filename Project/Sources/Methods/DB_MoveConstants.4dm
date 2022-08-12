//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MoveConstants
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

$_t_oldMethodName:=ERR_MethodTracker("DB_MoveConstants")

//NG This method is to move Constants to the User constants file so they can be used with V11
//It works by running the various method that write 4DK# which have all been modified to write to the new constants resource file
ERR_MethodTrackerReturn("DB_MoveConstants"; $_t_oldMethodName)