//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetVisible
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
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_BOOLEAN:C305($_bo_HideTImes; $_bo_ShowTImes; $1; SD_bo_AddingDiaryRecord; SD_bo_CBAlarmed)
	C_LONGINT:C283(SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_DIaryPage; SD_l_TimeFrame; vSD_SelCalendar2; vSD_SelCalendar3)
	C_POINTER:C301(SD_ptr_Date1; SD_ptr_Date2)
	C_TEXT:C284($_t_oldMethodName; SD_at_TimeFrame; SD_t_TimeSetting)
	C_TIME:C306(SD_ti_AfternoonEnd; SD_ti_AfternoonStart; SD_ti_EveningEnd; SD_ti_EveningStart; SD_ti_MorningEnd; SD_ti_MorningStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetVisible")

If (SD_l_DIaryPage=3) & (Not:C34(FORM Get current page:C276=2))
	
	
	OBJECT SET VISIBLE:C603(*; "oDiaryInputObject"+"@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oPersons"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDescriptionLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSplitter1"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "PICT_SMSR"; False:C215)
	OBJECT SET VISIBLE:C603(*; "PICT_EmailR"; False:C215)
	OBJECT SET VISIBLE:C603(*; "PICT_SnailMailR"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oResCodeLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDiaryResult"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oResdescLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oMacroLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oUnitsLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStatusLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRelationLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDiaryCodeLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRelations"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDiaryActionDesc"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
	
Else 
	
	If (True:C214)
		OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDateDoToLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oActionCodeDropDown"; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDateDoFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
		OBJECT SET VISIBLE:C603(vSD_SelCalendar2; False:C215)
		OBJECT SET VISIBLE:C603(vSD_SelCalendar3; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
		If (SD_bo_AddingDiaryRecord)
			SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3; True:C214)
		Else 
			SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3; False:C215)
		End if 
		
		If ([DIARY:12]Done:14=False:C215) | (SD_bo_AddingDiaryRecord)
			Case of 
				: ([DIARY:12]Date_Done_From:5=!00-00-00!)
					OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; True:C214)
					SD_ptr_Date1:=->[DIARY:12]Date_Do_From:4
					SD_TimeToDuration([DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35)
					OBJECT SET VISIBLE:C603(vSD_SelCalendar2; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDateDoFromLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; True:C214)
					If ([DIARY:12]Date_Do_To:33#[DIARY:12]Date_Do_From:4) | (SD_bo_AddingDiaryRecord)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Do_To:33
						OBJECT SET VISIBLE:C603(vSD_SelCalendar3; True:C214)
						OBJECT SET VISIBLE:C603(*; "oDateDoToLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oActionCodeDropDown"; True:C214)
						
					End if 
					If ([DIARY:12]Time_Do_From:6#?00:00:00?) | (SD_bo_AddingDiaryRecord)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
						// oHoursPicture
						OBJECT SET VISIBLE:C603(*; "oHoursFromHLList"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursHLList"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
					End if 
				: ([DIARY:12]Date_Done_From:5>!00-00-00!)
					OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; True:C214)
					SD_ptr_Date1:=->[DIARY:12]Date_Done_From:5
					OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; True:C214)
					OBJECT SET VISIBLE:C603(vSD_SelCalendar2; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; True:C214)
					If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5) | (SD_bo_AddingDiaryRecord)
						
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Done_To:34
						OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oActionCodeDropDown"; True:C214)
						OBJECT SET VISIBLE:C603(vSD_SelCalendar3; True:C214)
						
					End if 
					If ([DIARY:12]Time_Done_From:7#?00:00:00?) | (SD_bo_AddingDiaryRecord)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursFromHLList"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oHoursHLList"; True:C214)
						OBJECT SET VISIBLE:C603(SD_HL_l_Hours; True:C214)
						OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; True:C214)
					End if 
			End case 
		Else   //item done
			Case of 
				: ([DIARY:12]Date_Done_From:5=!00-00-00!)
					//still show the do from time
					OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; True:C214)
					SD_ptr_Date1:=->[DIARY:12]Date_Do_From:4
					OBJECT SET VISIBLE:C603(*; "oDateDoFromLabel"; True:C214)
					
					If ([DIARY:12]Date_Do_To:33#[DIARY:12]Date_Do_From:4)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Do_To:33
						OBJECT SET VISIBLE:C603(*; "oDateDoToLabel"; True:C214)
					End if 
					If ([DIARY:12]Time_Do_From:6#?00:00:00?)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; True:C214)
					End if 
				: ([DIARY:12]Date_Done_From:5>!00-00-00!)
					OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; True:C214)
					SD_ptr_Date1:=->[DIARY:12]Date_Done_From:5
					OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; True:C214)
					If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Done_To:34
						OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; True:C214)
					End if 
					If ([DIARY:12]Time_Done_From:7#?00:00:00?)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; True:C214)
					End if 
			End case 
		End if 
		
	Else 
		Case of 
			: ($1=True:C214)  //load record
				
				Case of 
					: ([DIARY:12]Date_Do_From:4#!00-00-00!) & ([DIARY:12]Date_Done_From:5=!00-00-00!)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; True:C214)
						SD_ptr_Date1:=->[DIARY:12]Date_Do_From:4
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Do_To:33
						OBJECT SET VISIBLE:C603(*; "Text12"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text13"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text25"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text26"; False:C215)
						
					: ([DIARY:12]Date_Done_From:5#!00-00-00!)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text12"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text13"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; True:C214)
						SD_ptr_Date1:=->[DIARY:12]Date_Done_From:5
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Done_To:34
						OBJECT SET VISIBLE:C603(*; "Text25"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text26"; True:C214)
					: (([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_From:4; True:C214)
						SD_ptr_Date1:=->[DIARY:12]Date_Do_From:4
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Do_To:33; True:C214)
						SD_ptr_Date2:=->[DIARY:12]Date_Do_To:33
						OBJECT SET VISIBLE:C603(*; "Text12"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text13"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text25"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text26"; False:C215)
				End case 
				Case of 
					: (([DIARY:12]Time_Do_From:6=?00:00:00?) & ([DIARY:12]Time_Done_From:7=?00:00:00?))
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text14"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text15"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Library Picture2"; True:C214)
					: ([DIARY:12]Time_Done_From:7#?00:00:00?)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text24"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; True:C214)
						OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Library Picture2"; True:C214)
					: ([DIARY:12]Time_Do_From:6#?00:00:00?)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text14"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text15"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Library Picture2"; True:C214)
						
				End case 
			: ($1=False:C215)  //load record
				Case of 
					: (([DIARY:12]Done:14=False:C215) & ([DIARY:12]Time_Do_From:6=?00:00:00?))
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture1"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture2"; False:C215)
						
					: (([DIARY:12]Done:14=False:C215) & ([DIARY:12]Time_Do_From:6#?00:00:00?))
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text14"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text15"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
					: (([DIARY:12]Done:14=True:C214) & ([DIARY:12]Time_Done_From:7=?00:00:00?))
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text24"; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture1"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Library Picture2"; False:C215)
					: (([DIARY:12]Done:14=True:C214) & ([DIARY:12]Time_Done_From:7#?00:00:00?))
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text24"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
						OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
				End case 
				SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3; False:C215)
		End case 
		
		
		
		
		
	End if 
	$_bo_HideTImes:=False:C215
	$_bo_ShowTImes:=False:C215
	Case of 
		: ([DIARY:12]Time_Do_From:6=?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?) & ([DIARY:12]Done:14=False:C215)
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{1}
			$_bo_HideTImes:=True:C214
		: ([DIARY:12]Time_Do_From:6<=SD_ti_SettingsTimeStart) & ([DIARY:12]Time_Do_To:35>=SD_ti_SettingsTimeEnd) & ([DIARY:12]Done:14=False:C215)
			//its an all day event
			$_bo_HideTImes:=True:C214
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{2}
		: ([DIARY:12]Time_Do_From:6=SD_ti_MorningStart) & ([DIARY:12]Time_Do_To:35=SD_ti_MorningEnd) & ([DIARY:12]Done:14=False:C215)
			//all morning
			$_bo_HideTImes:=True:C214
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{4}
		: ([DIARY:12]Time_Do_From:6=SD_ti_AfternoonStart) & ([DIARY:12]Time_Do_To:35=SD_ti_AfternoonEnd) & ([DIARY:12]Done:14=False:C215)
			// all afternoon
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{5}
			$_bo_HideTImes:=True:C214
		: ([DIARY:12]Time_Do_From:6<=SD_ti_EveningStart) & ([DIARY:12]Time_Do_To:35=SD_ti_EveningEnd) & ([DIARY:12]Done:14=False:C215)
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{6}
			//all evening
			$_bo_HideTImes:=True:C214
			
		: ([DIARY:12]Time_Do_From:6>=?00:00:00?) & ([DIARY:12]Time_Do_To:35>=?00:00:00?) & ([DIARY:12]Done:14=False:C215)
			$_bo_ShowTImes:=True:C214
		: ([DIARY:12]Time_Done_From:7=?00:00:00?) & ([DIARY:12]Time_Done_To:36=?00:00:00?) & ([DIARY:12]Done:14=True:C214)
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{1}
			$_bo_HideTImes:=True:C214
		: ([DIARY:12]Time_Done_From:7<=SD_ti_SettingsTimeStart) & ([DIARY:12]Time_Done_To:36>=SD_ti_SettingsTimeEnd) & ([DIARY:12]Done:14=True:C214)
			//its an all day event
			$_bo_HideTImes:=True:C214
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{2}
		: ([DIARY:12]Time_Done_From:7=SD_ti_MorningStart) & ([DIARY:12]Time_Done_To:36=SD_ti_MorningEnd) & ([DIARY:12]Done:14=True:C214)
			//all morning
			$_bo_HideTImes:=True:C214
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{4}
		: ([DIARY:12]Time_Done_From:7=SD_ti_AfternoonStart) & ([DIARY:12]Time_Done_To:36=SD_ti_AfternoonEnd) & ([DIARY:12]Done:14=True:C214)
			// all afternoon
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{5}
			$_bo_HideTImes:=True:C214
		: ([DIARY:12]Time_Done_From:7<=SD_ti_EveningStart) & ([DIARY:12]Time_Done_To:36=SD_ti_EveningEnd) & ([DIARY:12]Done:14=True:C214)
			SD_t_TimeSetting:=SD_at_DefaultTimeSettings{6}
			//all evening
			$_bo_HideTImes:=True:C214
			
		: ([DIARY:12]Time_Done_From:7>=?00:00:00?) & ([DIARY:12]Time_Done_To:36>=?00:00:00?) & ([DIARY:12]Done:14=True:C214)
			$_bo_ShowTImes:=True:C214
			
	End case 
	If ($_bo_HideTImes)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
		OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
		OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; True:C214)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
		
		If ($_bo_ShowTImes)
			If ([DIARY:12]Done:14)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; True:C214)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; True:C214)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
				OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
				
			Else 
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours; True:C214)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; True:C214)
				OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
			End if 
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_SetVisible"; $_t_oldMethodName)
