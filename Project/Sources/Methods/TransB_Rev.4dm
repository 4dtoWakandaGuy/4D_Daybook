//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_Rev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 16:42
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

$_t_oldMethodName:=ERR_MethodTracker("TransB_Rev")
DBI_MenuDisplayRecords("Trans inREVERSE")
ERR_MethodTrackerReturn("TransB_Rev"; $_t_oldMethodName)