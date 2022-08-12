//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_WS_Manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2011 16:21
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

$_t_oldMethodName:=ERR_MethodTracker("DB_WS_Manager")
ERR_MethodTrackerReturn("DB_WS_Manager"; $_t_oldMethodName)