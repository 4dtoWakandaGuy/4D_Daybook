If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oSD_Priority
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_LONGINT:C283(SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName; SD_t_PriorityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oSD_Priority"; Form event code:C388)
If (SD_at_PriorityNM>0)
	If ([DIARY:12]Diary_Code:3#"")
		If (Read only state:C362([DIARY:12]))
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			[DIARY:12]Done:14:=False:C215
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
			SD_l_EditingDiaryRecord:=1
		End if 
		If ((Not:C34(Locked:C147([DIARY:12]))) & (Not:C34(Read only state:C362([DIARY:12]))))
			SD_t_PriorityName:=SD_at_PriorityNM{SD_at_PriorityNM}
			[DIARY:12]Priority:17:=String:C10(SD_al_PriorityNUM{SD_at_PriorityNM})
			Diary_InD
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oSD_Priority"; $_t_oldMethodName)
