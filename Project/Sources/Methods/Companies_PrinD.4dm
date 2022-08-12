//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_PrinD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_PrinD")
Menu_Record("Companies_PrinD"; "Print Company with Diary")
Companies_Print("Diary")
ERR_MethodTrackerReturn("Companies_PrinD"; $_t_oldMethodName)