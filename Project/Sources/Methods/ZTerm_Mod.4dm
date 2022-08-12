//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTerm_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2012 13:57
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

$_t_oldMethodName:=ERR_MethodTracker("ZTerm_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TERMINOLOGY:75])))
//ZProc ("Term Mod";DB_ProcessMemoryinit(2);"Terminology")
ERR_MethodTrackerReturn("ZTerm_Mod"; $_t_oldMethodName)