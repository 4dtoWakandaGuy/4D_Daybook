If (False:C215)
	//object Name: [USER]List_Manager.Button6
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
	C_LONGINT:C283($_l_ListID; AA_l_CurrentListiD)
	C_TEXT:C284($_t_oldMethodName; AA_t_listName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button6"; Form event code:C388)
If (AA_l_CurrentListiD>0)
	$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
	AA_LoadListtoManager(AA_l_CurrentListiD; AA_t_listName; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Button6"; $_t_oldMethodName)
