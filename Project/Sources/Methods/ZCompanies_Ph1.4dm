//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_Ph1
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_Ph1")
ZProc("Companies_Ph1"; DB_ProcessMemoryinit(3); "PhONEday Update")
ERR_MethodTrackerReturn("ZCompanies_Ph1"; $_t_oldMethodName)