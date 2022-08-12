//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Zinvoices_state
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

$_t_oldMethodName:=ERR_MethodTracker("Zinvoices_state")
ZProc("invoices_state"; DB_ProcessMemoryinit(2); "Statements - Due Amounts")
ERR_MethodTrackerReturn("Zinvoices_state"; $_t_oldMethodName)