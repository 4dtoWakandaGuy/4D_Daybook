//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ChangeActionCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	ARRAY LONGINT:C221($_al_WhoseDiary; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY LONGINT(SD2_AL_MacroEvent;0)
	//ARRAY LONGINT(SD2_AL_MacroignoreStd;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_Scripts;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	C_BOOLEAN:C305($_bo_isInShecdule; $_bo_NoScripts; $_bo_RecordDoneTimeDate; $_bo_UseJSRate; DB_bo_NoLoad; SD2_bo_ShowDetailsASWP; $_bo_Exclude; $_bo_isInShecdule; $_bo_NoScripts; $_bo_RecordDoneTimeDate; $_bo_UseJSRate)
	C_BOOLEAN:C305(SD2_bo_ShowDetailsASWP)
	C_DATE:C307($_d_EndDate; $_d_StartAT; $_d_StartDate; $_d_CurrentDate; $_d_EndDate; $_d_StartAT; $_d_StartDate)
	C_LONGINT:C283($_l_CBThreaded; $_l_ColumnIndex; $_l_ColumnsIndex; $_l_DayNumber; $_l_Days; $_l_DiaryActionClass; $_l_FieldNumber; $_l_FieldRow; $_l_FieldRow2; $_l_FieldRow3; $_l_Hours)
	C_LONGINT:C283($_l_Minutes; $_l_OneDay; $_l_OneHour; $_l_Remainder; $_l_ReminderTime; $_l_SD2TimeAmount; $_l_Seconds; $_l_TimeInSeconds; $_l_TimeToSeconds; SD2_l_CB_Alarmed; SD2_l_Completed)
	C_LONGINT:C283(SD2_l_FieldLevelMacros; SD2_l_IgnoreStdMacros; SD2_l_TimeFrame; $_l_AbsTimeFrame; $_l_CBThreaded; $_l_ColumnIndex; $_l_ColumnsIndex; $_l_DayNumber; $_l_Days; $_l_DiaryActionClass; $_l_FieldRow)
	C_LONGINT:C283($_l_FieldRow2; $_l_FieldRow3; $_l_FieldRow4; $_l_Hours; $_l_Minutes; $_l_OneDay; $_l_OneHour; $_l_Remainder; $_l_ReminderTime; $_l_SD2TimeAmount; $_l_Seconds)
	C_LONGINT:C283($_l_TimeInSeconds; $_l_TimeToSeconds; SD2_l_autoActionCode; SD2_l_CB_Alarmed; SD2_l_Completed; SD2_l_FieldLevelMacros; SD2_l_IgnoreStdMacros; SD2_l_TimeFrame)
	C_OBJECT:C1216($_obj_ActionAttributes)
	C_POINTER:C301($_ptr_DiaryField)
	C_TEXT:C284($_t_oldMethodName; $1; SD2_t_DiaryOwnerName; SD2_t_DocumentDisplayCode; SD2_t_SELActionName; SD2_t_TimeFrame; $_t_DocumentCode; $_t_oldMethodName; SD2_t_DiaryOwnerName; SD2_t_DocumentDisplayCode; SD2_t_SELActionName)
	C_TEXT:C284(SD2_t_TimeFrame)
	C_TIME:C306($_ti_TimeEnd; $_ti_TimeStart; $_ti_DayTimeStart; $_ti_TimeEnd; $_ti_TimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ChangeActionCode")

//This method is called from a diary window when the action code is changed. It may change some values etc in the interface
If ([DIARY:12]Action_Code:9#"")
	
	$_l_DiaryActionClass:=0
	// we now have an action code
	If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	End if 
	If ([ACTIONS:13]xActionTypeID:10<0)
		//The action is a default one-not user set this is used for actions that were hard coded previously
		//this is only gonna happen if it is not being displayed on screen
	End if 
	SD2_t_SELActionName:=[ACTIONS:13]Action_Name:2
	If (Records in selection:C76([ACTIONS:13])>0)
		SD2_ActionAttributesToArrays
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
		$_l_DiaryActionClass:=0
		If ($_l_FieldRow>0)
			For ($_l_ColumnsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
				$_l_DiaryActionClass:=$_l_DiaryActionClass+(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_ColumnsIndex})
				
			End for 
		End if 
	Else 
		//need to do something here as don't have the action code settings
		
		SD2_LoadDefaultAttributes(->$_obj_ActionAttributes)
	End if 
	
	
	//set the diary class this is a binary field containing numbers in from the ACTION locations
	[DIARY:12]xDiaryClass:65:=$_l_DiaryActionClass  //this tells us where this diary item will appear
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Whose Diaries")
	If ($_l_FieldRow>0)
		For ($_l_ColumnIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			$_al_WhoseDiary:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_ColumnIndex}
			If ($_al_WhoseDiary#0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_al_WhoseDiary)
				If (Records in selection:C76([PERSONNEL:11])>0)
					If ([PERSONNEL:11]PersonDeleted:38=0)
						APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; $_al_WhoseDiary)
						APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; [PERSONNEL:11]Name:2)
						APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Person_Identity:13)
						If ([PERSONNEL:11]Global_Access:47)
							APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
							APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
						Else 
							APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
							APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
						End if 
					End if 
				End if 
			End if 
		End for 
	End if 
	//NG Note that here this is different to what happens in SD2_LoadDiary_In that it does not use the current owner because that is already on the diary
	//only if it is supposed to exclude does it change the current diary owner
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude from Adder")
	If ($_l_FieldRow>0)
		$_bo_Exclude:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
	Else 
		$_bo_Exclude:=False:C215
	End if 
	If ($_bo_Exclude)
		[DIARY:12]Person:8:=SD2_at_DiaryOwnerPersonCD{1}
	End if 
	If ([DIARY:12]Person:8#"")
		If ([PERSONNEL:11]Person_Identity:13#[DIARY:12]Person:8)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Person_Identity:13=[DIARY:12]Person:8)
		End if 
		SD2_t_DiaryOwnerName:=[PERSONNEL:11]Name:2
	End if 
	UNLOAD RECORD:C212([PERSONNEL:11])
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
	If ($_l_FieldRow>0)
		$_bo_RecordDoneTimeDate:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
	Else 
		$_bo_RecordDoneTimeDate:=False:C215
	End if 
	SD2_l_Completed:=Num:C11($_bo_RecordDoneTimeDate)
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Day")
	If ($_l_FieldRow>0)
		$_l_DayNumber:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
		If ($_l_DayNumber=0)
			//Here too this is different to SD2_load Diary_In that it uses the date on the diary
			$_d_StartDate:=[DIARY:12]Display_Date_From:51
		Else 
			For ($_l_ColumnIndex; 1; 8)
				$_d_CurrentDate:=Current date:C33(*)+($_l_ColumnIndex-1)
				$_l_DayNumber:=Day number:C114($_d_CurrentDate)
				If ($_l_DayNumber=$_l_DayNumber)
					$_d_StartDate:=$_d_CurrentDate
					$_l_ColumnIndex:=9
				End if 
			End for 
		End if 
	Else 
		$_d_StartDate:=[DIARY:12]Display_Date_From:51
	End if   // we now have a potential start date
	If ([DIARY:12]Date_Do_From:4=!00-00-00!)
		[DIARY:12]Date_Do_From:4:=$_d_StartDate
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Date_Done_From:5:=$_d_StartDate
		End if 
	Else 
		$_d_StartDate:=[DIARY:12]Date_Do_From:4
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")
	If ($_l_FieldRow>0)
		$_l_DayNumber:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
		If ($_l_DayNumber=0)
			$_d_EndDate:=[DIARY:12]Display_Date_To:52
		Else 
			$_d_StartAT:=[DIARY:12]Date_Do_From:4
			For ($_l_ColumnIndex; 1; 8)
				$_d_CurrentDate:=$_d_StartAT+($_l_ColumnIndex-1)
				$_l_DayNumber:=Day number:C114($_d_CurrentDate)
				If ($_l_DayNumber=$_l_DayNumber)
					$_d_EndDate:=$_d_CurrentDate
					$_l_ColumnIndex:=9
				End if 
			End for 
		End if 
	Else 
		$_d_EndDate:=[DIARY:12]Display_Date_To:52
	End if 
	If ([DIARY:12]Date_Do_To:33=!00-00-00!)
		[DIARY:12]Date_Do_To:33:=$_d_EndDate
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Date_Done_To:34:=$_d_StartDate
		End if 
		
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")
	If ($_l_FieldRow>0)
		$_ti_TimeStart:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}))
	Else 
		$_ti_TimeStart:=[DIARY:12]Display_Time_From:53
	End if 
	If ([DIARY:12]Time_Do_From:6#?00:00:00?)
		//a do from time was passed to the method
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_From:6
		End if 
	Else 
		[DIARY:12]Time_Do_From:6:=$_ti_TimeStart
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_From:6
		End if 
		
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")
	If ($_l_FieldRow>0)
		$_ti_TimeEnd:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}))
	Else 
		$_ti_TimeEnd:=[DIARY:12]Time_Do_To:35
	End if 
	If ([DIARY:12]Time_Do_To:35#?00:00:00?)
		//a do to  time was passed to the method
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
		End if 
	Else 
		[DIARY:12]Time_Do_To:35:=$_ti_TimeEnd  //this may be †00:00:00†
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
		End if 
		
	End if 
	If ([DIARY:12]Time_Do_To:35=?00:00:00?) & ([DIARY:12]Time_Do_From:6#?00:00:00?)
		//no end time was set
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
		If ($_l_FieldRow>0)
			$_l_SD2TimeAmount:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
			If ($_l_SD2TimeAmount>0)
				//calculate the amount of time
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
				If ($_l_FieldRow>0)
					
					Case of 
						: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=2)
							[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
							//End time=start time then!
						: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
							SD2_at_TimeType:=2  //hours
							$_l_Seconds:=(60*60)*$_l_SD2TimeAmount
							$_l_TimeInSeconds:=[DIARY:12]Time_Do_From:6*1
							$_l_TimeToSeconds:=$_l_TimeInSeconds+$_l_Seconds
							[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180($_l_TimeToSeconds))
							If ($_bo_RecordDoneTimeDate)
								[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
							End if 
							
						Else 
							SD2_at_TimeType:=1  //minutes
							$_l_Seconds:=60*$_l_SD2TimeAmount
							$_l_TimeInSeconds:=[DIARY:12]Time_Do_From:6*1
							$_l_TimeToSeconds:=$_l_TimeInSeconds+$_l_Seconds
							[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180($_l_TimeToSeconds))
							If ($_bo_RecordDoneTimeDate)
								[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
							End if 
					End case 
					
				End if 
			End if 
		End if 
	End if 
	If ([DIARY:12]Time_Do_From:6=?00:00:00?)
		
		$_bo_isInShecdule:=[DIARY:12]xDiaryClass:65 ?? 1
		If ($_bo_isInShecdule) | ([DIARY:12]xDiaryClass:65=0)
			//this is going into the schedule. find a time slot on the date
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
			If ($_l_FieldRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=2)
						$_l_Minutes:=(60*24)
						//End time=start time then!
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
						SD2_at_TimeType:=2  //hours
						$_l_Minutes:=(60)*$_l_SD2TimeAmount
						
						
					Else 
						SD2_at_TimeType:=1  //minutes
						$_l_Minutes:=$_l_SD2TimeAmount
						
				End case 
			Else 
				$_l_Minutes:=1
				//Try the user settings for te time for this action
			End if 
			If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
				$_ti_TimeStart:=SD_GETAVAILABLETIMESLOT([DIARY:12]Person:8; [DIARY:12]Date_Do_From:4; Current time:C178(*); $_l_Minutes)
			Else 
				$_ti_DayTimeStart:=?09:00:00?  //or SD_ti_SettingsTimeStart
				$_ti_TimeStart:=SD_GETAVAILABLETIMESLOT([DIARY:12]Person:8; [DIARY:12]Date_Do_From:4; $_ti_DayTimeStart; $_l_Minutes)
			End if 
			//NOTE THIS DOES NOT SET THE END TIME-the amount of time was only being used above to find a long enough slot to default to
			[DIARY:12]Time_Do_From:6:=$_ti_TimeStart
			If ($_bo_RecordDoneTimeDate)
				[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_To:35
			End if 
		Else 
			[DIARY:12]Time_Do_From:6:=Current time:C178(*)
		End if 
	End if 
	SD2_SetDisplayTime
	If (SD2_l_CB_Alarmed=0)  //ifUse has already put an alarm on don;t clear it
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")
		If ($_l_FieldRow>0)
			If (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)  //set reminder by default
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme")
				If ($_l_FieldRow>0)
					$_l_ReminderTime:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme Type")
					//The alarm time frame is always stored in minutes
					If ($_l_FieldRow>0)
						Case of 
							: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=2)  // Days
								$_l_OneDay:=24*60
								[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime*$_l_OneDay
							: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)  //Hours
								$_l_OneHour:=60
								[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime*$_l_OneHour
							Else 
								[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime  //minutes
						End case 
						//Now set the screen values -not the visibility
						If ([DIARY:12]Alarm_Timeframe:48#0)
							SD2_l_CB_Alarmed:=1
							$_l_AbsTimeFrame:=Abs:C99([DIARY:12]Alarm_Timeframe:48)
							Case of 
								: ($_l_AbsTimeFrame>(60*24))  //DAYS/Hours/mins
									$_l_Days:=$_l_AbsTimeFrame/(60*24)
									$_l_Remainder:=$_l_AbsTimeFrame-($_l_Days*(60*24))
									If ($_l_Remainder>0)
										$_l_Hours:=$_l_Remainder/60
										$_l_Remainder:=$_l_Remainder-($_l_Hours*(60))
										If ($_l_Remainder>0)
											SD2_l_TimeFrame:=$_l_AbsTimeFrame
											SD2_t_TimeFrame:="Minutes"
										Else 
											SD2_l_TimeFrame:=$_l_Hours+($_l_Days*24)
											SD2_t_TimeFrame:="Hours"
										End if 
									Else 
										SD2_l_TimeFrame:=$_l_Days
										SD2_t_TimeFrame:="Days"
									End if 
									If ([DIARY:12]Alarm_Timeframe:48<0)
										SD2_l_TimeFrame:=-SD2_l_TimeFrame
									End if 
								: ($_l_AbsTimeFrame>60)  //hours
									
									
									$_l_Hours:=$_l_AbsTimeFrame/60
									$_l_Remainder:=$_l_AbsTimeFrame-($_l_Hours*(60))
									If ($_l_Remainder>0)
										SD2_l_TimeFrame:=$_l_AbsTimeFrame
										SD2_t_TimeFrame:="Minutes"
									Else 
										SD2_l_TimeFrame:=$_l_Hours
										SD2_t_TimeFrame:="Hours"
									End if 
									If ([DIARY:12]Alarm_Timeframe:48<0)
										SD2_l_TimeFrame:=-SD2_l_TimeFrame
									End if 
									
								Else 
									//   Minutes
									SD2_l_TimeFrame:=[DIARY:12]Alarm_Timeframe:48
									SD2_t_TimeFrame:="Minutes"
									//time frame already set so calc mins/hours/etc
							End case 
							
						Else 
							SD2_l_TimeFrame:=0
							SD2_t_TimeFrame:=""
							SD2_l_CB_Alarmed:=0
						End if 
						
					End if 
					
					
				End if 
			End if 
		End if 
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Default Description")
	If ([DIARY:12]Action_Details:10="")  //i fuser has put a description don't overwrite it
		If ($_l_FieldRow>0)
			[DIARY:12]Action_Details:10:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
		End if 
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use WP for action Description")
	If ($_l_FieldRow>0)
		If (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)  //use wp entry area....
			//Load the document
			$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Document Code")
			$_t_DocumentCode:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow2}
			If ($_t_DocumentCode#"")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
				If (Records in selection:C76([DOCUMENTS:7])>0)
					Case of 
						: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter) | ([DOCUMENTS:7]Document_Class:14=0)
							
							//Here duplicate the document and set the document code on the diary
							//Actually NO-don't do that-no need to create a document at all we will never store the document
							SD2_t_DocumentDisplayCode:=$_t_DocumentCode
							SD2_bo_ShowDetailsASWP:=True:C214
						Else 
							SD2_bo_ShowDetailsASWP:=False:C215
					End case 
				Else 
					SD2_bo_ShowDetailsASWP:=False:C215
				End if 
			Else 
				//no default document but do show as WP area
				SD2_bo_ShowDetailsASWP:=True:C214
				SD2_t_DocumentDisplayCode:=$_t_DocumentCode
			End if 
		Else 
			SD2_bo_ShowDetailsASWP:=False:C215
			$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Document Code")
			$_t_DocumentCode:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow2}
			//Copy this document and put the document code on the diary record
		End if 
	Else 
		SD2_bo_ShowDetailsASWP:=False:C215
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Codes")
	If ($_l_FieldRow>0)
		$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
		If ($_l_FieldRow2>0)
			For ($_l_ColumnIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
				//If (SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}>=$_l_ColumnIndex)
				//$_l_FieldNumber:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow2}{$_l_ColumnIndex}
				//$_ptr_DiaryField:=Field(Table(->[DIARY]); $_l_FieldNumber)
				//$_ptr_DiaryField->:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}{$_l_ColumnIndex}
				//End if 
			End for 
		End if 
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")
	$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")
	$_l_FieldRow3:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Event")
	$_l_FieldRow4:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	ARRAY TEXT:C222(SD2_at_Scripts; 0)
	ARRAY LONGINT:C221(SD2_AL_MacroEvent; 0)
	//Events are
	//1=on saving new record
	//2=on saving existing record
	//3=on loading record
	//4=On setting a record code (is a field macro on the current setup)& (Not(DB_bo_NoLoad))
	ARRAY LONGINT:C221(SD2_AL_MacroignoreStd; 0)
	If ($_l_FieldRow>0)
		ARRAY TEXT:C222(SD2_at_Scripts; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
		ARRAY LONGINT:C221(SD2_AL_MacroEvent; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
		ARRAY LONGINT:C221(SD2_AL_MacroignoreStd; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))  // ignore std macros
		
		For ($_l_ColumnIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			SD2_at_Scripts{$_l_ColumnIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}{$_l_ColumnIndex}
			SD2_AL_MacroEvent{$_l_ColumnIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow3}{$_l_ColumnIndex}
			SD2_AL_MacroignoreStd{$_l_ColumnIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow4}{$_l_ColumnIndex}  //note that i have set this up like this but the interface only allows on esetting
		End for 
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")
	If ($_l_FieldRow>0)
		SD2_l_FieldLevelMacros:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	If ($_l_FieldRow>0)
		SD2_l_IgnoreStdMacros:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
	If ($_l_FieldRow>0)
		If (Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow})>0)
			
			ARRAY TEXT:C222(SD2_at_ResultCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			For ($_l_ColumnIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
				SD2_at_ResultCodes{$_l_ColumnIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}{$_l_ColumnIndex}
				$_l_FieldRow2:=Find in array:C230(SD2_at_AllResultCodes; SD2_at_ResultCodes{$_l_ColumnIndex})
				If ($_l_FieldRow2>0)
					SD2_at_ResultNames{$_l_ColumnIndex}:=SD2_at_AllresultNames{$_l_FieldRow2}
				End if 
			End for 
		Else 
			//all results
			ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
			ARRAY TEXT:C222(SD2_at_ResultNames; 0)
			
		End if 
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
	If ($_l_FieldRow>0)
		SD2_l_autoActionCode:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
		[DIARY:12]x_Close_Options:71:=SD2_l_autoActionCode
		//The options here are
		//SD2_at_AutoActions{1}:="No automatic action"
		//SD2_at_AutoActions{2}:="Nag user"
		//SD2_at_AutoActions{3}:="Put in to-do list"
		//SD2_at_AutoActions{4}:="Auto complete"
		//SD2_at_AutoActions{5}:="Force user to complete"
		//SD2_al_AutoActionCodes{1}:=0
		//SD2_al_AutoActionCodes{2}:=1
		//SD2_al_AutoActionCodes{3}:=2
		//SD2_al_AutoActionCodes{4}:=3
		//SD2_al_AutoActionCodes{5}:=4
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Macro Code")
	If ($_l_FieldRow>0)
		If (SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}#"")
			$_bo_NoScripts:=False:C215
			Macro(SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow})
		Else 
			$_bo_NoScripts:=True:C214
		End if 
	Else 
		$_bo_NoScripts:=True:C214
	End if 
	If ($_bo_NoScripts)
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use Job Stage Rates")
		If ($_l_FieldRow>0)
			$_bo_UseJSRate:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
		Else 
			$_bo_UseJSRate:=False:C215
		End if 
		If ($_bo_UseJSRate)
			//this will get the CLIENT rate from the JS-note that we will be modifying the JS so it can use a personnel led rate or a Price table led rate or a default rate
			
		Else 
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units")
			If ($_l_FieldRow>0)
				[DIARY:12]Units:20:=SD2_ar_ActionVirtFieldDataREAL{$_l_FieldRow}
			End if 
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Value")
			If ($_l_FieldRow>0)
				[DIARY:12]Charge_Rate:22:=SD2_ar_ActionVirtFieldDataREAL{$_l_FieldRow}
			End if 
			[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
		End if 
		
	End if 
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
	If ($_l_FieldRow>0)
		$_l_CBThreaded:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
	Else 
		$_l_CBThreaded:=0
	End if 
	If ($_l_CBThreaded>0)
		//need to find out if we only open the diary window as a companion to the original object.
		
	End if 
	
End if 
If (Count parameters:C259>=1)
	SD2_SetInterface($1)
End if 
ERR_MethodTrackerReturn("SD2_ChangeActionCode"; $_t_oldMethodName)
