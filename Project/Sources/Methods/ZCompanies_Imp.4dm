//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_Imp
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_Imp")
ZProc("Companies_Imp"; DB_ProcessMemoryinit(4); "General Import")
ERR_MethodTrackerReturn("ZCompanies_Imp"; $_t_oldMethodName)
