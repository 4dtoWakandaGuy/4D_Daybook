If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oTimeDurationPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DurationNames;0)
	C_LONGINT:C283($_l_event; $_l_TimeSpan; SD2_l_DiaryDuration)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oTimeDurationPopUp"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_l_DiaryDuration=0)
			If ([DIARY:12]Display_Time_To:54>[DIARY:12]Display_Time_From:53)
				$_l_TimeSpan:=([DIARY:12]Display_Time_To:54)-([DIARY:12]Display_Time_From:53)
				SD2_l_DiaryDuration:=$_l_TimeSpan/60  //Time_In minutes
			Else 
				$_l_TimeSpan:=0
				SD2_l_DiaryDuration:=0  //Time_In minute
			End if 
		End if 
		SD2_SetDiaryTimeFromDuration(SD2_at_DurationNames; ->SD2_l_DiaryDuration)
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oTimeDurationPopUp"; $_t_oldMethodName)
