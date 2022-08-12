//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZProblems_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZProblems_Mod")
ZProc("Problems_Mod"; DB_ProcessMemoryinit(2); "Problems")
ERR_MethodTrackerReturn("ZProblems_Mod"; $_t_oldMethodName)