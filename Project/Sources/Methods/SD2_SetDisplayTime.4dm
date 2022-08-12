//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetDisplayTime
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
	C_LONGINT:C283(SD2_l_Completed)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetDisplayTime")

//This method sets the displayed date and time
Case of 
	: (SD2_l_Completed=1) | ([DIARY:12]Done:14)
		[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Done_From:5
		[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Done_To:34
		[DIARY:12]Display_Time_From:53:=[DIARY:12]Time_Done_From:7
		[DIARY:12]Display_Time_To:54:=[DIARY:12]Time_Done_To:36
	Else 
		[DIARY:12]Display_Date_From:51:=[DIARY:12]Date_Do_From:4
		[DIARY:12]Display_Date_To:52:=[DIARY:12]Date_Do_To:33
		[DIARY:12]Display_Time_From:53:=[DIARY:12]Time_Do_From:6
		[DIARY:12]Display_Time_To:54:=[DIARY:12]Time_Do_To:35
End case 
ERR_MethodTrackerReturn("SD2_SetDisplayTime"; $_t_oldMethodName)