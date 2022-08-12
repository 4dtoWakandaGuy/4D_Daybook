//%attributes = {}
If (False:C215)
	//Project Method Name:      ZLetters_Mod_1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2011 13:36
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

$_t_oldMethodName:=ERR_MethodTracker("ZLetters_Mod_1")
ZProc("Letters_Mod"; DB_ProcessMemoryinit(3); "View Templates"; "1")
ERR_MethodTrackerReturn("ZLetters_Mod_1"; $_t_oldMethodName)
