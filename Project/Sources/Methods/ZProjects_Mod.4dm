//%attributes = {}
If (False:C215)
	//Project Method Name:      ZProjects_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 18:57
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

$_t_oldMethodName:=ERR_MethodTracker("ZProjects_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PROJECTS:89])))
ERR_MethodTrackerReturn("ZProjects_Mod"; $_t_oldMethodName)