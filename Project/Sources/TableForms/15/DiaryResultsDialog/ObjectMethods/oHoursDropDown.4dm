If (False:C215)
	//object Name: [USER]DiaryResultsDialog.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded; SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_SelectedListItem; $_l_SublistiD; SD_HL_l_Hours; SD_HL_l_Hours2)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		
		If (SD_bo_AddingDiaryRecord)
			$_l_SelectedListItem:=Selected list items:C379(SD_HL_l_Hours)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(SD_HL_l_Hours; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistiD; $_bo_Expanded)
				$_ti_Time:=Time:C179(Time string:C180($_l_ItemReference))
				If ([DIARY:12]Done:14=False:C215)
					[DIARY:12]Time_Do_From:6:=$_ti_Time
				Else 
					[DIARY:12]Time_Done_From:7:=$_ti_Time
				End if 
				
				Diary_InD
				
			End if 
			
		End if 
		
End case 
SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours2; 0)
SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours; 0)
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Variable8"; $_t_oldMethodName)