//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_ParseText
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
	ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; 0)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	ARRAY LONGINT:C221($_al_GroupIDS; 0)
	ARRAY LONGINT:C221($_al_ParentItemReferences; 0)
	ARRAY LONGINT:C221($_al_SubListIDS; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_SelectGroupIDS;0)
	//ARRAY LONGINT(QV_aValidGroupID;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_SelectGroups;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_BOOLEAN:C305($_bo_ExactOrExactNotRequired; $_bo_Expanded; $2; QV_bo_ExactQualityMatchOnly)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CloseBracketPosition; $_l_CountListItems; $_l_Element; $_l_FindNextGroup; $_l_GroupID; $_l_GroupPosition; $_l_GroupRow; $_l_InsertItemAt; $_l_ItemID; $_l_ItemPosition)
	C_LONGINT:C283($_l_ItemReference; $_l_LoadSubGroup; $_l_OpenBracketPosition; $_l_ParentIndex; $_l_ParentReferenceElement; $_l_PropertyColumn; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SubElement; $_l_SublistID; $_l_SublistNumber)
	C_LONGINT:C283($3; QV_HL_QualitiesList; QV_l_insertExistingGroupPos)
	C_TEXT:C284($_t_Group; $_t_Item; $_t_ItemText; $_t_oldMethodName; $_t_QualitiesTEXT; $_t_QualityItemName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_ParseText")

//TRACE
ARRAY LONGINT:C221($_al_ParentItemReferences; 0)
ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; 0)


