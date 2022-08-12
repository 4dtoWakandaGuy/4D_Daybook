//%attributes = {}

If (False:C215)
	//Database Method Name:      SD_AlarmingEvents
	//------------------ Method Notes ------------------
	//JUst a note so far....but I think HERE is where we SHOULD somehow...
	//...be checking if $_bo_Update = true and doing its block of functionality
	//NOTE: This is instead of waiting until after the delay ticks and it's subsequent...
	//...selection to array.
	//The way it's currently doing it there is a time window of at least a minute in which...
	//...someone could open the diary item and reset reminder time and/or to do date or time (after first...
	//....causiong system to set $_al_NextWarnTime to 0 by clicking view diary and/or dismiss)...
	//...which would result in them expecting to reset the reminder (and so see it again later)...
	//...but the system would simply continue to delete the diary from the set...
	//...without taking into account that they have resaved the diary.
	// This is NOT as unlikely as it sounds!!
	//Also i think there is the potential chance that with the way it currently does...
	//...it that it will mix up the $_al_NextWarnTime array with the other arrays as they...
	//...have a selection to array done to them nearer the top of the repeat loop so their...
	//...order is based on whatever order the prior query was in (which looks like no particualr order...
	//...to me)....whereas the order of $_al_NextWarnTime is itself due to sort array AFTER the query...
	//...(ie it makes decision based on $_al_NextWarnTime{$_l_index} (ordered by itself)  but searches in $OLDRecordNumbers for...
	//...$_al_RecordNumbers{$_l_index} (ordered by result of query...ie unordered)...Despite my initial impression that...
	//...the fact it searches in $OLDRecordNumbers would somehow help I don't think that this is the case...
	//...In other words, I might be wrong but I am thinking it looks broken.
	//******************************************************************************************************
	
	
	//------------------ Revision Control ----------------
	//Date Created:  25/10/2019
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateDoFrom; 0)
	ARRAY LONGINT:C221($_al_AlarmTimeFrame; 0)
	ARRAY LONGINT:C221($_al_NextWarnTime; 0)
	ARRAY LONGINT:C221($_al_NumDaysDifference; 0)
	ARRAY LONGINT:C221($_al_postponedTimes; 0)
	ARRAY LONGINT:C221($_al_RecordNumbers; 0)
	ARRAY LONGINT:C221($_al_RecordNumbersOLD; 0)
	//ARRAY LONGINT(SM_al_RecordNumbers;0)
	ARRAY TEXT:C222($_at_DiaryActionCode; 0)
	ARRAY TEXT:C222($_at_DiaryRecordCode; 0)
	ARRAY TEXT:C222($_at_postponed; 0)
	ARRAY TIME:C1223($_ati_TimeStart; 0)
	C_BOOLEAN:C305(<>Err_bo_ManualHandler; <>SYS_bo_QuitCalled; $_bo_CreateSet; $_bo_Ok; $_bo_ScriptExists; $_bo_Update; DB_bo_DuringInsideCall; DB_bo_DuringOutsideCall; SD_bo_AlarmsEnd)
	C_LONGINT:C283(<>Err_l_NoError; <>PER_l_CurrentUserID; $_l_Count; $_l_CurrentWinRefOLD; $_l_DiaryRecordPosition; $_l_index; $_l_Ofset; $_l_ProcessNum; $_l_ProcessState; $_l_ProcessTime; $_l_UserID)
	C_LONGINT:C283($1; SD_l_alarmPostpone; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Initials; $_t_oldMethodName; $_t_ProcessName; $_t_UserIntials; $2; DB_t_CallOnCloseorSave; SD3_t_DiaryRelatedRecordCode)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_AlarmingEvents")


//This method will run as a seperate process and monitor Diary items
//it will provide on screen warnings for items which are due
READ ONLY:C145([DIARY:12])

