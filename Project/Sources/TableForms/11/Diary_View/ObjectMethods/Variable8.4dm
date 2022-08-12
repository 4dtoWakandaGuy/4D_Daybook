If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable8
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283(SD_CurrentFormObject; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving; vlItemPos)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable8"; Form event code:C388)
//SD_l_HLDayToDoItems
//◊SuperDiary
//SD_ItemData($1;$2;$3) `max 3 parameters
//$1: first Hierachial List
//$2: second Hierachial List
//$3: third Hierachial List
//MODNG 67
Case of 
	: ((Form event code:C388=On Clicked:K2:4) & (Macintosh option down:C545))  // An OPTION CLICK occurred
		SD_CurrentFormObject:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		SD_AutoAddRec("EVENT"; Current date:C33; ?00:00:00?)
		//ENABLE MENU ITEM(4;0)
	: (Form event code:C388=On Clicked:K2:4)  // A click occurred
		SD_CurrentFormObject:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		If (SD_at_Events>0)
			SD_EventItemData(SD_al_EventRecordIDs{SD_at_Events})
		End if 
	: (Form event code:C388=On Getting Focus:K2:7)
	: (Form event code:C388=On Double Clicked:K2:5)
		SD_CurrentFormObject:=1
		//◊SuperDiary
		vlItemPos:=SD_at_Events
		If (SD_at_Events=0)
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
			SD_SetFieldsFalse
			SD_AutoAddRec("EVENT"; Current date:C33; ?00:00:00?)
		Else 
			
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
			SD_SetFieldsFalse
			SD_l_RecNeedssaving:=1
			SD_SetFieldsFalse
			SD_EventItemData(SD_al_EventRecordIDs{SD_at_Events})
			SD_SetSplitter(->SD_l_DescriptionSplitter)
			If ([DIARY:12]Done:14=False:C215)
				READ WRITE:C146([DIARY:12])
				LOAD RECORD:C52([DIARY:12])
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
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Variable8"; $_t_oldMethodName)
