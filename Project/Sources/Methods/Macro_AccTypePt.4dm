//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_AccTypePt
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_AccTypePt")
//Macro_AccTypePt - used in During phases
//see also Macro_AccTypeFF
If (Not:C34(<>SYS_bo_ScriptonSave))
	If (DB_GetModuleSettingByNUM(Module_Macros)>0)
		<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
	End if 
End if 

If (<>SYS_bo_ScriptonSave)
	$_t_TableName:=String:C10(Table:C252($1))
	Macro_AccType("Modified "+$_t_TableName+"/"+String:C10(Field:C253($1)))
End if 
ERR_MethodTrackerReturn("Macro_AccTypePt"; $_t_oldMethodName)