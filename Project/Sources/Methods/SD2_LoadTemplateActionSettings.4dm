//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadTemplateActionSettings
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
	ARRAY INTEGER:C220($_ai_DiaryLocationsSEL; 0)
	//ARRAY INTEGER(SD2_ai_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_FieldNum; 0)
	ARRAY LONGINT:C221($_al_rTableNUMs; 0)
	ARRAY LONGINT:C221($_al_ScriptIgnoreStd; 0)
	ARRAY LONGINT:C221($_al_ScriptWhen; 0)
	ARRAY LONGINT:C221($_al_WhoseDiary; 0)
	//ARRAY LONGINT(SD2_al_FieldNum;0)
	//ARRAY LONGINT(SD2_al_mIgnore;0)
	//ARRAY LONGINT(SD2_al_mWhen;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	ARRAY TEXT:C222($_at_AutoResultCodes; 0)
	ARRAY TEXT:C222($_at_AutoResultNames; 0)
	ARRAY TEXT:C222($_at_FieldName; 0)
	ARRAY TEXT:C222($_at_RecordCode; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_ResultNames; 0)
	ARRAY TEXT:C222($_at_rTableNames; 0)
	ARRAY TEXT:C222($_at_ScriptCodes; 0)
	ARRAY TEXT:C222($_at_ScriptNames; 0)
	ARRAY TEXT:C222($_at_ScriptWhen; 0)
	ARRAY TEXT:C222($_at_SD2ReminderType2; 0)
	ARRAY TEXT:C222($_at_TimeType; 0)
	ARRAY TEXT:C222($_at_WhoseDiary; 0)
	//ARRAY TEXT(SD2_at_AutoResultCodes;0)
	//ARRAY TEXT(SD2_at_AutoResultNames;0)
	//ARRAY TEXT(SD2_at_DayNames;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_rTableNames;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptWhen;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	//ARRAY TEXT(SD2_at_TimeType2;0)
	//ARRAY TEXT(SD2_at_WhoseDiary;0)
	C_BOOLEAN:C305($_bo_NewRecord; $_bo_NotDiaryOwner; $1; ACT_bo_NotDiaryOwner)
	C_LONGINT:C283($_l_ActionTypeID; $_l_CBPostAction; $_l_CBSetReminder; $_l_CBThreaded; $_l_DayEnd; $_l_DayStart; $_l_ExcludeNonWorking; $_l_FieldLevelScripts; $_l_IgnoreStdScripts; $_l_SD2ReminderTime; $_l_sRBDiary)
	C_LONGINT:C283($_l_sRBOriginal; $_l_TimeAmount; $_l_WPDescription; CB_l_ExcludeNonWorking; CB_l_FieldLevelMacros; CB_l_IgnoreStdMacros; CB_l_SetReminder; CB_l_WPDescription; SD_l_DayEND; SD_l_DayStart; SD2_l_ActionTypeID)
	C_LONGINT:C283(SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_ReminderTime; SD2_l_TimeAmount; sRB_l_Diary; sRB_l_Original)
	C_REAL:C285($_r_TimeUnits; $_r_TimeValue; $2; SD2_R_TimeUnits; SD2_R_TimeValue)
	C_TEXT:C284($_t_actionCode; $_t_actionName; $_t_ActionTypeName; $_t_AutoAction; $_t_AutoResult; $_t_DayEnd; $_t_Description; $_t_DocumentCode; $_t_EntryForm; $_t_oldMethodName; $_t_Priority)
	C_TEXT:C284($_t_TUScriptCode; $_t_TUScriptName; SD_t_ViewActionClassNM; SD2_t_AutoAction; SD2_t_AutoResult; SD2_T_DayEnd; SD2_t_DayStart; SD2_t_EntryForm; SD2_t_TUMacroCode; SD2_t_TUScriptName)
	C_TIME:C306($_ti_TimeEnd; $_ti_TimeStart; SD2_ti_TimeEnd; SD2_ti_TimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadTemplateActionSettings")
//This method will 'save' the current action settings
//load a selected template
//and then update(as per choice) the current action.
If (Count parameters:C259>=2)
	If ($2#0)
		If (Record number:C243([ACTIONS:13])=-3)  // a new record
			$_bo_NewRecord:=True:C214
		Else 
			$_bo_NewRecord:=False:C215
		End if 
		//FIRST COPY ALL THE VARIABLES FROM THE CURRENT FORM(NO NEED TO SAVE THEM)
		$_t_actionCode:=[ACTIONS:13]Action_Code:1
		$_t_actionName:=[ACTIONS:13]Action_Name:2
		$_l_ActionTypeID:=SD2_l_ActionTypeID
		$_t_ActionTypeName:=SD_t_ViewActionClassNM
		ARRAY INTEGER:C220($_ai_DiaryLocationsSEL; 0)
		COPY ARRAY:C226(SD2_ai_DiaryLocationsSEL; $_ai_DiaryLocationsSEL)
		$_l_CBThreaded:=SD2_l_CBThreaded
		$_l_sRBOriginal:=sRB_l_Original
		$_l_sRBDiary:=sRB_l_Diary
		$_l_CBPostAction:=SD2_l_CBPostAction
		$_l_TimeAmount:=SD2_l_TimeAmount
		$_ti_TimeStart:=SD2_ti_TimeStart
		$_ti_TimeEnd:=SD2_ti_TimeEnd
		$_at_TimeType:=SD2_at_TimeType
		$_l_DayStart:=SD_l_DayStart
		$_t_DayEnd:=SD2_T_DayEnd
		$_l_DayEnd:=SD_l_DayEND
		$_l_ExcludeNonWorking:=CB_l_ExcludeNonWorking
		$_l_CBSetReminder:=CB_l_SetReminder
		$_l_SD2ReminderTime:=SD2_l_ReminderTime
		$_at_SD2ReminderType2:=SD2_at_TimeType2
		ARRAY TEXT:C222($_at_WhoseDiary; 0)
		ARRAY LONGINT:C221($_al_WhoseDiary; 0)
		COPY ARRAY:C226(SD2_al_WhoseDiary; $_al_WhoseDiary)
		COPY ARRAY:C226(SD2_at_WhoseDiary; $_at_WhoseDiary)
		$_bo_NotDiaryOwner:=ACT_bo_NotDiaryOwner
		$_t_Priority:=[ACTIONS:13]Priority:5
		$_t_Description:=[ACTIONS:13]Default_Description:6
		$_t_DocumentCode:=[ACTIONS:13]Document_Code:4
		$_l_WPDescription:=CB_l_WPDescription
		ARRAY TEXT:C222($_at_FieldName; 0)
		ARRAY TEXT:C222($_at_RecordCode; 0)
		ARRAY LONGINT:C221($_al_FieldNum; 0)
		COPY ARRAY:C226(SD2_at_FieldName; $_at_FieldName)
		COPY ARRAY:C226(SD2_at_RecordCode; $_at_RecordCode)
		COPY ARRAY:C226(SD2_al_FieldNum; $_al_FieldNum)
		$_r_TimeUnits:=SD2_R_TimeUnits
		$_r_TimeValue:=SD2_R_TimeValue
		$_t_TUScriptCode:=SD2_t_TUMacroCode
		$_t_TUScriptName:=SD2_t_TUScriptName
		ARRAY LONGINT:C221($_al_rTableNUMs; 0)
		ARRAY TEXT:C222($_at_rTableNames; 0)
		COPY ARRAY:C226(SD2_al_rTableNUMs; $_al_rTableNUMs)
		COPY ARRAY:C226(SD2_at_rTableNames; $_at_rTableNames)
		ARRAY TEXT:C222($_at_ScriptCodes; 0)
		ARRAY TEXT:C222($_at_ScriptNames; 0)
		ARRAY TEXT:C222($_at_ScriptWhen; 0)
		ARRAY LONGINT:C221($_al_ScriptWhen; 0)
		ARRAY LONGINT:C221($_al_ScriptIgnoreStd; 0)  // ignore std macros
		COPY ARRAY:C226(SD2_at_ScriptCodes; $_at_ScriptCodes)
		COPY ARRAY:C226(SD2_at_ScriptNames; $_at_ScriptNames)
		COPY ARRAY:C226(SD2_at_ScriptWhen; $_at_ScriptWhen)
		COPY ARRAY:C226(SD2_al_mWhen; $_al_ScriptWhen)
		COPY ARRAY:C226(SD2_al_mIgnore; $_al_ScriptIgnoreStd)  // ignore std macros
		$_l_FieldLevelScripts:=CB_l_FieldLevelMacros
		$_l_IgnoreStdScripts:=CB_l_IgnoreStdMacros
		ARRAY TEXT:C222($_at_ResultCodes; 0)
		ARRAY TEXT:C222($_at_ResultNames; 0)
		COPY ARRAY:C226(SD2_at_ResultCodes; $_at_ResultCodes)
		COPY ARRAY:C226(SD2_at_ResultNames; $_at_ResultNames)
		$_t_AutoAction:=SD2_t_AutoAction
		ARRAY TEXT:C222($_at_AutoResultNames; 0)
		ARRAY TEXT:C222($_at_AutoResultCodes; 0)
		COPY ARRAY:C226(SD2_at_AutoResultNames; $_at_AutoResultNames)
		COPY ARRAY:C226(SD2_at_AutoResultCodes; $_at_AutoResultCodes)
		$_t_AutoResult:=SD2_t_AutoResult
		$_t_EntryForm:=SD2_t_EntryForm
		//NOW LOAD THE TEMPLATE
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$2)
		SD2_ActionAttributesToArrays
		SD2_ActionAttributestoScreen
		If (Not:C34($_bo_NewRecord))
			QUERY:C277([ACTIONS:13]Action_Code:1=$_t_actionCode)
		Else 
			CREATE RECORD:C68([ACTIONS:13])
		End if 
		[ACTIONS:13]Action_Code:1:=$_t_actionCode
		[ACTIONS:13]Action_Name:2:=$_t_actionName
		
		If ($1=False:C215)
			//DONT OVERWRITE EXISTING VALUES--SO PUT THEM BACK
			If ($_l_ActionTypeID>0)
				SD2_l_ActionTypeID:=$_l_ActionTypeID
				SD_t_ViewActionClassNM:=$_t_ActionTypeName
			End if 
			If (Size of array:C274($_ai_DiaryLocationsSEL)>0)
				COPY ARRAY:C226($_ai_DiaryLocationsSEL; SD2_ai_DiaryLocationsSEL)
			End if 
			If ($_l_CBThreaded=1)
				SD2_l_CBThreaded:=$_l_CBThreaded
				sRB_l_Original:=$_l_sRBOriginal
				sRB_l_Diary:=$_l_sRBDiary
			End if 
			If ($_l_CBPostAction=1)
				SD2_l_CBPostAction:=$_l_CBPostAction
			End if 
			If ($_l_TimeAmount>0)
				SD2_l_TimeAmount:=$_l_TimeAmount
			End if 
			If ($_ti_TimeStart#?00:00:00?)
				SD2_ti_TimeStart:=$_ti_TimeStart
			End if 
			If ($_ti_TimeEnd#?00:00:00?)
				SD2_ti_TimeEnd:=$_ti_TimeEnd
			End if 
			If ($_at_TimeType>0)
				SD2_at_TimeType:=$_at_TimeType
			End if 
			If ($_l_DayStart>0)
				SD_l_DayStart:=$_l_DayStart
				SD2_t_DayStart:=SD2_at_DayNames{SD_l_DayStart}
			End if 
			If ($_l_DayEnd>0)
				SD_l_DayEnd:=$_l_DayEnd
				SD2_T_DayEnd:=SD2_at_DayNames{SD_l_DayEnd}
			End if 
			If ($_l_ExcludeNonWorking=1)
				CB_l_ExcludeNonWorking:=$_l_ExcludeNonWorking
			End if 
			If ($_l_CBSetReminder=1)
				CB_l_SetReminder:=$_l_CBSetReminder
			End if 
			If ($_l_SD2ReminderTime>0)
				SD2_l_ReminderTime:=$_l_SD2ReminderTime
			End if 
			If ($_at_SD2ReminderType2>0)
				SD2_at_TimeType2:=$_at_SD2ReminderType2
			End if 
			If (Size of array:C274($_at_WhoseDiary)>0)
				COPY ARRAY:C226($_al_WhoseDiary; SD2_al_WhoseDiary)
				COPY ARRAY:C226($_at_WhoseDiary; SD2_at_WhoseDiary)
			End if 
			If (ACT_bo_NotDiaryOwner) | ($_bo_NotDiaryOwner)
				ACT_bo_NotDiaryOwner:=$_bo_NotDiaryOwner
			End if 
			If ($_t_Priority#"")
				[ACTIONS:13]Priority:5:=$_t_Priority
			End if 
			If ($_t_Description#"")
				[ACTIONS:13]Default_Description:6:=$_t_Description
			End if 
			If ($_t_DocumentCode#"")
				[ACTIONS:13]Document_Code:4:=$_t_DocumentCode
			End if 
			If ($_l_WPDescription=1)
				CB_l_WPDescription:=$_l_WPDescription
			End if 
			If (Size of array:C274($_at_FieldName)>0)
				COPY ARRAY:C226($_at_FieldName; SD2_at_FieldName)
				COPY ARRAY:C226($_at_RecordCode; SD2_at_RecordCode)
				COPY ARRAY:C226($_al_FieldNum; SD2_al_FieldNum)
			End if 
			If ($_r_TimeUnits>0)
				SD2_R_TimeUnits:=$_r_TimeUnits
			End if 
			If ($_r_TimeValue>0)
				$_r_TimeValue:=SD2_R_TimeValue
			End if 
			If ($_t_TUScriptCode#"")
				SD2_t_TUMacroCode:=$_t_TUScriptCode
				SD2_t_TUScriptName:=$_t_TUScriptName
			End if 
			If (Size of array:C274($_al_rTableNUMs)>0)
				COPY ARRAY:C226($_al_rTableNUMs; SD2_al_rTableNUMs)
				COPY ARRAY:C226($_at_rTableNames; SD2_at_rTableNames)
			End if 
			If (Size of array:C274($_at_ScriptCodes)>0)
				COPY ARRAY:C226($_at_ScriptCodes; SD2_at_ScriptCodes)
				COPY ARRAY:C226($_at_ScriptNames; SD2_at_ScriptNames)
				COPY ARRAY:C226($_at_ScriptWhen; SD2_at_ScriptWhen)
				COPY ARRAY:C226($_al_ScriptWhen; SD2_al_mWhen)
				COPY ARRAY:C226($_al_ScriptIgnoreStd; SD2_al_mIgnore)  // ignore std macros
			End if 
			If ($_l_FieldLevelScripts=1)
				CB_l_FieldLevelMacros:=$_l_FieldLevelScripts
			End if 
			If ($_l_IgnoreStdScripts=1)
				CB_l_IgnoreStdMacros:=$_l_IgnoreStdScripts
			End if 
			If (Size of array:C274($_at_ResultCodes)>0)
				COPY ARRAY:C226($_at_ResultCodes; SD2_at_ResultCodes)
				COPY ARRAY:C226($_at_ResultNames; SD2_at_ResultNames)
			End if 
			If (SD2_t_AutoAction#"")
				SD2_t_AutoAction:=$_t_AutoAction
			End if 
			If (Size of array:C274($_at_AutoResultNames)>0)
				COPY ARRAY:C226($_at_AutoResultNames; SD2_at_AutoResultNames)
				COPY ARRAY:C226($_at_AutoResultCodes; SD2_at_AutoResultCodes)
			End if 
			If ($_t_AutoResult#"")
				SD2_t_AutoResult:=$_t_AutoResult
			End if 
			If ($_t_EntryForm#"")
				$_t_EntryForm:=SD2_t_EntryForm
			End if 
			
		End if 
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("SD2_LoadTemplateActionSettings"; $_t_oldMethodName)
