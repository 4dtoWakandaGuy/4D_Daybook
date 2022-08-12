//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_Renu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 13:00
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_Renu")
DBI_MenuDisplayRecords("CompaniesRenum")
ZProc("Companies_Renum"; DB_ProcessMemoryinit(3); "Recode Companies")
ERR_MethodTrackerReturn("ZCompanies_Renu"; $_t_oldMethodName)