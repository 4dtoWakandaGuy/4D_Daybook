If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Variable1"; Form event code:C388)
If (EW_Validate)
	DB_SaveRecord(->[EW_ExportProjects:117])
	DB_SaveRecord(->[EW_ExportTables:120])
	If (EW_bo_ModifiedStep)
		EW_SaveSteps
	End if 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ:[EW_ExportProjects].Entry.Variable1"; $_t_oldMethodName)
