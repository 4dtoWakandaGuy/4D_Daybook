//%attributes = {}
If (False:C215)
	//Project Method Name: SD_LoadPrefs
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_aI_ActionCodes; 0)
	ARRAY INTEGER:C220($_aI_ActionCodesOSW; 0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	ARRAY LONGINT:C221($_al_ActionCodesOST; 0)
	ARRAY LONGINT:C221($_al_ActionTime; 0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_ActionCodesOST; 0)
	ARRAY TEXT:C222($_at_DiaryActionNames; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_ResultNames; 0)
	ARRAY TEXT:C222($_at_TimeType; 0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_ActionTimesString;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	//ARRAY TEXT(SD_at_PriorityNM2;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305($_bo_PersonnelSelection; $_bo_RecordFixed; $_bo_try1; $3; SD_bo_ChangePrefs; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionCodeRow; $_l_AmountofTimePosition; $_l_AmountofTimeTypePosition; $_l_ArraySize; $_l_BlobOffset; $_l_Days; $_l_EndHour; $_l_Hours; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_ItemReference; $_l_ListRef; $_l_OwnerID; $_l_ResultCodeRow; $_l_StartHour; $_l_Time; $_l_Time2; $_l_TimeAmount; $_l_TypeTypeRow; $1; SD_HL_l_Hours)
	C_LONGINT:C283(SD_HL_l_Hours2; SD_HL_l_MINS; SD_HL_l_TENS; SD_l_IncludeCompleted; SD_l_ScheduleSetting; SD_l_SettingsTimeLen; SD_l_TimeSpace; SD2_l_CUrrentLoadedPrefsID)
	C_OBJECT:C1216($_obj_GroupPrefs; $_obj_MasterPrefs; $0; SD2_obj_DiaryPreferences)
	C_TEXT:C284($_t_GroupName; $_t_Hour; $_t_oldMethodName; $_t_TimeText; $2)
	C_TIME:C306(SD_ti_AfternoonEnd; SD_ti_AfternoonStart; SD_ti_EveningEnd; SD_ti_EveningStart; SD_ti_MorningEnd; SD_ti_MorningStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD_LoadPrefs")

If (SD2_l_CUrrentLoadedPrefsID#$1)
	
	If (Count parameters:C259>=3)
		$_bo_PersonnelSelection:=$3
		//we  have a selection of personnel records-dont change it
	Else 
		$_bo_PersonnelSelection:=False:C215
	End if 
	//SD_LoadPrefs ([PERSONNEL]Personnel_ID)
	MESSAGES OFF:C175
	//This method will load the prefs
	//for the current user for super diary prefs.
	
	ARRAY INTEGER:C220(SD_ai_ActionCodes; 0)  //is the action code available
	ARRAY TEXT:C222(SD_at_ActionCodes; 0)  //list of all action codes
	ARRAY TEXT:C222(SD_at_DiaryActionNames; 0)  //list of all action codes
	ARRAY LONGINT:C221(SD_al_ActionTime; 0)  //default length of action
	ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; 0)  //does this action get on screen warning
	ARRAY LONGINT:C221(SD_al_ActionCodesOST; 0)  // time
	ARRAY TEXT:C222(SD_at_ActioncodesOST; 0)  //timing string
	//`````
	ARRAY INTEGER:C220($_aI_ActionCodes; 0)  //is the action code available
	ARRAY TEXT:C222($_at_ActionCodes; 0)  //list of all action codes
	ARRAY TEXT:C222($_at_DiaryActionNames; 0)  //list of all action codes
	ARRAY LONGINT:C221($_al_ActionTime; 0)  //default length of action
	ARRAY INTEGER:C220($_aI_ActionCodesOSW; 0)  //does this action get on screen warning
	ARRAY LONGINT:C221($_al_ActionCodesOST; 0)  // time
	ARRAY TEXT:C222($_at_ActionCodesOST; 0)
	
	ARRAY TEXT:C222(SD_at_PriorityNM; 0)
	ARRAY LONGINT:C221(SD_al_PriorityNUM; 0)
	
	ARRAY INTEGER:C220(SD_ai_ResultCodes; 0)  //is the Result code available
	ARRAY TEXT:C222(SD_at_ResultCodes; 0)  //list of all action codes
	ARRAY TEXT:C222(SD_at_ResultNames; 0)  //list of all action codes
	
	//TRACE
	READ ONLY:C145([ACTIONS:13])
	ALL RECORDS:C47([ACTIONS:13])
	READ ONLY:C145([PERSONNEL_GROUPS:92])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes; [ACTIONS:13]Action_Name:2; $_at_DiaryActionNames)
	
	READ ONLY:C145([RESULTS:14])
	ALL RECORDS:C47([RESULTS:14])
	SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; $_at_ResultCodes; [RESULTS:14]Result_Name:2; $_at_ResultNames)
	If (Count parameters:C259>=2)
		$_t_GroupName:=$2
	Else 
		$_t_GroupName:=""
	End if 
	READ ONLY:C145([SD_Settings:107])
	
	
	
	//Note that the 'user' record has the default settings•   `
	// - the ID of the [SD_Settings]x_OwnerID is -1
	If (Count parameters:C259>=1)
		If ($1#-1)
			QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
			If (Records in selection:C76([SD_Settings:107])=0)  //this bit will only get called once!
				$_obj_GroupPrefs:=SD_LoadPrefs(-1)
				QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
			Else 
				//Load these first
				$_obj_GroupPrefs:=SD_LoadPrefs(-1)
			End if 
		End if 
		$_l_OwnerID:=$1
		$_bo_RecordFixed:=True:C214
		
		If ($_l_OwnerID=-1)
			//This is to check a fix has been done
			QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-2)
			If (Records in selection:C76([SD_Settings:107])=0)
				$_bo_RecordFixed:=False:C215
			End if 
		End if 
		If ($1#0)
			If ($_l_OwnerID>0)
				$_obj_GroupPrefs:=SD_GetGroups($_l_OwnerID; $_bo_PersonnelSelection)
			End if 
			
			QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=$_l_OwnerID)
			If (Records in selection:C76([SD_Settings:107])=0)
				If ($_t_GroupName#"")
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=$_t_GroupName)
					If ([PERSONNEL_GROUPS:92]x_ID:12>0)
						QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-([PERSONNEL_GROUPS:92]x_ID:12)*10)
						If (Records in selection:C76([SD_Settings:107])>0)
							$_obj_GroupPrefs:=SD_LoadPrefs(-([PERSONNEL_GROUPS:92]x_ID:12)*10)
							$_bo_try1:=False:C215
						Else 
							$_bo_try1:=True:C214
						End if 
					Else 
						$_bo_try1:=True:C214
					End if 
					
				Else 
					$_bo_try1:=True:C214
				End if 
				If ($_bo_try1)  //no group setting loaded
					If ($1>0) | ($1<-1)
						QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
						If (Records in selection:C76([SD_Settings:107])=0)  //this bit will only get called once!
							$_obj_MasterPrefs:=SD_LoadPrefs(-1)
							QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
						End if 
						//there are no settings for this user so use the defaults
					Else 
						SD2_LoadDiaryFormNames
						SD2_LoadDiaryTypes
						
						READ WRITE:C146([SD_Settings:107])
						CREATE RECORD:C68([SD_Settings:107])
						[SD_Settings:107]x_OwnerID:1:=-1
						[SD_Settings:107]X_DayStartTime:2:=?09:00:00?
						[SD_Settings:107]x_DayEndTime:3:=?17:30:00?
						[SD_Settings:107]EventDefaultTimeFrame:4:=60
						[SD_Settings:107]Saturday_Work:6:=False:C215
						[SD_Settings:107]Sunday_Work:7:=False:C215
						
						$_l_ArraySize:=Size of array:C274($_at_ActionCodes)
						ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)  //is the action code available
						ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)  //list of all action codes
						ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)  //list of all action codes
						ARRAY LONGINT:C221(SD_al_ActionTime; $_l_ArraySize)  //default length of action
						ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; $_l_ArraySize)  //does this action get on screen warning
						ARRAY LONGINT:C221(SD_al_ActionCodesOST; $_l_ArraySize)  // time
						ARRAY TEXT:C222(SD_at_ActioncodesOST; $_l_ArraySize)
						ARRAY TEXT:C222(SD_at_PriorityNM; 5)
						ARRAY TEXT:C222(SD_at_PriorityNM2; 5)
						ARRAY LONGINT:C221(SD_al_PriorityNUM; 5)
						SD_at_PriorityNM{1}:="Highest"
						SD_at_PriorityNM{2}:="High"
						SD_at_PriorityNM{3}:="Normal"
						SD_at_PriorityNM{4}:="Low"
						SD_at_PriorityNM{5}:="Lowest"
						
						For ($_l_Index; 1; 5)
							SD_al_PriorityNUM{$_l_Index}:=$_l_Index
						End for 
						For ($_l_Index; 1; $_l_ArraySize)
							SD_ai_ActionCodes{$_l_Index}:=1
							SD_at_ActionCodes{$_l_Index}:=$_at_ActionCodes{$_l_Index}
							SD_at_DiaryActionNames{$_l_Index}:=$_at_DiaryActionNames{$_l_Index}
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD_at_ActionCodes{$_l_Index})
							SD2_ActionAttributesToArrays
							$_l_AmountofTimePosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
							If ($_l_AmountofTimePosition>0)
								$_l_TimeAmount:=SD2_al_ActionVirtFieldDataLong{$_l_AmountofTimePosition}
								$_l_AmountofTimeTypePosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
								If ($_l_AmountofTimeTypePosition>0)
									Case of 
										: (SD2_al_ActionVirtFieldDataLong{$_l_AmountofTimeTypePosition}=2)  //Days
											$_l_TimeAmount:=$_l_TimeAmount*(60*24)
										: (SD2_al_ActionVirtFieldDataLong{$_l_AmountofTimeTypePosition}=1)  // Hours
											$_l_TimeAmount:=$_l_TimeAmount*60
										Else 
											$_at_TimeType:=1  //Mins
									End case 
									
								End if 
								
							Else 
								$_l_TimeAmount:=[SD_Settings:107]EventDefaultTimeFrame:4
							End if 
							
							SD_al_ActionTime{$_l_Index}:=$_l_TimeAmount
						End for 
						$_l_ArraySize:=Size of array:C274($_at_ResultNames)
						ARRAY INTEGER:C220(SD_ai_ResultCodes; $_l_ArraySize)  //is the action code available
						ARRAY TEXT:C222(SD_at_ResultCodes; $_l_ArraySize)  //list of all action codes
						ARRAY TEXT:C222(SD_at_ResultNames; $_l_ArraySize)  //list of all action codes
						For ($_l_Index; 1; $_l_ArraySize)
							SD_ai_ResultCodes{$_l_Index}:=1
							SD_at_ResultCodes{$_l_Index}:=$_at_ResultCodes{$_l_Index}
							SD_at_ResultNames{$_l_Index}:=$_at_ResultNames{$_l_Index}
						End for 
						
						
						VARIABLE TO BLOB:C532(SD_ai_ActionCodes; [SD_Settings:107]EventParametersACTION:5)
						VARIABLE TO BLOB:C532(SD_at_ActionCodes; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_at_DiaryActionNames; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_al_ActionTime; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_ai_ActionCodesOSW; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_al_ActionCodesOST; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_at_ActioncodesOST; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_l_IncludeCompleted; [SD_Settings:107]EventParametersACTION:5; *)
						VARIABLE TO BLOB:C532(SD_at_PriorityNM; [SD_Settings:107]EventParametersPriority:10)
						VARIABLE TO BLOB:C532(SD_al_PriorityNUM; [SD_Settings:107]EventParametersPriority:10; *)
						VARIABLE TO BLOB:C532(SD_ai_ResultCodes; [SD_Settings:107]EventParametersResult:9)
						VARIABLE TO BLOB:C532(SD_at_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
						VARIABLE TO BLOB:C532(SD_at_ResultNames; [SD_Settings:107]EventParametersResult:9; *)
						
						
						DB_SaveRecord(->[SD_Settings:107])
						UNLOAD RECORD:C212([SD_Settings:107])
						READ ONLY:C145([SD_Settings:107])
						QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
					End if 
				End if 
			End if 
			//we now have a record loaded
			//So get the values from that record
			SD_ti_SettingsTimeStart:=[SD_Settings:107]X_DayStartTime:2
			SD_ti_SettingsTimeEnd:=[SD_Settings:107]x_DayEndTime:3
			SD_l_SettingsTimeLen:=[SD_Settings:107]EventDefaultTimeFrame:4
			SD_bo_SaturdayWork:=[SD_Settings:107]Saturday_Work:6
			SD_bo_SundayWork:=[SD_Settings:107]Sunday_Work:7
			If ([SD_Settings:107]x_OwnerID:1=-1)
				SD_bo_ResultsDialog:=[SD_Settings:107]DiaryResultsDialog:8
				SD_bo_ResultsDialogSequence:=[SD_Settings:107]ResultUseSequence:11
			End if 
			SD_l_TimeSpace:=[SD_Settings:107]TimePopUpSetting:12
			SD_l_ScheduleSetting:=[SD_Settings:107]ScheduleSetting:14
			
			
			$_l_BlobOffset:=0
			If (Current user:C182="Designer") & (Macintosh option down:C545)
			Else 
				BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_ai_ActionCodes; $_l_BlobOffset)
				If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
					BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_ActionCodes; $_l_BlobOffset)
					If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
						BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_DiaryActionNames; $_l_BlobOffset)
						If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
							BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_al_ActionTime; $_l_BlobOffset)
							If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
								BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_ai_ActionCodesOSW; $_l_BlobOffset)
								If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
									BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_al_ActionCodesOST; $_l_BlobOffset)
									If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
										BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_ActioncodesOST; $_l_BlobOffset)
										If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
											BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_l_IncludeCompleted; $_l_BlobOffset)
											If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
												$_l_BlobOffset:=0
												If ([SD_Settings:107]x_OwnerID:1=-1)
													If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
														BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_at_PriorityNM; $_l_BlobOffset)
														If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
															BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_al_PriorityNUM; $_l_BlobOffset)
														End if 
													End if 
													
												End if 
												BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_ai_ResultCodes; $_l_BlobOffset)
												If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
													BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_at_ResultCodes; $_l_BlobOffset)
													If (BLOB size:C605([SD_Settings:107]EventParametersACTION:5)>$_l_BlobOffset)
														BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_at_ResultNames; $_l_BlobOffset)
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
				End if 
				
			End if 
			
			For ($_l_Index; 1; Size of array:C274($_at_ActionCodes))
				$_l_ActionCodeRow:=Find in array:C230(SD_at_ActionCodes; $_at_ActionCodes{$_l_Index})
				If ($_l_ActionCodeRow<0)
					SD_bo_ChangePrefs:=True:C214
					INSERT IN ARRAY:C227(SD_ai_ActionCodes; 9999; 1)
					INSERT IN ARRAY:C227(SD_at_ActionCodes; 9999; 1)
					INSERT IN ARRAY:C227(SD_at_DiaryActionNames; 9999; 1)
					INSERT IN ARRAY:C227(SD_al_ActionTime; 9999; 1)
					
					INSERT IN ARRAY:C227(SD_ai_ActionCodesOSW; 9999; 1)
					INSERT IN ARRAY:C227(SD_al_ActionCodesOST; 9999; 1)
					INSERT IN ARRAY:C227(SD_at_ActioncodesOST; 9999; 1)
					SD_ai_ActionCodes{Size of array:C274(SD_ai_ActionCodes)}:=1
					SD_at_ActionCodes{Size of array:C274(SD_at_ActionCodes)}:=$_at_ActionCodes{$_l_Index}
					SD_at_DiaryActionNames{Size of array:C274(SD_at_DiaryActionNames)}:=$_at_DiaryActionNames{$_l_Index}
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_ActionCodes{$_l_Index})
					SD2_ActionAttributesToArrays
					$_l_TypeTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
					If ($_l_TypeTypeRow>0)
						$_l_TimeAmount:=SD2_al_ActionVirtFieldDataLong{$_l_TypeTypeRow}
						$_l_TypeTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
						If ($_l_TypeTypeRow>0)
							Case of 
								: (SD2_al_ActionVirtFieldDataLong{$_l_TypeTypeRow}=2)  //Days
									$_l_TimeAmount:=$_l_TimeAmount*(60*24)
								: (SD2_al_ActionVirtFieldDataLong{$_l_TypeTypeRow}=1)  // Hours
									$_l_TimeAmount:=$_l_TimeAmount*60
								Else 
									$_at_TimeType:=1  //Mins
							End case 
							
						End if 
						
					Else 
						$_l_TimeAmount:=[SD_Settings:107]EventDefaultTimeFrame:4
					End if 
					
					SD_al_ActionTime{Size of array:C274(SD_al_ActionTime)}:=$_l_TimeAmount
					
				End if 
			End for 
			For ($_l_Index; 1; Size of array:C274($_at_ResultCodes))
				$_l_ResultCodeRow:=Find in array:C230(SD_at_ResultCodes; $_at_ResultCodes{$_l_Index})
				If ($_l_ResultCodeRow<0)
					SD_bo_ChangePrefs:=True:C214
					INSERT IN ARRAY:C227(SD_ai_ResultCodes; 9999; 1)
					INSERT IN ARRAY:C227(SD_at_ResultCodes; 9999; 1)
					INSERT IN ARRAY:C227(SD_at_ResultNames; 9999; 1)
					SD_ai_ResultCodes{Size of array:C274(SD_ai_ResultCodes)}:=1
					SD_at_ResultCodes{Size of array:C274(SD_at_ResultCodes)}:=$_at_ResultCodes{$_l_Index}
					SD_at_ResultNames{Size of array:C274(SD_at_ResultNames)}:=$_at_ResultNames{$_l_Index}
				End if 
			End for 
			//next bit just makes sure all these are the same size!
			$_l_ArraySize:=Size of array:C274(SD_at_DiaryActionNames)
			Case of 
				: (Size of array:C274(SD_ai_ActionCodes)<$_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)  //is the action code available
				: (Size of array:C274(SD_ai_ActionCodes)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_ai_ActionCodes)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
			End case 
			Case of 
				: (Size of array:C274(SD_at_ActionCodes)<$_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)  //is the action code available
				: (Size of array:C274(SD_at_ActionCodes)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_at_ActionCodes)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)
			End case 
			Case of 
				: (Size of array:C274(SD_al_ActionTime)<$_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionTime; $_l_ArraySize)  //is the action code available
				: (Size of array:C274(SD_al_ActionTime)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_al_ActionTime)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)
			End case 
			Case of 
				: (Size of array:C274(SD_ai_ActionCodesOSW)<$_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; $_l_ArraySize)
				: (Size of array:C274(SD_ai_ActionCodesOSW)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_ai_ActionCodesOSW)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionTime; $_l_ArraySize)
			End case 
			Case of 
				: (Size of array:C274(SD_al_ActionCodesOST)<$_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionCodesOST; $_l_ArraySize)
				: (Size of array:C274(SD_al_ActionCodesOST)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_al_ActionCodesOST)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionTime; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; $_l_ArraySize)
			End case 
			Case of 
				: (Size of array:C274(SD_at_ActioncodesOST)<$_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActioncodesOST; $_l_ArraySize)
				: (Size of array:C274(SD_at_ActioncodesOST)>$_l_ArraySize)
					$_l_ArraySize:=Size of array:C274(SD_at_ActioncodesOST)
					ARRAY TEXT:C222(SD_at_DiaryActionNames; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodes; $_l_ArraySize)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionTime; $_l_ArraySize)
					ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; $_l_ArraySize)
					ARRAY LONGINT:C221(SD_al_ActionCodesOST; $_l_ArraySize)
			End case 
			ARRAY TEXT:C222(SD_at_ActionTimesString; 0)
			ARRAY TEXT:C222(SD_at_ActionTimesString; $_l_ArraySize)
			For ($_l_Index; 1; Size of array:C274(SD_al_ActionTime))
				Case of 
					: (SD_al_ActionTime{$_l_Index}<60)
						SD_at_ActionTimesString{$_l_Index}:=String:C10(SD_al_ActionTime{$_l_Index})+" Mins"
						
					: (SD_al_ActionTime{$_l_Index}<(60*24))
						$_l_Hours:=0
						$_l_Time:=SD_al_ActionTime{$_l_Index}
						Repeat 
							$_l_Hours:=$_l_Hours+1
							$_l_Time:=$_l_Time-60
						Until ($_l_Time<60)
						SD_at_ActionTimesString{$_l_Index}:=String:C10($_l_Hours)+" Hrs "+String:C10(SD_al_ActionTime{$_l_Index})+" Mins"
						
					Else 
						$_l_Days:=0
						$_l_Hours:=0
						$_l_Time:=SD_al_ActionTime{$_l_Index}
						Repeat 
							$_l_Days:=$_l_Days+1
							$_l_Time:=$_l_Time-(60*24)
						Until ($_l_Time<(60*24))
						Repeat 
							$_l_Hours:=$_l_Hours+1
							$_l_Time:=$_l_Time-60
						Until ($_l_Time<60)
						SD_at_ActionTimesString{$_l_Index}:=String:C10($_l_Days)+" Days "+String:C10($_l_Hours)+" Hrs "+String:C10(SD_al_ActionTime{$_l_Index})+" Mins"
				End case 
			End for 
			SORT ARRAY:C229(SD_at_DiaryActionNames; SD_ai_ActionCodes; SD_at_ActionCodes; SD_al_ActionTime; SD_ai_ActionCodesOSW; SD_al_ActionCodesOST; SD_at_ActioncodesOST; SD_at_ActionTimesString)
			
			SORT ARRAY:C229(SD_at_ResultNames; SD_at_ResultCodes; SD_ai_ResultCodes)
			
			If ($_l_OwnerID>0)
				QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
			End if 
			$_l_BlobOffset:=0
			If ($_bo_RecordFixed)
				BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_at_PriorityNM; $_l_BlobOffset)
				If (BLOB size:C605([SD_Settings:107]EventParametersPriority:10)>$_l_BlobOffset)
					BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_al_PriorityNUM; $_l_BlobOffset)
				End if 
				
				
			End if 
			
			
			If (Size of array:C274(SD_al_PriorityNUM)=0) | ($_bo_RecordFixed=False:C215)
				//the priority list is not set-up
				//so make the defaults
				ARRAY TEXT:C222(SD_at_PriorityNM; 5)
				ARRAY LONGINT:C221(SD_al_PriorityNUM; 5)
				SD_at_PriorityNM{1}:="Highest"
				SD_at_PriorityNM{2}:="High"
				SD_at_PriorityNM{3}:="Normal"
				SD_at_PriorityNM{4}:="Low"
				SD_at_PriorityNM{5}:="Lowest"
				For ($_l_Index; 1; 5)
					SD_al_PriorityNUM{$_l_Index}:=$_l_Index
				End for 
				READ WRITE:C146([SD_Settings:107])
				QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=-1)
				SET BLOB SIZE:C606([SD_Settings:107]EventParametersPriority:10; 0)
				SET BLOB SIZE:C606([SD_Settings:107]EventParametersPriority:10; 0)
				
				VARIABLE TO BLOB:C532(SD_at_PriorityNM; [SD_Settings:107]EventParametersPriority:10; *)
				VARIABLE TO BLOB:C532(SD_al_PriorityNUM; [SD_Settings:107]EventParametersPriority:10; *)
				
				
				
				DB_SaveRecord(->[SD_Settings:107])
				UNLOAD RECORD:C212([SD_Settings:107])
				READ ONLY:C145([SD_Settings:107])
				If ($_bo_RecordFixed=False:C215)
					CREATE RECORD:C68([SD_Settings:107])
					[SD_Settings:107]x_OwnerID:1:=-2
					DB_SaveRecord(->[SD_Settings:107])
				End if 
				
			End if 
			If (SD_l_TimeSpace<1)
				SD_l_TimeSpace:=1
			End if 
			If (SD_l_TimeSpace>60)
				SD_l_TimeSpace:=60
			End if 
			
			SD_HL_l_Mins:=New list:C375
			APPEND TO LIST:C376(SD_HL_l_Mins; "1"; 1; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "2"; 2; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "3"; 3; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "4"; 4; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "5"; 5; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "6"; 6; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "7"; 7; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "8"; 8; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "9"; 9; 0; True:C214)
			APPEND TO LIST:C376(SD_HL_l_Mins; "10"; 10; 0; True:C214)
			SD_HL_l_tens:=New list:C375
			
			For ($_l_Index; 0; 59; SD_l_TimeSpace)
				If ($_l_Index=0)
					APPEND TO LIST:C376(SD_HL_l_tens; "0"; 60; 0; True:C214)
				Else 
					APPEND TO LIST:C376(SD_HL_l_tens; String:C10($_l_Index); $_l_Index; 0; True:C214)
				End if 
			End for 
			
			$_l_StartHour:=SD_ti_SettingsTimeStart*1  //Time_In seconds since midnight
			
			$_l_StartHour:=Int:C8($_l_StartHour/3600)
			$_l_EndHour:=SD_ti_SettingsTimeEnd*1  //Time_In seconds since midnight
			
			$_l_EndHour:=(Int:C8($_l_EndHour/3600))+1
			
			SD_HL_l_Hours:=New list:C375
			For ($_l_Index; $_l_StartHour; $_l_EndHour)
				$_l_Time:=$_l_Index*3600
				$_t_Hour:=Time string:C180($_l_Time)
				$_t_Hour:=Substring:C12($_t_Hour; 1; Length:C16($_t_Hour)-3)
				$_l_ListRef:=Copy list:C626(SD_HL_l_tens)
				For ($_l_Index2; 1; Count list items:C380($_l_ListRef))
					GET LIST ITEM:C378($_l_ListRef; $_l_Index2; $_l_ItemReference; $_t_TimeText)
					If ($_l_ItemReference<60)
						SET LIST ITEM:C385($_l_ListRef; $_l_ItemReference; $_t_TimeText; ($_l_ItemReference*60)+$_l_Time)
					Else 
						$_l_Time2:=($_l_Index-1)*3600
						SET LIST ITEM:C385($_l_ListRef; $_l_ItemReference; $_t_TimeText; ($_l_ItemReference*60)+$_l_Time2)
					End if 
					
				End for 
				APPEND TO LIST:C376(SD_HL_l_Hours; $_t_Hour; $_l_Time; $_l_ListRef; True:C214)
			End for 
			SD_HL_l_Hours2:=Copy list:C626(SD_HL_l_Hours)
			SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours2; 0)
			SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours; 0)
			
			COPY ARRAY:C226(SD_at_PriorityNM; SD_at_PriorityNM2)
			INSERT IN ARRAY:C227(SD_at_PriorityNM2; Size of array:C274(SD_at_PriorityNM2)+1; 2)
			SD_at_PriorityNM2{Size of array:C274(SD_at_PriorityNM2)-1}:="-"
			SD_at_PriorityNM2{Size of array:C274(SD_at_PriorityNM2)}:="All Priorities"
			
			If ([SD_Settings:107]x_OwnerID:1=<>PER_l_CurrentUserID)
				//the current user's settings
				//here we load  any other prefs that pertain
			End if 
			If (SD_ti_SettingsTimeStart=?00:00:00?)
				SD_ti_SettingsTimeStart:=?09:00:00?
			End if 
			If (SD_ti_SettingsTimeEnd=?00:00:00?)
				SD_ti_SettingsTimeEnd:=?17:00:00?
			End if 
			SD_ti_MorningStart:=SD_ti_SettingsTimeStart
			SD_ti_AfternoonEnd:=SD_ti_SettingsTimeEnd
			SD_ti_MorningEnd:=?13:00:00?
			SD_ti_AfternoonStart:=?13:00:00?
			SD_ti_EveningStart:=SD_ti_SettingsTimeEnd
			SD_ti_EveningEnd:=?23:59:00?
			//....
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionCodes"; SD_at_ActionCodes)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionNames"; SD_at_DiaryActionNames)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionCodesAvailable"; SD_ai_ActionCodes)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionCodes"; SD_at_ActionCodes)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionDefaultTiming"; SD_al_ActionTime)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionDefaultTimingName"; SD_at_ActionTimesString)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionWarningTime"; SD_al_ActionCodesOST)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionWarningName"; SD_at_ActioncodesOST)
			
			
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionResultCodes"; SD_at_ResultCodes)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionResultNames"; SD_at_ResultNames)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionResultAvailable"; SD_ai_ResultCodes)
			
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionPriorities"; SD_al_PriorityNUM)
			OB SET ARRAY:C1227(SD2_obj_DiaryPreferences; "ActionPriorityName"; SD_at_PriorityNM)
			
			
			
			OB SET:C1220(SD2_obj_DiaryPreferences; "DefaultActionLength"; SD_l_SettingsTimeLen)  //evening starts when work ends
			
			OB SET:C1220(SD2_obj_DiaryPreferences; "Day_Start"; SD_ti_SettingsTimeStart*1)  //evening starts when work ends
			
			OB SET:C1220(SD2_obj_DiaryPreferences; "Morning_Start"; SD_ti_MorningStart*1)  //evening starts when work ends
			
			OB SET:C1220(SD2_obj_DiaryPreferences; "Morning_End"; SD_ti_MorningEnd*1)  //evening starts when work ends
			OB SET:C1220(SD2_obj_DiaryPreferences; "Afternoon_Start"; SD_ti_AfternoonStart*1)  //evening starts when work ends
			OB SET:C1220(SD2_obj_DiaryPreferences; "Afternoon_End"; SD_ti_SettingsTimeEnd*1)  //evening starts when work ends
			OB SET:C1220(SD2_obj_DiaryPreferences; "Day_End"; SD_ti_SettingsTimeEnd*1)  //evening starts when work ends
			
			OB SET:C1220(SD2_obj_DiaryPreferences; "Evening_Start"; SD_ti_EveningStart*1)  //evening starts when work ends
			OB SET:C1220(SD2_obj_DiaryPreferences; "Evening_End"; SD_ti_EveningEnd*1)
			OB SET:C1220(SD2_obj_DiaryPreferences; "WorkSaturday"; SD_bo_SaturdayWork)  //
			OB SET:C1220(SD2_obj_DiaryPreferences; "WorkSunday"; SD_bo_SundayWork)
			OB SET:C1220(SD2_obj_DiaryPreferences; "ResultDialogue"; SD_bo_ResultsDialog)  //
			OB SET:C1220(SD2_obj_DiaryPreferences; "ResultSequence"; SD_bo_ResultsDialogSequence)
			OB SET:C1220(SD2_obj_DiaryPreferences; "TimePopInt"; SD_l_TimeSpace)  //
			OB SET:C1220(SD2_obj_DiaryPreferences; "ScheduleIntSetting"; SD_l_ScheduleSetting)
			$0:=SD2_obj_DiaryPreferences
			SD2_l_CUrrentLoadedPrefsID:=$1
			
			
		Else 
			
			// ALERT("INVALID VALUES HAVE BEEN PASSED TO SD_LOADPREFS")
			Gen_Alert("INVALID VALUES HAVE BEEN PASSED TO SD_LOADPREFS")
			
		End if 
	Else 
		// ALERT("SD LOADPREFS HAS BEEN CALLED WITHOUT PARAMETERS")
		Gen_Alert("SD LOADPREFS HAS BEEN CALLED WITHOUT PARAMETERS")
	End if 
Else 
	$0:=SD2_obj_DiaryPreferences
End if 
ERR_MethodTrackerReturn("SD_LoadPrefs"; $_t_oldMethodName)
