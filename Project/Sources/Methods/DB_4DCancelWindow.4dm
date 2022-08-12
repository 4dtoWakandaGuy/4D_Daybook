//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_4DCancelWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2010 15:35
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

$_t_oldMethodName:=ERR_MethodTracker("DB_4DCancelWindow")
CANCEL:C270
ERR_MethodTrackerReturn("DB_4DCancelWindow"; $_t_oldMethodName)