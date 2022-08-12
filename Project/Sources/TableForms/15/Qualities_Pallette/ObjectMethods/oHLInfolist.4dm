If (False:C215)
	//object Name: [USER]Qualities_Pallette.oHLInfolist
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
	//ARRAY LONGINT(AA_al_SubListItemsIDs;0)
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistItemNMs;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Expanded2; QV_bo_AlPopulated)
	C_LONGINT:C283($_l_event; $_l_GroupReferenceRow; $_l_ItemReference; $_l_itemReference2; $_l_ListItemRow; $_l_PropertyReferenceRow; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SubListID; $_l_SublistID2)
	C_LONGINT:C283(Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_l_CurrentMode; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName; QV_T_MultiADD; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.oHLInfolist"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (FORM Get current page:C276=2) | (FORM Get current page:C276=3)
			Case of 
				: (FORM Get current page:C276=2)
					If (QV_T_MultiADD#"")
						QV_SaveFromMultiAdd
					End if 
					
				: (FORM Get current page:C276=3)
					If (QV_bo_AlPopulated)
						//the al was already populated so save it first
						CONFIRM:C162("Save "+QV_t_QualitiesGroupName+"?"; "Yes"; "No")
						If (OK=1)
							QV_SaveFromPowerview(QV_t_QualitiesGroupName)
						End if 
					End if 
					
			End case 
			QV_l_SelectedQualityID:=0
			QV_t_QualitiesGroupName:=""
			QV_t_QualityName:=""
			QV_t_QualityDescription:=""
			QV_R_QualityLevel:=0
			QV_l_QualityYear:=0
			OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
			OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
			OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
			ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
			ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
			OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
			// SET ENTERABLE(QV_R_QualityLevel;False)
			OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
			OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)  //NG Checked April 2020
			QV_al_QualityYear:=0  //NG Checked April 2020
			QV_ar_QualityLevel:=0
			GOTO OBJECT:C206(QV_HL_QualitiesList)
			OBJECT SET TITLE:C194(Badd; "Add")
			OBJECT SET TITLE:C194(BDelete; "Delete")
			OBJECT SET ENABLED:C1123(Bedit; False:C215)
			OBJECT SET ENABLED:C1123(BDelete; False:C215)
			//_O_DISABLE BUTTON(Bedit)
			//_O_DISABLE BUTTON(BDelete)
			QV_l_CurrentMode:=1
			FORM GOTO PAGE:C247(1)
		End if 
		
		
		$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
		
		GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		Case of 
			: (QV_l_CurrentMode=1)
				
				$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
				//no current item loaded
				//just load this item
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
					$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
					GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
					$_l_GroupReferenceRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_itemReference2)
					If ($_l_GroupReferenceRow>0)
						$_l_SubListID:=0
						$_l_PropertyReferenceRow:=Find in array:C230(QV_at_QualityProperties{$_l_GroupReferenceRow}; "SUBLIST")
						If ($_l_PropertyReferenceRow>0)
							$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_GroupReferenceRow}{$_l_PropertyReferenceRow}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupReferenceRow})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
						End if 
						If ($_l_SubListID>0)
							ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
							AA_LoadListbyID($_l_SubListID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
							$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
							
							QV_l_SelectedQualityID:=$_l_ItemReference
							QV_t_QualitiesGroupName:=$_t_ItemText2
							$_l_GroupReferenceRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_itemReference2)
							If ($_l_GroupReferenceRow>0)
								$_l_SubListID:=0
								$_l_PropertyReferenceRow:=Find in array:C230(QV_at_QualityProperties{$_l_GroupReferenceRow}; "SUBLIST")
								If ($_l_PropertyReferenceRow>0)
									$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_GroupReferenceRow}{$_l_PropertyReferenceRow}
								Else 
									QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupReferenceRow})
									AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
								End if 
								If ($_l_SubListID>0)
									ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
									ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
									AA_LoadListbyID($_l_SubListID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
									QV_t_QualityName:=AA_at_SubSublistItemNMs{Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ListItemRow})}
									QV_t_QualityDescription:=QV_at_QualityDetail{$_l_ListItemRow}
									QV_R_QualityLevel:=QV_ar_QualityLevel{$_l_ListItemRow}
									QV_l_QualityYear:=QV_al_QualityYear{$_l_ListItemRow}
									OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
									OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
									OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
									// SET ENTERABLE(QV_R_QualityLevel;True)
									OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
									OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
									OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
									OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)
									// SET ENTERABLE(QV_l_QualityYear;True)
									GOTO OBJECT:C206(QV_t_QualityName)
									OBJECT SET TITLE:C194(Badd; "Save")
									// DISABLE BUTTON(Badd)
									OBJECT SET TITLE:C194(BDelete; "Delete")
									OBJECT SET ENABLED:C1123(Bedit; True:C214)
									OBJECT SET ENABLED:C1123(BDelete; True:C214)
									//_O_ENABLE BUTTON(Bedit)
									//_O_ENABLE BUTTON(BDelete)
									QV_l_CurrentMode:=3
								End if 
							End if 
						End if 
					End if 
				Else 
					//selected a parent item
					//this is the same as clicking "Add Information"
					If (False:C215)
						SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
						$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
						GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
						SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
						$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
						QV_l_SelectedQualityID:=-1
						QV_t_QualitiesGroupName:=$_t_ItemText
						QV_t_QualityName:=""
						QV_t_QualityDescription:=""
						QV_R_QualityLevel:=0
						QV_l_QualityYear:=0
						OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; True:C214)
						// SET ENTERABLE(QV_R_QualityLevel;True)
						OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture25"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture26"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; True:C214)
						// SET ENTERABLE(QV_l_QualityYear;True)
						GOTO OBJECT:C206(QV_t_QualityName)
						OBJECT SET TITLE:C194(Badd; "Save")
						OBJECT SET TITLE:C194(BDelete; "Clear")
						//_O_DISABLE BUTTON(Bedit)
						//_O_ENABLE BUTTON(BDelete)
						OBJECT SET ENABLED:C1123(Bedit; False:C215)
						OBJECT SET ENABLED:C1123(BDelete; True:C214)
						QV_l_CurrentMode:=2
					End if 
					
				End if 
				
			: (QV_l_CurrentMode=2) | (QV_l_CurrentMode=3)
				//SAVED OR UNSAVED ITEM IS LOADED
				//save the existing item first
				QV_SaveCurrentQuality(True:C214; QV_l_SelectedQualityID)
				$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
				//no current item loaded
				//just load this item
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
					$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
					GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
					SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
					$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
					QV_l_SelectedQualityID:=$_l_ItemReference
					QV_t_QualitiesGroupName:=$_t_ItemText2
					$_l_GroupReferenceRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_itemReference2)
					If ($_l_GroupReferenceRow>0)
						$_l_SubListID:=0
						$_l_PropertyReferenceRow:=Find in array:C230(QV_at_QualityProperties{$_l_GroupReferenceRow}; "SUBLIST")
						If ($_l_PropertyReferenceRow>0)
							$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_GroupReferenceRow}{$_l_PropertyReferenceRow}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupReferenceRow})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
						End if 
						If ($_l_SubListID>0)
							
							ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
							AA_LoadListbyID($_l_SubListID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							QV_t_QualityName:=AA_at_SubSublistItemNMs{Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ListItemRow})}
							
							QV_t_QualityDescription:=QV_at_QualityDetail{$_l_ListItemRow}
							QV_R_QualityLevel:=QV_ar_QualityLevel{$_l_ListItemRow}
							QV_l_QualityYear:=QV_al_QualityYear{$_l_ListItemRow}  //NG Checked April 2020
							OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
							// SET ENTERABLE(QV_R_QualityLevel;True)
							OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)
							// SET ENTERABLE(QV_l_QualityYear;True)
							GOTO OBJECT:C206(QV_t_QualityName)
							OBJECT SET TITLE:C194(Badd; "Save")
							// DISABLE BUTTON(Badd)
							OBJECT SET TITLE:C194(BDelete; "Delete")
							//_O_ENABLE BUTTON(Bedit)
							//_O_ENABLE BUTTON(Bdelete)
							OBJECT SET ENABLED:C1123(Bedit; True:C214)
							OBJECT SET ENABLED:C1123(BDelete; True:C214)
							QV_l_CurrentMode:=3
						End if 
					End if 
				Else 
					//selected a parent item
					//this is the same as clicking "Add quality"
					If (False:C215)
						SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
						$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
						GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
						SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
						$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
						QV_l_SelectedQualityID:=-1
						QV_t_QualitiesGroupName:=$_t_ItemText
						QV_t_QualityName:=""
						QV_t_QualityDescription:=""
						QV_R_QualityLevel:=0
						QV_l_QualityYear:=0
						OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; True:C214)
						// SET ENTERABLE(QV_R_QualityLevel;True)
						OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture25"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture26"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; True:C214)
						// SET ENTERABLE(QV_l_QualityYear;True)
						GOTO OBJECT:C206(QV_t_QualityName)
						OBJECT SET TITLE:C194(Badd; "Save")
						OBJECT SET TITLE:C194(BDelete; "Clear")
						//_O_DISABLE BUTTON(Bedit)
						//_O_ENABLE BUTTON(BDelete)
						OBJECT SET ENABLED:C1123(Bedit; False:C215)
						OBJECT SET ENABLED:C1123(BDelete; True:C214)
						QV_l_CurrentMode:=2
					End if 
				End if 
				
		End case 
		
		
	: ($_l_event=On Double Clicked:K2:5)
		//in this case we load and set the edit button
		$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
		GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		Case of 
			: (QV_l_CurrentMode=1)
				
				$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
				//no current item loaded
				//just load this item
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
					$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
					GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
					SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
					$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
					QV_l_SelectedQualityID:=$_l_ItemReference
					QV_t_QualitiesGroupName:=$_t_ItemText2
					$_l_GroupReferenceRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_itemReference2)
					If ($_l_GroupReferenceRow>0)
						$_l_SubListID:=0
						$_l_PropertyReferenceRow:=Find in array:C230(QV_at_QualityProperties{$_l_GroupReferenceRow}; "SUBLIST")
						If ($_l_PropertyReferenceRow>0)
							$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_GroupReferenceRow}{$_l_PropertyReferenceRow}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupReferenceRow})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
						End if 
						If ($_l_SubListID>0)
							
							ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
							AA_LoadListbyID($_l_SubListID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							QV_t_QualityName:=AA_at_SubSublistItemNMs{Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ListItemRow})}
							
							
							QV_t_QualityDescription:=QV_at_QualityDetail{$_l_ListItemRow}
							QV_R_QualityLevel:=QV_ar_QualityLevel{$_l_ListItemRow}
							QV_l_QualityYear:=QV_al_QualityYear{$_l_ListItemRow}  //NG Checked April 2020
							OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
							// SET ENTERABLE(QV_R_QualityLevel;True)
							OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)
							// SET ENTERABLE(QV_l_QualityYear;True)
							GOTO OBJECT:C206(QV_t_QualityName)
							OBJECT SET TITLE:C194(Badd; "Save")
							// DISABLE BUTTON(Badd)
							OBJECT SET TITLE:C194(BDelete; "Delete")
							//_O_ENABLE BUTTON(Bedit)
							//_O_ENABLE BUTTON(Bdelete)
							OBJECT SET ENABLED:C1123(Bedit; True:C214)
							OBJECT SET ENABLED:C1123(BDelete; True:C214)
							QV_l_CurrentMode:=3
						End if 
					End if 
				Else 
					//selected a parent item
					//this is the same as clicking "Add quality"
					
				End if 
				
			: (QV_l_CurrentMode=2) | (QV_l_CurrentMode=3)
				//SAVED OR UNSAVED ITEM IS LOADED
				//save the existing item first
				QV_SaveCurrentQuality(True:C214; QV_l_SelectedQualityID)
				$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
				//no current item loaded
				//just load this item
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
					$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
					GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
					SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
					$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
					QV_l_SelectedQualityID:=$_l_ItemReference
					QV_t_QualitiesGroupName:=$_t_ItemText2
					$_l_GroupReferenceRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_itemReference2)
					If ($_l_GroupReferenceRow>0)
						$_l_SubListID:=0
						$_l_PropertyReferenceRow:=Find in array:C230(QV_at_QualityProperties{$_l_GroupReferenceRow}; "SUBLIST")
						If ($_l_PropertyReferenceRow>0)
							$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_GroupReferenceRow}{$_l_PropertyReferenceRow}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupReferenceRow})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
						End if 
						If ($_l_SubListID>0)
							ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
							AA_LoadListbyID($_l_SubListID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							QV_t_QualityName:=AA_at_SubSublistItemNMs{Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ListItemRow})}
							
							QV_t_QualityDescription:=QV_at_QualityDetail{$_l_ListItemRow}
							QV_R_QualityLevel:=QV_ar_QualityLevel{$_l_ListItemRow}
							QV_l_QualityYear:=QV_al_QualityYear{$_l_ListItemRow}  //NG Checked April 2020
							OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
							OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
							// SET ENTERABLE(QV_R_QualityLevel;True)
							OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
							OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)
							// SET ENTERABLE(QV_l_QualityYear;True)
							GOTO OBJECT:C206(QV_t_QualityName)
							OBJECT SET TITLE:C194(Badd; "Save")
							// DISABLE BUTTON(Badd)
							OBJECT SET TITLE:C194(BDelete; "Delete")
							//_O_ENABLE BUTTON(Bedit)
							
							//_O_ENABLE BUTTON(BDelete)
							OBJECT SET ENABLED:C1123(Bedit; True:C214)
							OBJECT SET ENABLED:C1123(BDelete; True:C214)
							QV_l_CurrentMode:=3
						End if 
					End if 
				Else 
					//selected a parent item
					//this is the same as clicking "Add quality"
					If (False:C215)
						SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
						$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
						GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
						SELECT LIST ITEMS BY POSITION:C381(QV_HL_QualitiesList; $_l_SelectedListItem)
						$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
						QV_l_SelectedQualityID:=-1
						QV_t_QualitiesGroupName:=$_t_ItemText
						QV_t_QualityName:=""
						QV_t_QualityDescription:=""
						QV_R_QualityLevel:=0
						QV_l_QualityYear:=0
						OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityName; True:C214)
						OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; True:C214)
						// SET ENTERABLE(QV_R_QualityLevel;True)
						OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture25"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Picture26"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; True:C214)
						// SET ENTERABLE(QV_l_QualityYear;True)
						GOTO OBJECT:C206(QV_t_QualityName)
						OBJECT SET TITLE:C194(Badd; "Save")
						OBJECT SET TITLE:C194(BDelete; "Clear")
						//_O_DISABLE BUTTON(Bedit)
						OBJECT SET ENABLED:C1123(BDelete; True:C214)
						//_O_ENABLE BUTTON(BDelete)
						OBJECT SET ENABLED:C1123(Bedit; False:C215)
						OBJECT SET ENABLED:C1123(BDelete; True:C214)
						QV_l_CurrentMode:=2
					End if 
				End if 
				
		End case 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.oHLInfolist"; $_t_oldMethodName)
