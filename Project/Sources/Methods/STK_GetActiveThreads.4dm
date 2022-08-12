//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetActiveThreads
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 18:01
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

$_t_oldMethodName:=ERR_MethodTracker("STK_GetActiveThreads")
ERR_MethodTrackerReturn("STK_GetActiveThreads"; $_t_oldMethodName)