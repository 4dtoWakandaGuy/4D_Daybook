If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	C_BOOLEAN:C305($_bo_Expanded)
	C_DATE:C307(SP_D_TFilterFromDate; SP_D_TFilterToDate)
	C_LONGINT:C283(<>SP_l_UsersnGroups; $_l_ItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID; SP_l_tGroupID; SP_l_tPersonelID; SP_l_tSalesProjectionStateID)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; SP_t_AdHocName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable20"; Form event code:C388)
//the script here works differently to the one on page1(sales pipeline)
//this is because with targets we allowing the users and groups to overridden
//when the user is entering, so I might just get the system to pick up the
//adhoc names as well. So the result goes in a variable
//also I dont want what you  select on this page to affect
//what is on Page_1
$_l_SelectedListItem:=Selected list items:C379(<>SP_l_UsersnGroups)  // Get the position of the selected item
If ($_l_SelectedListItem#0)  // Just in case, check the position
	GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_SelectedItemParent:=List item parent:C633(<>SP_l_UsersnGroups; $_l_ItemReference)
	If ($_l_SelectedItemParent>0)
		//it is a person
		If ($_l_ItemReference>0)
			SP_t_AdHocName:=$_t_ItemText
			SP_l_tPersonelID:=$_l_ItemReference
			SP_l_tGroupID:=$_l_SelectedItemParent
			SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID)
			If (Size of array:C274(SP_al_SalesProjectionID)>0)
				If (SP_al_SalesProjectionID{1}<0)
					SP_at_TargetOwner{1}:=SP_t_AdHocName
					SP_al_TargetOPersonID{1}:=SP_l_tPersonelID
					SP_al_TargetOGroupID{1}:=SP_l_tGroupID
					//AL_UpdateArrays (SP_Powerviewtarget;-2)
				End if 
			End if 
			
		Else 
			If ($_l_ItemReference#-999)
				SP_l_tGroupID:=Abs:C99($_l_ItemReference)
				SP_l_tPersonelID:=0
				SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID)
				//remember we NEVER save this
				SELECT LIST ITEMS BY REFERENCE:C630(<>SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(<>SP_l_UsersnGroups)
				GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				SP_t_AdHocName:=$_t_ItemText
				If (Size of array:C274(SP_al_SalesProjectionID)>0)
					If (SP_al_SalesProjectionID{1}<0)
						SP_at_TargetOwner{1}:=SP_t_AdHocName
						SP_al_TargetOPersonID{1}:=0
						SP_al_TargetOGroupID{1}:=SP_l_tGroupID
						//AL_UpdateArrays (SP_Powerviewtarget;-2)
					End if 
				End if 
			Else 
				SP_l_tGroupID:=0
				SP_l_tPersonelID:=0
				
				SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID)
				
				SELECT LIST ITEMS BY REFERENCE:C630(<>SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(<>SP_l_UsersnGroups)
				GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				SP_t_AdHocName:=$_t_ItemText
				If (Size of array:C274(SP_al_SalesProjectionID)>0)
					If (SP_al_SalesProjectionID{1}<0)
						SP_at_TargetOwner{1}:=SP_t_AdHocName
						SP_al_TargetOPersonID{1}:=0
						SP_al_TargetOGroupID{1}:=0
						//AL_UpdateArrays (SP_Powerviewtarget;-2)
						
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable20"; $_t_oldMethodName)
