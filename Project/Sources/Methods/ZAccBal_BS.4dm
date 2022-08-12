//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAccBal_BS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 11:04
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

$_t_oldMethodName:=ERR_MethodTracker("ZAccBal_BS")
//This is a build in report
ZProc("Acc_BalBS"; DB_ProcessMemoryinit(2); "Balance Sheet")
ERR_MethodTrackerReturn("ZAccBal_BS"; $_t_oldMethodName)
