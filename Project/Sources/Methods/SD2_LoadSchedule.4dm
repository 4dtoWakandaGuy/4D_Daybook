//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadSchedule
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 15:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_ScheduleInclude;0)
	//ARRAY BOOLEAN(SD2_lb_SchedulesList;0)
	//ARRAY DATE(SD2_ad_EndDateRange;0)
	//ARRAY DATE(SD2_ad_StartDateRange;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_AllActionIDS; 0)
	ARRAY LONGINT:C221($_al_PersonIDs; 0)
	//ARRAY LONGINT(SD_al_INCpersonIDS;0;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_CurrentUserIDs;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_EndTimeRange;0)
	//ARRAY LONGINT(SD2_al_ExcludeDone;0)
	//ARRAY LONGINT(SD2_al_Priority;0)
	//ARRAY LONGINT(SD2_al_SearchUIDs;0)
	//ARRAY LONGINT(SD2_al_StartTimeRange;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_ActionNames; 0)
	ARRAY TEXT:C222($_at_AllActionCodes; 0)
	ARRAY TEXT:C222($_at_AllActionNames; 0)
	ARRAY TEXT:C222($_at_PriorityCodes; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	//ARRAY TEXT(SD_at_INCACTIONCODES;0;0)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_IncludeExclude;0)
	//ARRAY TEXT(SD2_at_LASTACCESSSTAMP;0)
	//ARRAY TEXT(SD2_at_MachineIDS;0;0)
	//ARRAY TEXT(SD2_at_PrioritesINC;0;0)
	//ARRAY TEXT(SD2_at_ScheduleActionNames;0)
	//ARRAY TEXT(SD2_at_SheduleActionCodes;0)
	//ARRAY TEXT(SD2_at_StatusINC;0;0)
	C_BOOLEAN:C305($_bo_OK; SD2_bo_CurrentUserPrefsLoaded; SD2_bo_FiltersOn; SD2_bo_QuerysInited; SD2_bo_ScheduleActionsInited)
	C_DATE:C307($_d_EndDateRange; $_d_StartDateRange; $3; $4)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionRow; $_l_IncludeDocs; $_l_Index; $_l_LocationPosition; $_l_OpenClosed; $6; $7; SD1_l_BUT1; SD1_l_But2; SD1_l_BUT3)
	C_LONGINT:C283(SD1_l_BUT4; SD1_l_BUT5; SD1_l_BUT6; SD1_l_BUT7; SD1_l_BUT8; SD1_l_BUT9; SD2_l_IncludeCompleted)
	C_POINTER:C301($5)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_ISODate; $_t_oldMethodName; $_t_SearchUUID; $_t_TimeString; $8; SD1_t_COL1; SD1_t_COL2; SD1_t_COL3; SD1_t_COL4; SD1_t_COL5; SD1_t_COL6)
	C_TEXT:C284(SD1_t_COL7; SD1_t_COL8; SD1_t_COL9; SD1_t_HED1; SD1_t_HED2; SD1_t_HED3; SD1_t_HED4; SD1_t_HED5; SD1_t_HED6; SD1_t_HED7; SD1_t_HED8)
	C_TEXT:C284(SD1_t_HED9)
	C_TIME:C306($_ti_EndTimeRange; $_ti_StartTimeRange; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadSchedule")

//This method will search for diary items for a given Schedule.
//Note that UIDS that are not being used can be overwritten
//so on the server we will maintain a UID register for the diary
//note that this COPIES the records to SF_DIARYVIEW table so that the calender can just retreive the selection based on the UUID
//Load SCHEDULE ACTIONS here
ARRAY TEXT:C222(SD2_at_SheduleActionCodes; 0)
ARRAY TEXT:C222(SD2_at_ScheduleActionNames; 0)
ARRAY TEXT:C222($_at_ActionNames; 0)
ARRAY TEXT:C222($_at_ActionCodes; 0)
If (Count parameters:C259>=2)
	
	If (Not:C34(SD2_bo_ScheduleActionsInited))
		SD2_GetActionsRangeByLocation("Schedule")
		If (False:C215)
			ARRAY TEXT:C222($_at_ActionCodes; 0)
			ARRAY TEXT:C222($_at_AllActionNames; 0)
			ALL RECORDS:C47([ACTIONS:13])
			SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCodes; [ACTIONS:13]xID:12; $_al_AllActionIDS; [ACTIONS:13]Action_Name:2; $_at_AllActionNames)
			ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
			ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
			ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
			SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
			
			For ($_l_Index; 1; Size of array:C274($_at_AllActionCodes))
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_Index})
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_ActionAttributesToArrays
				$_bo_OK:=False:C215
				$_l_LocationPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationPosition>0)
					$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationPosition}; 1)>0)
				Else 
					$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
				End if 
				If ($_bo_OK)  // This ensures we only include
					APPEND TO ARRAY:C911($_at_ActionNames; $_at_AllActionNames{$_l_Index})
					APPEND TO ARRAY:C911($_at_ActionCodes; $_at_AllActionCodes{$_l_Index})
				End if 
			End for 
		End if 
		//SELECTION TO ARRAY([ACTIONS]Action Code;SD2_at_ActionCodes;[ACTIONS]Action Name;SD2_at_ActionNames)
		SD2_bo_ScheduleActionsInited:=True:C214
	End if 
	
	
	COPY ARRAY:C226(SD2_at_ActionsRange; SD2_at_SheduleActionCodes)
	ARRAY TEXT:C222(SD2_at_ScheduleActionNames; Size of array:C274(SD2_at_SheduleActionCodes))
	For ($_l_Index; 1; Size of array:C274(SD2_at_ScheduleActionNames))
		$_l_ActionRow:=Find in array:C230(SD2_at_ActionsRange; SD2_at_SheduleActionCodes{$_l_Index})
		If ($_l_ActionRow>0)
			SD2_at_ScheduleActionNames{$_l_Index}:=SD2_at_ActionNames{$_l_ActionRow}
		End if 
	End for 
	APPEND TO ARRAY:C911(SD2_at_ScheduleActionNames; "HEllO")
	APPEND TO ARRAY:C911(SD2_at_SheduleActionCodes; "HEL")
	
	ARRAY BOOLEAN:C223(SD2_abo_ScheduleInclude; Size of array:C274(SD2_at_ScheduleActionNames))
	
	For ($_l_Index; 1; Size of array:C274(SD2_abo_ScheduleInclude))
		SD2_abo_ScheduleInclude{$_l_Index}:=True:C214
	End for 
	
	
	LB_SetupListbox(->SD2_lb_SchedulesList; "SD1_t"; "SD1_L"; 1; ->SD2_abo_ScheduleInclude; ->SD2_at_ScheduleActionNames; ->SD2_at_SheduleActionCodes)
	
	LB_SetColumnHeaders(->SD2_lb_SchedulesList; "SD1_L"; 1; ""; "Include"; "Name"; "Code")
	LB_SetColumnWidths(->SD2_lb_SchedulesList; "SD1_t"; 1; 20; 100; 0)
	LB_SetEnterable(->SD2_lb_SchedulesList; False:C215; 0)
	LB_SetEnterable(->SD2_lb_SchedulesList; True:C214; 1)
	LB_StyleSettings(->SD2_lb_SchedulesList; "Black"; 9; "SD1_t"; ->[DIARY:12])
	LB_Setdividers(->SD2_lb_SchedulesList; 0; 0)  //Both off
	LBI_Scrollonresize(->SD2_lb_SchedulesList)
	
