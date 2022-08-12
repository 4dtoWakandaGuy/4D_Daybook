//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_PrinQ
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_PrinQ")
Menu_Record("Companies_PrinQ"; "Print Company with information")
Companies_Print("Qualities")
ERR_MethodTrackerReturn("Companies_PrinQ"; $_t_oldMethodName)