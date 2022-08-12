//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetFieldsTrue
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
	C_BOOLEAN:C305(SD_bo_ResultsDialog)
	C_LONGINT:C283(Badd_Person)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetFieldsTrue")
OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; True:C214)
If (SD_bo_ResultsDialog=False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_From:4; True:C214)
	OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_To:33; True:C214)
Else 
	If ([DIARY:12]Date_Do_To:33>=Current date:C33(*)) | ([DIARY:12]Date_Do_From:4=!00-00-00!)
		OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_From:4; True:C214)
		OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_To:33; True:C214)
	End if 
End if 
If (SD_bo_ResultsDialog=False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; True:C214)
	OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; True:C214)
Else 
	Case of 
		: ([DIARY:12]Date_Do_To:33>Current date:C33(*)) | ([DIARY:12]Date_Do_From:4=!00-00-00!)
			OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; True:C214)
			OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; True:C214)
		: ([DIARY:12]Date_Do_To:33=Current date:C33(*))
			If ([DIARY:12]Time_Do_To:35>=Current time:C178(*)) | ([DIARY:12]Time_Do_From:6=?00:00:00?)
				OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; True:C214)
				OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; True:C214)
			End if 
	End case 
End if 


OBJECT SET ENTERABLE:C238([DIARY:12]Person:8; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Action_Details:10; True:C214)
If (SD_bo_ResultsDialog=False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Result_Code:11; True:C214)
	OBJECT SET ENTERABLE:C238([DIARY:12]Result_Description:12; True:C214)
End if 

OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Heading:32; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Script_Code:29; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Units:20; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Value:16; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Job_Code:19; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Stage_Code:21; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Order_Code:26; True:C214)


OBJECT SET ENTERABLE:C238([DIARY:12]Product_Code:13; True:C214)
OBJECT SET ENTERABLE:C238([DIARY:12]Call_Code:25; True:C214)
//SET ENTERABLE([DIARY]Diary Code;True)
OBJECT SET ENTERABLE:C238([DIARY:12]Status:30; True:C214)
If ([DIARY:12]Company_Code:1="")
	GOTO OBJECT:C206([DIARY:12]Company_Code:1)
Else 
	GOTO OBJECT:C206([DIARY:12]Action_Details:10)
	HIGHLIGHT TEXT:C210([DIARY:12]Action_Details:10; Length:C16([DIARY:12]Action_Details:10)+1; Length:C16([DIARY:12]Action_Details:10)+1)
End if 

SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3)
Case of 
	: ([DIARY:12]Date_Do_From:4>Current date:C33(*))
		OBJECT SET VISIBLE:C603(Badd_Person; True:C214)
	: ([DIARY:12]Date_Do_From:4=Current date:C33(*))
		If ([DIARY:12]Time_Do_From:6>=Current time:C178(*))
			OBJECT SET VISIBLE:C603(Badd_Person; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("SD_SetFieldsTrue"; $_t_oldMethodName)