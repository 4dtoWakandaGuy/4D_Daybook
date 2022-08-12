//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTransB_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2010 12:48
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

$_t_oldMethodName:=ERR_MethodTracker("ZTransB_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
ERR_MethodTrackerReturn("ZTransB_Mod"; $_t_oldMethodName)