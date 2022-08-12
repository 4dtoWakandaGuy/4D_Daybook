//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies Renum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 21:52
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

$_t_oldMethodName:=ERR_MethodTracker("Companies Renum")
//Companies Renum
DBI_MenuDisplayRecords("CompaniesRenum")
ERR_MethodTrackerReturn("Companies Renum"; $_t_oldMethodName)