//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_Pros
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 15:31
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_Pros")
ZProc("Companies_Pros"; DB_ProcessMemoryinit(3); "Prospects Report")
//Replaced with call to CO_prospectReport
ERR_MethodTrackerReturn("ZCompanies_Pros"; $_t_oldMethodName)