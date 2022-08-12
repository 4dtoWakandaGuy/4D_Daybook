If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oServiceLocationsPopup1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_ExtServiceLocations;0)
	//ARRAY LONGINT(SVS_al_IntServiceLocations;0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	//ARRAY TEXT(SVS_at_ExtServiceLoactions;0)
	//ARRAY TEXT(SVS_at_IntServiceLoactions;0)
	//ARRAY TEXT(SVS_at_ServiceLocations;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; $_bo_Expanded; DB_bo_RecordModified)
	C_LONGINT:C283($_l_ListID2; $_l_LocationRow; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SublistID; SVS_at_ServiceLocations; $_l_ItemReference; $_l_ListID2; $_l_LocationRow; $_l_SelectedItemParent; $_l_SelectedListItem)
	C_LONGINT:C283($_l_SublistID)
	C_TEXT:C284($_t_oldMethodName; $_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oServiceLocationsPopup1"; Form event code:C388)
$_l_SelectedListItem:=Selected list items:C379(SVS_at_ServiceLocations)
If ($_l_SelectedListItem>0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	GET LIST ITEM:C378(SVS_at_ServiceLocations; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	If ($_l_ItemReference<0)
		$_l_LocationRow:=Find in array:C230(SVS_al_IntServiceLocations; Abs:C99($_l_ItemReference))
		If ($_l_LocationRow>0)  //it should be if internal
			[SERVICE_CALLS:20]xServiceLocationName:33:=SVS_at_IntServiceLoactions{$_l_LocationRow}
			[SERVICE_CALLS:20]xServiceLocation:32:=SVS_al_IntServiceLocations{$_l_LocationRow}
			OBJECT SET VISIBLE:C603(*; "oIncomingDel@"; True:C214)
		Else 
			$_l_LocationRow:=Find in array:C230(SVS_al_ExtServiceLocations; Abs:C99($_l_ItemReference))
			If ($_l_LocationRow>0)  //it should be if external
				[SERVICE_CALLS:20]xServiceLocationName:33:=SVS_at_ExtServiceLoactions{$_l_LocationRow}
				[SERVICE_CALLS:20]xServiceLocation:32:=SVS_al_ExtServiceLocations{$_l_LocationRow}
			End if 
			
		End if 
		DB_bo_RecordModified:=True:C214
	Else 
		$_l_SelectedItemParent:=List item parent:C633(SVS_at_ServiceLocations; $_l_ItemReference)
		Case of 
			: ($_l_ItemReference=998) & ($_l_SelectedItemParent>0)
				//Edit external locations
				
				$_l_ListID2:=AA_ListAddItembyID($_l_SelectedItemParent)
				SVS_LoadServiceLocations
			: ($_l_ItemReference=999) & ($_l_SelectedItemParent>0)
				//edit internal location
				$_l_ListID2:=AA_ListAddItembyID($_l_SelectedItemParent)
				SVS_LoadServiceLocations
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ:Calls_In,SC_at_ProblemTypes"; $_t_oldMethodName)
