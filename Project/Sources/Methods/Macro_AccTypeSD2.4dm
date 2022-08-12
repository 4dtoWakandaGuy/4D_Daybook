//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_AccTypeSD2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; $_bo_Executed)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_Action; $_t_ExecuteScriptCode; $_t_oldMethodName; $_t_Table; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_AccTypeSD2")
//ALTHOUGH THIS IS INITIALLY DEVELOPED FOR USE IN THE DIARY. THIS COULD BE USED ANYWHERE TO ALLOW CONTEXTUAL MACROS ASSOCIATED WITH A  FIELD
//IN THE CASE OF THE DIARY THIS PASSED THE ACTION CODE IN $2..IF ONE EXITS THAT GETS ACTIONED IF NOT THE STANDARD Macro_AccTypePt is called
//Macro_AccTypeSD2 - used in During phases
//see also Macro_AccTypeFF
If (Count parameters:C259>=2)
	If (Not:C34(<>SYS_bo_ScriptonSave))
		If (DB_GetModuleSettingByNUM(Module_Macros)>0)
			<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
		End if 
	End if 
	If (<>SYS_bo_ScriptonSave)
		$_t_Table:=String:C10(Table:C252($1))
		$_bo_Executed:=False:C215
		If ($2#"")
			$_t_Action:=$2
			$_t_ExecuteScriptCode:="Modified "+$_t_Table+"/"+$_t_Action+"/"+String:C10(Field:C253($1))
			
		Else 
			$_t_ExecuteScriptCode:="Modified "+$_t_Table+"/"+String:C10(Field:C253($1))
			
			
		End if 
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ExecuteScriptCode)
		If (Records in selection:C76([SCRIPTS:80])>0)
			If ([SCRIPTS:80]Script_status:13#Disabled)
				$_bo_Executed:=True:C214
				Macro_AccType($_t_ExecuteScriptCode)
			End if 
			
		End if 
		If (Not:C34($_bo_Executed))
			//Not executed
			If ($_t_ExecuteScriptCode#"Modified "+$_t_Table+"/"+String:C10(Field:C253($1)))
				$_t_ExecuteScriptCode:="Modified "+$_t_Table+"/"+String:C10(Field:C253($1))
				Macro_AccType($_t_ExecuteScriptCode)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Macro_AccTypeSD2"; $_t_oldMethodName)