MESSAGES OFF:C175
READ ONLY:C145(*)
ARRAY LONGINT:C221(SM_al_RecordNumbers; 0)
If (Count parameters:C259>=1)  //1
	
	If ($1#0)  //2
		SD_LoadPrefs($1)
		$_l_UserID:=$1
	Else 
		SD_LoadPrefs(<>PER_l_CurrentUserID)
		$_l_UserID:=<>PER_l_CurrentUserID
	End if   //2
	If (Count parameters:C259>=2)  //3
		$_l_UserID:=$1
		If ($2#"")  //4
			$_t_UserIntials:=$2
		Else 
			$_t_UserIntials:=<>PER_t_CurrentUserInitials
		End if   //4
	Else 
		$_t_UserIntials:=<>PER_t_CurrentUserInitials
	End if   //3
	
Else 
	SD_LoadPrefs(<>PER_l_CurrentUserID)
	$_l_UserID:=<>PER_l_CurrentUserID
	$_t_UserIntials:=<>PER_t_CurrentUserInitials
End if   //1
If ($_l_UserID#0)  //5
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_UserID)
	$_t_Initials:=[PERSONNEL:11]Initials:1
	READ ONLY:C145([USER_SETS:105])
	QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
	
	QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
	QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
	
	If (Records in selection:C76([USER_SETS:105])=0)  //6
		While (Semaphore:C143("CreatingDiaryReminders"))
			DelayTicks(60)
		End while 
		
		
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		CREATE SET:C116([DIARY:12]; "set1")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8#$2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		CREATE SET:C116([DIARY:12]; "Set2")
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_UserID)
		RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
		CREATE SET:C116([DIARY:12]; "Set3")
		INTERSECTION:C121("Set3"; "Set2"; "Set3")
		UNION:C120("Set1"; "Set3"; "Set1")
		USE SET:C118("Set1")
		CLEAR SET:C117("Set1")
		CLEAR SET:C117("Set2")
		CLEAR SET:C117("set3")
		LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SM_al_RecordNumbers)
		READ WRITE:C146([USER_SETS:105])
		CREATE RECORD:C68([USER_SETS:105])
		[USER_SETS:105]SET_ID:3:=$_l_UserID
		[USER_SETS:105]Set_Table:5:=-(Table:C252(->[DIARY:12]))
		[USER_SETS:105]USER_INITIALS:2:=$_t_Initials
		SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
		VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4)
		DB_SaveRecord(->[USER_SETS:105])
		AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
		UNLOAD RECORD:C212([USER_SETS:105])
		READ ONLY:C145([USER_SETS:105])
		LOAD RECORD:C52([USER_SETS:105])
		CLEAR SEMAPHORE:C144("CreatingDiaryReminders")
	End if   //6
Else 
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
	$_l_UserID:=<>PER_l_CurrentUserID
	$_t_Initials:=[PERSONNEL:11]Initials:1
	READ ONLY:C145([USER_SETS:105])
	QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
	QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
	QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
	If (Records in selection:C76([USER_SETS:105])=0)  //7
		While (Semaphore:C143("CreatingDiaryReminders"))
			DelayTicks(60)
		End while 
		
		$_bo_CreateSet:=True:C214
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		CREATE SET:C116([DIARY:12]; "set1")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8#$2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		CREATE SET:C116([DIARY:12]; "Set2")
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_UserID)
		RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
		CREATE SET:C116([DIARY:12]; "Set3")
		INTERSECTION:C121("Set3"; "Set2"; "Set3")
		UNION:C120("Set1"; "Set3"; "Set1")
		USE SET:C118("Set1")
		CLEAR SET:C117("Set1")
		CLEAR SET:C117("Set2")
		CLEAR SET:C117("set3")
		LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SM_al_RecordNumbers)
		READ WRITE:C146([USER_SETS:105])
		CREATE RECORD:C68([USER_SETS:105])
		[USER_SETS:105]SET_ID:3:=$_l_UserID
		[USER_SETS:105]Set_Table:5:=-(Table:C252(->[DIARY:12]))
		[USER_SETS:105]USER_INITIALS:2:=$_t_Initials
		SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
		VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
		DB_SaveRecord(->[USER_SETS:105])
		AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
		UNLOAD RECORD:C212([USER_SETS:105])
		READ ONLY:C145([USER_SETS:105])
		LOAD RECORD:C52([USER_SETS:105])
		CLEAR SEMAPHORE:C144("CreatingDiaryReminders")
		
	End if   //7
	
