If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oDiaryTimeSettingDropDown
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
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	C_LONGINT:C283(SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName; SD_t_TimeSetting)
	C_TIME:C306(SD_ti_AfternoonEnd; SD_ti_AfternoonStart; SD_ti_EveningEnd; SD_ti_EveningStart; SD_ti_MorningEnd; SD_ti_MorningStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDiaryTimeSettingDropDown"; Form event code:C388)
If (SD_at_DefaultTimeSettings>0)
	If ([DIARY:12]Diary_Code:3#"")
		If (Read only state:C362([DIARY:12]))
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			[DIARY:12]Done:14:=False:C215
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
			SD_l_EditingDiaryRecord:=1
		End if 
		SD_ti_MorningStart:=SD_ti_SettingsTimeStart
		SD_ti_AfternoonEnd:=SD_ti_SettingsTimeEnd
		SD_ti_MorningEnd:=?13:00:00?
		SD_ti_AfternoonStart:=?13:00:00?
		SD_ti_EveningStart:=SD_ti_SettingsTimeEnd
		SD_ti_EveningEnd:=?23:59:00?
		
		If ((Not:C34(Locked:C147([DIARY:12]))) & (Not:C34(Read only state:C362([DIARY:12]))))
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{SD_at_DefaultTimeSettings}
			Case of 
				: (SD_at_DefaultTimeSettings=1)  //no time
					
					[DIARY:12]Time_Do_From:6:=?00:00:00?
					[DIARY:12]Time_Do_To:35:=?00:00:00?
				: (SD_at_DefaultTimeSettings=2)  //All Day
					[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
					[DIARY:12]Time_Do_To:35:=SD_ti_SettingsTimeEnd
				: (SD_at_DefaultTimeSettings=4)  //All Morning
					[DIARY:12]Time_Do_From:6:=SD_ti_MorningStart
					[DIARY:12]Time_Do_To:35:=SD_ti_MorningEnd
				: (SD_at_DefaultTimeSettings=5)  //All Afternoon
					[DIARY:12]Time_Do_From:6:=SD_ti_AfternoonStart
					[DIARY:12]Time_Do_To:35:=SD_ti_AfternoonEnd
				: (SD_at_DefaultTimeSettings=6)  //All evening
					[DIARY:12]Time_Do_From:6:=SD_ti_EveningStart
					[DIARY:12]Time_Do_To:35:=SD_ti_EveningEnd
				: (SD_at_DefaultTimeSettings=8)  //Set time
					OBJECT SET VISIBLE:C603(SD_t_TimeSetting; False:C215)
					OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
					OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
					OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
					OBJECT SET VISIBLE:C603(SD_HL_l_Hours; True:C214)
					OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; True:C214)
			End case 
		End if 
	End if 
End if 
SD_at_DefaultTimeSettings:=0
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDiaryTimeSettingDropDown"; $_t_oldMethodName)