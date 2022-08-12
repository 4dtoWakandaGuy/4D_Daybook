If (False:C215)
	//object Name: [USER]WS_SetManager.Variable2
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(WS_at_TableNames;0)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_LONGINT:C283(WS_l_ContextID)
	C_TEXT:C284($_t_oldMethodName; WS_t_ContextLabel)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable2"; Form event code:C388)
//note
//user cannot add a context by typing a table name
//the context is linked to a table
//so the user need to select the table
SM_bo_Busy:=True:C214
SM_SaveModifiedList

If (SM_CheckActionOK("Add"; "Context"))
	WS_at_TableNames:=0
	WS_t_ContextLabel:=""
	WS_l_ContextID:=0
	FORM GOTO PAGE:C247(2)
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable2"; $_t_oldMethodName)
