If (False:C215)
	//object Name: [USER]List_Manager.Variable13
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
	C_LONGINT:C283($_l_event; AA_l_CurrentListiD)
	C_TEXT:C284($_t_oldMethodName; AA_t_listName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Variable13"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		//Change the name in the list on the left
		If (AA_l_CurrentListiD>0)
			AA_l_CurrentListiD:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Variable13"; $_t_oldMethodName)
