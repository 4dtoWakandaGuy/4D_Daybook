//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SEQUENCESetNextDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	C_BOOLEAN:C305(SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283($_l_ActionRow; $_l_Length; SD_l_SettingsTimeLen)
	C_TEXT:C284($_t_oldMethodName; $1; SD_t_CurrentDiaryInitials)
	C_TIME:C306(SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SEQUENCESetNextDate")
//this method will set the time and date of the next action using data
//from the sequences

If (Count parameters:C259>=1)
	If ($1#"")
		If ([WORKFLOW_CONTROL:51]WFControl_Code:10#$1)
			QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$1)
		End if 
		If ([WORKFLOW_CONTROL:51]Days:4>0)
			[DIARY:12]Date_Do_From:4:=SD_WorkingDays([DIARY:12]Date_Done_To:34; [WORKFLOW_CONTROL:51]Days:4; SD_bo_SaturdayWork; SD_bo_SundayWork)
		End if 
		If ([WORKFLOW_CONTROL:51]Hours:12>0)
			[DIARY:12]Time_Do_From:6:=SD_WorkingHours([DIARY:12]Time_Done_To:36; [WORKFLOW_CONTROL:51]Hours:12; ->[DIARY:12]Date_Done_To:34; SD_bo_SaturdayWork; SD_bo_SundayWork)
		End if 
		If ([WORKFLOW_CONTROL:51]Minutes:13>0)
			[DIARY:12]Time_Do_From:6:=SD_WorkingMinutes([DIARY:12]Time_Done_To:36; [WORKFLOW_CONTROL:51]Hours:12; ->[DIARY:12]Date_Done_To:34; SD_bo_SaturdayWork; SD_bo_SundayWork)
		End if 
		Case of 
			: ([WORKFLOW_CONTROL:51]TimeNeededDAYS:14>0)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4+[WORKFLOW_CONTROL:51]TimeNeededDAYS:14
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
			: ([WORKFLOW_CONTROL:51]TimeNeededHours:15>0)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
				[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180([DIARY:12]Time_Do_From:6+([WORKFLOW_CONTROL:51]TimeNeededHours:15*60*60)))
			: ([WORKFLOW_CONTROL:51]TimeNeededMinutes:16>0)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
				[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180([DIARY:12]Time_Do_From:6+([WORKFLOW_CONTROL:51]TimeNeededHours:15*60)))
			Else 
				//SD_l_SettingsTimeLen
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
				If ([DIARY:12]Time_Do_From:6=?00:00:00?)
					[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
				End if 
				
				$_l_ActionRow:=Find in array:C230(SD_at_ActionCodes; [DIARY:12]Action_Code:9)
				If ($_l_ActionRow>0)
					If (SD_al_ActionTime{$_l_ActionRow}>0)
						[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_al_ActionTime{$_l_ActionRow}*60)
					Else   //action has no special time
						[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
					End if 
					
				End if 
				$_l_Length:=(([DIARY:12]Time_Do_To:35*1)-([DIARY:12]Time_Do_From:6*1))/60
				[DIARY:12]Time_Do_To:35:=SD_GETAVAILABLETIMESLOT(SD_t_CurrentDiaryInitials; [DIARY:12]Date_Do_From:4; [DIARY:12]Time_Do_From:6; $_l_Length)
				[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180([DIARY:12]Time_Do_To:35-($_l_Length*60)))
				
		End case 
	End if 
End if 

[DIARY:12]Date_Done_From:5:=!00-00-00!
[DIARY:12]Date_Done_To:34:=!00-00-00!
[DIARY:12]Time_Done_From:7:=?00:00:00?
[DIARY:12]Time_Done_To:36:=?00:00:00?
ERR_MethodTrackerReturn("SD_SEQUENCESetNextDate"; $_t_oldMethodName)
