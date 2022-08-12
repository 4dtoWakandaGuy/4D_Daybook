//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary SeqCreate
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
	//ARRAY DATE(BAT_ad_BankHolidays;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	ARRAY LONGINT:C221($_al_actionTiming; 0)
	ARRAY LONGINT:C221($_al_actionWarningTiming; 0)
	ARRAY LONGINT:C221($_al_AddToDiaries; 0)
	ARRAY LONGINT:C221($_al_PrefsObjectTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_ScriptEvents; 0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	ARRAY TEXT:C222($_at_actionCodes; 0)
	ARRAY TEXT:C222($_at_PrefsObjectNames; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_Scripts; 0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	C_BOOLEAN:C305($_bo_ChargableAction; $_bo_DefaultAviodnonWorkingDays; $_bo_DefaultSetReminder; $_bo_DocumentAction; $_bo_ExcludeFromAdder; $_bo_IgnoreNWD; $_bo_IsThreaed; $_bo_Ok; $_bo_RecordDoneAction; $_bo_RecordJobActivity; $_bo_UseJobStageRates)
	C_BOOLEAN:C305($_bo_UserDiaryActionMacros; $_bo_WorkSaturday; $_bo_WorkSunday)
	C_DATE:C307($_d_DateCalculateFrom; $_d_EndDate; $_d_StartDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionClass; $_l_ActionReminder; $_l_ActionReminderTime; $_l_ActionThreaded; $_l_add; $_l_AddToDiaryID; $_l_AmountOfTime; $_l_AmountofTimeType; $_l_CompletedAction; $_l_DefaultDayofWeekEnd)
	C_LONGINT:C283($_l_DefaultDayofWeekStart; $_l_DefaultEndTime; $_l_DefaultReminderTime; $_l_DefaultReminderTimeType; $_l_DefaultTimeUnits; $_l_EndDayOfWeek; $_l_ExcludeFromAdder; $_l_FieldMacros; $_l_FindNext; $_l_FindPrevious; $_l_IgnoreStandarMacros)
	C_LONGINT:C283($_l_OverdueAutoAction; $_l_Plus; $_l_Priority; $_l_Ref; $_l_Ref2; $_l_SKipDays; $_l_StageRates; $_l_Stages; $_l_StartDayOfWeek; $_l_SUbtract; $_l_TaskDefaultColur)
	C_LONGINT:C283($_l_ThreadedView; $_l_TimeEndDays; $_l_TimeEndHours; $_l_TimeRemainingThisDay; $_l_TimeREQUIREDDays; $_l_TimeRequiredHours; $_l_TimeREQUIREDMinutes; $_l_TimeStartDays; $_l_TimeStartHours; $_l_TimeStartMinutes; $_l_TimeUnitsValue)
	C_LONGINT:C283($_l_TreadOption; $_l_UserID; $_l_WPAction; $_l_WPEntry)
	C_OBJECT:C1216($_obj_ActionAttributes; $_obj_DiaryAttributes; $_obj_DiaryPrefs; SD2_obj_DiaryPreferences)
	C_TEXT:C284($_t_ActionCode; $_t_ActionDetails; $_t_ActionName; $_t_AssociatedJobStageType; $_t_AutoResultCode; $_t_AutoResultScript; $_t_ChargeCalculationSript; $_t_DefaultDesciption; $_t_DefaultDescription; $_t_DefaultResultCode; $_t_Description)
	C_TEXT:C284($_t_DOcActionCode; $_t_DocumentCode; $_t_EntryForm; $_t_Locations; $_t_Macro; $_t_oldMethodName; $_t_Priority; $_t_PutinDIaryID; $_t_ScriptCode; $_t_StageType; $_t_UseEntryForm)
	C_TEXT:C284($_t_WOrkTimeEnd; $1)
	C_TIME:C306($_ti_DefaultStartTime; $_ti_TimeCalculateFrom; $_ti_TimeEndFrom; $_ti_TimeEndTo; $_ti_TimeStartFrom; $_ti_WorkTimeENd; $_ti_WorkTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary SeqCreate")
If (Count parameters:C259>=1)
	If ([ACTIONS:13]Action_Code:1#$1)
		//Diary SeqCreate
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$1)
	End if 
End if 

If (Records in selection:C76([DIARY:12])=1)
	DUPLICATE RECORD:C225([DIARY:12])
	[DIARY:12]x_ID:50:=0
	$_t_ActionDetails:=[DIARY:12]Action_Details:10
	[DIARY:12]Action_Details:10:="Sequence: "+[WORKFLOW_CONTROL:51]Description:5+Char:C90(13)+"Previous: "+[DIARY:12]Action_Code:9+", "+[DIARY:12]Result_Code:11+", "+[DIARY:12]Result_Description:12+Char:C90(13)
	[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Date Done: "+String:C10([DIARY:12]Date_Done_From:5)
	
	If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" - "+String:C10([DIARY:12]Date_Done_From:5)
	End if 
	[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Diary Code: "+[DIARY:12]Diary_Code:3+Char:C90(13)
	$_d_DateCalculateFrom:=[DIARY:12]Date_Done_To:34
	$_ti_TimeCalculateFrom:=[DIARY:12]Time_Done_To:36
	
Else 
	CREATE RECORD:C68([DIARY:12])
	$_d_DateCalculateFrom:=Current date:C33(*)
	$_ti_TimeCalculateFrom:=Current time:C178(*)
End if 

//from the workflow get some values.
//we are always creating the NEXT action.
$_t_DefaultDesciption:=[WORKFLOW_CONTROL:51]Description:5
$_t_DocumentCode:=[WORKFLOW_CONTROL:51]Document_Code:8  //this might be the 
$_t_ScriptCode:=[WORKFLOW_CONTROL:51]Script_Code:11
//the first bit here here controls the time from now that the action is set to be done
//in the case of something like a file note this might be zero
$_l_TimeStartHours:=[WORKFLOW_CONTROL:51]Hours:12
$_l_TimeStartMinutes:=[WORKFLOW_CONTROL:51]Minutes:13
$_l_TimeStartDays:=[WORKFLOW_CONTROL:51]Days:4
//the second bit here controls how long the action needs to the do to time
$_l_TimeRequiredHours:=[WORKFLOW_CONTROL:51]TimeNeededHours:15
$_l_TimeREQUIREDMinutes:=[WORKFLOW_CONTROL:51]TimeNeededMinutes:16
$_l_TimeREQUIREDDays:=[WORKFLOW_CONTROL:51]TimeNeededDAYS:14
$_t_PutinDIaryID:=[WORKFLOW_CONTROL:51]Person:7


QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[WORKFLOW_CONTROL:51]Next_Action:3)
//now we gather futther data from the action
//some of this might get over-ridden by the above.

//the following loads from the soft attributes
SD2_LoadDefaultAttributes(->$_obj_ActionAttributes)
OB GET PROPERTY NAMES:C1232($_obj_ActionAttributes; $_at_Properties; $_al_PropertyTypes)
$_l_Ref:=Find in array:C230($_at_Properties; "Whose Diaries")
If ($_l_Ref>0)
	
	OB GET ARRAY:C1229($_obj_ActionAttributes; "Whose Diaries"; $_al_AddToDiaries)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Exclude_from_Adder")
If ($_l_Ref>0)
	$_l_ExcludeFromAdder:=OB Get:C1224($_obj_ActionAttributes; "Exclude_from_Adder")
End if 
If ($_l_ExcludeFromAdder=1) & (Size of array:C274($_al_AddToDiaries)>0)  //
	//get the preferences from the first person add too
	$_obj_DiaryPrefs:=SD_LoadPrefs($_al_AddToDiaries{1})  //this gets the preferences for the user current user...
	
Else 
	$_obj_DiaryPrefs:=SD_LoadPrefs(<>PER_l_CurrentUserID)  //this gets the preferences for the user current user...
End if 
//from those diary prefs we want to know whether saturday and sunday are working days
OB GET PROPERTY NAMES:C1232($_obj_DiaryPrefs; $_at_PrefsObjectNames; $_al_PrefsObjectTypes)
$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "WorkSaturday")
If ($_l_Ref>0)
	$_bo_WorkSaturday:=OB Get:C1224($_obj_DiaryPrefs; "WorkSaturday")
End if 
$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "WorkSunday")
If ($_l_Ref>0)
	$_bo_WorkSunday:=OB Get:C1224($_obj_DiaryPrefs; "WorkSunday")
End if 
$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "Day_Start")
If ($_l_Ref>0)
	$_ti_WorkTimeStart:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_DiaryPrefs; "Day_Start"))
