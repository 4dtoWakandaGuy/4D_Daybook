//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTransB_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2009 13:51
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

$_t_oldMethodName:=ERR_MethodTracker("ZTransB_In")
ZProc("TransB In"; DB_ProcessMemoryinit(6); "Enter Transaction Batch")
ERR_MethodTrackerReturn("ZTransB_In"; $_t_oldMethodName)
