If (False:C215)
	//object Name: [EW_ExportProjects]Calculation.BKfields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EW_bo_Modified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Calculation.BKfields"; Form event code:C388)
EW_bo_Modified:=True:C214
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Calculation.BKfields"; $_t_oldMethodName)