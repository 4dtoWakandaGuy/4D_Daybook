//%attributes = {}
If (False:C215)
	//Project Method Name: AA_CloseManager
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:23`Method: AA_CloseManager
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
	C_BOOLEAN:C305(<>DB_Bo_UnitTestMode; $_bo_Deletions; AA_Bo_ListtoUpdate)
	C_LONGINT:C283($_l_DeletionIndex; $_l_ListID; $_l_OK; AA_l_CurrentListiD; iCancel; IOK)
	C_TEXT:C284($_t_oldMethodName; $_t_Press; AA_t_listName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_CloseManager")

If (AA_l_CurrentListiD>0)
	$_bo_Deletions:=False:C215
	For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_ListItemDeletion))
		If (AA_al_ListItemDeletion{$_l_DeletionIndex}>0)
			$_l_DeletionIndex:=Size of array:C274(AA_al_ListItemDeletion)
			$_bo_Deletions:=True:C214
		End if 
	End for 
	If (Not:C34($_bo_Deletions))
		For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_SubListItemDeletion))
			If (AA_al_SubListItemDeletion{$_l_DeletionIndex}>0)
				$_l_DeletionIndex:=Size of array:C274(AA_al_SubListItemDeletion)
				$_bo_Deletions:=True:C214
			End if 
		End for 
		
	End if 
	
	If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_Bo_ListtoUpdate)
		
		
		
		
		Gen_Confirm("Save "+AA_t_listName+"?")
		$_l_OK:=OK
		
	Else 
		$_l_OK:=OK
	End if 
	
End if 

If ($_l_OK=1)
	$_t_Press:="OK"
Else 
	$_t_Press:="Cancel"
End if 

Case of 
	: (($_t_Press="OK") | (iOK=1))
		If (AA_l_CurrentListiD>0)
			If ($_l_OK=1)
				$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
			End if 
		End if 
		
		CANCEL:C270
		
	: (($_t_Press="Cancel") | (iCancel=1))
		CANCEL:C270
End case 
ERR_MethodTrackerReturn("AA_CloseManager"; $_t_oldMethodName)
