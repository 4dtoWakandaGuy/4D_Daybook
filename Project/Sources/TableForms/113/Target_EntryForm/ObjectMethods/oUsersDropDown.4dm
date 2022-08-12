If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable3
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
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_ItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID; BaddMiultiple; SP_l_UsersnGroups)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; SP_t_SalesProjectionPerson)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable3"; Form event code:C388)
$_l_SelectedListItem:=Selected list items:C379(SP_l_UsersnGroups)  // Get the position of the selected item
If ($_l_SelectedListItem#0)  // Just in case, check the position
	GET LIST ITEM:C378(SP_l_UsersnGroups; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_SelectedItemParent:=List item parent:C633(SP_l_UsersnGroups; $_l_ItemReference)
	If ($_l_SelectedItemParent>0)
		//it is a person
		If ($_l_ItemReference>0)
			SP_t_SalesProjectionPerson:=$_t_ItemText
			[SALES_PROJECTION:113]PersonnelOwnerID:4:=$_l_ItemReference
			[SALES_PROJECTION:113]PersonnelGroupID:5:=$_l_SelectedItemParent
		Else 
			If ($_l_ItemReference#-999)
				[SALES_PROJECTION:113]PersonnelGroupID:5:=Abs:C99($_l_ItemReference)
				[SALES_PROJECTION:113]PersonnelOwnerID:4:=0
				//remember we NEVER save this
				SELECT LIST ITEMS BY REFERENCE:C630(SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(SP_l_UsersnGroups)
				GET LIST ITEM:C378(SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				SP_t_SalesProjectionPerson:=$_t_ItemText
			Else 
				[SALES_PROJECTION:113]PersonnelGroupID:5:=0
				[SALES_PROJECTION:113]PersonnelOwnerID:4:=0
				
				
				SELECT LIST ITEMS BY REFERENCE:C630(SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(SP_l_UsersnGroups)
				GET LIST ITEM:C378(SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				SP_t_SalesProjectionPerson:=$_t_ItemText
			End if 
		End if 
	End if 
End if 
If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0) | ([SALES_PROJECTION:113]PersonnelGroupID:5>0) | ([SALES_PROJECTION:113]ProjectionAdHocOwner:26#"")
	OBJECT SET VISIBLE:C603(BaddMiultiple; True:C214)
Else 
	OBJECT SET VISIBLE:C603(BaddMiultiple; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable3"; $_t_oldMethodName)