End if 
$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "Day_End")
If ($_l_Ref>0)
	$_ti_WorkTimeENd:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_DiaryPrefs; "Day_End"))
End if 

///THE AMOUNT OF TIME FOR THE ACTION CAN BE SET AT WORKFLOW OR ACTION LEVEL.
//WE USE THE WORK FLOW TIMING AS A PREFERENCE
//IF THAT IS NOT SET WE USE THE ACTION TIMING
//AND IF THAT IS NOT SET WE USE THE USER PREFERECE
//OR WE USE A DEFAULT
If ($_l_TimeRequiredHours=0) & ($_l_TimeREQUIREDMinutes=0) & ($_l_TimeREQUIREDDays=0)
	$_l_Ref:=Find in array:C230($_at_Properties; "Amount_of_Time")
	$_l_Ref2:=Find in array:C230($_at_Properties; "Amount_of_Time_Type")
	If ($_l_Ref>0)
		$_l_amountofTime:=OB Get:C1224($_obj_ActionAttributes; "Amount_of_Time")
		$_l_amountofTimeType:=OB Get:C1224($_obj_ActionAttributes; "Amount_of_Time_Type")
	End if 
	Case of 
		: ($_l_amountofTimeType=0)  //minutes
			$_l_TimeREQUIREDMinutes:=$_l_amountofTime
		: ($_l_amountofTimeType=1)  //hours
			$_l_TimeRequiredHours:=$_l_amountofTime
		: ($_l_amountofTimeType=2)  //days
			$_l_TimeREQUIREDDays:=$_l_amountofTime
	End case 
	If ($_l_TimeRequiredHours=0) & ($_l_TimeREQUIREDMinutes=0) & ($_l_TimeREQUIREDDays=0)
		//there is no time set on the action either
		$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "ActionCodes")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_DiaryPrefs; "ActionCodes"; $_at_actionCodes)
			$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "ActionCodes")
			If ($_l_Ref>0)
				OB GET ARRAY:C1229($_obj_DiaryPrefs; "ActionDefaultTiming"; $_al_actionTiming)  //note this is alway minutes
			End if 
		End if 
		$_l_Ref:=Find in array:C230($_at_actionCodes; [WORKFLOW_CONTROL:51]Next_Action:3)
		If ($_l_Ref>0)
			$_l_TimeREQUIREDMinutes:=$_al_actionTiming{$_l_Ref}
		End if 
		If ($_l_TimeREQUIREDMinutes=0)
			$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "DefaultActionLength")
			If ($_l_Ref>0)
				$_l_TimeREQUIREDMinutes:=OB Get:C1224($_obj_DiaryPrefs; "DefaultActionLength")
			End if 
			If ($_l_TimeREQUIREDMinutes=0)
				$_l_TimeREQUIREDMinutes:=60
			End if 
		End if 
	End if 