End if 
COPY ARRAY:C226(SD2_at_ActionsRange; $_at_ActionCodes)

//here load the preferences for this user this may reduce the number of items in the list as we only include enabled items
If (Not:C34(SD2_bo_CurrentUserPrefsLoaded))
	
	If (Count parameters:C259>=5)
		If (Size of array:C274($5->)>0)
			SD_LoadPrefs($5->{1})
		Else 
			SD_LoadPrefs(<>PER_l_CurrentUserID)
			
		End if 
	Else 
		SD_LoadPrefs(<>PER_l_CurrentUserID)
	End if 
	SD2_bo_CurrentUserPrefsLoaded:=True:C214  //Set this to false if you change current user-NOT IF YOU CHANGE WHO YOU ARE VIEWING
End if 
If (Not:C34(SD2_bo_QuerysInited))
	ARRAY LONGINT:C221(SD2_al_SearchUIDs; 0)  //List of Current Search window
	ARRAY TEXT:C222(SD2_at_MachineIDS; 0)  //machine ID..this can be used on logout to kill all for this machine(cannot use the User name)
	ARRAY LONGINT:C221(SD2_al_CurrentUserIDs; 0)
	ARRAY TEXT:C222(SD2_at_LASTACCESSSTAMP; 0)  //last data and time
	ARRAY DATE:C224(SD2_ad_StartDateRange; 0)
	ARRAY DATE:C224(SD2_ad_EndDateRange; 0)
	ARRAY LONGINT:C221(SD2_al_StartTimeRange; 0)
	ARRAY LONGINT:C221(SD2_al_EndTimeRange; 0)
	ARRAY LONGINT:C221(SD2_al_ExcludeDone; 0)
	//THE FOLLOWING ARE ALL 2D
	ARRAY TEXT:C222(SD2_at_PrioritesINC; 0; 0)  //note if this blank it means all
	ARRAY TEXT:C222(SD2_at_StatusINC; 0; 0)  //note if this blank it means all
	ARRAY LONGINT:C221(SD_al_INCpersonIDS; 0; 0)  //note this is 2D if blank just the Current User ID
	ARRAY TEXT:C222(SD_at_INCACTIONCODES; 0; 0)
	SD2_bo_QuerysInited:=True:C214
