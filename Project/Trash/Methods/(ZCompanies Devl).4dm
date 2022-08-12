//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZCompanies Devl
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies Devl")
ZProc("Companies_Devlt"; DB_ProcessMemoryinit(2); "Development Report")
//See Co_DevelopmentReport
ERR_MethodTrackerReturn("ZCompanies Devl"; $_t_oldMethodName)