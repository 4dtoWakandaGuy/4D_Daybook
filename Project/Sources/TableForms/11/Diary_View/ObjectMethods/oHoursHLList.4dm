If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_View.oHoursHLList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2011 11:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded; SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_SelectedListItem; $_l_SublistID; SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here





$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oHoursHLList"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If ([DIARY:12]Diary_Code:3#"")
			If (Read only state:C362([DIARY:12]))
				READ WRITE:C146([DIARY:12])
				LOAD RECORD:C52([DIARY:12])
				[DIARY:12]Done:14:=False:C215
				SD_SetVisible(True:C214)
				SD_SetFieldsTrue
				SD_l_EditingDiaryRecord:=1
			End if 
			If (SD_bo_AddingDiaryRecord)
				$_l_SelectedListItem:=Selected list items:C379(SD_HL_l_Hours2)
				
				If ($_l_SelectedListItem>0)
					GET LIST ITEM:C378(SD_HL_l_Hours2; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					$_ti_Time:=Time:C179(Time string:C180($_l_ItemReference))
					If ([DIARY:12]Done:14=False:C215)
						[DIARY:12]Time_Do_To:35:=$_ti_Time
					Else 
						[DIARY:12]Time_Done_To:36:=$_ti_Time
					End if 
					Diary_InD
				End if 
			End if 
		End if 
		
End case 

SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours2; 0)
SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours; 0)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oHoursHLList"; $_t_oldMethodName)