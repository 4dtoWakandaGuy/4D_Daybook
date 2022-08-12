//%attributes = {}
If (False:C215)
	//Project Method Name:      temp_sp_test
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

$_t_oldMethodName:=ERR_MethodTracker("temp_sp_test")
ERR_MethodTrackerReturn("temp_sp_test"; $_t_oldMethodName)