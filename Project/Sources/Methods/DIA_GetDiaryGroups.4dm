//%attributes = {}
If (False:C215)
	//Project Method Name:      DIA_GetDiaryGroups
	//------------------ Method Notes ------------------
	//This method will create 3 groups
	//1) Sheduled diary actions
	//2)  //Workflow diary Actions
	//3 Tabs only
	//all ACTIONS must belong to one of the above. if they belong to none they will be in 'other'
	
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ScheduleActionIDS; 0)
	ARRAY LONGINT:C221($_al_TabOnlyActionIDS; 0)
	ARRAY LONGINT:C221($_al_WorkflowActionIDS; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_AL_DIARYTYPESETTINGS;0)
	//ARRAY LONGINT(SD2_al_FieldNum;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	//ARRAY TEXT(SD_at_OtherActions;0)
	//ARRAY TEXT(SD_at_ScheduleActions;0)
	//ARRAY TEXT(SD_at_TabsOnlyActions;0)
	//ARRAY TEXT(SD_at_WorkflowActions;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_rTableNames;0)
	//ARRAY TEXT(SD2_at_WhoseDiary;0)
	C_BOOLEAN:C305($_bo_Allowed; $_bo_Forced)
	C_LONGINT:C283($_l_arraySize; $_l_DIaryTypeIndex; $_l_DiaryTypeRow; $_l_FieldRow; $_l_FieldRow2; $_l_FieldRow3; $_l_FieldRow4; $_l_Records; $_l_RestrictionsIndex; $_l_SettingsIndex; SD2_l_ActionTypeID)
	C_TEXT:C284($_t_LocationString; $_t_oldMethodName; SD_t_ViewActionClassNM)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DIA_GetDiaryGroups")

