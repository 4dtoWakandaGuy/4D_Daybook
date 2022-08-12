//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCollections_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 08:32
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

$_t_oldMethodName:=ERR_MethodTracker("zCollections_Mod")

ZProc("CatalogueGroup_Mod"; DB_ProcessMemoryinit(2); "Collections")
ERR_MethodTrackerReturn("zCollections_Mod"; $_t_oldMethodName)