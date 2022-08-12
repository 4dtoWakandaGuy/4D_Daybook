//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetDiaryTimeFromDuration
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 16:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Days; $1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_MaxTime; $_ti_Time2; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetDiaryTimeFromDuration")

$_ti_MaxTime:=?23:59:59?*1
If (Count parameters:C259>=2)
	Case of 
		: ($1=1)
			OBJECT SET VISIBLE:C603($2->; True:C214)
			If ([DIARY:12]Display_Time_From:53=?00:00:00?)
				[DIARY:12]Display_Time_From:53:=Current time:C178(*)
			End if 
			//The time entered is in minutes
			$_ti_Time2:=[DIARY:12]Display_Time_From:53+($2->*60)  //add a number of seconds
			$_l_Days:=0
			If ($_ti_Time2>$_ti_MaxTime)
				Repeat 
					$_l_Days:=$_l_Days+1
					$_ti_Time2:=$_ti_Time2-$_ti_MaxTime
				Until ($_ti_Time2<=$_ti_MaxTime)
				
				
				[DIARY:12]Display_Date_To:52:=[DIARY:12]Display_Date_From:51+$_l_Days
			Else 
				[DIARY:12]Display_Date_To:52:=[DIARY:12]Display_Date_From:51
				
			End if 
			
			[DIARY:12]Display_Time_To:54:=Time:C179(Time string:C180($_ti_Time2))
			
		: ($1=2)  //Time is in hours
			If ([DIARY:12]Display_Time_From:53=?00:00:00?)
				[DIARY:12]Display_Time_From:53:=Current time:C178(*)
			End if 
			OBJECT SET VISIBLE:C603($2->; True:C214)
			//time is a number of hours
			$_ti_Time2:=[DIARY:12]Display_Time_From:53+($2->*60*60)  //add a number of seconds
			$_l_Days:=0
			If ($_ti_Time2>$_ti_MaxTime)
				Repeat 
					$_l_Days:=$_l_Days+1
					$_ti_Time2:=$_ti_Time2-$_ti_MaxTime
				Until ($_ti_Time2<=$_ti_MaxTime)
				
				[DIARY:12]Display_Date_To:52:=[DIARY:12]Display_Date_From:51+$_l_Days
				
				
			End if 
			
			[DIARY:12]Display_Time_To:54:=Time:C179(Time string:C180($_ti_Time2))
			
		: ($1=3)
			//time is all morning
			OBJECT SET VISIBLE:C603($2->; False:C215)
			//This is slightly more complex we have to find when the 'MORNING' starts and ends
			[DIARY:12]Display_Time_From:53:=SD_ti_SettingsTimeStart  //Make sure this was loaded
			[DIARY:12]Display_Time_To:54:=?13:00:00?
		: ($1=4)
			//time is all afternoon
			OBJECT SET VISIBLE:C603($2->; False:C215)
			[DIARY:12]Display_Time_From:53:=?13:00:00?  //
			[DIARY:12]Display_Time_To:54:=SD_ti_SettingsTimeEnd
		: ($1=5)
			//time is all evening
			OBJECT SET VISIBLE:C603($2->; False:C215)
			[DIARY:12]Display_Time_From:53:=SD_ti_SettingsTimeEnd
			[DIARY:12]Display_Time_To:54:=?23:59:00?
		: ($1=6)  // all day
			OBJECT SET VISIBLE:C603($2->; False:C215)
			[DIARY:12]Display_Time_From:53:=SD_ti_SettingsTimeStart
			[DIARY:12]Display_Time_To:54:=SD_ti_SettingsTimeEnd
			
			
	End case 
	If ([DIARY:12]Display_Time_To:54=?00:00:00?)
		
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; False:C215)
	Else 
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; True:C214)
		OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("SD2_SetDiaryTimeFromDuration"; $_t_oldMethodName)
