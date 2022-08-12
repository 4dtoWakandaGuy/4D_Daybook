//%attributes = {}
If (False:C215)
	//Project Method Name:      Trigger_setDiaryDisplayData
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trigger_setDiaryDisplayData")
If ([DIARY:12]Done:14)
	If ([DIARY:12]Date_Done_From:5=!00-00-00!)
		[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Do_From:4
	End if 
	
	[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Done_From:5
	If ([DIARY:12]Date_Done_To:34#!00-00-00!)
		[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Done_To:34
	Else 
		[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Do_To:33
	End if 
	If ([DIARY:12]Time_Done_From:7#?00:00:00?) & ([DIARY:12]Time_Done_To:36#?00:00:00?)
		[DIARY:12]Display_Time_From:53:=[DIARY:12]Time_Done_From:7
		[DIARY:12]Display_Time_To:54:=[DIARY:12]Time_Done_To:36
	Else 
		[DIARY:12]Display_Time_From:53:=[DIARY:12]Time_Do_From:6
		[DIARY:12]Display_Time_To:54:=[DIARY:12]Time_Do_To:35
	End if 
	
	[DIARY:12]Display_Description:55:=[DIARY:12]Result_Code:11+"  "+SD_GetResultName+Char:C90(13)+[DIARY:12]Result_Description:12
Else 
	If ([DIARY:12]Date_Do_From:4#!00-00-00!)
		[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Do_From:4
	Else 
		If ([DIARY:12]Date_Do_To:33#!00-00-00!)
			[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Do_To:33
		Else 
			If ([DIARY:12]Date_Done_From:5#!00-00-00!)
				[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Done_From:5
			Else 
				If ([DIARY:12]Date_Done_To:34#!00-00-00!)
					[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Done_To:34
				End if 
			End if 
		End if 
	End if 
	If ([DIARY:12]Date_Do_To:33#!00-00-00!)
		[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Do_To:33
	Else 
		If ([DIARY:12]Date_Do_From:4#!00-00-00!)
			[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Do_From:4
		Else 
			If ([DIARY:12]Date_Done_To:34#!00-00-00!)
				[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Done_To:34
			Else 
				If ([DIARY:12]Date_Done_From:5#!00-00-00!)
					[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Done_From:5
				End if 
			End if 
		End if 
	End if 
	[DIARY:12]Display_Time_From:53:=[DIARY:12]Time_Do_From:6
	[DIARY:12]Display_Time_To:54:=[DIARY:12]Time_Do_To:35
	[DIARY:12]Display_Description:55:=[DIARY:12]Action_Code:9+"  "+SD_GetActionName+Char:C90(13)+[DIARY:12]Action_Details:10
End if 
ERR_MethodTrackerReturn("Trigger_setDiaryDisplayData"; $_t_oldMethodName)