//%attributes = {}
If (False:C215)
	//Project Method Name:      SuperDiary_AddRec
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
	C_LONGINT:C283(SD_l_EditingDiaryRecord)
	C_LONGINT:C283(SD_l_DescriptionSplitter)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName; SD_t_DiaryPersonName; SD_t_DiaryDefaultUser)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary_AddRec")
SD_l_EditingDiaryRecord:=1
READ WRITE:C146([DIARY:12])
CREATE RECORD:C68([DIARY:12])
WT_hl_DiaryDETAIL3
If (<>CompCode#"")
	[DIARY:12]Company_Code:1:=<>CompCode
End if 
If (<>ContCode#"")
	[DIARY:12]Contact_Code:2:=<>ContCode
End if 
[DIARY:12]Date_Do_From:4:=Current date:C33
[DIARY:12]Date_Do_To:33:=Current date:C33
[DIARY:12]Time_Do_From:6:=Current time:C178
[DIARY:12]Time_Do_To:35:=Current time:C178+(60*60)
[DIARY:12]Person:8:=SD_t_DiaryDefaultUser
RELATE ONE:C42([DIARY:12]Person:8)
SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
If ([DIARY:12]Diary_Code:3="")
	DiarySetCode
End if 
SD_l_EditingDiaryRecord:=1
SD_SetFieldsTrue
SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
ERR_MethodTrackerReturn("SuperDiary_AddRec"; $_t_oldMethodName)