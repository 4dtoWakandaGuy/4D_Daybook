If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable28
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
	//ARRAY LONGINT(SD_al_EventRecordIDs;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_SelectedListItem; $_l_SublistID; SD_CurrentFormObject; SD_l_DescriptionSplitter; SD_l_HLDayTime)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable28"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD_CurrentFormObject=1)
				If (SD_at_Events>1)
					SD_at_Events:=SD_at_Events-1
				Else 
					SD_at_Events:=Size of array:C274(SD_at_Events)
				End if 
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				SD_SetFieldsFalse
				SD_EventItemData(SD_al_EventRecordIDs{SD_at_Events})
				
			: (SD_CurrentFormObject=2)
				$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
				If ($_l_SelectedListItem>1)
					$_l_SelectedListItem:=$_l_SelectedListItem-1
				Else 
					$_l_SelectedListItem:=Count list items:C380(SD_l_HLDayTime)
				End if 
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				SD_SetFieldsFalse
				// $_l_SelectedListItem:=Selected list item(SD_l_HLDayTime)
				If ($_l_SelectedListItem>0)
					GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
					//         $_l_SelectedListItem:=SELECT LIST ITEM BY REFERENCE(SD_l_HLDayTime;$_l_ItemReference)
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_ItemReference)  // 24/04/02 pb
					////////_o_REDRAW LIST(SD_l_HLDayTime)
					
					If ($_l_SublistID=0)
						SD_EventItemData($_l_ItemReference; 2)
						SD_SetSplitter(->SD_l_DescriptionSplitter)
					End if 
				End if 
				
			: (SD_CurrentFormObject=3)
				If (SD_at_ToDoList>1)
					SD_at_ToDoList:=SD_at_ToDoList-1
				Else 
					SD_at_ToDoList:=Size of array:C274(SD_at_ToDoList)
				End if 
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				SD_SetFieldsFalse
				SD_EventItemData(SD_al_EventRecordIDs{SD_at_Events})
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Variable28"; $_t_oldMethodName)