End if   //5







ARRAY TEXT:C222($_at_postponed; 0)
ARRAY LONGINT:C221($_al_postponedTimes; 0)
ARRAY LONGINT:C221($_al_RecordNumbers; 0)
ARRAY LONGINT:C221($_al_RecordNumbersOLD; 0)

Repeat   //9
	IDLE:C311
	If (Not:C34(<>SYS_bo_QuitCalled))  //   29/05/02`10
		READ ONLY:C145([USER_SETS:105])
		QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
		QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
		QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
		
		$_l_Ofset:=0
		BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_Ofset)
		
		<>Err_l_NoError:=-10503  //don't report this error to the user
		
		CREATE SET FROM ARRAY:C641([DIARY:12]; SM_al_RecordNumbers; "TempSet")
		<>Err_l_NoError:=0  //don't report this error to the user
		If (<>Err_bo_ManualHandler)
			<>Err_l_NoError:=39  // in case the set does not exist!
			//we got an error -10503
			REDUCE SELECTION:C351([DIARY:12]; 0)
			USE SET:C118("TempSet")
			LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SM_al_RecordNumbers)
			READ WRITE:C146([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
			SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
			
			VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
			SAVE RECORD:C53([USER_SETS:105])
			
			CREATE EMPTY SET:C140([DIARY:12]; "TempSet")
		End if 
		<>Err_bo_ManualHandler:=False:C215
		
		USE SET:C118("TempSet")
		CLEAR SET:C117("TempSet")
		$_bo_Update:=False:C215
		If (Records in selection:C76([DIARY:12])>0)  //11
			COPY ARRAY:C226($_al_RecordNumbers; $_al_RecordNumbersOLD)  //NG april 2004
			SELECTION TO ARRAY:C260([DIARY:12]; $_al_RecordNumbers; [DIARY:12]Diary_Code:3; $_at_DiaryRecordCode; [DIARY:12]Action_Code:9; $_at_DiaryActionCode; [DIARY:12]Time_Do_From:6; $_ati_TimeStart; [DIARY:12]Alarm_Timeframe:48; $_al_AlarmTimeFrame; [DIARY:12]Date_Do_From:4; $_ad_DateDoFrom)  //kmw 30/09/08 - added ";[DIARY]Date Do From;$_ad_DateDoFrom)" (previously reminders weren't taking into account dates - they were soley based on time which led to strange results)
			
			ARRAY LONGINT:C221($_al_NextWarnTime; Size of array:C274($_at_DiaryRecordCode))
			
			ARRAY LONGINT:C221($_al_NumDaysDifference; Size of array:C274($_at_DiaryRecordCode))  //added 1/10/08 -kmw (array replaces single value...so we can re-use it later (in second for loop) without re-calcing each item all over again
			For ($_l_index; 1; Size of array:C274($_at_DiaryRecordCode))  //12
				
				//************************************ added 30/09/08 -kmw ************************************
				//(previously reminders weren't taking into account dates - they were soley based on time which led to strange results)
				//C_LONGINT($_al_NumDaysDifference)  `$NumberOfDays from now before the day the date to do is due. (this will be negative if the date to do has past already)
				//$_al_NumDaysDifference:=0
				$_al_NumDaysDifference{$_l_index}:=$_ad_DateDoFrom{$_l_index}-Current date:C33(*)
				//*************************************************************************************************
				
				//***************************** 01/10/09 -kmw, modified and parts of this functionality moved to after for loop to fix issues (as described in comments after for loop) ***************************
				//NOTE: 01/10/09 -kmw, an effect of this change is that $_al_NextWarnTime array is always overwritten with correct warn time matching $_at_DiaryRecordCode and/or record numbers
				
				//kmw 01/10/08 - chnaged so that doesn't use postponed time if it is 0 (other parts of this functionality deliberately leave diary code in the array with a 0 value to indicate that there i sno longer a postponement time (user has viewed or dismissed) )
				$_al_NextWarnTime{$_l_index}:=($_ati_TimeStart{$_l_index}-($_al_AlarmTimeFrame{$_l_index}*60))+($_al_NumDaysDifference{$_l_index}*60*60*24)  //kmw 30/09/08 - added "($_al_NumDaysDifference*60*60*24)" (previously reminders weren't taking into account dates - they were soley based on time which led to strange results)
				$_l_DiaryRecordPosition:=Find in array:C230($_at_postponed; $_at_DiaryRecordCode{$_l_index})
				If ($_l_DiaryRecordPosition>0)
					If ($_al_postponedTimes{$_l_DiaryRecordPosition}<$_al_NextWarnTime{$_l_index}) & ($_al_postponedTimes{$_l_DiaryRecordPosition}#0)
						$_al_NextWarnTime{$_l_index}:=$_al_postponedTimes{$_l_DiaryRecordPosition}
					End if 
				End if 
				//***************************************************************************************************************************************************************************************
				
			End for   //12
			
			
			//********************************** 01/10/09 -kmw,  moved to after for loop (for reasons as described in comments after for loop) ***************************************
			//If ($_bo_Update)
			//While (Semaphore("CreatingDiaryReminders")) & (Not(◊QuitCalled))
			//DelayTicks (2)
			//End while
			//
			//$_bo_Ok:=False
			//Repeat
			//If (Not(Check_Locked (->[FILES NOS];0)))
			//DelayTicks (2)
			//Else
			//$_bo_Ok:=True
			//End if
			//Until ($_bo_Ok)
			//
			//READ WRITE([USER_SETS])
			//QUERY([USER_SETS];[USER_SETS]SET_ID=$_l_UserID;*)
			//QUERY([USER_SETS]; & ;[USER_SETS]Set_Table=-(Table(->[DIARY]));*)
			//QUERY([USER_SETS]; & ;[USER_SETS]USER_INITIALS=$_t_Initials)
			//SET BLOB SIZE([USER_SETS]SET_BLOB;0)
			//VARIABLE TO BLOB(SM_al_RecordNumbers;[USER_SETS]SET_BLOB;*)
			//DB_SaveRecord (->[USER_SETS])
			//UNLOAD RECORD([USER_SETS])
			//READ ONLY([USER_SETS])
			//CLEAR SEMAPHORE("CreatingDiaryReminders")
			//End if
			//********************************************************************************************************************************************************************
			
			//now we sort the array and find any NEW records
			SORT ARRAY:C229($_al_NextWarnTime; $_al_AlarmTimeFrame; $_at_DiaryRecordCode; $_at_DiaryActionCode; $_ati_TimeStart; $_al_RecordNumbers; $_ad_DateDoFrom; $_al_NumDaysDifference)  //kmw 1/10/08 -added $_al_NumDaysDifference   `kmw 30/09/08 - added "($_al_NumDaysDifference*60*60*24)" (previously reminders weren't taking into account dates - they were soley based on time which led to strange results)
			For ($_l_index; 1; Size of array:C274($_al_NextWarnTime))  //14
				If (SD_bo_AlarmsEnd=False:C215)  //15
					If ($_al_NextWarnTime{$_l_index}<(Current time:C178(*)*1)) & ($_al_NextWarnTime{$_l_index}>0)  //16
						//We need to warn on this
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1987)
						QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryRecordCode{$_l_index})
						DIALOG:C40([DIARY:12]; "Diary_AlarmManager")
						CLOSE WINDOW:C154
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						//SD_l_alarmPostpone
						
						
						
						Case of   //17
							: (SD_l_alarmPostpone>0)  //3
								If (False:C215)
									$_al_NextWarnTime{$_l_index}:=(Current time:C178(*)*1)+(SD_l_alarmPostpone*60)  //need to ensure array does not get refreshed
									$_l_DiaryRecordPosition:=Find in array:C230($_at_postponed; $_at_DiaryRecordCode{$_l_index})
									If ($_l_DiaryRecordPosition<0)  //18
										INSERT IN ARRAY:C227($_at_postponed; Size of array:C274($_at_postponed)+1; 1)
										INSERT IN ARRAY:C227($_al_postponedTimes; Size of array:C274($_al_postponedTimes)+1; 1)
										$_at_postponed{Size of array:C274($_at_postponed)}:=$_at_DiaryRecordCode{$_l_index}
										$_al_postponedTimes{Size of array:C274($_al_postponedTimes)}:=$_al_NextWarnTime{$_l_index}
									Else 
										$_at_postponed{$_l_DiaryRecordPosition}:=$_at_DiaryRecordCode{$_l_index}
										$_al_postponedTimes{$_l_DiaryRecordPosition}:=$_al_NextWarnTime{$_l_index}
									End if   //18
									
									
									//kmw 1/10/08 - above needs to be changed to take into account dates??
									
								Else 
									
									//***************************************** Added "alter actual alarm timeframe" functionality 01/10/08 -kmw ****************************************
									READ WRITE:C146([DIARY:12])
									QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryRecordCode{$_l_index})
									LOAD RECORD:C52([DIARY:12])
									$_bo_Ok:=False:C215
									Repeat   //19
										$_bo_Ok:=Check_Locked(->[DIARY:12]; 1)
									Until ($_bo_Ok)  //19
									//$_al_NextWarnTime{$_l_index}:=(Current time(*)*1)+(SD_l_alarmPostpone*60)  `need to ensure array does not get refreshed
									[DIARY:12]Alarm_Timeframe:48:=((24*60)*([DIARY:12]Date_Do_From:4-Current date:C33(*)))+((([DIARY:12]Time_Do_From:6+0)-(Current time:C178(*)+0))/60)-SD_l_alarmPostpone
									$_al_AlarmTimeFrame{$_l_index}:=[DIARY:12]Alarm_Timeframe:48
									$_al_NextWarnTime{$_l_index}:=($_ati_TimeStart{$_l_index}-($_al_AlarmTimeFrame{$_l_index}*60))+($_al_NumDaysDifference{$_l_index}*60*60*24)
									DB_SaveRecord(->[DIARY:12])
									AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
									UNLOAD RECORD:C212([DIARY:12])
									READ ONLY:C145([DIARY:12])
									//***********************************************************************************************************
								End if 
								
								
								
								
								
							: (SD_l_alarmPostpone<0)  //3
								READ WRITE:C146([DIARY:12])
								QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryRecordCode{$_l_index})
								LOAD RECORD:C52([DIARY:12])
								$_bo_Ok:=False:C215
								Repeat   //19
									$_bo_Ok:=Check_Locked(->[DIARY:12]; 1)
								Until ($_bo_Ok)  //19
								$_al_NextWarnTime{$_l_index}:=0
								[DIARY:12]Alarm_Timeframe:48:=0
								//********************* added 16/06/08 -kmw *********************
								
								$_bo_ScriptExists:=Macro_AccTypeDEF("OnReminderDismiss")  //run macro "Command /OnReminderDismiss" if it exists
								//*******************************************************************
								$_al_AlarmTimeFrame{$_l_index}:=[DIARY:12]Alarm_Timeframe:48  //re-set this because macro could have for some reason turned the reminder back on
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
								UNLOAD RECORD:C212([DIARY:12])
								READ ONLY:C145([DIARY:12])
								If ($_al_AlarmTimeFrame{$_l_index}=0)  //re-check this because macro could have for some reason turned the reminder back on
									$_l_DiaryRecordPosition:=Find in array:C230($_at_postponed; $_at_DiaryRecordCode{$_l_index})
									If ($_l_DiaryRecordPosition<0)  //18
										INSERT IN ARRAY:C227($_at_postponed; Size of array:C274($_at_postponed)+1; 1)
										INSERT IN ARRAY:C227($_al_postponedTimes; Size of array:C274($_al_postponedTimes)+1; 1)
										$_at_postponed{Size of array:C274($_at_postponed)}:=$_at_DiaryRecordCode{$_l_index}
										$_al_postponedTimes{Size of array:C274($_al_postponedTimes)}:=0
									Else 
										$_at_postponed{$_l_DiaryRecordPosition}:=$_at_DiaryRecordCode{$_l_index}
										$_al_postponedTimes{$_l_DiaryRecordPosition}:=0
									End if   //18
								Else 
									//$_al_NextWarnTime{$_l_index}:=(Current time(*)*1)+($_al_AlarmTimeFrame{$_l_index}*60)  `need to ensure array does not get refreshed
									//kmw 01/10/08 - above line  probably needs to take into account dates
									
									//kmw 01/10/08 - actually, as well as needing to take into account dates above was completely wrong anyway (it should have used warning time and start time...NOT current time) ( fixed in line below)
									$_al_NextWarnTime{$_l_index}:=($_ati_TimeStart{$_l_index}-($_al_AlarmTimeFrame{$_l_index}*60))+($_al_NumDaysDifference{$_l_index}*60*60*24)
								End if 
							Else 
								//call diary manager
								
								
								//***************************************** Added "alter actual alarm timeframe" functionality 01/10/08 -kmw ****************************************
								READ WRITE:C146([DIARY:12])
								QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryRecordCode{$_l_index})
								LOAD RECORD:C52([DIARY:12])
								$_bo_Ok:=False:C215
								Repeat   //19
									$_bo_Ok:=Check_Locked(->[DIARY:12]; 1)
								Until ($_bo_Ok)  //19
								//$_al_NextWarnTime{$_l_index}:=(Current time(*)*1)+(SD_l_alarmPostpone*60)  `need to ensure array does not get refreshed
								[DIARY:12]Alarm_Timeframe:48:=0
								$_al_AlarmTimeFrame{$_l_index}:=0
								$_al_NextWarnTime{$_l_index}:=0
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
								UNLOAD RECORD:C212([DIARY:12])
								READ ONLY:C145([DIARY:12])
								//***********************************************************************************************************
								$_l_DiaryRecordPosition:=Find in array:C230($_at_postponed; $_at_DiaryRecordCode{$_l_index})
								If ($_l_DiaryRecordPosition<0)  //20
									INSERT IN ARRAY:C227($_at_postponed; Size of array:C274($_at_postponed)+1; 1)
									INSERT IN ARRAY:C227($_al_postponedTimes; Size of array:C274($_al_postponedTimes)+1; 1)
									$_at_postponed{Size of array:C274($_at_postponed)}:=$_at_DiaryRecordCode{$_l_index}
									$_al_postponedTimes{Size of array:C274($_al_postponedTimes)}:=0
								Else 
									$_at_postponed{$_l_DiaryRecordPosition}:=$_at_DiaryRecordCode{$_l_index}
									$_al_postponedTimes{$_l_DiaryRecordPosition}:=0
								End if   //20
								$_t_ProcessName:="Schedule"+"-"+$_t_UserIntials
								$_l_ProcessNum:=Process number:C372($_t_ProcessName)
								PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
								If ($_l_ProcessState<0)  //21
									$_l_ProcessNum:=0
									$_t_ProcessName:="View SuperDiary"+"-"+$_t_UserIntials
								End if   //21
								DB_t_CallOnCloseorSave:="File"
								
								SD3_l_CallActionNum:=8
								
								If ($_l_ProcessNum>0)  //22
									PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
									If ($_l_ProcessState>=0)  // 29/05/02`23
										
										SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_t_DiaryRelatedRecordCode; $_at_DiaryRecordCode{$_l_index})
										SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										SHOW PROCESS:C325($_l_ProcessNum)
										RESUME PROCESS:C320($_l_ProcessNum)
										BRING TO FRONT:C326($_l_ProcessNum)
										If (Application type:C494#4D Server:K5:6)
											POST OUTSIDE CALL:C329($_l_ProcessNum)
										End if 
									End if   // process state`23
								Else   //22
									ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_ProcessName)
									Repeat   //24
										IDLE:C311
										If (SD_bo_AlarmsEnd=False:C215)  // 29/05/02`25
											DelayTicks(10)
										End if   //25
										$_t_ProcessName:="View SuperDiary"+"-"+$_t_UserIntials
										$_t_ProcessName:="View SuperDiary"+"-"+$_t_UserIntials
										$_l_ProcessNum:=Process number:C372($_t_ProcessName)
									Until (($_l_ProcessNum>0) | (<>SYS_bo_QuitCalled))  //endr1 30/05/02 pb`24
									
									
									PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
									
									$_l_Count:=0
									Repeat 
										DelayTicks(20)  //added 16/08/06 -kmw
										
										GET PROCESS VARIABLE:C371($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										GET PROCESS VARIABLE:C371($_l_ProcessNum; DB_bo_DuringOutsideCall; DB_bo_DuringOutsideCall)
										GET PROCESS VARIABLE:C371($_l_ProcessNum; DB_bo_DuringInsideCall; DB_bo_DuringInsideCall)
										POST OUTSIDE CALL:C329($_l_ProcessNum)
										
										$_l_Count:=$_l_Count+1
										
									Until ((SD3_l_CallActionNum=0) & (DB_bo_DuringOutsideCall=False:C215)) | ($_l_Count=100)  // & (DB_bo_DuringInsideCall=False)  ` | ($_l_Count>100)
									
									
									PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
									SD3_l_CallActionNum:=8
									If ($_l_ProcessState>=0)  // 29/05/02`26
										SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_t_DiaryRelatedRecordCode; $_at_DiaryRecordCode{$_l_index})
										SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										SHOW PROCESS:C325($_l_ProcessNum)
										RESUME PROCESS:C320($_l_ProcessNum)
										BRING TO FRONT:C326($_l_ProcessNum)
										If (Application type:C494#4D Server:K5:6)
											POST OUTSIDE CALL:C329($_l_ProcessNum)
										End if 
										SD3_l_CallActionNum:=0
										If (SD_bo_AlarmsEnd=False:C215)  // 29/05/02`27
											DelayTicks(30*60)
										End if   //27
									End if   // process state`26
								End if   //`22
								SD3_l_CallActionNum:=0
						End case   //17
						
						//******************************** NOTE -30/09/08 -kmw *********************************************
						//JUst a note so far....but I think HERE is where we SHOULD somehow...
						//...be deleting record from SM_al_RecordNumbers (if $_al_NextWarnTime{$_l_index}=0)...
						//...and set $_bo_Update to true
						//NOTE: This is instead of waiting until after the delay ticks and it's subsequent...
						//...selection to array.
						//The way it's currently doing it there is a time window of at least a minute in which...
						//...someone could open the diary item and reset reminder time and/or to do date or time (after first...
						//....causiong system to set $_al_NextWarnTime to 0 by clicking view diary and/or dismiss)...
						//...which would result in them expecting to reset the reminder (and so see it again later)...
						//...but the system would simply continue to delete the diary from the set...
						//...without taking into account that they have resaved the diary.
						// This is NOT as unlikely as it sounds!!
						//Also i think there is the potential chance that with the way it currently does...
						//...it that it will mix up the $_al_NextWarnTime array with the other arrays as they...
						//...have a selection to array done to them nearer the top of the repeat loop so their...
						//...order is based on whatever order the prior query was in (which looks like no particualr order...
						//...to me)....whereas the order of $_al_NextWarnTime is itself due to sort array AFTER the query...
						//...(ie it makes decision based on $_al_NextWarnTime{$_l_index} (ordered by itself)  but searches in $OLDRecordNumbers for...
						//...$_al_RecordNumbers{$_l_index} (ordered by result of query...ie unordered)...Despite my initial impression that...
						//...the fact it searches in $OLDRecordNumbers would somehow help I don't think that this is the case...
						//...In other words, I might be wrong but I am thinking it looks broken.
						//******************************************************************************************************
						
						//******************************** 01/10/08 -kmw, moved from prior for loop for the reasons described above *********************************************
						If ($_al_NextWarnTime{$_l_index}=0)
							//$_bo_Update:=True
							
							While (Semaphore:C143("CreatingDiaryReminders")) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(2)
							End while 
							
							$_bo_Ok:=False:C215
							Repeat 
								If (Not:C34(Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0)))
									DelayTicks(2)
								Else 
									$_bo_Ok:=True:C214
								End if 
							Until ($_bo_Ok)
							
							//changed so that now updating user set immediately after each diary reminder window clicked on...
							//...also changed so based on current values in user set rather than assuming the array SM_al_RecordNumbers...
							//...was up to to date which it could easily not have been.
							
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
							
							$_l_Ofset:=0
							BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_Ofset)
							
							$_l_DiaryRecordPosition:=Find in array:C230(SM_al_RecordNumbers; $_al_RecordNumbers{$_l_index})
							If ($_l_DiaryRecordPosition>0)
								DELETE FROM ARRAY:C228(SM_al_RecordNumbers; $_l_DiaryRecordPosition)
							End if 
							
							SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
							VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
							
							DB_SaveRecord(->[USER_SETS:105])
							UNLOAD RECORD:C212([USER_SETS:105])
							READ ONLY:C145([USER_SETS:105])
							
							CLEAR SEMAPHORE:C144("CreatingDiaryReminders")
							
							
						End if 
						//*********************************************************************************************************************************************************
						
						
						//*************************** removed 01/10/09 -kmw (to facilitate change of timing user set update as describved above *************************
						//Else   `[DIARY]• ;"dDiary_Sel"
						//If (SD_bo_AlarmsEnd=False)  ` 29/05/02`28
						//DelayTicks (30*60)
						//End if   `28
						//**********************************************************************************************************************************************
						
					End if   //`16
				Else   //15
					$_l_index:=Size of array:C274($_al_NextWarnTime)
					
				End if   //15 `
				
				
			End for   //14
			
			//******************************** NOTE -30/09/08 -kmw *********************************************
			
			//******************************** 01/10/08 -kmw, moved from prior for loop for the reasons described above *********************************************
			If (False:C215)  //01/10/08 -kmw, changed mind and decided update needed to occur immediately after EACH reminder displayed
				If ($_bo_Update)
					While (Semaphore:C143("CreatingDiaryReminders")) & (Not:C34(<>SYS_bo_QuitCalled))
						DelayTicks(2)
					End while 
					
					$_bo_Ok:=False:C215
					Repeat 
						If (Not:C34(Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0)))
							DelayTicks(2)
						Else 
							$_bo_Ok:=True:C214
						End if 
					Until ($_bo_Ok)
					
					READ WRITE:C146([USER_SETS:105])
					QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_UserID; *)
					QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
					QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$_t_Initials)
					SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
					VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
					DB_SaveRecord(->[USER_SETS:105])
					UNLOAD RECORD:C212([USER_SETS:105])
					READ ONLY:C145([USER_SETS:105])
					CLEAR SEMAPHORE:C144("CreatingDiaryReminders")
				End if 
			End if 
			//*****************************************************************************************************************************************************************
			
		End if   //11
		//we now wait UPTO one minute
		If (SD_bo_AlarmsEnd=False:C215)
			DelayTicks(60*60)
		End if 
		
	Else 
		SD_bo_AlarmsEnd:=True:C214
	End if   // ◊QuitCalled`10
	
Until (<>SYS_bo_QuitCalled)  //9
ERR_MethodTrackerReturn("SD_AlarmingEvents"; $_t_oldMethodName)