If (Count parameters:C259>=1)
	$_t_QualitiesTEXT:=$1
	Repeat 
		$_l_CharacterPosition:=Position:C15(","; $_t_QualitiesTEXT)
		If ($_l_CharacterPosition>0)
			$_t_QualityItemName:=Substring:C12($_t_QualitiesTEXT; 1; $_l_CharacterPosition-1)
			$_t_QualitiesTEXT:=Substring:C12($_t_QualitiesTEXT; $_l_CharacterPosition+1; Length:C16($_t_QualitiesTEXT))
		Else 
			$_t_QualityItemName:=$_t_QualitiesTEXT
			$_t_QualitiesTEXT:=""
		End if 
		If ($_t_QualityItemName#"")
			$_t_Group:=""
			$_t_Item:=""
			$_l_OpenBracketPosition:=Position:C15("["; $_t_QualityItemName)
			If ($_l_OpenBracketPosition>0)
				$_l_CloseBracketPosition:=Position:C15("]"; $_t_QualityItemName)
				If ($_l_CloseBracketPosition>0)
					$_t_Group:=Substring:C12($_t_QualityItemName; $_l_OpenBracketPosition+1; ($_l_CloseBracketPosition-$_l_OpenBracketPosition)-1)
					If ($_l_CloseBracketPosition<Length:C16($_t_QualityItemName))
						$_t_Item:=Substring:C12($_t_QualityItemName; $_l_CloseBracketPosition+1; Length:C16($_t_QualityItemName))
						If ($_t_Item#"")
							If ($_t_Item[[1]]=" ")
								$_t_Item:=Substring:C12($_t_Item; 2; Length:C16($_t_Item))
							End if 
						End if 
						If ($_t_Item#"")
							If ($_t_Item[[Length:C16($_t_Item)]]=" ")
								$_t_Item:=Substring:C12($_t_Item; 1; Length:C16($_t_Item)-1)
							End if 
						End if 
					Else 
						$_t_Item:=""
					End if 
					
				Else 
					$_t_Group:=""
					$_t_Item:=$_t_QualityItemName
					If ($_t_Item#"")
						If ($_t_Item[[1]]=" ")
							$_t_Item:=Substring:C12($_t_Item; 2; Length:C16($_t_Item))
						End if 
					End if 
					If ($_t_Item#"")
						If ($_t_Item[[Length:C16($_t_Item)]]=" ")
							$_t_Item:=Substring:C12($_t_Item; 1; Length:C16($_t_Item)-1)
						End if 
					End if 
				End if 
			Else 
				$_t_Group:=""
				$_t_Item:=$_t_QualityItemName
				If ($_t_Item#"")
					If ($_t_Item[[1]]=" ")
						$_t_Item:=Substring:C12($_t_Item; 2; Length:C16($_t_Item))
					End if 
				End if 
				If ($_t_Item#"")
					If ($_t_Item[[Length:C16($_t_Item)]]=" ")
						$_t_Item:=Substring:C12($_t_Item; 1; Length:C16($_t_Item)-1)
					End if 
				End if 
			End if 
			If ($_t_Item#"")
				If ($_t_Item[[1]]=" ")
					$_t_Item:=Substring:C12($_t_Item; 2; Length:C16($_t_Item))
				End if 
				$_l_GroupID:=0
				If ($_t_Group#"")  //a group is entered
					$_l_GroupRow:=Find in array:C230(QV_at_QualityGroupsNM; $_t_Group)
					If ($_l_GroupRow>0)
						$_l_GroupID:=QV_al_QualityGroupsIDs{$_l_GroupRow}
						ARRAY LONGINT:C221($_al_ParentItemReferences; 0)
						ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; 0)
						
					Else 
						//this is not a known group-user will need to fix or ignore
						ARRAY TEXT:C222(QV_at_SelectGroups; 0)
						ARRAY LONGINT:C221(QV_al_SelectGroupIDS; 0)
						ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
						ARRAY TEXT:C222(QV_at_SelectGroups; Size of array:C274(QV_at_QualityGroupsNM))
						ARRAY LONGINT:C221(QV_al_SelectGroupIDS; Size of array:C274(QV_at_QualityGroupsNM))
						ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_QualityGroupsNM))
						For ($_l_SelectedListItem; 1; Size of array:C274(QV_al_SelectGroupIDS))
							QV_at_SelectGroups{$_l_SelectedListItem}:=QV_at_QualityGroupsNM{$_l_SelectedListItem}
							QV_al_SelectGroupIDS{$_l_SelectedListItem}:=QV_al_SelectGroupIDS{$_l_SelectedListItem}
						End for 
						QV_SelectGroupORitem(2; $_t_Group; ->QV_at_SelectGroups; ->QV_al_SelectGroupIDS; ->QV_al_ValidGroupID)
						For ($_l_SelectedListItem; 1; Size of array:C274(QV_al_ValidGroupID))
							If (QV_al_ValidGroupID{$_l_SelectedListItem}=1)  //this is selected
								//recall this method with the one item of text
								
								
								Case of 
									: (Count parameters:C259=1)
										QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item)
									: (Count parameters:C259=2)
										QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item; $2)
									: (Count parameters:C259=3)
										QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item; $2; $3)
								End case 
							End if 
						End for 
						$_t_Item:=""
						$_t_Group:=""
						$_l_GroupID:=0
						$_l_ItemID:=0
						ARRAY LONGINT:C221($_al_ParentItemReferences; 0)
						ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; 0)
						
					End if 
					
				Else 
					//`GROUP Is not entered have to find it
					If (Count parameters:C259<3)
						$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
					Else 
						$_l_CountListItems:=Count list items:C380($3)
					End if 
					//first make sure everything is expanded
					ARRAY LONGINT:C221($_al_GroupIDS; 0)
					ARRAY LONGINT:C221($_al_GroupIDS; Size of array:C274(QV_al_QualityGroupsIDs))
					ARRAY LONGINT:C221($_al_SubListIDS; Size of array:C274(QV_al_QualityGroupsIDs))
					$_l_Element:=0
					$_l_SubElement:=0
					ARRAY LONGINT:C221($_al_ParentItemReferences; 99)
					ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; 99)
					$_l_ParentReferenceElement:=0
					For ($_l_SelectedListItem; $_l_CountListItems; 1; -1)
						
						If (Count parameters:C259<3)
							GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
						Else 
							GET LIST ITEM:C378($3; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
						End if 
						If ($_l_SublistID>0)
							$_l_ParentReferenceElement:=$_l_ParentReferenceElement+$_l_ParentReferenceElement
							If ($_l_ParentReferenceElement>Size of array:C274($_al_ParentItemReferences))
								INSERT IN ARRAY:C227($_al_ParentItemReferences; Size of array:C274($_al_ParentItemReferences)+1; 99)
								INSERT IN ARRAY:C227($_abo_ListExpandedSetting; Size of array:C274($_abo_ListExpandedSetting)+1; 99)
							End if 
							$_l_SubElement:=$_l_SubElement+1
							$_al_SubListIDS{$_l_SubElement}:=$_l_SublistID
							$_al_ParentItemReferences{$_l_ParentReferenceElement}:=$_l_ItemReference
							$_abo_ListExpandedSetting{$_l_ParentReferenceElement}:=$_bo_Expanded
							
							If (Count parameters:C259<3)
								SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
							Else 
								SET LIST ITEM:C385($3; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
							End if 
							
							
						End if 
					End for 
					ARRAY LONGINT:C221($_al_ParentItemReferences; $_l_ParentReferenceElement)
					ARRAY BOOLEAN:C223($_abo_ListExpandedSetting; $_l_ParentReferenceElement)
					$_l_ParentReferenceElement:=0
					
					ARRAY LONGINT:C221($_al_SubListIDS; $_l_SubElement)
					
					//everything is expanded-find any groups this item exists in
					If (Count parameters:C259<3)
						$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
					Else 
						$_l_CountListItems:=Count list items:C380($3)
					End if 
					
					For ($_l_SelectedListItem; $_l_CountListItems; 1; -1)
						If (Count parameters:C259<3)
							GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
						Else 
							GET LIST ITEM:C378($3; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
						End if 
						
						If ($_l_SublistID=0)
							$_l_SelectedListItem2:=Position:C15($_t_Item; $_t_ItemText)
							If ($_t_ItemText=$_t_Item) | ($_l_SelectedListItem2>0)
								If (Count parameters:C259<3)
									$_l_GroupRow:=Find in array:C230($_al_GroupIDS; List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference))
									If ($_l_GroupRow<0)
										$_l_Element:=$_l_Element+1
										$_al_GroupIDS{$_l_Element}:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
									End if 
								Else 
									$_l_GroupRow:=Find in array:C230($_al_GroupIDS; List item parent:C633($3; $_l_ItemReference))
									If ($_l_GroupRow<0)
										$_l_Element:=$_l_Element+1
										$_al_GroupIDS{$_l_Element}:=List item parent:C633($3; $_l_ItemReference)
									End if 
								End if 
								
							End if 
							
						End if 
					End for 
					ARRAY LONGINT:C221($_al_GroupIDS; $_l_Element)
					Case of 
						: ($_l_Element=1)  //only one group
							$_l_GroupID:=$_al_GroupIDS{1}
							$_t_Group:=QV_at_QualityGroupsNM{Find in array:C230(QV_al_QualityGroupsIDs; $_l_GroupID)}
							
						: ($_l_Element>1)  //several groups(select)
							ARRAY TEXT:C222(QV_at_SelectGroups; 0)
							ARRAY LONGINT:C221(QV_al_SelectGroupIDS; 0)
							ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
							ARRAY TEXT:C222(QV_at_SelectGroups; Size of array:C274($_al_GroupIDS))
							ARRAY LONGINT:C221(QV_al_SelectGroupIDS; Size of array:C274($_al_GroupIDS))
							ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274($_al_GroupIDS))
							For ($_l_SelectedListItem; 1; Size of array:C274($_al_GroupIDS))
								QV_at_SelectGroups{$_l_SelectedListItem}:=QV_at_QualityGroupsNM{Find in array:C230(QV_al_QualityGroupsIDs; $_al_GroupIDS{$_l_SelectedListItem})}
								QV_al_SelectGroupIDS{$_l_SelectedListItem}:=$_al_GroupIDS{$_l_SelectedListItem}
							End for 
							QV_SelectGroupORitem(1; $_t_Item; ->QV_at_SelectGroups; ->QV_al_SelectGroupIDS; ->QV_al_ValidGroupID)
							For ($_l_SelectedListItem; 1; Size of array:C274(QV_al_ValidGroupID))
								If (QV_al_ValidGroupID{$_l_SelectedListItem}=1)  //this is selected
									//recall this method with the one item of text
									Case of 
										: (Count parameters:C259=1)
											QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item)
										: (Count parameters:C259=2)
											QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item; $2)
										: (Count parameters:C259=3)
											QV_ParseText("["+QV_at_SelectGroups{$_l_SelectedListItem}+"]"+$_t_Item; $2; $3)
									End case 
									
								End if 
							End for 
							$_t_Item:=""
							$_t_Group:=""
							$_l_GroupID:=0
							$_l_ItemID:=0
							
						Else 
							//no item found
							Gen_Alert($_t_Item+" does not exist in any group, it will be ignored!")
					End case 
					
				End if 
				If ($_l_GroupID>0)
					//the group is now identified
					$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_GroupID)
					//->QV_at_QualityProperties;->QV_al_QualityPropertiesNUM;->QV_at_QualityPropertiesNAM)
					$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
					If ($_l_PropertyColumn>0)
						$_l_SublistNumber:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
						AA_GetListItemProperty("SUBLIST"; ->$_l_SublistNumber)
					End if 
					If ($_l_SublistNumber>0)
						AA_LoadListbyID($_l_SublistNumber; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
						SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
						
					End if 
					//now look for the item entered
					For ($_l_CountListItems; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
						$_l_ItemID:=0
						$_l_SelectedListItem2:=Position:C15($_t_Item; QV_at_QualitySubGroupsNM{$_l_CountListItems})
						$_bo_ExactOrExactNotRequired:=True:C214
						If (QV_bo_ExactQualityMatchOnly)
							If (QV_at_QualitySubGroupsNM{$_l_CountListItems}#$_t_Item) & ((QV_at_QualitySubGroupsNM{$_l_CountListItems}+" ")#$_t_Item) & ((" "+QV_at_QualitySubGroupsNM{$_l_CountListItems})#$_t_Item)
								$_bo_ExactOrExactNotRequired:=False:C215  //ie exactly make sure we don't copy down quality codes that just CONTAIN the item that the user selected (e.g..if user selects "HTML" just grab that (or " HTML" or "HTML ") but not "XHTML" and "HTML - dreamweaver"
							End if 
						End if 
						If ($_l_SelectedListItem2>0) & ($_bo_ExactOrExactNotRequired)
							$_l_ItemReference:=$_l_CountListItems
							If ($_l_ItemReference>0)
								$_l_ItemID:=QV_al_QualitySubGroupsIDs{$_l_ItemReference}
							Else 
								//item not found user to select
								ARRAY TEXT:C222(QV_at_SelectGroups; 0)
								ARRAY LONGINT:C221(QV_al_SelectGroupIDS; 0)
								ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
								ARRAY TEXT:C222(QV_at_SelectGroups; Size of array:C274(QV_at_QualitySubGroupsNM))
								ARRAY LONGINT:C221(QV_al_SelectGroupIDS; Size of array:C274(QV_at_QualitySubGroupsNM))
								ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_QualitySubGroupsNM))
								For ($_l_SelectedListItem; 1; Size of array:C274($_al_GroupIDS))
									QV_at_SelectGroups{$_l_SelectedListItem}:=QV_at_QualityGroupsNM{$_l_SelectedListItem}
									QV_al_SelectGroupIDS{$_l_SelectedListItem}:=$_al_GroupIDS{$_l_SelectedListItem}
								End for 
								If (False:C215)  //See email by NG to BW on 30/01/03 7:05pm
									For ($_l_SelectedListItem; 1; Size of array:C274($_al_GroupIDS))
										QV_at_SelectGroups{$_l_SelectedListItem}:=QV_at_QualitySubGroupsNM{$_l_SelectedListItem}
										QV_al_SelectGroupIDS{$_l_SelectedListItem}:=QV_al_QualitySubGroupsIDs{$_l_SelectedListItem}
									End for 
								End if 
								QV_SelectGroupORitem(3; $_t_Item; ->QV_at_SelectGroups; ->QV_al_SelectGroupIDS; ->QV_al_ValidGroupID)
								//this time we are returned an ITEM ID
								For ($_l_SelectedListItem; 1; Size of array:C274(QV_al_ValidGroupID))
									If (QV_al_ValidGroupID{$_l_SelectedListItem}=1)  //this is selected
										//recall this method with the one item of text
										
										Case of 
											: (Count parameters:C259=1)
												QV_ParseText("["+$_t_Group+"]"+QV_at_SelectGroups{$_l_SelectedListItem})
											: (Count parameters:C259=2)
												QV_ParseText("["+$_t_Group+"]"+QV_at_SelectGroups{$_l_SelectedListItem}; $2)
											: (Count parameters:C259=3)
												QV_ParseText("["+$_t_Group+"]"+QV_at_SelectGroups{$_l_SelectedListItem}; $2; $3)
										End case 
									End if 
								End for 
								$_t_Item:=""
								$_t_Group:=""
								$_l_GroupID:=0
								$_l_ItemID:=0
								
							End if 
						End if 
						
						
						
						If ($_l_ItemID>0)
							$_l_GroupPosition:=Find in array:C230(QV_al_GroupIDs; $_l_GroupID)
							If ($_l_GroupPosition>0)
								//this group is already in our array
								//Check the item is not already there
								$_l_ItemPosition:=Find in array:C230(QV_al_QualityIDs; $_l_ItemID)
								If ($_l_ItemPosition>0)
									//just check that the tick is ticked
									//QV_ai_include{$_l_ItemPosition}:=1
									QV_abo_include{$_l_ItemPosition}:=True:C214
								Else 
									//item is not there already
									
									//added 31/08/06 - kmw - Altered to find position to insert the new item at the end of the group it belongs to  (as opposed to start of group which was causing problems)
									$_l_InsertItemAt:=0
									If ($_l_GroupPosition<Size of array:C274(QV_al_GroupIDs))
										For ($_l_FindNextGroup; ($_l_GroupPosition+1); Size of array:C274(QV_al_GroupIDs))
											If (QV_at_GroupNames{$_l_FindNextGroup}#"")
												$_l_InsertItemAt:=$_l_FindNextGroup  //found the next group so insertion point equals this element (INSERT ITEM will insert just before this element)
												$_l_FindNextGroup:=Size of array:C274(QV_al_GroupIDs)  //break out of for loop
											End if 
										End for 
									Else 
										$_l_InsertItemAt:=$_l_GroupPosition+1  //for some reason no items on this group so insert striaght after the group
									End if 
									If ($_l_InsertItemAt=0)
										$_l_InsertItemAt:=Size of array:C274(QV_al_GroupIDs)+1  //got all the way through the array without finding the next group so therefore this must be the last group, therefore insert item right at the end
									End if 
									QV_l_insertExistingGroupPos:=$_l_InsertItemAt  //-kmw 31/08/06 - gets used by QV_l_Powerview on Quality Groups Setup Screen
									
									INSERT IN ARRAY:C227(QV_at_GroupNames; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_at_QualityNames; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_al_GroupIDs; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_al_QualityIDs; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_al_QualityQualityYears; $_l_InsertItemAt; 1)  //NG Checked April 2020
									INSERT IN ARRAY:C227(QV_abo_include; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_abo_Exclude; $_l_InsertItemAt; 1)
									
									INSERT IN ARRAY:C227(QV_ai_include; $_l_InsertItemAt; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
									INSERT IN ARRAY:C227(QV_ai_Exclude; $_l_InsertItemAt; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
									
									INSERT IN ARRAY:C227(QV_at_LevelOptions; $_l_InsertItemAt; 1)
									INSERT IN ARRAY:C227(QV_at_YearOptions; $_l_InsertItemAt; 1)
									QV_at_QualityNames{$_l_InsertItemAt}:=QV_at_QualitySubGroupsNM{Find in array:C230(QV_al_QualitySubGroupsIDs; $_l_ItemID)}
									
									QV_al_QualityIDs{$_l_InsertItemAt}:=$_l_ItemID
									//QV_ai_include{$_l_GroupPosition+1}:=1
									QV_abo_include{$_l_InsertItemAt}:=True:C214
									QV_at_LevelOptions{$_l_InsertItemAt}:=">="
									QV_at_YearOptions{$_l_InsertItemAt}:="="
									
									//INSERT ELEMENT(QV_at_GroupNames;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_at_QualityNames;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_al_GroupIDs;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_al_QualityIDs;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_al_QualityLevelLevels;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_al_QualityQualityYears;$_l_GroupPosition+1;1) //NG Checked April 2020
									//INSERT ELEMENT(QV_ai_include;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_ai_Exclude;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_at_LevelOptions;$_l_GroupPosition+1;1)
									//INSERT ELEMENT(QV_at_YearOptions;$_l_GroupPosition+1;1)
									//QV_at_QualityNames{$_l_GroupPosition+1}:=QV_at_QualitySubGroupsNM{Find in array(QV_al_QualitySubGroupsIDs;$_l_ItemID)}
									
									//QV_al_QualityIDs{$_l_GroupPosition+1}:=$_l_ItemID
									//QV_ai_include{$_l_GroupPosition+1}:=1
									//QV_at_LevelOptions{$_l_GroupPosition+1}:=">="
									//QV_at_YearOptions{$_l_GroupPosition+1}:="="
								End if 
								
							Else 
								//The Group is not already
								INSERT IN ARRAY:C227(QV_at_GroupNames; Size of array:C274(QV_at_GroupNames)+1; 1)
								INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
								INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)  //NG Checked April 2020
								INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
								INSERT IN ARRAY:C227(QV_abo_Exclude; Size of array:C274(QV_abo_Exclude)+1; 1)
								
								INSERT IN ARRAY:C227(QV_ai_include; Size of array:C274(QV_ai_include)+1; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
								INSERT IN ARRAY:C227(QV_ai_Exclude; Size of array:C274(QV_ai_include)+1; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
								
								INSERT IN ARRAY:C227(QV_at_LevelOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
								INSERT IN ARRAY:C227(QV_at_YearOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
								QV_at_GroupNames{Size of array:C274(QV_at_GroupNames)}:=$_t_Group
								QV_al_GroupIDs{Size of array:C274(QV_al_GroupIDs)}:=$_l_GroupID
								//QV_ai_include{Size of array(QV_ai_include)}:=0
								QV_abo_include{Size of array:C274(QV_abo_include)}:=False:C215
								INSERT IN ARRAY:C227(QV_at_GroupNames; Size of array:C274(QV_at_GroupNames)+1; 1)
								INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
								INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)  //NG Checked April 2020
								INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
								INSERT IN ARRAY:C227(QV_abo_Exclude; Size of array:C274(QV_abo_Exclude)+1; 1)
								INSERT IN ARRAY:C227(QV_ai_include; Size of array:C274(QV_ai_include)+1; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
								INSERT IN ARRAY:C227(QV_ai_Exclude; Size of array:C274(QV_ai_include)+1; 1)  //added 27/05/08 - kmw, should be no longer needed but just in case
								
								INSERT IN ARRAY:C227(QV_at_LevelOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
								INSERT IN ARRAY:C227(QV_at_YearOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
								QV_at_QualityNames{Size of array:C274(QV_at_QualityNames)}:=QV_at_QualitySubGroupsNM{Find in array:C230(QV_al_QualitySubGroupsIDs; $_l_ItemID)}
								
								
								QV_al_QualityIDs{Size of array:C274(QV_al_QualityIDs)}:=$_l_ItemID
								//QV_ai_include{Size of array(QV_ai_include)}:=1
								QV_abo_include{Size of array:C274(QV_abo_include)}:=True:C214
								QV_at_LevelOptions{Size of array:C274(QV_at_LevelOptions)}:=">="
								QV_at_YearOptions{Size of array:C274(QV_at_LevelOptions)}:="="
							End if 
							
						End if 
					End for 
					
				End if 
				//And here restore the setting of the parent items
				
				
				For ($_l_ParentIndex; Size of array:C274($_al_ParentItemReferences); 1; -1)
					If (Count parameters:C259<3)
						//TRACE
						SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_al_ParentItemReferences{$_l_ParentIndex})
						$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
					Else 
						SELECT LIST ITEMS BY REFERENCE:C630($3; $_al_ParentItemReferences{$_l_ParentIndex})
						$_l_SelectedListItem2:=Selected list items:C379($3)
					End if 
					
					If (Count parameters:C259<3)
						GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					Else 
						GET LIST ITEM:C378($3; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					End if 
					If (Count parameters:C259<3)
						SET LIST ITEM:C385(QV_HL_QualitiesList; $_al_ParentItemReferences{$_l_ParentIndex}; $_t_ItemText; $_l_ItemReference; $_l_SublistID; $_abo_ListExpandedSetting{$_l_ParentIndex})
					Else 
						SET LIST ITEM:C385($3; $_al_ParentItemReferences{$_l_ParentIndex}; $_t_ItemText; $_l_ItemReference; $_l_SublistID; $_abo_ListExpandedSetting{$_l_ParentIndex})
					End if 
					
				End for 
			Else 
				//no item but was there a group
				If ($_t_Group#"")
					$_l_GroupRow:=Find in array:C230(QV_at_QualityGroupsNM; $_t_Group)
					If ($_l_GroupRow>0)
						$_l_GroupID:=QV_al_QualityGroupsIDs{$_l_GroupRow}
					Else 
						//this is not a known group-user will need to fix or ignore
					End if 
					If ($_l_GroupID>0)
						//put the group in
						$_l_GroupPosition:=Find in array:C230(QV_al_GroupIDs; $_l_GroupID)
						If ($_l_GroupPosition>0)
							//make sure the sub group is all there
							$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_GroupID)
							If ($_l_GroupRow>0)
								$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
								If ($_l_PropertyColumn>0)
									$_l_SublistNumber:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
								Else 
									QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
									AA_GetListItemProperty("SUBLIST"; ->$_l_SublistNumber)
								End if 
							End if 
							If ($_l_SublistNumber>0)
								AA_LoadListbyID($_l_SublistNumber; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs)
								SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
								For ($_l_LoadSubGroup; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
									$_l_GroupRow:=Find in array:C230(QV_al_QualityIDs; QV_al_QualitySubGroupsIDs{$_l_LoadSubGroup})
									If ($_l_GroupRow<0)
										INSERT IN ARRAY:C227(QV_at_GroupNames; Size of array:C274(QV_at_GroupNames)+1; 1)
										INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
										INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
										INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
										INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
										INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)  //NG Checked April 2020
										INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
										INSERT IN ARRAY:C227(QV_abo_Exclude; Size of array:C274(QV_abo_Exclude)+1; 1)
										INSERT IN ARRAY:C227(QV_at_LevelOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
										INSERT IN ARRAY:C227(QV_at_YearOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
										QV_at_QualityNames{Size of array:C274(QV_at_QualityNames)}:=QV_at_QualitySubGroupsNM{$_l_LoadSubGroup}
										QV_al_QualityIDs{Size of array:C274(QV_al_QualityIDs)}:=QV_al_QualitySubGroupsIDs{$_l_LoadSubGroup}
										//QV_ai_include{Size of array(QV_ai_include)}:=0
										QV_abo_include{Size of array:C274(QV_abo_include)}:=False:C215
									Else 
										//QV_ai_include{$_l_GroupRow}:=0
										QV_abo_include{$_l_GroupRow}:=False:C215
									End if 
									
								End for 
							End if 
						Else 
							//add the group and all the sub items(only tick the group)
							INSERT IN ARRAY:C227(QV_at_GroupNames; Size of array:C274(QV_at_GroupNames)+1; 1)
							INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
							INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
							INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
							INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
							INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)  //NG Checked April 2020
							INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
							INSERT IN ARRAY:C227(QV_abo_Exclude; Size of array:C274(QV_abo_Exclude)+1; 1)
							INSERT IN ARRAY:C227(QV_at_LevelOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
							INSERT IN ARRAY:C227(QV_at_YearOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
							QV_at_GroupNames{Size of array:C274(QV_at_GroupNames)}:=$_t_Group
							QV_al_GroupIDs{Size of array:C274(QV_al_GroupIDs)}:=$_l_GroupID
							//QV_ai_include{Size of array(QV_ai_include)}:=1
							QV_abo_include{Size of array:C274(QV_abo_include)}:=True:C214
							$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_GroupID)
							$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
							If ($_l_PropertyColumn>0)
								$_l_SublistNumber:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
							Else 
								QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
								AA_GetListItemProperty("SUBLIST"; ->$_l_SublistNumber)
								
							End if 
							If ($_l_SublistNumber>0)
								AA_LoadListbyID($_l_SublistNumber; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs)
								SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
								
								For ($_l_LoadSubGroup; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
									INSERT IN ARRAY:C227(QV_at_GroupNames; Size of array:C274(QV_at_GroupNames)+1; 1)
									INSERT IN ARRAY:C227(QV_at_QualityNames; Size of array:C274(QV_at_QualityNames)+1; 1)
									INSERT IN ARRAY:C227(QV_al_GroupIDs; Size of array:C274(QV_al_GroupIDs)+1; 1)
									INSERT IN ARRAY:C227(QV_al_QualityIDs; Size of array:C274(QV_al_QualityIDs)+1; 1)
									INSERT IN ARRAY:C227(QV_al_QualityLevelLevels; Size of array:C274(QV_al_QualityLevelLevels)+1; 1)
									INSERT IN ARRAY:C227(QV_al_QualityQualityYears; Size of array:C274(QV_al_QualityQualityYears)+1; 1)  //NG Checked April 2020
									INSERT IN ARRAY:C227(QV_abo_include; Size of array:C274(QV_abo_include)+1; 1)
									INSERT IN ARRAY:C227(QV_abo_Exclude; Size of array:C274(QV_abo_Exclude)+1; 1)
									INSERT IN ARRAY:C227(QV_at_LevelOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
									INSERT IN ARRAY:C227(QV_at_YearOptions; Size of array:C274(QV_at_LevelOptions)+1; 1)
									QV_at_QualityNames{Size of array:C274(QV_at_QualityNames)}:=QV_at_QualitySubGroupsNM{$_l_LoadSubGroup}
									QV_al_QualityIDs{Size of array:C274(QV_al_QualityIDs)}:=QV_al_QualitySubGroupsIDs{$_l_LoadSubGroup}
									//QV_ai_include{Size of array(QV_ai_include)}:=0
									QV_abo_include{Size of array:C274(QV_abo_include)}:=False:C215
									QV_at_LevelOptions{Size of array:C274(QV_at_LevelOptions)}:=">="
									QV_at_YearOptions{Size of array:C274(QV_at_LevelOptions)}:="="
								End for 
							End if 
							
						End if 
						
						
						
					End if 
					
				End if 
				
			End if 
			
		End if 
		
	Until ($_t_QualitiesTEXT="")
	
End if 
//If (Count parameters<2)
//AL_UpdateArrays (QV_l_Powerview;-2)
//Else
//If ($2=True)
//AL_UpdateArrays (QV_l_Powerview;-2)
//End if
//End if
If (Count parameters:C259<3)
	// ////////_o_REDRAW LIST(QV_HL_QualitiesList)
Else 
	// ////////_o_REDRAW LIST($3)
	
End if 
ERR_MethodTrackerReturn("QV_ParseText"; $_t_oldMethodName)