//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTransT_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2012 13:08
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

$_t_oldMethodName:=ERR_MethodTracker("ZTransT_Mod")
//Depracated method.
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_TYPES:31])))
ERR_MethodTrackerReturn("ZTransT_Mod"; $_t_oldMethodName)