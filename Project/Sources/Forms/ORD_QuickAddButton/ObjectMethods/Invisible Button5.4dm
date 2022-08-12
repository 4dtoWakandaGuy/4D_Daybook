If (False:C215)
	//object Name: Object Name:      ORD_QuickAddButton.Invisible Button5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2012 09:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; ORD_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ORD_QuickAddButton/Invisible Button5"; Form event code:C388)

If (Gen_Option)
	
	DB_l_ButtonClickedFunction:=0
	DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Add Line Quick Repeat")
	SET PROCESS VARIABLE:C370(ORD_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
	POST OUTSIDE CALL:C329(ORD_l_CallBackProcess)
Else 
	DB_l_ButtonClickedFunction:=0
	DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Add Line Quick Add")
	SET PROCESS VARIABLE:C370(ORD_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
	POST OUTSIDE CALL:C329(ORD_l_CallBackProcess)
End if 
ERR_MethodTrackerReturn("OBJ ORD_QuickAddButton.Invisible Button5"; $_t_oldMethodName)
