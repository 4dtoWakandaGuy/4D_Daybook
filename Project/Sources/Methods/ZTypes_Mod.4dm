//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTypes_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 17:12`Method: ZTypes_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZTypes_Mod")
ZProc("Types_Mod"; DB_ProcessMemoryinit(2); "Types")
ERR_MethodTrackerReturn("ZTypes_Mod"; $_t_oldMethodName)