If (False:C215)
	//object Name: [USER]DM_FunctionEditor.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DM_l_Save)
	C_TEXT:C284($_t_oldMethodName; DM_t_ScriptName; DM_t_ScriptNameOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_FunctionEditor.Variable7"; Form event code:C388)
If (DM_t_ScriptName="")
	CANCEL:C270
	DM_l_Save:=0
Else 
	If (DM_t_ScriptName=DM_t_ScriptNameOLD)
		CANCEL:C270
		DM_l_Save:=0
	Else 
		DM_l_Save:=1
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].DM_FunctionEditor.Variable7"; $_t_oldMethodName)
