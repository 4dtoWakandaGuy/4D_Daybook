If (False:C215)
	//object Name: [USER]List_Manager.Button19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 13:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	C_BOOLEAN:C305($_bo_Deletions; AA_Bo_ListtoUpdate)
	C_LONGINT:C283($_l_DeletionsIndex; $_l_ListID; $_l_OK; AA_l_CurrentListiD)
	C_TEXT:C284($_t_oldMethodName; AA_t_listName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button19"; Form event code:C388)
If (AA_l_CurrentListiD>0)
	$_bo_Deletions:=False:C215
	For ($_l_DeletionsIndex; 1; Size of array:C274(AA_al_ListItemDeletion))
		If (AA_al_ListItemDeletion{$_l_DeletionsIndex}>0)
			$_l_DeletionsIndex:=Size of array:C274(AA_al_ListItemDeletion)
			$_bo_Deletions:=True:C214
		End if 
	End for 
	If (Not:C34($_bo_Deletions))
		For ($_l_DeletionsIndex; 1; Size of array:C274(AA_al_SubListItemDeletion))
			If (AA_al_SubListItemDeletion{$_l_DeletionsIndex}>0)
				$_l_DeletionsIndex:=Size of array:C274(AA_al_SubListItemDeletion)
				$_bo_Deletions:=True:C214
			End if 
		End for 
		
	End if 
	If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_Bo_ListtoUpdate)
		
		
		Gen_Confirm("Save "+AA_t_listName+"?")
		$_l_OK:=OK
		If ($_l_OK=1)
			$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
		End if 
	End if 
	
	
	LM_PrintListItems(AA_l_CurrentListiD)
	
End if 
ERR_MethodTrackerReturn("OBJ:List_Manager,Bprint"; $_t_oldMethodName)
