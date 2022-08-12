If (False:C215)
	//object Name: [EW_ExportProjects]Entry.MacroList
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
	//ARRAY TEXT(EW_at_ScriptQueryCodes;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.MacroList"; Form event code:C388)
Case of 
	: (Self:C308-><1)
		iLoc:=Find in array:C230(EW_at_ScriptQueryCodes; [EW_ExportSteps:118]MacroCode:7)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportSteps:118]MacroCode:7:=EW_at_ScriptQueryCodes{1}
			EW_bo_ModifiedStep:=True:C214
		End if 
	Else 
		[EW_ExportSteps:118]MacroCode:7:=EW_at_ScriptQueryCodes{Self:C308->}
		EW_bo_ModifiedStep:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.MacroList"; $_t_oldMethodName)