SD2_LoadDiaryTypes
QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13#"")
//TRACE
If (Records in selection:C76([ACTIONS:13])=0)
	
	ALL RECORDS:C47([ACTIONS:13])
	For ($_l_Records; 1; Records in selection:C76([ACTIONS:13]))
		
		SD2_ActionAttributesToArrays
		If ([ACTIONS:13]xActionTypeID:10=0)
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Type ID")
			If ($_l_FieldRow>0)  //It should be
				SD2_l_ActionTypeID:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
				//And look up the string
				
				$_l_DiaryTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_ActionTypeID)
				If ($_l_DiaryTypeRow>0)
					SD_t_ViewActionClassNM:=SD2_at_DiaryTypes{$_l_DiaryTypeRow}
				Else 
					SD2_l_ActionTypeID:=0
					SD_t_ViewActionClassNM:=""
				End if 
			Else 
				SD2_l_ActionTypeID:=0
				SD_t_ViewActionClassNM:=""
			End if 
		End if 
		//````
		//xlocations
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
		$_t_LocationString:=""
		If ($_l_FieldRow>0)
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
				If ($_l_DIaryTypeIndex=1)
					$_t_LocationString:=String:C10(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex})
				Else 
					$_t_LocationString:=$_t_LocationString+","+String:C10(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex})
				End if 
				
			End for 
			
		Else 
			
		End if 
		[ACTIONS:13]xLocations:13:=$_t_LocationString
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
		If ($_l_FieldRow>0)
			[ACTIONS:13]IsThreaded:14:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
			
			If ([ACTIONS:13]IsThreaded:14)
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_FieldRow>0)
					[ACTIONS:13]ThreadOption:15:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
				End if 
			End if 
		End if 
		//class of action-the class of action only exists if the action gets its settings from a template action-in which all the fields will be locked
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Class ID")
		If ($_l_FieldRow>0)
			[ACTIONS:13]ClassofAction:16:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
		End if 
		//DefaultAmountof time
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_Amount_of_Time:17:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
			If ($_l_FieldRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=2)
						[ACTIONS:13]Default_Amount_of_TimeType:18:=3
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
						[ACTIONS:13]Default_Amount_of_TimeType:18:=2
					Else 
						[ACTIONS:13]Default_Amount_of_TimeType:18:=1
				End case 
				
			End if 
			
		Else 
			
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_StartTime:19:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}))
			
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_EndTime:20:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}))
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Day")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_DayofWeekStart:21:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
			
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_DayofWeekEnd:22:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_SetReminder:23:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder Time")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_ReminderTime:24:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme Type")
			If ($_l_FieldRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=2)
						[ACTIONS:13]Default_ReminderTimeType:25:=3
					: (SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
						[ACTIONS:13]Default_ReminderTimeType:25:=2
					Else 
						[ACTIONS:13]Default_ReminderTimeType:25:=1
				End case 
				
			End if 
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude NON working Days")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_AvoidnonWorkingDays:26:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
			
			
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Whose Diaries")
		If ($_l_FieldRow>0)
			ARRAY LONGINT:C221(SD2_al_WhoseDiary; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_WhoseDiary; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
				CREATE RECORD:C68([ACTIONS_DEFAULTDIARIES:200])
				[ACTIONS_DEFAULTDIARIES:200]xUUID:1:=Generate UUID:C1066
				[ACTIONS_DEFAULTDIARIES:200]ActionID:2:=[ACTIONS:13]xID:12
				[ACTIONS_DEFAULTDIARIES:200]DiaryUserorGroupID:3:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}
				SAVE RECORD:C53([ACTIONS_DEFAULTDIARIES:200])
			End for 
		End if 
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
		$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Codes")
		If ($_l_FieldRow>0)
			ARRAY LONGINT:C221(SD2_al_FieldNum; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_FieldName; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_RecordCode; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
				CREATE RECORD:C68([ACTIONS_STATICRELATIONS:204])
				[ACTIONS_STATICRELATIONS:204]UUID:1:=Generate UUID:C1066
				Case of 
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Call_Code:25))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[SERVICE_CALLS:20])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Company_Code:1))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[COMPANIES:2])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Contact_Code:2))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[CONTACTS:1])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Job_Code:19))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[JOBS:26])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Order_Code:26))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[ORDERS:24])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Product_Code:13))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[PRODUCTS:9])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Picture_Code:37))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[PICTURES:85])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]Stage_Code:21))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[JOB_STAGES:47])
					: (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}=Field:C253(->[DIARY:12]))
						[ACTIONS_STATICRELATIONS:204]StaticTableNum:3:=Table:C252(->[JOB_STAGES:47])
				End case 
				[ACTIONS_STATICRELATIONS:204]StaticFieldNumber:4:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}
				[ACTIONS_STATICRELATIONS:204]StaticRecordCode:5:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow2}{$_l_DIaryTypeIndex}
				SAVE RECORD:C53([ACTIONS_STATICRELATIONS:204])
				
			End for 
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units")
		If ($_l_FieldRow>0)
			[ACTIONS:13]Default_TimeUnits:31:=SD2_ar_ActionVirtFieldDataREAL{$_l_FieldRow}
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Value")
		If ($_l_FieldRow>0)
			[ACTIONS:13]TimeUnitsValue:32:=SD2_ar_ActionVirtFieldDataREAL{$_l_FieldRow}
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Macro Code")
		If ($_l_FieldRow>0)
			[ACTIONS:13]ChargingMacroCode:33:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use Job Stage Rates")
		If ($_l_FieldRow>0)
			[ACTIONS:13]UseJobStageRates:38:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Record Time_In Job Stage")
		If ($_l_FieldRow>0)
			[ACTIONS:13]RecordActiivityInJobStage:39:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Associated Job Stage Type")
			If ($_l_FieldRow>0)
				[ACTIONS:13]Default_AssociatedJobStageType:40:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
			End if 
		End if 
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
		If ($_l_FieldRow>0)
			ARRAY LONGINT:C221(SD2_al_rTableNUMs; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_rTableNames; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
				CREATE RECORD:C68([ACTIONS_RESTRICTABLES:201])
				[ACTIONS_RESTRICTABLES:201]UUID:1:=Generate UUID:C1066
				[ACTIONS_RESTRICTABLES:201]ActionID:2:=[ACTIONS:13]xID:12
				[ACTIONS_RESTRICTABLES:201]TableNUM:3:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_DIaryTypeIndex}
				SAVE RECORD:C53([ACTIONS_RESTRICTABLES:201])
			End for 
			
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")
		$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")
		$_l_FieldRow3:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Event")
		$_l_FieldRow4:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
		If ($_l_FieldRow>0)
			
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
				CREATE RECORD:C68([ACTIONS_MACROS:202])
				[ACTIONS_MACROS:202]UUID:1:=Generate UUID:C1066
				[ACTIONS_MACROS:202]ActionID:2:=[ACTIONS:13]xID:12
				[ACTIONS_MACROS:202]Action_Event:3:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow3}{$_l_DIaryTypeIndex}
				[ACTIONS_MACROS:202]Macro_Code:4:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}{$_l_DIaryTypeIndex}
				[ACTIONS_MACROS:202]IgnoreStdMacro:5:=(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow4}{$_l_DIaryTypeIndex}=1)
				SAVE RECORD:C53([ACTIONS_MACROS:202])
			End for 
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")
		If ($_l_FieldRow>0)
			[ACTIONS:13]UseActionSpecificDiaryMacros:35:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
		End if 
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
		If ($_l_FieldRow>0)
			[ACTIONS:13]ignoreDefaultDiaryMacros:36:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}=1)
		End if 
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
		If ($_l_FieldRow>0)
			ARRAY TEXT:C222(SD2_at_ResultCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
			For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}))
				CREATE RECORD:C68([ACTIONS_RESULTSLINK:203])
				[ACTIONS_RESULTSLINK:203]UUID:1:=Generate UUID:C1066
				[ACTIONS_RESULTSLINK:203]ActionID:2:=[ACTIONS:13]xID:12
				[ACTIONS_RESULTSLINK:203]Result_Code:3:=SD2_at_ActionVirtFieldDataMA{$_l_FieldRow}{$_l_DIaryTypeIndex}
				SAVE RECORD:C53([ACTIONS_RESULTSLINK:203])
			End for 
		End if 
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
		If ($_l_FieldRow>0)
			[ACTIONS:13]OverdueAutomatedAction:27:=(SD2_al_ActionVirtFieldDataLong{$_l_FieldRow})
			$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")
			If ($_l_FieldRow>0)
				[ACTIONS:13]AutoResultMacro:29:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
				
			End if 
			
		End if 
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
		If ($_l_FieldRow>0)
			[ACTIONS:13]UseDateEntryForm:41:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
		End if 
		
		
		$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Type")
		If ($_l_FieldRow>0)  //It should be
			//there is 2D array of the relation Types
			$_l_FieldRow2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Table")
			If ($_l_FieldRow2>0)
				$_l_FieldRow3:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Restriction")
				If ($_l_FieldRow3>0)
					$_l_arraySize:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})
					
					For ($_l_RestrictionsIndex; 1; $_l_arraySize)
						CREATE RECORD:C68([ACTIONS_RELATIONRESTRICTIONS:205])
						[ACTIONS_RELATIONRESTRICTIONS:205]UUID:1:=Generate UUID:C1066
						[ACTIONS_RELATIONRESTRICTIONS:205]ActionID:2:=[ACTIONS:13]xID:12
						[ACTIONS_RELATIONRESTRICTIONS:205]RelationTable:3:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow2}{$_l_RestrictionsIndex}
						$_bo_Forced:=(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_RestrictionsIndex}=2)
						$_bo_Allowed:=(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_RestrictionsIndex}=1)
						//[ACTIONS_RELATIONRESTRICTIONS]RelationName
						If ($_bo_Forced)  //allowed and forced
							[ACTIONS_RELATIONRESTRICTIONS:205]RelationMinRecords:6:=1
							[ACTIONS_RELATIONRESTRICTIONS:205]RelationMandatory:7:=True:C214
						End if 
						If (Not:C34($_bo_Allowed))  //Not allowed
							[ACTIONS_RELATIONRESTRICTIONS:205]RelationMinRecords:6:=0
							[ACTIONS_RELATIONRESTRICTIONS:205]RelationMaxRecords:5:=0
						Else 
							//it is allowed if a max is set use it-remember zero is unrestricted here
							If (SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow3}{$_l_RestrictionsIndex}>0)
								[ACTIONS_RELATIONRESTRICTIONS:205]RelationMaxRecords:5:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow3}{$_l_RestrictionsIndex}
							End if 
						End if 
						If ([ACTIONS_RELATIONRESTRICTIONS:205]RelationMaxRecords:5>0) | ([ACTIONS_RELATIONRESTRICTIONS:205]RelationMinRecords:6#0) | ([ACTIONS_RELATIONRESTRICTIONS:205]RelationMandatory:7) | ($_bo_Allowed)
							SAVE RECORD:C53([ACTIONS_RELATIONRESTRICTIONS:205])
						End if 
					End for 
					
				End if 
				
			End if 
		End if 
		
		
		SAVE RECORD:C53([ACTIONS:13])
		
		
		
		
		NEXT RECORD:C51([ACTIONS:13])
	End for 
	
End if 
ARRAY LONGINT:C221($_al_ScheduleActionIDS; 0)
ARRAY LONGINT:C221($_al_WorkflowActionIDS; 0)
ARRAY LONGINT:C221($_al_TabOnlyActionIDS; 0)
For ($_l_DIaryTypeIndex; 1; Size of array:C274(SD2_al_DiaryTypeIDS))
	For ($_l_SettingsIndex; 1; Size of array:C274(SD2_AL_DIARYTYPESETTINGS{$_l_DIaryTypeIndex}))
		Case of 
			: (SD2_AL_DIARYTYPESETTINGS{$_l_DIaryTypeIndex}{$_l_SettingsIndex}=1)
				APPEND TO ARRAY:C911($_al_ScheduleActionIDS; SD2_al_DiaryTypeIDS{$_l_DIaryTypeIndex})
			: (SD2_AL_DIARYTYPESETTINGS{$_l_DIaryTypeIndex}{$_l_SettingsIndex}=2)
				APPEND TO ARRAY:C911($_al_WorkflowActionIDS; SD2_al_DiaryTypeIDS{$_l_DIaryTypeIndex})
				
			: (SD2_AL_DIARYTYPESETTINGS{$_l_DIaryTypeIndex}{$_l_SettingsIndex}=3)
				APPEND TO ARRAY:C911($_al_TabOnlyActionIDS; SD2_al_DiaryTypeIDS{$_l_DIaryTypeIndex})
				
		End case 
	End for 
	
End for 


QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13="@"+"1")
CREATE SET:C116([ACTIONS:13]; "$Temp")
QUERY WITH ARRAY:C644([ACTIONS:13]xActionTypeID:10; $_al_ScheduleActionIDS)
CREATE SET:C116([ACTIONS:13]; "$Temp2")
UNION:C120("$Temp"; "$Temp2"; "$Temp")
USE SET:C118("$Temp")

SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_ScheduleActions)

QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13="@"+"2")
CREATE SET:C116([ACTIONS:13]; "$Temp")
QUERY WITH ARRAY:C644([ACTIONS:13]xActionTypeID:10; $_al_WorkflowActionIDS)
CREATE SET:C116([ACTIONS:13]; "$Temp2")
UNION:C120("$Temp"; "$Temp2"; "$Temp")
USE SET:C118("$Temp")
SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_WorkflowActions)



QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13="@"+"3")
CREATE SET:C116([ACTIONS:13]; "$Temp")
QUERY WITH ARRAY:C644([ACTIONS:13]xActionTypeID:10; $_al_TabOnlyActionIDS)
CREATE SET:C116([ACTIONS:13]; "$Temp2")
UNION:C120("$Temp"; "$Temp2"; "$Temp")
USE SET:C118("$Temp")

SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_TabsOnlyActions)


QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13=""; *)
QUERY:C277([ACTIONS:13];  & ; [ACTIONS:13]xActionTypeID:10<=0)
SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_OtherActions)
ERR_MethodTrackerReturn("DIA_GetDiaryGroups"; $_t_oldMethodName)