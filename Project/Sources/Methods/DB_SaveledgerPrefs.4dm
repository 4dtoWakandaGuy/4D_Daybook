//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveledgerPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2012 20:15
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

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveledgerPrefs")
DB_LoadLedgerPreferences(True:C214)
ERR_MethodTrackerReturn("DB_SaveledgerPrefs"; $_t_oldMethodName)