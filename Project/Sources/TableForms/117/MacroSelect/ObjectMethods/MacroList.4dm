If (False:C215)
	//object Name: [EW_ExportProjects]MacroSelect.MacroList
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
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].MacroSelect.MacroList"; Form event code:C388)
Case of 
	: (Self:C308-><1)
		iLoc:=Find in array:C230(EW_at_ScriptQueryCodes; [EW_StepActions:119]MacroCode:14)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_StepActions:119]MacroCode:14:=EW_at_ScriptQueryCodes{1}
		End if 
	Else 
		[EW_StepActions:119]MacroCode:14:=EW_at_ScriptQueryCodes{Self:C308->}
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].MacroSelect.MacroList"; $_t_oldMethodName)