End if 





OB GET PROPERTY NAMES:C1232($_obj_ActionAttributes; $_at_Properties; $_al_PropertyTypes)

[DIARY:12]Action_Code:9:=[WORKFLOW_CONTROL:51]Next_Action:3
Diary_InLPX(->[DIARY:12]Action_Details:10)
Diary_Code
//$DateDoFrom:=[DIARY]Date_Do_From
//note that an action can only have one ot the following not some days and some hours and some minutes
$_l_Ref:=Find in array:C230($_at_Properties; "Start_Day")
If ($_l_Ref>0)
	$_l_StartDayOfWeek:=OB Get:C1224($_obj_ActionAttributes; "Start_Day")
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "End_Day")
If ($_l_Ref>0)
	$_l_EndDayOfWeek:=OB Get:C1224($_obj_ActionAttributes; "End_Day")
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Exclude_NW_Days")
If ($_l_Ref>0)
	$_bo_IgnoreNWD:=((OB Get:C1224($_obj_ActionAttributes; "Exclude_NW_Days"))=1)
	
End if 
Case of 
	: ($_l_TimeStartDays>0)  //we put this action N days from the date
		$_d_StartDate:=$_d_DateCalculateFrom+$_l_TimeStartDays
		If ($_bo_IgnoreNWD)
			SD_SetBankHols($_d_DateCalculateFrom)
			//make sure the date is not a bank holiday or non working day-note that we have to get the preferences of the diary
			//the problem here is if this is going in multiple diaries
			$_l_Plus:=0
			For ($_l_SKipDays; 1; $_l_TimeStartDays)
				Case of 
					: (Day number:C114(Current date:C33+$_l_SKipDays)=Saturday:K10:18) & ($_bo_WorkSaturday=False:C215)
						$_l_Plus:=$_l_Plus+1
					: (Day number:C114(Current date:C33+$_l_SKipDays)=Sunday:K10:19) & ($_bo_WorkSunday=False:C215)
						$_l_Plus:=$_l_Plus+1
					: (Find in array:C230(BAT_ad_BankHolidays; (Current date:C33+$_l_SKipDays))>0)
						$_l_Plus:=$_l_Plus+1
				End case 
				
			End for 
			$_d_StartDate:=$_d_StartDate+$_l_Plus
		End if 
		If ($_l_StartDayOfWeek>0)  //this action must start on a given day.-in that case we ingore if we work saturday/sunday or if its a bank holiday
			//we go to the nearest
			$_l_SUbtract:=0
			For ($_l_FindPrevious; 1; 8)
				If (Day number:C114($_d_StartDate-($_l_FindPrevious-1))=$_l_StartDayOfWeek)
					$_l_SUbtract:=($_l_FindPrevious-1)
					$_l_FindPrevious:=9
				End if 
			End for 
			$_l_add:=0
			For ($_l_FindNext; 1; 8)
				If (Day number:C114($_d_StartDate-($_l_FindNext+1))=$_l_StartDayOfWeek)
					$_l_FindNext:=($_l_FindNext+1)
					$_l_FindNext:=9
				End if 
			End for 
			If ($_l_SUbtract<$_l_add)
				$_d_StartDate:=$_d_StartDate-$_l_SUbtract
			Else 
				$_d_StartDate:=$_d_StartDate+$_l_SUbtract
			End if 
			
			
		Else 
			//here we do not put it on a saturday sunday or bank holiday
			$_l_Plus:=0
			Repeat 
				Case of 
					: (Day number:C114(($_d_StartDate+$_l_Plus))=Saturday:K10:18) & ($_bo_WorkSaturday=False:C215)
						$_l_Plus:=$_l_Plus+1
					: (Day number:C114(($_d_StartDate+$_l_Plus))=Sunday:K10:19) & ($_bo_WorkSunday=False:C215)
						$_l_Plus:=$_l_Plus+1
					: (Find in array:C230(BAT_ad_BankHolidays; ($_d_StartDate+$_l_Plus))>0)
						$_l_Plus:=$_l_Plus+1
					Else 
						$_bo_Ok:=True:C214
				End case 
			Until ($_bo_Ok)
			$_d_StartDate:=$_d_StartDate+$_l_Plus
		End if 
		[DIARY:12]Date_Do_From:4:=$_d_StartDate
		//here we need to get the start time of the persons diary we are adding to an make sure this is in working hours.
		//
		If ($_ti_WorkTimeStart>?00:00:00?)
			If ($_ti_WorkTimeStart>$_ti_TimeCalculateFrom)
				$_ti_TimeCalculateFrom:=$_ti_WorkTimeStart
			End if 
		End if 
		If ($_ti_WorkTimeEND>?00:00:00?)
			If ($_ti_WorkTimeEND<$_ti_TimeCalculateFrom)
				Case of 
					: ($_l_TimeRequiredHours>0)
						$_ti_TimeCalculateFrom:=$_ti_WorkTimeEND-($_l_TimeRequiredHours*60)
					: ($_l_TimeStartMinutes>0)
						$_ti_TimeCalculateFrom:=$_ti_WorkTimeEND-($_l_TimeStartMinutes)
					Else 
						$_ti_TimeCalculateFrom:=$_ti_WorkTimeStart
				End case 
			End if 
		End if 
		If ($_l_TimeREQUIREDDays>0)  //if the action is a day or number of days then the start time is the start of the working day
			[DIARY:12]Time_Do_From:6:=$_ti_WorkTimeStart
		Else 
			[DIARY:12]Time_Do_From:6:=$_ti_TimeCalculateFrom
		End if 
		
	: ($_l_TimeStartHours>0)
		$_ti_TimeStartFrom:=$_ti_TimeCalculateFrom+(60*60*$_l_TimeStartHours)
		If ($_ti_TimeStartFrom>?24:00:00?)
			//this is tomorrow or more...
			Repeat 
				$_l_TimeStartDays:=$_l_TimeStartDays+1
				$_l_TimeStartHours:=$_l_TimeStartHours-24
				$_ti_TimeStartFrom:=$_ti_TimeCalculateFrom+(60*60*$_l_TimeStartHours)
			Until ($_ti_TimeStartFrom<?24:00:00?)
			[DIARY:12]Date_Do_From:4:=$_d_DateCalculateFrom+$_l_TimeStartDays
			
		End if 
		//
		If ($_ti_WorkTimeStart>?00:00:00?)
			If ($_ti_WorkTimeStart>$_ti_TimeStartFrom)
				$_ti_TimeStartFrom:=$_ti_WorkTimeStart
			End if 
		End if 
		If ($_ti_WorkTimeEND>?00:00:00?)
			If ($_ti_WorkTimeEND<$_ti_TimeStartFrom)
				Case of 
					: ($_l_TimeRequiredHours>0)
						$_ti_TimeStartFrom:=$_ti_WorkTimeEND-($_l_TimeRequiredHours*60)
					: ($_l_TimeStartMinutes>0)
						$_ti_TimeStartFrom:=$_ti_WorkTimeEND-($_l_TimeStartMinutes)
					Else 
						$_ti_TimeStartFrom:=$_ti_WorkTimeStart
				End case 
			End if 
		End if 
		
		
		[DIARY:12]Time_Do_From:6:=$_ti_TimeStartFrom
		
	: ($_l_TimeStartMinutes>0)
		$_ti_TimeStartFrom:=$_ti_TimeCalculateFrom+(60*$_l_TimeStartMinutes)
		If ($_ti_TimeStartFrom>?24:00:00?)
			//this is tomorrow or more...
			Repeat 
				$_l_TimeStartDays:=$_l_TimeStartDays+1
				$_l_TimeStartMinutes:=$_l_TimeStartMinutes-(24*60)
				$_ti_TimeStartFrom:=$_ti_TimeCalculateFrom+(60*$_l_TimeStartMinutes)
			Until ($_ti_TimeStartFrom<?24:00:00?)
			[DIARY:12]Date_Do_From:4:=$_d_DateCalculateFrom+$_l_TimeStartDays
		End if 
		If ($_ti_WorkTimeStart>?00:00:00?)
			If ($_ti_WorkTimeStart>$_ti_TimeStartFrom)
				$_ti_TimeStartFrom:=$_ti_WorkTimeStart
			End if 
		End if 
		If ($_ti_WorkTimeEND>?00:00:00?)
			If ($_ti_WorkTimeEND<$_ti_TimeStartFrom)
				Case of 
					: ($_l_TimeRequiredHours>0)
						$_ti_TimeStartFrom:=$_ti_WorkTimeEND-($_l_TimeRequiredHours*60)
					: ($_l_TimeStartMinutes>0)
						$_ti_TimeStartFrom:=$_ti_WorkTimeEND-($_l_TimeStartMinutes)
					Else 
						$_ti_TimeStartFrom:=$_ti_WorkTimeStart
				End case 
			End if 
		End if 
		
		
		[DIARY:12]Time_Do_From:6:=$_ti_TimeStartFrom
		
