//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SavePrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	C_BOOLEAN:C305($_bo_NoCHange; $_bo_ResultDialog; $_bo_UseSequence; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork; SD_bo_UseAgenda)
	C_LONGINT:C283($_l_TimePopup; $1; $2; SD_l_IncludeCompleted; SD_l_SettingsTimeLen; SD_l_TimeSpace; SD_l_TimeSpace2)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SavePrefs")

If (Count parameters:C259>=1)
	If ($1#0)
		If (UTI_Semaphore("CheckingDiarySettings"))
			READ WRITE:C146([SD_Settings:107])
			QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=$1)
			If (Records in selection:C76([SD_Settings:107])=0)
				CREATE RECORD:C68([SD_Settings:107])
				[SD_Settings:107]x_OwnerID:1:=$1
			End if 
			[SD_Settings:107]X_DayStartTime:2:=SD_ti_SettingsTimeStart
			[SD_Settings:107]x_DayEndTime:3:=SD_ti_SettingsTimeEnd
			[SD_Settings:107]EventDefaultTimeFrame:4:=SD_l_SettingsTimeLen
			SET BLOB SIZE:C606([SD_Settings:107]EventParametersACTION:5; 0)
			SORT ARRAY:C229(SD_at_DiaryActionNames; SD_ai_ActionCodes; SD_at_ActionCodes; SD_al_ActionTime; SD_ai_ActionCodesOSW; SD_al_ActionCodesOST; SD_at_ActioncodesOST; SD_al_ActionCodesOST)
			VARIABLE TO BLOB:C532(SD_ai_ActionCodes; [SD_Settings:107]EventParametersACTION:5)
			VARIABLE TO BLOB:C532(SD_at_ActionCodes; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_at_DiaryActionNames; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_al_ActionTime; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_ai_ActionCodesOSW; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_al_ActionCodesOST; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_at_ActioncodesOST; [SD_Settings:107]EventParametersACTION:5; *)
			VARIABLE TO BLOB:C532(SD_l_IncludeCompleted; [SD_Settings:107]EventParametersACTION:5; *)
			[SD_Settings:107]Saturday_Work:6:=SD_bo_SaturdayWork
			[SD_Settings:107]Sunday_Work:7:=SD_bo_SundayWork
			[SD_Settings:107]DiaryResultsDialog:8:=SD_bo_ResultsDialog
			[SD_Settings:107]ResultUseSequence:11:=SD_bo_ResultsDialogSequence
			[SD_Settings:107]TimePopUpSetting:12:=SD_l_TimeSpace
			[SD_Settings:107]ScheduleSetting:14:=SD_l_TimeSpace2
			
			DB_SaveRecord(->[SD_Settings:107])
			$_bo_NoCHange:=([SD_Settings:107]DiaryResultsDialog:8=Old:C35([SD_Settings:107]DiaryResultsDialog:8)) & ([SD_Settings:107]ResultUseSequence:11=Old:C35([SD_Settings:107]ResultUseSequence:11)) & ([SD_Settings:107]TimePopUpSetting:12=Old:C35([SD_Settings:107]TimePopUpSetting:12))
			SET BLOB SIZE:C606([SD_Settings:107]EventParametersPriority:10; 0)
			SET BLOB SIZE:C606([SD_Settings:107]EventParametersResult:9; 0)
			SORT ARRAY:C229(SD_at_ResultNames; SD_at_ResultCodes; SD_ai_ResultCodes)
			If ($1=-1)
				VARIABLE TO BLOB:C532(SD_at_PriorityNM; [SD_Settings:107]EventParametersPriority:10)
				VARIABLE TO BLOB:C532(SD_al_PriorityNUM; [SD_Settings:107]EventParametersPriority:10; *)
				VARIABLE TO BLOB:C532(SD_ai_ResultCodes; [SD_Settings:107]EventParametersResult:9)
				VARIABLE TO BLOB:C532(SD_at_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
				VARIABLE TO BLOB:C532(SD_at_ResultNames; [SD_Settings:107]EventParametersResult:9; *)
			Else 
				VARIABLE TO BLOB:C532(SD_ai_ResultCodes; [SD_Settings:107]EventParametersResult:9)
				VARIABLE TO BLOB:C532(SD_at_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
				VARIABLE TO BLOB:C532(SD_at_ResultNames; [SD_Settings:107]EventParametersResult:9; *)
			End if 
			DB_SaveRecord(->[SD_Settings:107])
			If ($1=-1)
				If (Not:C34($_bo_NoCHange))
					$_bo_ResultDialog:=[SD_Settings:107]DiaryResultsDialog:8
					$_bo_UseSequence:=[SD_Settings:107]ResultUseSequence:11
					$_l_TimePopup:=[SD_Settings:107]TimePopUpSetting:12
					ALL RECORDS:C47([SD_Settings:107])
					DB_lockFile(->[SD_Settings:107])
					APPLY TO SELECTION:C70([SD_Settings:107]; [SD_Settings:107]DiaryResultsDialog:8:=$_bo_ResultDialog)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[SD_Settings:107]))
					DB_lockFile(->[SD_Settings:107])
					APPLY TO SELECTION:C70([SD_Settings:107]; [SD_Settings:107]ResultUseSequence:11:=$_bo_UseSequence)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[SD_Settings:107]))
					DB_lockFile(->[SD_Settings:107])
					APPLY TO SELECTION:C70([SD_Settings:107]; [SD_Settings:107]TimePopUpSetting:12:=$_l_TimePopup)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[SD_Settings:107]))
					
				End if 
			End if 
			
			
			UNLOAD RECORD:C212([SD_Settings:107])
			READ ONLY:C145([SD_Settings:107])
			If (Count parameters:C259>=2)
				//Save the agenda usage preference as well
				SD_bo_UseAgenda:=SDAG_SavePreference($1; $2)
				
				
			End if 
			
		End if 
		UTI_ClearSemaphore("CheckingDiarySettings")
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("SD_SavePrefs"; $_t_oldMethodName)
