//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_Saverecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; SD_bo_AddingDiaryRecord; SD_bo_AgendaEnabled; SD_bo_RecordModified; SD_bo_ResultsDialog)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_LONGINT:C283($_l_DateSpan; $_l_DayNumber; $_l_TimeSpan; SD_l_EditingDiaryRecord; WS_l_SELECTEDDIARYVIEWTAB; xOK)
	C_TEXT:C284($_t_oldMethodName; $_t_ResultCodeOLD; SD_t_ItemActionDescription)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Saverecord")
//◊SuperDiary
SD_l_EditingDiaryRecord:=0
xOK:=0

SD_Updatereminder
$_t_ResultCodeOLD:=Old:C35([DIARY:12]Result_Code:11)
DB_SaveRecord(->[DIARY:12])
AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)  //save the record
Diary_InLPA($_t_ResultCodeOLD; SD_bo_ResultsDialog)

$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
If (SD_bo_ResultsDialog=False:C215)
	Case of 
		: (([DIARY:12]Date_Done_From:5>!00-00-00!) & ([DIARY:12]Done:14=False:C215))
			xOK:=1
			Gen_Confirm("Is this diary Item completed?"; "Done"; "No")
			If (OK=1)
				$_l_DateSpan:=[DIARY:12]Date_Do_To:33-[DIARY:12]Date_Do_From:4
				If ([DIARY:12]Time_Done_From:7=?00:00:00?)
					$_l_TimeSpan:=[DIARY:12]Time_Do_To:35-[DIARY:12]Time_Do_From:6
					[DIARY:12]Time_Done_From:7:=Time:C179(Time string:C180((Current time:C178(*)*1)-$_l_TimeSpan))
					[DIARY:12]Time_Done_To:36:=Current time:C178(*)
				End if 
				[DIARY:12]Done:14:=True:C214
				Diary_InD
			End if 
		: (([DIARY:12]Date_Do_From:4<Current date:C33(*)) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
			xOK:=Gen_alert_SD("The date entered for this diary item has already passed."+"  Click Change date to change to "+String:C10(Current date:C33(*)); "Save"; "Change Date")
			If (xOK=0)
				$_l_DateSpan:=[DIARY:12]Date_Do_To:33-[DIARY:12]Date_Do_From:4
				[DIARY:12]Date_Do_From:4:=Current date:C33(*)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4+$_l_DateSpan
				xOK:=1
			End if 
		Else 
			xOK:=1
	End case 
End if 


If (xOK=1)  //continue and DB_SaveRecord changes
	
	If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
		If (Not:C34(<>SYS_bo_ScriptonSave))
			If (DB_GetModuleSettingByNUM(Module_Macros)>0)
				<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
			End if 
		End if 
		
		
		If (<>SYS_bo_ScriptonSave)
			Macro_AccType("Accept "+String:C10(Table:C252(->[DIARY:12])))
		End if 
	End if 
	If (SD_bo_AgendaEnabled)
		AG_SetDiaryColours
	End if 
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	Diary_InLPA($_t_ResultCodeOLD; SD_bo_ResultsDialog)
	Case of 
		: (WS_at_DiaryVIewTab=1) | (WS_at_DiaryVIewTab=2) | (WS_at_DiaryVIewTab=3)  //monthly view
			SD_TabManager(On Clicked:K2:4)
		: (WS_at_DiaryVIewTab=4)  //QUERY view
			SD_t_ItemActionDescription:=Substring:C12([DIARY:12]Action_Details:10; 1; 25)
			
	End case 
	WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
	//********************************************
	//********************************************
	SD_SetFieldsFalse
	WT_hl_DiaryDETAIL3
	SD_bo_RecordModified:=False:C215
Else   //don't continue, go to the [DIARY]Date Do From field to edit
	GOTO OBJECT:C206([DIARY:12]Date_Do_From:4)
End if 
If (True:C214)
Else 
	Case of 
		: (WS_at_DiaryVIewTab=1) | (WS_at_DiaryVIewTab=2) | (WS_at_DiaryVIewTab=3)  //monthly view
			SD_TabManager
		: (WS_at_DiaryVIewTab=4)  //QUERY view
			SD_t_ItemActionDescription:=Substring:C12([DIARY:12]Action_Details:10; 1; 25)
	End case 
	//********************************************
	//********************************************
	
	SD_SetFieldsFalse
	WT_hl_DiaryDETAIL3
	
	SD_bo_RecordModified:=False:C215
End if 
SD_bo_AddingDiaryRecord:=False:C215
ERR_MethodTrackerReturn("SD_Saverecord"; $_t_oldMethodName)