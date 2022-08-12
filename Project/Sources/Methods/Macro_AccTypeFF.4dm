//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_AccTypeFF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_AccTypeFF")
//Macro_AccTypeFF - used in During phases
//see also Macro_AccTypePt
If (Not:C34(<>SYS_bo_ScriptonSave))
	If (DB_GetModuleSettingByNUM(Module_Macros)>0)
		<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
	End if 
End if 

If (<>SYS_bo_ScriptonSave)
	Macro_AccType("Modified FF"+Substring:C12(FirstWord($1); 1; 4))
End if 
ERR_MethodTrackerReturn("Macro_AccTypeFF"; $_t_oldMethodName)