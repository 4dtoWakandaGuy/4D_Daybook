//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Next
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Next")
//Diary_Next
Menu_Record("Diary_Next"; "Next Action")
If (Modified record:C314([DIARY:12]))
	Diary_PersPrior
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
ADD TO SET:C119([DIARY:12]; "DMaster")
DUPLICATE RECORD:C225([DIARY:12])
[DIARY:12]x_ID:50:=0

[DIARY:12]Action_Details:10:="Next: "+Char:C90(13)+"Previous: "+[DIARY:12]Action_Code:9+", "+[DIARY:12]Result_Code:11+", "+[DIARY:12]Result_Description:12+Char:C90(13)
[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Date Done: "+String:C10([DIARY:12]Date_Done_From:5)
If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
	[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" - "+String:C10([DIARY:12]Date_Done_From:5)
End if 
[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Diary Code: "+[DIARY:12]Diary_Code:3+Char:C90(13)
DiarySetCode
If ([DIARY:12]Date_Done_From:5>=<>DB_d_CurrentDate)
	[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Done_From:5+1
Else 
	If ([DIARY:12]Date_Do_From:4>=<>DB_d_CurrentDate)
		[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4+1
	Else 
		[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
	End if 
End if 
[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
[DIARY:12]Time_Do_From:6:=?00:00:00?
[DIARY:12]Time_Do_To:35:=?00:00:00?
[DIARY:12]Time_Done_From:7:=?00:00:00?
[DIARY:12]Time_Done_To:36:=?00:00:00?
[DIARY:12]Date_Done_From:5:=!00-00-00!
[DIARY:12]Date_Done_To:34:=!00-00-00!
[DIARY:12]Action_Code:9:=""
[DIARY:12]Result_Code:11:=""
[DIARY:12]Result_Description:12:=""
[DIARY:12]Done:14:=False:C215
[DIARY:12]Document_Code:15:=""
[DIARY:12]Document_Heading:32:=""
[DIARY:12]Originator:23:=[DIARY:12]Person:8
[DIARY:12]Original_Date_Time_Stamp:47:=0
[DIARY:12]Email_ID:41:=0
[DIARY:12]Email_Text:42:=""
[DIARY:12]Email_From:38:=""
[DIARY:12]Email_Person:39:=""
[DIARY:12]Email_Subject:40:=""

RELATE ONE:C42([DIARY:12]Company_Code:1)
[DIARY:12]Status:30:=[COMPANIES:2]Status:12
Diary_InB
Diary_PersPrior
DB_SaveRecord(->[DIARY:12])
AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
DB_t_CurrentFormUsage2:="Next"
If (<>SD3_l_DiaryVersion=0)
	SD_l_RecNeedssaving:=1
	SD_l_EditingDiaryRecord:=1
	SD_bo_AddingDiaryRecord:=True:C214
	READ WRITE:C146([DIARY:12])
	LOAD RECORD:C52([DIARY:12])
	SD_SetVisible(True:C214)
	SD_SetFieldsTrue
	
End if 

//PUSH RECORD([DIARY])
//ADD TO SET([DIARY];"DMaster")
//USE SET("DMaster")
//POP RECORD([DIARY])
//`$SRN:=Selected record number([DIARY])
//`GOTO SELECTED RECORD([DIARY];$SRN)
GOTO OBJECT:C206([DIARY:12]Action_Code:9)
ERR_MethodTrackerReturn("Diary_Next"; $_t_oldMethodName)