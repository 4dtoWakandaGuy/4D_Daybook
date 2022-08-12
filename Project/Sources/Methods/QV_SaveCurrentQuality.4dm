//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_SaveCurrentQuality
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
	//ARRAY DATE(QV_ad_QualityDate;0)
	//ARRAY INTEGER(QV_al_QualityYear;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDs;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsUsed;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityParentID;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_RelatedRecordNum;0)
	//ARRAY LONGINT(QV_al_ValidGroupID;0)
	//ARRAY LONGINT(QV_aValidGroupID;0)
	//ARRAY LONGINT(QV_al_ListItemIDs;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY TEXT(AA_at_SubSublistItemNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityCode;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityGroupsUSED;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_ListItemProperties;0)
	//ARRAY TEXT(QV_at_ListItems;0)
	C_BOOLEAN:C305($_bo_AddRow; $_bo_AskChange; $_bo_Continue; $_bo_Expanded; $_bo_noHL; $1; $3; QV_bo_AddAllowed; QV_bo_ForceNewList; QV_NewList)
	C_LONGINT:C283($_l_AccessNumber; $_l_ArrayElement; $_l_CountGroups; $_l_ExistingItemPosition; $_l_ExistingItemPositionITION; $_l_GroupID; $_l_GroupPosition; $_l_Index; $_l_ItemID; $_l_ItemNamePosition; $_l_ItemPosition)
	C_LONGINT:C283($_l_ListID; $_l_NewItemID; $_l_QualityID; $_l_SublistID; $_l_SublistPropertyPosition; Q_HL_QualitiesList; QV_HL_QualitiesList; QV_HL_SUBLIST; QV_l_DisplayedOwnerID; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285($2; QV_R_QualityLevel)
	C_TEXT:C284($_t_ApplicationVersion; $_t_itemText; $_t_oldMethodName; $_t_SublistIDSTR; $_t_SublistItemName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_SaveCurrentQuality")
//NG Feb2004 Modified to use semaphore before reloading lists

//QV_bo_AddAllowed:=True
If (Count parameters:C259>=1)
	$_bo_AskChange:=$1
Else 
	$_bo_AskChange:=True:C214
End if 
$_bo_noHL:=False:C215
If (Count parameters:C259>=3)
	$_bo_noHL:=$3
End if 
If ($2#0)
	If ($2=-1)
		If (QV_t_QualityName#"")
			//new item
			If ($_bo_AskChange)
				$_bo_Continue:=False:C215
				Gen_Confirm("Save "+QV_t_QualityName+"?"; "Yes"; "No")
				If (Ok=1)
					$_bo_Continue:=True:C214
				End if 
			Else 
				$_bo_Continue:=True:C214
			End if 
			If ($_bo_Continue)
				//need to check the item does not aleady exist
				
				//Find the group
				$_l_GroupPosition:=Find in array:C230(QV_at_QualityGroupsNM; QV_t_QualitiesGroupName)
				If ($_l_GroupPosition<0)
					
					//is this person allowed to add
					Repeat 
						If (QV_bo_AddAllowed)
							//yes they can add-but do they really want to
							If (Not:C34(QV_bo_ForceNewList))
								ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_GroupsPopUPNM))
								QV_SelectGroupORitem(5; QV_t_QualitiesGroupName; ->QV_at_GroupsPopUPNM; ->QV_al_GroupsPOPUPID; ->QV_al_ValidGroupID)
							Else 
								QV_NewList:=True:C214
							End if 
						Else 
							ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_GroupsPopUPNM))
							QV_SelectGroupORitem(6; QV_t_QualitiesGroupName; ->QV_at_GroupsPopUPNM; ->QV_al_GroupsPOPUPID; ->QV_al_ValidGroupID)
						End if 
						
						Case of 
							: (QV_NewList)
								//add a new group
								//add the group to the list of groups
								$_l_GroupID:=AA_ListAddItem(->[INFORMATION:55]QualityID:14; QV_t_QualitiesGroupName)
								//Now we need to create the subgroup
								ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
								ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
								ARRAY TEXT:C222(QV_at_QualityGroups; 0)
								ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
								ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
								ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
								$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
								
								//now create the sublist
								ARRAY TEXT:C222(QV_at_ListItems; 0)
								ARRAY LONGINT:C221(QV_al_ListItemIDs; 0)
								ARRAY TEXT:C222(QV_at_ListItemProperties; 0)
								$_l_ListID:=AA_LoadListByName(QV_t_QualitiesGroupName; ->QV_at_ListItems; ->QV_al_ListItemIDs)
								//that will have created an empty sublist
								//we need the ID of that list
								$_l_SublistID:=AA_GetListbyName(QV_t_QualitiesGroupName)
								READ WRITE:C146([X_LISTS:111])
								QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SublistID)
								$_l_AccessNumber:=0
								$_l_AccessNumber:=$_l_AccessNumber ?+ 5
								AA_SetListProperty("ACCESS"; $_l_AccessNumber)
								DB_SaveRecord(->[X_LISTS:111])
								AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
								//now put the sublist ID onto the list item
								READ WRITE:C146([LIST_ITEMS:95])
								QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_GroupID)
								AA_SetListItemProperty("SUBLIST"; $_l_SublistID)
								DB_SaveRecord(->[LIST_ITEMS:95])
								AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
								UNLOAD RECORD:C212([LIST_ITEMS:95])
								READ ONLY:C145([LIST_ITEMS:95])
								//THIS ITEM CANNOT EXIST SO NOW WE ADD THAT TOO
								If (QV_t_QualityName#"")
									$_l_ItemID:=AA_ListAddItembyID($_l_SublistID; QV_t_QualityName)
									$_l_ListID:=AA_LoadListByName(QV_t_QualitiesGroupName; ->QV_at_ListItems; ->QV_al_ListItemIDs)
								End if 
								INSERT IN ARRAY:C227(QV_al_GroupsPOPUPID; Size of array:C274(QV_al_GroupsPOPUPID)+1; 1)
								INSERT IN ARRAY:C227(QV_at_GroupsPopUPNM; Size of array:C274(QV_at_GroupsPopUPNM)+1; 1)
								QV_al_GroupsPOPUPID{Size of array:C274(QV_al_GroupsPOPUPID)}:=$_l_GroupID
								QV_at_GroupsPopUPNM{Size of array:C274(QV_at_GroupsPopUPNM)}:=QV_t_QualitiesGroupName
								$_bo_Continue:=True:C214
							Else 
								//NEED TO TEST ONLY ONE GROUP HAS BEEN CLICKED
								$_l_CountGroups:=0
								For ($_l_Index; 1; Size of array:C274(QV_al_ValidGroupID))
									If (QV_al_ValidGroupID{$_l_Index}=1)  //this is selected
										$_l_CountGroups:=$_l_CountGroups+1
										$_l_GroupID:=QV_al_GroupsPOPUPID{$_l_Index}
									End if 
								End for 
								If ($_l_CountGroups>1)
									$_bo_Continue:=False:C215
									$_l_GroupID:=0
								Else 
									$_bo_Continue:=True:C214
								End if 
								
								
						End case 
					Until ($_l_GroupID>0) | ($_bo_Continue=False:C215)
				Else 
					$_bo_Continue:=True:C214
					$_l_GroupID:=QV_al_QualityGroupsIDs{$_l_GroupPosition}
				End if 
				If ($_bo_Continue)
					//we can now load the subgroup
					$_l_GroupPosition:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_GroupID)
					If ($_l_GroupPosition>0)
						//    ARRAY STRING(55;QV_at_QualityProperties;0;0)
						//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
						//ARRAY STRING(55;QV_at_QualityPropertiesNAM;0;0)
						$_l_SublistPropertyPosition:=Find in array:C230(QV_at_QualityProperties{$_l_GroupPosition}; "SUBLIST")
						$_l_SublistID:=0
						If ($_l_SublistPropertyPosition>0)
							$_l_SublistID:=QV_al_QualityPropertiesNUM{$_l_GroupPosition}{$_l_SublistPropertyPosition}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupPosition})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SublistID)
						End if 
						If ($_l_SublistID=0)
							
							$_l_ListID:=AA_LoadListByName(QV_at_QualityGroupsNM{$_l_GroupPosition}; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs)
							$_l_SublistID:=AA_GetListbyName(QV_at_QualityGroupsNM{$_l_GroupPosition})
							//this WILL return an ID
							READ WRITE:C146([X_LISTS:111])
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SublistID)
							$_l_AccessNumber:=0
							$_l_AccessNumber:=$_l_AccessNumber ?+ 5
							AA_SetListProperty("ACCESS"; $_l_AccessNumber)
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
							UNLOAD RECORD:C212([X_LISTS:111])
							READ ONLY:C145([X_LISTS:111])
							//now update the group id
							READ WRITE:C146([LIST_ITEMS:95])
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_GroupID)
							AA_SetListItemProperty("SUBLIST"; $_l_SublistID)
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							UNLOAD RECORD:C212([LIST_ITEMS:95])
							READ ONLY:C145([LIST_ITEMS:95])
							$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
							
							$_t_SublistIDSTR:=String:C10($_l_SublistID)
							
						End if 
						If ($_l_SublistID>0)
							ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
							AA_LoadListbyID($_l_SublistID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							$_l_ItemNamePosition:=Find in array:C230(AA_at_SubSublistItemNMs; QV_t_QualityName)
							If ($_l_ItemNamePosition<0)
								//this does not exist
								$_l_QualityID:=AA_ListAddItembyID($_l_SublistID; QV_t_QualityName)
								AA_LoadListbyID($_l_SublistID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							Else 
								$_l_QualityID:=AA_al_SubListItemsIDs{$_l_ItemNamePosition}
							End if 
							//now the item exists and the group
							//check the item does not already exist
							$_l_ItemPosition:=Find in array:C230(QV_al_QualityID; $_l_QualityID)
							If ($_l_ItemPosition<0)
								$_bo_AddRow:=True:C214
								$_l_ArrayElement:=Size of array:C274(QV_al_QualityDeletions)
								INSERT IN ARRAY:C227(QV_al_QualityDeletions; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_at_QualityDetail; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_ar_QualityLevel; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityYear; $_l_ArrayElement+1; 1)  //NG Checked April 2020
								INSERT IN ARRAY:C227(QV_ad_QualityDate; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_at_QualityCode; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_al_RelatedRecordNum; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityID; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityParentID; $_l_ArrayElement+1; 1)
								INSERT IN ARRAY:C227(QV_al_QualityRecordID; $_l_ArrayElement+1; 1)
								$_l_ArrayElement:=Size of array:C274(QV_al_QualityDeletions)
								
							Else 
								//update it(cant have same one twice
								$_bo_AddRow:=False:C215
								$_l_ArrayElement:=$_l_ItemPosition
							End if 
							$_l_NewItemID:=AA_GetNextIDinMethod(->[INFORMATION:55]QualityRecordID:16)
							
							QV_al_QualityDeletions{$_l_ArrayElement}:=-1
							QV_ar_QualityLevel{$_l_ArrayElement}:=QV_R_QualityLevel
							QV_at_QualityDetail{$_l_ArrayElement}:=QV_t_QualityDescription
							QV_al_QualityYear{$_l_ArrayElement}:=QV_l_QualityYear  //NG Checked April 2020
							QV_ad_QualityDate{$_l_ArrayElement}:=Current date:C33(*)
							QV_at_QualityCode{$_l_ArrayElement}:=Qual_Code(True:C214)
							QV_al_RelatedRecordNum{$_l_ArrayElement}:=QV_l_DisplayedOwnerID
							QV_al_QualityID{$_l_ArrayElement}:=$_l_QualityID
							QV_al_QualityParentID{$_l_ArrayElement}:=$_l_GroupID
							QV_al_QualityRecordID{$_l_ArrayElement}:=$_l_NewItemID
							//now the item is in the arrays
							//next update the HL
							$_t_SublistItemName:=AA_at_SubSublistItemNMs{Find in array:C230(AA_al_SubListItemsIDs; $_l_QualityID)}
							If (QV_ar_QualityLevel{$_l_ArrayElement}#0)
								$_t_SublistItemName:=$_t_SublistItemName+"(Level:"+String:C10(QV_ar_QualityLevel{$_l_ArrayElement})+")"
							End if 
							If (QV_at_QualityDetail{$_l_ArrayElement}#"")
								$_t_SublistItemName:=$_t_SublistItemName+" (Desc:"+QV_at_QualityDetail{$_l_ArrayElement}+")"
							End if 
							$_t_ApplicationVersion:=Application version:C493
							If (Num:C11($_t_ApplicationVersion)<670)
								If (Length:C16($_t_SublistItemName)>255)
									$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 255)
								End if 
							Else 
								If (Length:C16($_t_SublistItemName)>32)
									$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 32)
								End if 
							End if 
							If (Not:C34($_bo_noHL))
								$_l_GroupPosition:=List item position:C629(QV_HL_QualitiesList; $_l_GroupID)
								If ($_l_GroupPosition=0)
									
									QV_HL_SubList:=New list:C375
									$_l_ItemPosition:=Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ArrayElement})
									If ($_l_ItemPosition>0)  //it should be!!!
										
										APPEND TO LIST:C376(QV_HL_SubList; $_t_SublistItemName; QV_al_QualityRecordID{$_l_ArrayElement})
										//now add the parent
										APPEND TO LIST:C376(QV_HL_QualitiesList; QV_t_QualitiesGroupName; $_l_GroupID; QV_HL_SubList; True:C214)
										INSERT IN ARRAY:C227(QV_al_QualityGroupsUsed; Size of array:C274(QV_al_QualityGroupsUsed)+1; 1)
										INSERT IN ARRAY:C227(QV_at_QualityGroupsUSED; Size of array:C274(QV_at_QualityGroupsUSED)+1; 1)
										QV_at_QualityGroupsUSED{Size of array:C274(QV_at_QualityGroupsUSED)}:=QV_t_QualitiesGroupName
										QV_al_QualityGroupsUsed{Size of array:C274(QV_al_QualityGroupsUsed)}:=$_l_GroupID
										SORT ARRAY:C229(QV_at_QualityGroupsUSED; QV_al_QualityGroupsUsed)
									End if 
								Else 
									//add to sublist
									GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_GroupPosition; $_l_ItemNamePosition; $_t_itemText; $_l_SublistID; $_bo_Expanded)
									//make sure it is expanded
									SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemNamePosition; $_t_itemText; $_l_ItemNamePosition; $_l_SublistID; True:C214)
									If ($_bo_AddRow)
										APPEND TO LIST:C376($_l_SublistID; $_t_SublistItemName; QV_al_QualityRecordID{$_l_ArrayElement}; 0; True:C214)
									Else 
										
										SET LIST ITEM:C385($_l_SublistID; QV_al_QualityRecordID{$_l_ArrayElement}; $_t_SublistItemName; QV_al_QualityRecordID{$_l_ArrayElement})
									End if 
									
								End if 
							End if 
						Else 
							//stop
							//warn user
							
						End if 
					End if 
				End if 
			End if 
		End if 
		
	Else 
		//existing
		//find it and update it
		$_l_ExistingItemPosition:=Find in array:C230(QV_al_QualityRecordID; $2)
		
		//Find the group
		$_l_GroupPosition:=Find in array:C230(QV_at_QualityGroupsNM; QV_t_QualitiesGroupName)
		If ($_l_GroupPosition<0)
			//is this person allowed to add
			$_l_GroupID:=0
			Repeat 
				If (QV_bo_AddAllowed)
					//yes they can add-but do they really want to
					ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_GroupsPopUPNM))
					QV_SelectGroupORitem(5; QV_t_QualitiesGroupName; ->QV_at_GroupsPopUPNM; ->QV_al_GroupsPOPUPID; ->QV_al_ValidGroupID)
				Else 
					ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_GroupsPopUPNM))
					QV_SelectGroupORitem(6; QV_t_QualitiesGroupName; ->QV_at_GroupsPopUPNM; ->QV_al_GroupsPOPUPID; ->QV_al_ValidGroupID)
				End if 
				Case of 
					: (QV_NewList)
						//add a new group
						//add the group to the list of groups
						$_l_GroupID:=AA_ListAddItem(->[INFORMATION:55]QualityID:14; QV_t_QualitiesGroupName)
						//Now we need to create the subgroup
						ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
						ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
						ARRAY TEXT:C222(QV_at_QualityGroups; 0)
						ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
						ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
						ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
						$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
						
						//now create the sublist
						ARRAY TEXT:C222(QV_at_ListItems; 0)
						ARRAY LONGINT:C221(QV_al_ListItemIDs; 0)
						ARRAY TEXT:C222(QV_at_ListItemProperties; 0)
						$_l_ListID:=AA_LoadListByName(QV_t_QualitiesGroupName; ->QV_at_ListItems; ->QV_al_ListItemIDs; True:C214; ->QV_at_ListItemProperties)
						//that will have created an empty sublist
						//we need the ID of that list
						$_l_SublistID:=AA_GetListbyName(QV_t_QualitiesGroupName)
						READ WRITE:C146([X_LISTS:111])
						QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SublistID)
						$_l_AccessNumber:=0
						$_l_AccessNumber:=$_l_AccessNumber ?+ 5
						AA_SetListProperty("ACCESS"; $_l_AccessNumber)
						DB_SaveRecord(->[X_LISTS:111])
						AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
						//now put the sublist ID onto the list item
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_GroupID)
						AA_SetListItemProperty("SUBLIST"; $_l_SublistID)
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						//THIS ITEM CANNOT EXIST SO NOW WE ADD THAT TOO
						If (QV_t_QualityName#"")
							$_l_ItemID:=AA_ListAddItembyID($_l_SublistID; QV_t_QualityName)
							$_l_ListID:=AA_LoadListByName(QV_t_QualitiesGroupName; ->QV_at_ListItems; ->QV_al_ListItemIDs; True:C214; ->QV_at_ListItemProperties)
						End if 
						INSERT IN ARRAY:C227(QV_al_GroupsPOPUPID; Size of array:C274(QV_al_GroupsPOPUPID)+1; 1)
						INSERT IN ARRAY:C227(QV_at_GroupsPopUPNM; Size of array:C274(QV_at_GroupsPopUPNM)+1; 1)
						QV_al_GroupsPOPUPID{Size of array:C274(QV_al_GroupsPOPUPID)}:=$_l_GroupID
						QV_at_GroupsPopUPNM{Size of array:C274(QV_at_GroupsPopUPNM)}:=QV_t_QualitiesGroupName
						$_bo_Continue:=True:C214
						
					Else 
						//NEED TO TEST ONLY ONE GROUP HAS BEEN CLICKED
						
						$_l_CountGroups:=0
						For ($_l_Index; 1; Size of array:C274(QV_al_ValidGroupID))
							If (QV_al_ValidGroupID{$_l_Index}=1)  //this is selected
								$_l_CountGroups:=$_l_CountGroups+1
								$_l_GroupID:=QV_al_GroupsPOPUPID{$_l_Index}
							End if 
						End for 
						If ($_l_CountGroups>1)
							$_bo_Continue:=False:C215
							$_l_GroupID:=0
						Else 
							$_bo_Continue:=True:C214
						End if 
						
						
				End case 
			Until ($_l_GroupID>0) | ($_bo_Continue=False:C215)
		Else 
			$_bo_Continue:=True:C214
			$_l_GroupID:=QV_al_QualityGroupsIDs{$_l_GroupPosition}
		End if 
		If ($_bo_Continue)
			//we can now load the subgroup
			//;->QV_at_QualityProperties;->QV_al_QualityPropertiesNUM;->QV_at_QualityPropertiesNAM)
			$_l_SublistPropertyPosition:=Find in array:C230(QV_at_QualityProperties{$_l_GroupPosition}; "SUBLIST")
			If ($_l_SublistPropertyPosition>0)
				$_l_SublistID:=QV_al_QualityPropertiesNUM{$_l_GroupPosition}{$_l_SublistPropertyPosition}
			Else 
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupPosition})
				AA_GetListItemProperty("SUBLIST"; ->$_l_SublistID)
			End if 
			
			If ($_l_SublistID>0)
				ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
				AA_LoadListbyID($_l_SublistID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
				$_l_ItemNamePosition:=Find in array:C230(AA_at_SubSublistItemNMs; QV_t_QualityName)
				If ($_l_ItemNamePosition<0)
					//this does not exist
					$_l_QualityID:=AA_ListAddItembyID($_l_SublistID; QV_t_QualityName)
					AA_LoadListbyID($_l_SublistID; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
				Else 
					$_l_QualityID:=AA_al_SubListItemsIDs{$_l_ItemNamePosition}
				End if 
				If ($_l_QualityID#QV_al_QualityID{$_l_ExistingItemPosition}) | (QV_R_QualityLevel#QV_ar_QualityLevel{$_l_ExistingItemPosition}) | (QV_at_QualityDetail{$_l_ExistingItemPosition}#QV_t_QualityDescription) | ($_l_GroupID#QV_al_QualityParentID{$_l_ExistingItemPosition}) | (QV_l_QualityYear#QV_al_QualityYear{$_l_ExistingItemPosition})  // //NG Checked April 2020
					//something has been changed
					If ($_bo_AskChange)
						Gen_Confirm("Update "+QV_t_QualityName; "Yes"; "No")
						If (OK=1)
							$_bo_Continue:=True:C214
						Else 
							$_bo_Continue:=False:C215
						End if 
						
					Else 
						$_bo_Continue:=True:C214
					End if 
					If ($_bo_Continue)
						//now the item exists and the group
						//check the item does not already exist
						$_l_ItemPosition:=Find in array:C230(AA_al_SubListItemsIDs; $_l_QualityID)
						QV_al_QualityDeletions{$_l_ExistingItemPosition}:=-1
						QV_ar_QualityLevel{$_l_ExistingItemPosition}:=QV_R_QualityLevel
						QV_at_QualityDetail{$_l_ExistingItemPosition}:=QV_t_QualityDescription
						QV_al_QualityYear{$_l_ExistingItemPosition}:=QV_l_QualityYear  //NG Checked April 2020
						QV_ad_QualityDate{$_l_ExistingItemPosition}:=Current date:C33(*)
						If (QV_at_QualityCode{$_l_ExistingItemPosition}#"")
							QV_at_QualityCode{$_l_ExistingItemPosition}:=Qual_Code(True:C214)
						End if 
						
						QV_al_RelatedRecordNum{$_l_ExistingItemPosition}:=QV_l_DisplayedOwnerID
						QV_al_QualityID{$_l_ExistingItemPosition}:=$_l_QualityID
						QV_al_QualityParentID{$_l_ExistingItemPosition}:=$_l_GroupID
						
						//now the item is in the arrays
						//next update the HL
						$_t_SublistItemName:=AA_at_SubSublistItemNMs{$_l_ItemPosition}
						If (QV_ar_QualityLevel{$_l_ExistingItemPosition}#0)
							$_t_SublistItemName:=$_t_SublistItemName+"(Level:"+String:C10(QV_ar_QualityLevel{$_l_ExistingItemPosition})+")"
						End if 
						If (QV_at_QualityDetail{$_l_ExistingItemPosition}#"")
							$_t_SublistItemName:=$_t_SublistItemName+" (Desc:"+QV_at_QualityDetail{$_l_ExistingItemPosition}+")"
						End if 
						$_t_ApplicationVersion:=Application version:C493
						If (Num:C11($_t_ApplicationVersion)<670)
							If (Length:C16($_t_SublistItemName)>255)
								$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 255)
							End if 
						Else 
							If (Length:C16($_t_SublistItemName)>32)
								$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 32)
							End if 
						End if 
						If (Not:C34($_bo_noHL))
							$_l_GroupPosition:=List item position:C629(QV_HL_QualitiesList; $_l_GroupID)
							If ($_l_GroupPosition=0)
								QV_HL_SubList:=New list:C375
								$_l_ItemPosition:=Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_ExistingItemPosition})
								If ($_l_ItemPosition>0)  //it should be!!!
									
									APPEND TO LIST:C376(QV_HL_SubList; $_t_SublistItemName; QV_al_QualityRecordID{$_l_ExistingItemPosition})
									//now add the parent
									APPEND TO LIST:C376(QV_HL_QualitiesList; QV_t_QualitiesGroupName; $_l_GroupID; QV_HL_SubList; True:C214)
									INSERT IN ARRAY:C227(QV_al_QualityGroupsUsed; Size of array:C274(QV_al_QualityGroupsUsed)+1; 1)
									INSERT IN ARRAY:C227(QV_at_QualityGroupsUSED; Size of array:C274(QV_at_QualityGroupsUSED)+1; 1)
									QV_at_QualityGroupsUSED{Size of array:C274(QV_at_QualityGroupsUSED)}:=QV_t_QualitiesGroupName
									QV_al_QualityGroupsUsed{Size of array:C274(QV_al_QualityGroupsUsed)}:=$_l_GroupID
									SORT ARRAY:C229(QV_at_QualityGroupsUSED; QV_al_QualityGroupsUsed)
								End if 
							Else 
								//add to sublist
								GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_GroupPosition; $_l_ItemNamePosition; $_t_itemText; $_l_SublistID; $_bo_Expanded)
								//make sure it is expanded
								SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemNamePosition; $_t_itemText; $_l_ItemNamePosition; $_l_SublistID; True:C214)
								//APPEND TO LIST($_l_SublistID;$_t_SublistItemName;QV_al_QualityRecordID{$_l_ExistingItemPosition};0;True)
								$_l_ExistingItemPositionition:=List item position:C629(QV_HL_QualitiesList; QV_al_QualityRecordID{$_l_ExistingItemPosition})
								If ($_l_ExistingItemPositionition=0)
									APPEND TO LIST:C376($_l_SublistID; $_t_SublistItemName; QV_al_QualityRecordID{$_l_ExistingItemPosition}; 0; True:C214)
								Else 
									GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_ExistingItemPositionition; $_l_ItemNamePosition; $_t_itemText; $_l_SublistID; $_bo_Expanded)
									SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemNamePosition; $_t_SublistItemName; $_l_ItemNamePosition; $_l_SublistID; $_bo_Expanded)
								End if 
								
							End if 
						End if 
						
					End if 
					
					
				End if 
			End if 
		End if 
	End if 
End if 
QV_l_SelectedQualityID:=0
If (Is a list:C621(Q_HL_QualitiesList))
	// ////////_o_REDRAW LIST(QV_HL_QualitiesList)
End if 
ERR_MethodTrackerReturn("QV_SaveCurrentQuality"; $_t_oldMethodName)
