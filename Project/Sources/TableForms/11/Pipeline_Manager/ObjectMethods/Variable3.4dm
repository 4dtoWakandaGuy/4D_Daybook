If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable3
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
	C_BOOLEAN:C305($_bo_Expanded)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283(<>SP_l_UsersnGroups; $_l_ItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable3"; Form event code:C388)

$_l_SelectedListItem:=Selected list items:C379(<>SP_l_UsersnGroups)  // Get the position of the selected item
If ($_l_SelectedListItem#0)  // Just in case, check the position
	GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_SelectedItemParent:=List item parent:C633(<>SP_l_UsersnGroups; $_l_ItemReference)
	If ($_l_SelectedItemParent>0)
		//it is a person
		If ($_l_ItemReference>0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_ItemReference)
			SP_l_PersonelID:=$_l_ItemReference
			SP_l_GroupID:=$_l_SelectedItemParent
			SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
			
		Else 
			If ($_l_ItemReference#-999)
				SP_l_GroupID:=Abs:C99($_l_ItemReference)
				SP_l_PersonelID:=0
				UNLOAD RECORD:C212([PERSONNEL:11])
				SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
				CREATE RECORD:C68([PERSONNEL:11])
				//remember we NEVER save this
				SELECT LIST ITEMS BY REFERENCE:C630(<>SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(<>SP_l_UsersnGroups)
				GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				[PERSONNEL:11]Name:2:=$_t_ItemText
			Else 
				SP_l_GroupID:=0
				SP_l_PersonelID:=0
				UNLOAD RECORD:C212([PERSONNEL:11])
				SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
				CREATE RECORD:C68([PERSONNEL:11])
				//remember we NEVER save this
				SELECT LIST ITEMS BY REFERENCE:C630(<>SP_l_UsersnGroups; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(<>SP_l_UsersnGroups)
				GET LIST ITEM:C378(<>SP_l_UsersnGroups; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				[PERSONNEL:11]Name:2:=$_t_ItemText
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable3"; $_t_oldMethodName)
