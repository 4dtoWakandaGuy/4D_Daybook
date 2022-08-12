//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZSequences_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2010 20:12
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

$_t_oldMethodName:=ERR_MethodTracker("ZSequences_Mod")
ZProc("Sequences_Mod"; DB_ProcessMemoryinit(2); "Workflow Sequences")
ERR_MethodTrackerReturn("ZSequences_Mod"; $_t_oldMethodName)