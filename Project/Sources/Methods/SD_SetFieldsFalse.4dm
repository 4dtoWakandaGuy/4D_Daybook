//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetFieldsFalse
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(Badd_Person; SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetFieldsFalse")
//SD_SetFieldsFalse
OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_From:4; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_To:33; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Person:8; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Action_Details:10; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Result_Code:11; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Result_Description:12; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Heading:32; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Script_Code:29; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Units:20; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Value:16; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Job_Code:19; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Stage_Code:21; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Order_Code:26; False:C215)


OBJECT SET ENTERABLE:C238([DIARY:12]Product_Code:13; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Call_Code:25; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Diary_Code:3; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Status:30; False:C215)
If (Is record loaded:C669([DIARY:12]))
	UNLOAD RECORD:C212([DIARY:12])
End if 
DB_MenuAction("Functions"; ""; 2; "")
//DISABLE MENU ITEM(3;0)
SD_LoadOtherPerson(""; "")
SD_SetReminder(0; "")
OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
SD_l_EditingDiaryRecord:=0



//WT_hl_DiaryDETAIL3
ERR_MethodTrackerReturn("SD_SetFieldsFalse"; $_t_oldMethodName)