End if 
//SD2_LoadCurrentSchedules
If ($1>0)
	//$Ref:=Find in array(SD2_al_SearchUIDs;$1)
Else 
	If ($1=-3) & ($2=-3)  //User logging out
		//$Ref:=99
	End if 
End if 

While (Semaphore:C143("$UIDRegisterUpdate"))
	DelayTicks(2)
End while 
If (Count parameters:C259>=5)
	$_d_StartDateRange:=$3
	$_d_EndDateRange:=$4
	If (SD_ti_SettingsTimeStart=?00:00:00?)
		$_ti_StartTimeRange:=?00:00:01?
	Else 
		$_ti_StartTimeRange:=SD_ti_SettingsTimeStart
	End if 
	If (SD_ti_SettingsTimeEnd=?00:00:00?)
		$_ti_EndTimeRange:=?23:59:00?
	Else 
		$_ti_EndTimeRange:=SD_ti_SettingsTimeEnd
	End if 
	
	$_t_ISODate:=String:C10(Current date:C33; ISO date:K1:8)
	$_t_TimeString:=String:C10(Current time:C178; 1)
	$_t_ISODate:=Replace string:C233($_t_ISODate; "00:00:00"; $_t_TimeString)
	ARRAY LONGINT:C221($_al_PersonIDs; 0)
	If (Count parameters:C259>=5)
		For ($_l_Index; 1; Size of array:C274($5->))
			APPEND TO ARRAY:C911($_al_PersonIDs; $5->{$_l_Index})
		End for 
	End if 
	$_l_OpenClosed:=Num:C11($6=0)
	$_l_IncludeDocs:=1
	ARRAY TEXT:C222($_at_ResultCodes; 0)  //we don;;t pass result codes but need th paramter
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	ARRAY TEXT:C222($_at_PriorityCodes; 0)
	
	If (SD2_bo_FiltersOn)
		If (SD2_at_IncludeExclude=1)  //include the chosen priority and status
			If (Count parameters:C259>=7)
				
				If ($7=0)
				Else 
					APPEND TO ARRAY:C911($_at_PriorityCodes; String:C10($7))
				End if 
			End if 
			If (Count parameters:C259>=8)
				If ($8="")
				Else 
					APPEND TO ARRAY:C911($_at_StatusCodes; $8)
				End if 
			End if 
		Else 
			//exclude the chosen prioriry and status
			If (Count parameters:C259>=7)
				If ($7=0)
				Else 
					For ($_l_Index; 1; Size of array:C274(SD2_al_Priority))
						If (SD2_al_Priority{$_l_Index}#$7)
							APPEND TO ARRAY:C911($_at_PriorityCodes; String:C10(SD2_al_Priority{$_l_Index}))
						End if 
					End for 
					
				End if 
			End if 
			If (Count parameters:C259>=8)
				If ($8="")
				Else 
					For ($_l_Index; 1; Size of array:C274(SD_at_StatusCodes))
						If (SD_at_StatusCodes{$_l_Index}#$8)
							APPEND TO ARRAY:C911($_at_StatusCodes; SD_at_StatusCodes{$_l_Index})
							
						End if 
					End for 
				End if 
			End if 
			
		End if 
	End if 
	
	$_l_IncludeDocs:=1SD2_GetRelationshipname
	If (SD2_l_IncludeCompleted=1)
		$_l_OpenClosed:=2
	Else 
		$_l_OpenClosed:=1
	End if 
	
	
	$_t_SearchUUID:=SD2_GetDataset(->$_al_PersonIDs; ->$_at_ActionCodes; $_l_IncludeDocs; $_d_StartDateRange; $_d_EndDateRange; $_ti_StartTimeRange; $_ti_EndTimeRange; $_l_OpenClosed; ->$_at_ResultCodes; ->$_at_StatusCodes)
	QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_ContextUUID:2=$_t_SearchUUID)
	
End if 
CLEAR SEMAPHORE:C144("$UIDRegisterUpdate")
ERR_MethodTrackerReturn("SD2_LoadSchedule"; $_t_oldMethodName)
