If (False:C215)
	//object Name: [USER]List_Manager.Button12
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
	C_LONGINT:C283(AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button12"; Form event code:C388)
If (AA_l_CurrentSelectedItemID#0)
	
	AA_SaveListItem(AA_l_CurrentSelectedItemID)
	//////_o_REDRAW LIST(AA_HL_ListItems)
End if 
AA_LMA_DeleteListItem
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Button12"; $_t_oldMethodName)
