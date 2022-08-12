//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_GroupPopUpScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_a_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_RecordIDs;0)
	//ARRAY PICTURE(QV_apic_PopupIcons;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Expanded2; QV_bo_AlPopulated)
	C_LONGINT:C283($_l_CountListItems; $_l_CountListItems2; $_l_GroupRow; $_l_ItemReference; $_l_itemReference2; $_l_Items; $_l_ListItemID; $_L_PropertyColumn; $_l_QualityRow; $_l_QualityRow2; $_l_SelectedListItem)
	C_LONGINT:C283($_l_SelectedListItem2; $_l_SubIndex; $_l_SublistID; $_l_SublistID2; $_l_SubListNUM; QV_HL_QualitiesList)
	C_PICTURE:C286(QV_pic_PopupIcon)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName; QV_t_QualitiesGroupName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_GroupPopUpScript")
If (QV_at_GroupsPopUPNM>0)
	QV_bo_AlPopulated:=True:C214
	QV_t_QualitiesGroupName:=QV_at_GroupsPopUPNM{QV_at_GroupsPopUPNM}
	$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_GroupsPOPUPID{QV_at_GroupsPopUPNM})
	$_L_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
	If ($_L_PropertyColumn>0)
		$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_L_PropertyColumn}
	Else 
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
		AA_GetListItemProperty("SUBLIST"; ->$_l_SubListNUM)
		
	End if 
	ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
	ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
	If ($_l_SubListNUM>0)
		AA_LoadListbyID($_l_SubListNUM; ->AA_at_SubSublistPOPNMs; ->AA_al_SubListItemsPOPIDs; False:C215)
		SORT ARRAY:C229(AA_at_SubSublistPOPNMs; AA_al_SubListItemsPOPIDs)
		
	End if 
	//now put the values into the powerview area(its al at the mo)
	ARRAY PICTURE:C279(QV_apic_PopupIcons; 0)
	ARRAY TEXT:C222(QV_at_QualityNames; 0)
	ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
	ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
	ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
	ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)  //NG Checked April 2020
	ARRAY LONGINT:C221(QV_al_QualityYears; 0)  //NG CHecked April 2020
	ARRAY INTEGER:C220(QV_ai_include; 0)
	ARRAY BOOLEAN:C223(QV_abo_include; 0)
	ARRAY LONGINT:C221(QV_al_RecordIDs; 0)
	ARRAY INTEGER:C220(QV_ai_Exclude; 0)
	ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
	For ($_l_SubIndex; 1; Size of array:C274(AA_at_SubSublistPOPNMs))
		INSERT IN ARRAY:C227(QV_apic_PopupIcons; Size of array:C274(QV_apic_PopupIcons)+1; 1)
		
		INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
		INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
		INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
		INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
		INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)
		INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
		QV_apic_PopupIcons{Size of array:C274(QV_apic_PopupIcons)}:=QV_pic_PopupIcon
		QV_al_QualityIDs{Size of array:C274(QV_al_QualityIDs)}:=AA_al_SubListItemsPOPIDs{$_l_SubIndex}
		QV_at_QualityNames{Size of array:C274(QV_at_QualityNames)}:=AA_at_SubSublistPOPNMs{$_l_SubIndex}
		QV_abo_include{Size of array:C274(QV_abo_include)}:=False:C215
		QV_al_GroupIDs{Size of array:C274(QV_al_GroupIDs)}:=QV_al_GroupsPOPUPID{QV_at_GroupsPopUPNM}
		
	End for 
	ARRAY LONGINT:C221(QV_al_RecordIDs; 0)
	ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
	ARRAY LONGINT:C221(QV_al_RecordIDs; Size of array:C274(QV_al_GroupIDs))
	ARRAY BOOLEAN:C223(QV_abo_Exclude; Size of array:C274(QV_al_GroupIDs))
	//need to set any values of already set items here
	$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
	$_l_SelectedListItem:=List item position:C629(QV_HL_QualitiesList; QV_al_GroupsPOPUPID{QV_at_GroupsPopUPNM})
	If ($_l_SelectedListItem>0)
		GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		If (Not:C34($_bo_Expanded))
			//expand it
			SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
		End if 
		$_l_CountListItems2:=Count list items:C380(QV_HL_QualitiesList)
		If ($_l_CountListItems2>$_l_CountListItems)
			$_l_Items:=$_l_CountListItems2-$_l_CountListItems  //number of items in sublist
		Else 
			$_l_Items:=$_l_CountListItems
		End if 
		
		
		For ($_l_SelectedListItem2; $_l_SelectedListItem+1; $_l_Items)
			GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
			If ($_l_SublistID2=0)
				
				
				$_l_QualityRow:=Find in array:C230(QV_al_QualityRecordID; $_l_itemReference2)
				If ($_l_QualityRow>0)
					//the Quality list id is
					$_l_ListItemID:=QV_al_QualityID{$_l_QualityRow}
					$_l_QualityRow2:=Find in array:C230(QV_al_QualityIDs; $_l_ListItemID)
					If ($_l_QualityRow2>0)  //it should be
						QV_al_RecordIDs{$_l_QualityRow2}:=$_l_itemReference2
						QV_abo_include{$_l_QualityRow2}:=True:C214
						QV_al_QualityLevelLevels{$_l_QualityRow2}:=QV_ar_QualityLevel{$_l_QualityRow}
						QV_al_QualityQualityYears{$_l_QualityRow2}:=(QV_al_QualityYear{$_l_QualityRow})
						
					End if 
					
				End if 
			Else 
				$_l_SelectedListItem2:=$_l_Items  //we have reached the next group
			End if 
			
		End for 
	End if 
	//AL_UpdateArrays (QV_l_Powerview;-2)
	
	
End if 
ERR_MethodTrackerReturn("QV_GroupPopUpScript"; $_t_oldMethodName)
