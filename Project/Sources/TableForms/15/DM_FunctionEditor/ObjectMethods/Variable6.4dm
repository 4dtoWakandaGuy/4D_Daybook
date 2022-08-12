If (False:C215)
	//object Name: [USER]DM_FunctionEditor.Variable6
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
	C_TEXT:C284($_t_oldMethodName; DM_t_SimpleStatement; DM_t_SimpleStatementOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_FunctionEditor.Variable6"; Form event code:C388)
If (DM_t_SimpleStatement="")
	CANCEL:C270
	DM_l_Save:=0
Else 
	If (DM_t_SimpleStatement=DM_t_SimpleStatementOLD)
		CANCEL:C270
		DM_l_Save:=0
	Else 
		DM_l_Save:=1
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].DM_FunctionEditor.Variable6"; $_t_oldMethodName)
