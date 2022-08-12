If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oButtonAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(EW_at_TabControl;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oButtonAdd"; Form event code:C388)
EW_NewStep
EW_at_TabControl:=2
FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.oButtonAdd"; $_t_oldMethodName)