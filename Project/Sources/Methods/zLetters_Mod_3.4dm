//%attributes = {}
If (False:C215)
	//Project Method Name:      zLetters_Mod_3
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

$_t_oldMethodName:=ERR_MethodTracker("zLetters_Mod_3")
ZProc("Letters_Mod"; DB_ProcessMemoryinit(3); "View Templates"; "3")
ERR_MethodTrackerReturn("zLetters_Mod_3"; $_t_oldMethodName)
