//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_REMEMBERTODELETE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2009 05:17
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

$_t_oldMethodName:=ERR_MethodTracker("TEMP_REMEMBERTODELETE")
ERR_MethodTrackerReturn("TEMP_REMEMBERTODELETE"; $_t_oldMethodName)