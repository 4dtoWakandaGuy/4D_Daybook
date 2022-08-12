//%attributes = {}
If (False:C215)
	//Project Method Name:      CHECK_INFO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_1DListItemIDS2;0)
	//ARRAY LONGINT(AA_al_1DSubListItemProperties2;0)
	//ARRAY LONGINT(AA_al_ListItemIDS2;0;0)
	//ARRAY LONGINT(AA_al_SubgroupIDs;0)
	//ARRAY LONGINT(AA_al_SubListItemIDS2;0)
	//ARRAY LONGINT(AA_al_SubListItemProperties2;0;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDS;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	//ARRAY TEXT(AA_at_1DListItemProperties;0)
	//ARRAY TEXT(AA_at_1DListPropertiesNM2;0)
	//ARRAY TEXT(AA_at_1DSubListItemProperties2;0)
	//ARRAY TEXT(AA_at_1DSubListPropertiesNM2;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_listItemproperties2;0;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItems2;0)
	//ARRAY TEXT(AA_at_ListPropertiesNM2;0;0)
	//ARRAY TEXT(AA_at_SubListItemProperties;0)
	//ARRAY TEXT(AA_at_SublistItemproperties2;0;0)
	//ARRAY TEXT(AA_at_SubListItems;0)
	//ARRAY TEXT(AA_at_SubListItems2;0)
	//ARRAY TEXT(AA_at_SubListPropertiesNM2;0;0)
	C_BOOLEAN:C305($_bo_TryAgain; $_bo_Started; $_bo_TryAgain)
	C_LONGINT:C283($_l_BuildSubGroupIndex; $_l_CurrentWinRefOLD; $_l_GroupID; $_l_GroupRow; $_l_Index; $_l_ItemID; $_l_ItemNameRow; $_l_LastSublistID; $_l_ListID; $_l_ListItemLength; $_l_Matched)
	C_LONGINT:C283($_l_Start; $_l_SubgroupLength; $_l_SubGroupRow; $_l_SubListColumn; $_l_SubListID; $_l_sublistIDRow; $_l_SubListItemsIndex; $_l_TestSubGroupLength; WIN_l_CurrentWinRef; $_l_Ask; $_l_BuildSubGroupIndex)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_GroupID; $_l_GroupRow; $_l_Index; $_l_ItemID; $_l_ItemNameRow; $_l_LastSublistID; $_l_ListID; $_l_ListItemLength; $_l_ListItemRow2; $_l_Matched)
	C_LONGINT:C283($_l_Start; $_l_SubgroupLength; $_l_SubGroupRow; $_l_SubListColumn; $_l_SubListID; $_l_sublistIDRow; $_l_SubListItemsIndex; $_l_TestSubGroupLength; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_ListItemName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CHECK_INFO")
ARRAY TEXT:C222(AA_at_ListItems2; 0)
ARRAY LONGINT:C221(AA_al_1DListItemIDS2; 0)
ARRAY LONGINT:C221(AA_al_1DSubListItemProperties2; 0)
//ARRAY TEXT(AA_at_ListItemProperties2;0)
ARRAY TEXT:C222(AA_at_1DListPropertiesNM2; 0)

ARRAY TEXT:C222(AA_at_ListPropertiesNM2; 0; 0)
ARRAY LONGINT:C221(AA_al_ListItemIDS2; 0; 0)
ARRAY TEXT:C222(AA_at_listItemproperties2; 0; 0)

ARRAY TEXT:C222(AA_at_ListItems; 0)
ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
ARRAY LONGINT:C221(AA_al_1DListItemIDS2; 0)
ARRAY TEXT:C222(AA_at_1DListItemProperties; 0)
ARRAY TEXT:C222(AA_at_SubListItems2; 0)
ARRAY LONGINT:C221(AA_al_SubListItemIDS2; 0)
ARRAY TEXT:C222(AA_at_1DSubListItemProperties2; 0)
ARRAY TEXT:C222(AA_at_1DSubListPropertiesNM2; 0)
ARRAY TEXT:C222(AA_at_SubListPropertiesNM2; 0; 0)
ARRAY LONGINT:C221(AA_al_SubListItemProperties2; 0; 0)
ARRAY TEXT:C222(AA_at_SublistItemproperties2; 0; 0)

ARRAY TEXT:C222(AA_at_SubListItems; 0)
ARRAY LONGINT:C221(AA_al_SubListItemsIDS; 0)
ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(40; 40; 400; 150; -1984)

$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems2; ->AA_al_1DListItemIDS2; False:C215; ->AA_at_1DListItemProperties; ->AA_at_1DListPropertiesNM2; ->AA_al_1DListItemIDS2; ->AA_at_listItemproperties2)
//$_l_ListID:=AA_LoadListByName ("Qualities";->AA_ListItems2;->AA_ListiTEMIDS2;False;->AA_LISTITEMPROPERTIES2;->AA_at_ListPropertiesNM2;->AA_al_ListItemProperties2;->AA_at_listItemproperties2)

QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="Qualities")
$_l_ListID:=[X_LISTS:111]x_ID:1
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_ListItems; [LIST_ITEMS:95]X_ID:3; AL_al_ListItemIDS)
ARRAY TEXT:C222(AA_at_ListItemProperties; Size of array:C274(AL_al_ListItemIDS))
ARRAY LONGINT:C221(AA_al_SubgroupIDs; Size of array:C274(AL_al_ListItemIDS))
FIRST RECORD:C50([LIST_ITEMS:95])
For ($_l_BuildSubGroupIndex; 1; Records in selection:C76([LIST_ITEMS:95]))
	$_l_SubListID:=0
	AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
	AA_al_SubgroupIDs{$_l_BuildSubGroupIndex}:=$_l_SubListID
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 


ALL RECORDS:C47([INFORMATION:55])
//QUERY([INFORMATION];[INFORMATION]QualityGroupID>0)

ORDER BY:C49([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15)
FIRST RECORD:C50([INFORMATION:55])
$_l_LastSublistID:=0
For ($_l_Index; 1; Records in selection:C76([INFORMATION:55]))
	MESSAGE:C88("Checking :"+[INFORMATION:55]Group:2+" "+[INFORMATION:55]SubGroup:6)
	If ([INFORMATION:55]QualityGroupID:15=0)
		$_l_GroupRow:=Find in array:C230(AA_at_ListItems2; [INFORMATION:55]Group:2)
		If ($_l_GroupRow>0)
			[INFORMATION:55]QualityGroupID:15:=AA_al_1DListItemIDS2{$_l_GroupRow}
			MESSAGE:C88("Inserting GroupID"+String:C10([INFORMATION:55]QualityGroupID:15))
			
			
		End if 
		
	End if 
	
	If ([INFORMATION:55]QualityGroupID:15>0)
		$_l_GroupID:=[INFORMATION:55]QualityGroupID:15
		$_l_GroupRow:=Find in array:C230(AL_al_ListItemIDS; $_l_GroupID)
		$_l_SubListID:=0
		If ($_l_GroupRow>0)
			$_l_SubListID:=AA_al_SubgroupIDs{$_l_GroupRow}
			
		Else 
			//this is not right
			$_l_ListItemRow2:=Find in array:C230(AA_at_ListItems2; [INFORMATION:55]Group:2)
			If ($_l_ListItemRow2>0)
				[INFORMATION:55]QualityGroupID:15:=AA_al_1DListItemIDS2{$_l_ListItemRow2}
				$_l_SubListColumn:=Find in array:C230(AA_at_ListPropertiesNM2{$_l_ListItemRow2}; "SUBLIST")
				If ($_l_SubListColumn>0)
					$_l_SubListID:=AA_al_ListItemIDS2{$_l_ListItemRow2}{$_l_SubListColumn}
				Else 
					$_l_SubListID:=0
				End if 
				
				
			Else 
				[INFORMATION:55]QualityGroupID:15:=0
				
			End if 
		End if 
		If ($_l_SubListID>0)
			If ($_l_SubListID#$_l_LastSublistID)
				AA_LoadListbyID($_l_SubListID; ->AA_at_SubListItems2; ->AA_al_SubListItemIDS2; False:C215; ->AA_at_1DSubListItemProperties2; ->AA_at_1DSubListPropertiesNM2; ->AA_al_1DSubListItemProperties2; ->AA_at_SublistItemproperties2)
				
				SORT ARRAY:C229(AA_at_SubListItems2; AA_al_SubListItemIDS2; AA_at_SubListItemProperties2; AA_at_SubListPropertiesNM2; AA_al_SubListItemProperties2; AA_at_SublistItemproperties2)
				$_l_LastSublistID:=$_l_SubListID
			End if 
			$_l_sublistID:=Find in array:C230(AA_al_SubListItemIDS2; [INFORMATION:55]QualityID:14)
			If ($_l_sublistIDRow>0)
				[INFORMATION:55]SubGroup:6:=AA_at_SubListItems2{$_l_GroupRow}  //check this it looks wrong april 2020
				MESSAGE:C88("Inserting SubGroup"+[INFORMATION:55]SubGroup:6)
				
			Else 
				$_l_SubGroupRow:=Find in array:C230(AA_at_SubListItems; [INFORMATION:55]SubGroup:6)
				If ($_l_SubGroupRow>0)  //4
					[INFORMATION:55]QualityID:14:=AA_al_SubListItemsIDS{$_l_SubGroupRow}
					MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
					
				Else 
					If ([LIST_ITEMS:95]X_ID:3>0)  //3
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
						If (Records in selection:C76([LIST_ITEMS:95])>0)  //1
							$_t_ListItemName:=[LIST_ITEMS:95]List_Entry:2
							$_l_ItemNameRow:=Find in array:C230(AA_at_SubListItems; $_t_ListItemName)
							If ($_l_ItemNameRow>0)  //2
								[INFORMATION:55]QualityID:14:=AA_al_SubListItemsIDS{$_l_ItemNameRow}
								MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
								$_bo_TryAgain:=False:C215
							Else   //2
								$_bo_TryAgain:=True:C214
							End if   //2
						Else   //1
							$_bo_TryAgain:=True:C214
						End if   //1
					Else   //3
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=[INFORMATION:55]SubGroup:6)
						If (Records in selection:C76([LIST_ITEMS:95])>0)
							[INFORMATION:55]QualityID:14:=[LIST_ITEMS:95]X_ID:3
							MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14)+" and  GroupID "+String:C10(AL_al_ListItemIDS{$_l_GroupRow}))  ///check this -april 2020
							
							$_l_SubGroupRow:=Find in array:C230(AA_al_SubgroupIDs; [LIST_ITEMS:95]X_ListID:4)
							If ($_l_SubGroupRow>0)
								[INFORMATION:55]QualityGroupID:15:=AL_al_ListItemIDS{$_l_SubGroupRow}
							Else 
								$_bo_TryAgain:=True:C214
							End if 
						Else 
							$_bo_TryAgain:=True:C214
						End if 
					End if   //3
					If ($_bo_TryAgain)  //5
						$_bo_Started:=False:C215
						$_l_Ask:=0
						$_l_Matched:=0
						$_l_Start:=1
						For ($_l_SubListItemsIndex; 1; Size of array:C274(AA_at_SubListItems))  //6
							$_l_SubgroupLength:=Length:C16([INFORMATION:55]SubGroup:6)
							$_l_ListItemLength:=Length:C16(AA_at_SubListItems{$_l_SubListItemsIndex})
							For ($_l_TestSubGroupLength; $_l_Start; $_l_SubgroupLength)  //7
								If ($_l_TestSubGroupLength<$_l_ListItemLength)  //8
									If ((Substring:C12(AA_at_SubListItems{$_l_SubListItemsIndex}; 1; $_l_TestSubGroupLength))=(Substring:C12([INFORMATION:55]SubGroup:6; 1; $_l_TestSubGroupLength)))  //9
										If ($_l_Matched<$_l_TestSubGroupLength)  //10
											$_l_Matched:=$_l_TestSubGroupLength
											$_l_Start:=$_l_Matched
											$_l_Ask:=$_l_SubListItemsIndex
											$_bo_Started:=True:C214
										End if   //10
									Else   //9
										$_l_TestSubGroupLength:=$_l_SubgroupLength
										If ($_bo_Started)  //11
											//     $_l_SubListItemsIndex:=Size of array(AA_at_ListItems)
										End if   //11
										
									End if   //9
									
								Else   //8
									$_l_TestSubGroupLength:=$_l_SubgroupLength
								End if   //8
							End for   //7
						End for   //6
						If ($_l_Ask>0)
							If ([INFORMATION:55]Group:2#"Old Ref Code: ")  //12
								CONFIRM:C162("Is   "+[INFORMATION:55]SubGroup:6+"The same as "+AA_at_SubListItems{$_l_Ask}; "Yes"; "No")
								If (OK=0)  //13
									//not
									$_l_ItemID:=AA_ListAddItembyID($_l_SubListID; [INFORMATION:55]SubGroup:6)
									INSERT IN ARRAY:C227(AA_at_SubListItems2; Size of array:C274(AA_at_SubListItems2)+1; 1)
									INSERT IN ARRAY:C227(AA_al_SubListItemIDS2; Size of array:C274(AA_al_SubListItemIDS2)+1; 1)
									INSERT IN ARRAY:C227(AA_at_SubListItemProperties2; Size of array:C274(AA_at_SubListItemProperties2)+1; 1)
									AA_at_SubListItems2{Size of array:C274(AA_at_SubListItems2)}:=[INFORMATION:55]SubGroup:6
									AA_al_SubListItemIDS2{Size of array:C274(AA_al_SubListItemIDS2)}:=$_l_ItemID
									SORT ARRAY:C229(AA_at_SubListItems2; AA_al_SubListItemIDS2; AA_at_SubListItemProperties2)
									//`
									INSERT IN ARRAY:C227(AA_at_SubListItems; Size of array:C274(AA_at_SubListItems)+1; 1)
									INSERT IN ARRAY:C227(AA_al_SubListItemsIDS; Size of array:C274(AA_al_SubListItemsIDS)+1; 1)
									INSERT IN ARRAY:C227(AA_at_SubListItemProperties; Size of array:C274(AA_at_SubListItemProperties)+1; 1)
									AA_at_SubListItems{Size of array:C274(AA_at_SubListItems)}:=[INFORMATION:55]SubGroup:6
									AA_al_SubListItemsIDS{Size of array:C274(AA_al_SubListItemsIDS)}:=$_l_ItemID
									SORT ARRAY:C229(AA_at_SubListItems; AA_al_SubListItemsIDS; AA_at_SubListItemProperties)
									[INFORMATION:55]QualityID:14:=$_l_ItemID
									MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
									
								Else   //13
									[INFORMATION:55]QualityID:14:=AA_al_SubListItemsIDS{$_l_Ask}
									MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
									
								End if   //13
							Else 
								$_l_ItemID:=AA_ListAddItembyID($_l_SubListID; [INFORMATION:55]SubGroup:6)
								INSERT IN ARRAY:C227(AA_at_SubListItems2; Size of array:C274(AA_at_SubListItems2)+1; 1)
								INSERT IN ARRAY:C227(AA_al_SubListItemIDS2; Size of array:C274(AA_al_SubListItemIDS2)+1; 1)
								INSERT IN ARRAY:C227(AA_at_SubListItemProperties2; Size of array:C274(AA_at_SubListItemProperties2)+1; 1)
								AA_at_SubListItems2{Size of array:C274(AA_at_SubListItems2)}:=[INFORMATION:55]SubGroup:6
								AA_al_SubListItemIDS2{Size of array:C274(AA_al_SubListItemIDS2)}:=$_l_ItemID
								SORT ARRAY:C229(AA_at_SubListItems2; AA_al_SubListItemIDS2; AA_at_SubListItemProperties2)
								//`
								INSERT IN ARRAY:C227(AA_at_SubListItems; Size of array:C274(AA_at_SubListItems)+1; 1)
								INSERT IN ARRAY:C227(AA_al_SubListItemsIDS; Size of array:C274(AA_al_SubListItemsIDS)+1; 1)
								INSERT IN ARRAY:C227(AA_at_SubListItemProperties; Size of array:C274(AA_at_SubListItemProperties)+1; 1)
								AA_at_SubListItems{Size of array:C274(AA_at_SubListItems)}:=[INFORMATION:55]SubGroup:6
								AA_al_SubListItemsIDS{Size of array:C274(AA_al_SubListItemsIDS)}:=$_l_ItemID
								SORT ARRAY:C229(AA_at_SubListItems; AA_al_SubListItemsIDS; AA_at_SubListItemProperties)
								[INFORMATION:55]QualityID:14:=$_l_ItemID
								MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
							End if 
						Else 
							
							$_l_ItemID:=AA_ListAddItembyID($_l_SubListID; [INFORMATION:55]SubGroup:6)
							INSERT IN ARRAY:C227(AA_at_SubListItems2; Size of array:C274(AA_at_SubListItems2)+1; 1)
							INSERT IN ARRAY:C227(AA_al_SubListItemIDS2; Size of array:C274(AA_al_SubListItemIDS2)+1; 1)
							INSERT IN ARRAY:C227(AA_at_SubListItemProperties2; Size of array:C274(AA_at_SubListItemProperties2)+1; 1)
							AA_at_SubListItems2{Size of array:C274(AA_at_SubListItems2)}:=[INFORMATION:55]SubGroup:6
							AA_al_SubListItemIDS2{Size of array:C274(AA_al_SubListItemIDS2)}:=$_l_ItemID
							SORT ARRAY:C229(AA_at_SubListItems2; AA_al_SubListItemIDS2; AA_at_SubListItemProperties2)
							//`
							INSERT IN ARRAY:C227(AA_at_SubListItems; Size of array:C274(AA_at_SubListItems)+1; 1)
							INSERT IN ARRAY:C227(AA_al_SubListItemsIDS; Size of array:C274(AA_al_SubListItemsIDS)+1; 1)
							INSERT IN ARRAY:C227(AA_at_SubListItemProperties; Size of array:C274(AA_at_SubListItemProperties)+1; 1)
							AA_at_SubListItems{Size of array:C274(AA_at_SubListItems)}:=[INFORMATION:55]SubGroup:6
							AA_al_SubListItemsIDS{Size of array:C274(AA_al_SubListItemsIDS)}:=$_l_ItemID
							SORT ARRAY:C229(AA_at_SubListItems; AA_al_SubListItemsIDS; AA_at_SubListItemProperties)
							[INFORMATION:55]QualityID:14:=$_l_ItemID
							MESSAGE:C88("Inserting SubGroupID"+String:C10([INFORMATION:55]QualityID:14))
						End if   //12
						
						
						
						
						
					End if   //5
					
					
				End if   //3
			End if   //4
		End if 
	End if 
	
	
	DB_SaveRecord(->[INFORMATION:55])
	AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
	
	NEXT RECORD:C51([INFORMATION:55])
End for 

CLOSE WINDOW:C154

WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("CHECK_INFO"; $_t_oldMethodName)
