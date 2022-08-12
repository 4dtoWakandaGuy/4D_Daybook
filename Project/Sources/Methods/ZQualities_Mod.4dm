//%attributes = {}
If (False:C215)
	//Project Method Name:      ZQualities_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 06:41
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

$_t_oldMethodName:=ERR_MethodTracker("ZQualities_Mod")
ZProc("Qualities_Mod"; DB_ProcessMemoryinit(2); "View qualitative information")
ERR_MethodTrackerReturn("ZQualities_Mod"; $_t_oldMethodName)
