If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Hierarchical List3
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_ItemReference; $_l_SelectedListItem; $_l_SublistID; SD_CurrentFormObject; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_HLDayTime; SD_l_RecNeedssaving)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Hierarchical List3"; Form event code:C388)
//SD_l_HLDayTime  `MODNG 67
//◊SuperDiary

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		SD_CurrentFormObject:=2
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		SD_l_RecNeedssaving:=1
		SD_l_EditingDiaryRecord:=0
		
		$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
		If ($_l_SelectedListItem>0)
			
			GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			If ($_l_SublistID=0)
				SD_EventItemData($_l_ItemReference)
				If (Read only state:C362([DIARY:12]))
					READ WRITE:C146([DIARY:12])
					LOAD RECORD:C52([DIARY:12])
				Else 
					If ($_l_ItemReference>0)
						If ($_l_ItemReference#[DIARY:12]x_ID:50)
							
						End if 
						
					End if 
					
				End if 
				
				If ([DIARY:12]Done:14=False:C215)
					SD_l_EditingDiaryRecord:=1
					SD_SetVisible(True:C214)
					SD_SetFieldsTrue
				Else 
					SD_l_EditingDiaryRecord:=1
					READ WRITE:C146([DIARY:12])
					LOAD RECORD:C52([DIARY:12])
					OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
				End if 
			Else 
				//add an item for that date
				
			End if 
		Else 
			//add an item(i dont think this works)
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)  // A click occurred
		SD_CurrentFormObject:=2
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
		If ($_l_SelectedListItem>0)
			GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			If ($_l_SublistID=0)
				SD_EventItemData($_l_ItemReference; 2)
				SD_SetSplitter(->SD_l_DescriptionSplitter)
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Hierarchical List3"; $_t_oldMethodName)