End case 
Diary_InLPX(->[DIARY:12]Date_Do_From:4)
Diary_InLPX(->[DIARY:12]Time_Do_From:6)
//the below calculation if different in nature to the start from if we say start in 12 hours then we would mean that we start 12 hours from now(even though there are some hours in between we are not working)
//but when we calculate how long the event runs for if it is for example 12 hours then the task needs 'n' hours from the time of the start on that day plus some hours on the next day.

Case of 
	: ($_l_TimeREQUIREDDays>0)
		//
		$_d_EndDate:=[DIARY:12]Date_Do_From:4+$_l_TimeREQUIREDDays
		$_l_Plus:=0
		Repeat 
			Case of 
				: (Day number:C114(($_d_EndDate+$_l_Plus))=Saturday:K10:18) & ($_bo_WorkSaturday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Day number:C114(($_d_EndDate+$_l_Plus))=Sunday:K10:19) & ($_bo_WorkSunday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Find in array:C230(BAT_ad_BankHolidays; ($_d_EndDate+$_l_Plus))>0)
					$_l_Plus:=$_l_Plus+1
				Else 
					$_bo_Ok:=True:C214
			End case 
		Until ($_bo_Ok)
		$_d_EndDate:=$_d_EndDate+$_l_Plus
		[DIARY:12]Date_Do_To:33:=$_d_EndDate
		[DIARY:12]Time_Do_To:35:=$_ti_WOrkTimeEnd
	: ($_l_TimeRequiredHours>0)
		$_l_TimeEndDays:=0
		$_ti_TimeEndFrom:=[DIARY:12]Time_Do_From:6+(60*60*$_l_TimeRequiredHours)
		$_ti_TimeStartFrom:=[DIARY:12]Time_Do_From:6
		If ($_ti_WorkTimeEND=?00:00:00?)
			$_ti_WorkTimeEND:=?17:30:00?
		End if 
		If ($_ti_WorkTimeStart=?00:00:00?)
			$_ti_WorkTimeStart:=?09:00:00?
		End if 
		
		If ($_ti_TimeEndFrom>$_ti_WorkTimeEND)
			//this is after end of today tomorrow or more...
			Repeat 
				$_l_TimeEndDays:=$_l_TimeEndDays+1
				$_l_TimeRemainingThisDay:=(($_ti_WorkTimeEND-$_ti_TimeStartFrom)/60)/60
				
				$_ti_TimeStartFrom:=$_ti_WorkTimeStart  //so the amount of hours for subsequent days is calculated from start of working day
				$_l_TimeRequiredHours:=$_l_TimeRequiredHours-$_l_TimeRemainingThisDay
				
				$_ti_TimeEndFrom:=$_ti_TimeStartFrom+(60*60*$_l_TimeRequiredHours)
			Until ($_ti_TimeEndFrom<=$_ti_WorkTimeEND)
			[DIARY:12]Date_Do_To:33:=$_d_DateCalculateFrom+$_l_TimeEndDays
			[DIARY:12]Time_Do_To:35:=$_ti_TimeStartFrom+(60*60*$_l_TimeRequiredHours)
		Else 
			[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
			[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(60*60*$_l_TimeRequiredHours)
			
			
		End if 
		$_l_Plus:=0
		Repeat 
			Case of 
				: (Day number:C114(([DIARY:12]Date_Do_To:33+$_l_Plus))=Saturday:K10:18) & ($_bo_WorkSaturday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Day number:C114(([DIARY:12]Date_Do_To:33+$_l_Plus))=Sunday:K10:19) & ($_bo_WorkSunday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Find in array:C230(BAT_ad_BankHolidays; ([DIARY:12]Date_Do_To:33+$_l_Plus))>0)
					$_l_Plus:=$_l_Plus+1
				Else 
					$_bo_Ok:=True:C214
			End case 
		Until ($_bo_Ok)
		[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_To:33+$_l_Plus
		
		
		//
		If ($_ti_WorkTimeStart>?00:00:00?)
			If ($_ti_WorkTimeStart>[DIARY:12]Time_Do_To:35)
				[DIARY:12]Time_Do_To:35:=$_ti_WorkTimeStart
			End if 
		End if 
		If ($_ti_WorkTimeEND>?00:00:00?)
			If ($_ti_WorkTimeEND<[DIARY:12]Time_Do_To:35)
				[DIARY:12]Time_Do_To:35:=$_ti_WorkTimeEND
			End if 
		End if 
		
		
		
	: ($_l_TimeREQUIREDMinutes>0)
		$_l_TimeEndDays:=0
		$_ti_TimeEndTo:=[DIARY:12]Time_Do_From:6+(60*$_l_TimeREQUIREDMinutes)
		$_ti_TimeStartFrom:=[DIARY:12]Time_Do_From:6
		If ($_ti_WorkTimeEND=?00:00:00?)
			$_ti_WorkTimeEND:=?17:30:00?
		End if 
		If ($_ti_WorkTimeStart=?00:00:00?)
			$_ti_WorkTimeStart:=?09:00:00?
		End if 
		
		
		If ($_ti_TimeEndTo>$_ti_WorkTimeEND)
			//this is tomorrow or more...
			Repeat 
				$_l_TimeEndDays:=$_l_TimeEndDays+1
				$_l_TimeRemainingThisDay:=(($_ti_WorkTimeEND-$_ti_TimeStartFrom)/60)  //numberofminsremaingin
				
				$_ti_TimeStartFrom:=$_ti_WorkTimeStart  //so the amount of hours for subsequent days is calculated from start of working day
				$_l_TimeREQUIREDMinutes:=$_l_TimeREQUIREDMinutes-$_l_TimeRemainingThisDay
				
				$_ti_TimeEndFrom:=$_ti_TimeStartFrom+(60*$_l_TimeREQUIREDMinutes)
			Until ($_ti_TimeEndFrom<=$_ti_WorkTimeEND)
			[DIARY:12]Date_Do_To:33:=$_d_DateCalculateFrom+$_l_TimeEndDays
			[DIARY:12]Time_Do_To:35:=$_ti_TimeStartFrom+(60*$_l_TimeREQUIREDMinutes)
			
		Else 
			[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
			[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(60*$_l_TimeStartMinutes)
		End if 
		$_l_Plus:=0
		Repeat 
			Case of 
				: (Day number:C114(([DIARY:12]Date_Do_To:33+$_l_Plus))=Saturday:K10:18) & ($_bo_WorkSaturday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Day number:C114(([DIARY:12]Date_Do_To:33+$_l_Plus))=Sunday:K10:19) & ($_bo_WorkSunday=False:C215)
					$_l_Plus:=$_l_Plus+1
				: (Find in array:C230(BAT_ad_BankHolidays; ([DIARY:12]Date_Do_To:33+$_l_Plus))>0)
					$_l_Plus:=$_l_Plus+1
				Else 
					$_bo_Ok:=True:C214
			End case 
		Until ($_bo_Ok)
		[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_To:33+$_l_Plus
		
		If ($_ti_WorkTimeStart>?00:00:00?)
			If ($_ti_WorkTimeStart>[DIARY:12]Time_Do_To:35)
				[DIARY:12]Time_Do_To:35:=$_ti_WorkTimeStart
			End if 
		End if 
		If ($_ti_WorkTimeEND>?00:00:00?)
			If ($_ti_WorkTimeEND<[DIARY:12]Time_Do_To:35)
				[DIARY:12]Time_Do_To:35:=$_ti_WorkTimeEND
			End if 
		End if 
		
End case 
Diary_InLPX(->[DIARY:12]Date_Do_To:33)
Diary_InLPX(->[DIARY:12]Time_Do_To:35)

$_l_Ref:=Find in array:C230($_at_Properties; "DoneAction")
If ($_l_Ref>0)
	$_l_CompletedAction:=OB Get:C1224($_obj_ActionAttributes; "DoneAction")
End if 
//with a completed action we do no set the done time here//they will be set when the action is saved
[DIARY:12]Done:14:=($_l_CompletedAction=1)
//we want to inherit some of the attrbutes to the diary item for ease of use
$_l_Ref:=Find in array:C230($_at_Properties; "WPEntry")
If ($_l_Ref>0)
	$_l_WPEntry:=OB Get:C1224($_obj_ActionAttributes; "WPEntry")
	OB SET:C1220($_obj_DiaryAttributes; "WPEntry"; $_l_WPEntry)
	
End if 

$_l_Ref:=Find in array:C230($_at_Properties; "Threaded_View_Option")
If ($_l_Ref>0)
	$_l_ThreadedView:=OB Get:C1224($_obj_ActionAttributes; "Threaded_View_Option")
	OB SET:C1220($_obj_DiaryAttributes; "Threaded_View_Option"; $_l_ThreadedView)
	
End if 

$_l_Ref:=Find in array:C230($_at_Properties; "Macro_Codes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_ActionAttributes; "Macro_Codes"; $_at_Scripts)
	OB SET ARRAY:C1227($_obj_DiaryAttributes; "Macro_Codes"; $_at_Scripts)
	
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Events")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_ActionAttributes; "Events"; $_al_ScriptEvents)
	OB SET ARRAY:C1227($_obj_DiaryAttributes; "Events"; $_al_ScriptEvents)
	
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Events")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_ActionAttributes; "Events"; $_al_ScriptEvents)
	OB SET ARRAY:C1227($_obj_DiaryAttributes; "Events"; $_al_ScriptEvents)
	
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Field_Macros")
If ($_l_Ref>0)
	$_l_FieldMacros:=OB Get:C1224($_obj_ActionAttributes; "Field_Macros")
	OB SET:C1220($_obj_DiaryAttributes; "Field_Macros"; $_l_FieldMacros)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Field_Macros")
If ($_l_Ref>0)
	$_l_FieldMacros:=OB Get:C1224($_obj_ActionAttributes; "Field_Macros")
	OB SET:C1220($_obj_DiaryAttributes; "Field_Macros"; $_l_FieldMacros)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Ignore_Diary_Macros")
If ($_l_Ref>0)
	$_l_IgnoreStandarMacros:=OB Get:C1224($_obj_ActionAttributes; "Ignore_Diary_Macros")
	OB SET:C1220($_obj_DiaryAttributes; "Ignore_Diary_Macros"; $_l_IgnoreStandarMacros)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Result_Codes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_ActionAttributes; "Result_Codes"; $_at_ResultCodes)
	OB SET ARRAY:C1227($_obj_DiaryAttributes; "Result_Codes"; $_at_ResultCodes)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Auto_Result_Code")
If ($_l_Ref>0)
	$_t_AutoResultCode:=OB Get:C1224($_obj_ActionAttributes; "Auto_Result_Code")
	OB SET:C1220($_obj_DiaryAttributes; "Auto_Result_Code"; $_t_AutoResultCode)
	
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Data_Entry_Form")
If ($_l_Ref>0)
	$_t_EntryForm:=OB Get:C1224($_obj_ActionAttributes; "Data_Entry_Form")
	OB SET:C1220($_obj_DiaryAttributes; "Data_Entry_Form"; $_t_EntryForm)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Stages_Rates")
If ($_l_Ref>0)
	$_l_StageRates:=OB Get:C1224($_obj_ActionAttributes; "Stages_Rates")
	OB SET:C1220($_obj_DiaryAttributes; "Stages_Rates"; $_l_StageRates)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "RecordStages")
If ($_l_Ref>0)
	$_l_Stages:=OB Get:C1224($_obj_ActionAttributes; "RecordStages")
	OB SET:C1220($_obj_DiaryAttributes; "RecordStages"; $_l_Stages)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Job_Stage_Type")
If ($_l_Ref>0)
	$_t_StageType:=OB Get:C1224($_obj_ActionAttributes; "Job_Stage_Type")
	OB SET:C1220($_obj_DiaryAttributes; "Job_Stage_Type"; $_t_StageType)
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Time_Units_Macro_Code")
If ($_l_Ref>0)
	$_t_Macro:=OB Get:C1224($_obj_ActionAttributes; "Time_Units_Macro_Code")
	OB SET:C1220($_obj_DiaryAttributes; "Time_Units_Macro_Code"; $_t_Macro)
End if 
[DIARY:12]Attributes:79:=$_obj_DiaryAttributes
//there can be a document for the workflow or a document for the action.
//which overrides?. This is attaching a document to the diary.
If ([WORKFLOW_CONTROL:51]Document_Code:8="")
	$_l_Ref:=Find in array:C230($_at_Properties; "Document_Code")
	If ($_l_Ref>0)
		$_t_DocumentCode:=OB Get:C1224($_obj_ActionAttributes; "Document_Code")
	End if 
	If ($_t_DocumentCode#"")
		[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate($_t_DocumentCode)
	End if 
Else 
	[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate([WORKFLOW_CONTROL:51]Document_Code:8)
End if 
Diary_InLPX(->[DIARY:12]Document_Code:15)
If ([DIARY:12]Document_Code:15="")
	[DIARY:12]Document_Heading:32:=""
Else 
	RELATE ONE:C42([DIARY:12]Document_Code:15)
	[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
End if 
If (False:C215)
	$_l_Ref:=Find in array:C230($_at_Properties; "WP_action")
	If ($_l_Ref>0)
		$_l_WPAction:=OB Get:C1224($_obj_ActionAttributes; "WP_action")
	End if 
	If ($_l_WPAction=1)  //this means there is a document type associated with the action and that document will open
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Priority")
If ($_l_Ref>0)
	$_t_Priority:=OB Get:C1224($_obj_ActionAttributes; "Priority")
End if 
If ($_t_Priority#"")
	[DIARY:12]Priority:17:=$_t_Priority
End if 
$_l_Ref:=Find in array:C230($_at_Properties; "Default_Description")
If ($_l_Ref>0)
	$_t_Description:=OB Get:C1224($_obj_ActionAttributes; "Default_Description")
End if 
If ($_t_Description#"")
	If ([DIARY:12]Action_Details:10#"")
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+$_t_Description
	Else 
		[DIARY:12]Action_Details:10:=$_t_Description
	End if 
End if 
//$_l_Ref:=Find in array($_at_Properties;"Action_Locations")
//If ($_l_Ref>0)
//$_l_ActionClass:=OB Get($_obj_ActionAttributes;"Action_Locations")
//End if 
[DIARY:12]xDiaryClass:65:=$_l_ActionClass
$_l_Ref:=Find in array:C230($_at_Properties; "Threaded")
If ($_l_Ref>0)
	$_l_ActionThreaded:=OB Get:C1224($_obj_ActionAttributes; "Threaded")
End if 
If ($_l_ActionThreaded=1)
	If ([DIARY:12]ThreadID:64=0)
		[DIARY:12]x_Is_Thread:68:=True:C214
		[DIARY:12]ThreadID:64:=AA_GetNextID(->[DIARY:12]ThreadID:64)  // new thread was but changed in stock version?
	End if 
End if 
//class of action-the class of action only exists if the action gets its settings from a template action-in which all the fields will be locked
$_l_Ref:=Find in array:C230($_at_Properties; "Reminder")
If ($_l_Ref>0)
	$_l_ActionReminder:=OB Get:C1224($_obj_ActionAttributes; "Reminder")
End if 
If ($_l_ActionReminder=0)
	//we dont set a reminder on this action..but the user might have that as a preference
	$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "ActionCodes")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_DiaryPrefs; "ActionCodes"; $_at_actionCodes)
		$_l_Ref:=Find in array:C230($_at_PrefsObjectNames; "ActionWarningTime")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_DiaryPrefs; "ActionWarningTime"; $_al_actionWarningTiming)  //note this is alway minutes
		End if 
		$_l_Ref:=Find in array:C230($_at_actionCodes; [DIARY:12]Action_Code:9)
		If ($_l_Ref>0)
			$_l_ActionReminder:=Num:C11($_al_actionWarningTiming{$_l_Ref}>0)
			$_l_ActionReminderTime:=$_al_actionWarningTiming{$_l_Ref}
		End if 
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_Properties; "Reminder_time")
	If ($_l_Ref>0)
		$_l_ActionReminderTime:=OB Get:C1224($_obj_ActionAttributes; "Reminder_time")
	End if 
	
End if 
If ($_l_ActionReminder=1)
	If ($_l_ActionReminderTime=0)
		$_l_ActionReminderTime:=60
	End if 
End if 
If ($_l_ActionReminder=1)
	[DIARY:12]Alarm_Timeframe:48:=$_l_ActionReminderTime
End if 
//remember the diary ids could be group diaries now
If (Size of array:C274($_al_AddToDiaries)>0)
	$_l_Ref:=Find in array:C230($_al_AddToDiaries; $_l_UserID)  //check var used
	If ($_l_Ref<0)
		If ($_l_ExcludeFromAdder=0)
			APPEND TO ARRAY:C911($_al_AddToDiaries; $_l_UserID)
		End if 
	Else 
		If ($_l_ExcludeFromAdder=1)
			DELETE FROM ARRAY:C228($_al_AddToDiaries; $_l_Ref)  //we dont want it in that diary
		End if 
	End if 
	
	
Else 
	//we only want this in one diary..the adder-can have exclude from adder and not have any diaries!!
	[DIARY:12]PersonID:56:=$_l_UserID
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_UserID)
	[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
	UNLOAD RECORD:C212([PERSONNEL:11])
	
End if 
OB GET ARRAY:C1229($_obj_ActionAttributes; "Whose Diaries"; $_al_AddToDiaries)
[DIARY:12]Date_Done_From:5:=!00-00-00!
[DIARY:12]Date_Done_To:34:=!00-00-00!
[DIARY:12]Time_Do_From:6:=?00:00:00?
[DIARY:12]Time_Do_To:35:=?00:00:00?
[DIARY:12]Time_Done_From:7:=?00:00:00?
[DIARY:12]Time_Done_To:36:=?00:00:00?


[DIARY:12]Result_Code:11:=""
[DIARY:12]Result_Description:12:=""


[DIARY:12]Originator:23:=[DIARY:12]Person:8

//[DIARY]Action_Code
//[DIARY]Action_Details
//[DIARY]Alarm_Timeframe
//[DIARY]Booking_Code
//[DIARY]Budget_Units
//[DIARY]Call_Code
//[DIARY]Charge_Rate
//[DIARY]Company_Code
//[DIARY]Contact_Code
//[DIARY]Cost_Rate
///[DIARY]Cost_Value
//[DIARY]Data_Source_Table
//[DIARY]Display_Description
//[DIARY]Document_Code
//[DIARY]Document_Heading
//[DIARY]Email_From
//[DIARY]Email_ID
//[DIARY]Event_Code
//[DIARY]Job_Code
//[DIARY]Order_Code
//[DIARY]Personal_Priority
//[DIARY]PersonID
//[DIARY]Picture_Code
//[DIARY]Priority
//[DIARY]Product_Code
//[DIARY]Public
//[DIARY]Result_Code
//[DIARY]Result_Description
//[DIARY]Script_Code
//[DIARY]Sequence_Actioned
//[DIARY]Stage_Code
//[DIARY]Status
//[DIARY]Subject
///[DIARY]ThreadID
//[DIARY]Time_Checked
//[DIARY]Time_Do_From
//[DIARY]Time_Do_To
//[DIARY]Time_Done_From
//[DIARY]Time_Done_To
//[DIARY]Units
//[DIARY]Value
//[DIARY]x_Close_Options
//[DIARY]x_ID
//[DIARY]x_Is_Thread
//[DIARY]x_Open_Parent
//[DIARY]x_Place_of_Action
//[DIARY]X_REOCCOURANCE
//[DIARY]xDiaryClass
//[DIARY]xDiaryForm


If ([WORKFLOW_CONTROL:51]Person:7#"")
	[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Person: "+[DIARY:12]Person:8
	Diary_InLPX(->[DIARY:12]Action_Details:10)
	[DIARY:12]Person:8:=[WORKFLOW_CONTROL:51]Person:7
	Diary_InLPX(->[DIARY:12]Person:8)
End if 
Diary_PersPrior
Diary_InLPX(->[DIARY:12]Personal_Priority:31)
DB_SaveRecord(->[DIARY:12])
AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
Case of 
	: ([WORKFLOW_CONTROL:51]Display:6=0)
		// PUSH RECORD([DIARY])
		// ADD TO SET([DIARY];"DMaster")
		//  USE SET("DMaster")
		//   POP RECORD([DIARY])
	: ([WORKFLOW_CONTROL:51]Display:6=1)
		//   ADD TO SET([DIARY];"DMaster")
End case 
ERR_MethodTrackerReturn("Diary SeqCreate"; $_t_oldMethodName)