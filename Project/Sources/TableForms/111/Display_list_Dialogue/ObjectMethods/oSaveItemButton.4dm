If (False:C215)
	//object Name: [X_LISTS]Display_list_Dialogue.oSaveItemLabel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.Variable8"; Form event code:C388)
AA_LMU_SaveListitem_ToScreen
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.Variable8"; $_t_oldMethodName)
