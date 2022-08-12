//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTrans_Types
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZTrans_Types")
ZProc("Trans_Types"; DB_ProcessMemoryinit(2); "Transactions by Type")
ERR_MethodTrackerReturn("ZTrans_Types"; $_t_oldMethodName)