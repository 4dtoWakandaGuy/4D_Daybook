//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTrans_Date
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

$_t_oldMethodName:=ERR_MethodTracker("ZTrans_Date")
ZProc("Trans_Date"; DB_ProcessMemoryinit(2); "Transactions by Date")
ERR_MethodTrackerReturn("ZTrans_Date"; $_t_oldMethodName)