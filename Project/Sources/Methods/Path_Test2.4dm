//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_Test2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 14:25
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

$_t_oldMethodName:=ERR_MethodTracker("Path_Test2")
//NG october 2012 this method is not called
ERR_MethodTrackerReturn("Path_Test2"; $_t_oldMethodName)