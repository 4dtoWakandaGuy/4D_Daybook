//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveLedgerPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 10:26
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

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveLedgerPreferences")

DB_LoadLedgerPreferences(True:C214)
ERR_MethodTrackerReturn("DB_SaveLedgerPreferences"; $_t_oldMethodName)