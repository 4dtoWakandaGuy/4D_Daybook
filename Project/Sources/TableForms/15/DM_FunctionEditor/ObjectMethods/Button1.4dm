If (False:C215)
	//object Name: [USER]DM_FunctionEditor.Button1
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
	C_TEXT:C284($_t_oldMethodName; DM_t_SimpleStatement; DM_t_ScriptName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_FunctionEditor.Button1"; Form event code:C388)
If (DM_t_SimpleStatement="")
	WS_AutoscreenSize(2; 324; 324)
	FORM GOTO PAGE:C247(2)
Else 
	Gen_Confirm("Convert to a macro?"; "Yes"; "No")
	
	If (OK=1)
		WS_AutoscreenSize(2; 151; 324)
		FORM GOTO PAGE:C247(2)
		
		DM_t_ScriptName:=DM_t_SimpleStatement
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].DM_FunctionEditor.Button1"; $_t_oldMethodName)
