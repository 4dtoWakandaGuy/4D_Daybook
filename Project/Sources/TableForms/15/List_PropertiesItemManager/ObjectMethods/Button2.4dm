If (False:C215)
	//object Name: [USER]List_PropertiesItemManager.Button2
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
	//ARRAY LONGINT(AA_al_PropertyItemsID;0)
	//ARRAY LONGINT(AA_at_PropertyItemActionCodes;0)
	//ARRAY TEXT(AA_at_ActionNames;0)
	//ARRAY TEXT(AA_at_PropertyItems;0)
	//ARRAY TEXT(AA_at_PropertyItemsProperties;0)
	//ARRAY TEXT(AA_at_PropertyItemAction;0)
	C_LONGINT:C283($_l_PropertyRow; AA_l_CurrentSelectItemID; AA_l_PropertyCurItemActionCode)
	C_TEXT:C284($_t_oldMethodName; AA_t_PropertyCurrentItem; AA_t_PropertyCurrentItemAction)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_PropertiesItemManager.Button2"; Form event code:C388)
//HERE  WE SHOW THE VARIABLE FOR ENTERING A NEW PROPERTY ITEM
//WE ADD IT TO THE ARRAYS
//BUT BUT BUT
//we only save it when we exit the screen
If (AA_t_PropertyCurrentItem#"")
	CONFIRM:C162("Save "+AA_t_PropertyCurrentItem)
	If (OK=1)
		If (AA_l_CurrentSelectItemID=0)
			//new item
			INSERT IN ARRAY:C227(AA_at_PropertyItems; Size of array:C274(AA_at_PropertyItems)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemAction; Size of array:C274(AA_at_PropertyItemAction)+1; 1)
			INSERT IN ARRAY:C227(AA_al_PropertyItemsID; Size of array:C274(AA_al_PropertyItemsID)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemsProperties; Size of array:C274(AA_at_PropertyItemsProperties)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemActionCodes; Size of array:C274(AA_at_PropertyItemActionCodes)+1; 1)
			AA_at_PropertyItems{Size of array:C274(AA_at_PropertyItems)}:=AA_t_PropertyCurrentItem
			AA_at_PropertyItemAction{Size of array:C274(AA_at_PropertyItemAction)}:=AA_t_PropertyCurrentItemAction
			AA_al_PropertyItemsID{Size of array:C274(AA_al_PropertyItemsID)}:=-Size of array:C274(AA_al_PropertyItemsID)  //temp number
			AA_at_PropertyItemActionCodes{Size of array:C274(AA_at_PropertyItemActionCodes)}:=AA_l_PropertyCurItemActionCode
			
		Else 
			$_l_PropertyRow:=Find in array:C230(AA_al_PropertyItemsID; AA_l_CurrentSelectItemID)
			If ($_l_PropertyRow>0)  //it should be
				AA_at_PropertyItems{$_l_PropertyRow}:=AA_t_PropertyCurrentItem
				AA_at_PropertyItemAction{$_l_PropertyRow}:=AA_t_PropertyCurrentItemAction
				AA_at_PropertyItemActionCodes{$_l_PropertyRow}:=AA_l_PropertyCurItemActionCode
			End if 
			
		End if 
	End if 
	
	AA_t_PropertyCurrentItem:=""
	AA_t_PropertyCurrentItemAction:=""
	AA_l_CurrentSelectItemID:=0
	AA_l_PropertyCurItemActionCode:=0
	OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItem; False:C215)
	OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItemAction; False:C215)
	OBJECT SET VISIBLE:C603(AA_at_ActionNames; False:C215)
	
End if 
OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItem; True:C214)
OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItemAction; True:C214)
OBJECT SET VISIBLE:C603(AA_at_ActionNames; True:C214)
ERR_MethodTrackerReturn("OBJ [USER].List_PropertiesItemManager.Button2"; $_t_oldMethodName)
