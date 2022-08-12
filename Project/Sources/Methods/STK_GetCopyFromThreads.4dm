//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetCopyFromThreads
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 10:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetCopyFromThreads")

If (<>DB_bo_NewStockActive)
End if 
ERR_MethodTrackerReturn("STK_GetCopyFromThreads"; $_t_oldMethodName)