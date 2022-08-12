//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AutoAddRec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_PRIORITYNM;0)
	C_BOOLEAN:C305($_bo_Linked; $_bo_NewWIndow; $_bo_PassDateTimePerson; $4; $5; SD_bo_AddingDiaryRecord; SD_bo_AgendaEnabled)
	C_DATE:C307($2)
	C_LONGINT:C283($_l_Event; $_l_PriorityRow; $_l_TimeSeconds; CB_ActionDone; CB_l_ScheduleFullPage; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving; SD_l_SettingsTimeLen)
	C_TEXT:C284(<>CompCode; <>ContCode; <>DefPrior; $_t_DateString; $_t_oldMethodName; $_t_TimeString; $1; DOC_t_ActionName; SD_t_CurrentDiaryInitials; SD_t_DiaryDefaultUser; SD_t_DiaryPersonName)
	C_TEXT:C284(SD_t_PriorityName)
	C_TIME:C306($_ti_TimeDoFrom; $_ti_TimeDoTo; $3; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AutoAddRec")
//SD_AutoAddRec($1;$2;$3)
//DiaryActionVar:= $1
//DateVar:= $2
//TimeVar:= $3
//MODNG 67-2
$_bo_NewWIndow:=False:C215
If (SD_bo_AgendaEnabled)
	//`````
	If (CB_l_ScheduleFullPage=1)
		$_bo_NewWIndow:=True:C214
	End if 
End if 


If ($_bo_NewWIndow)
	If (Count parameters:C259>=4)
		$_bo_Linked:=$4
	Else 
		$_bo_Linked:=False:C215
	End if 
	If (Count parameters:C259>=5)
		$_bo_PassDateTimePerson:=$5
	Else 
		$_bo_PassDateTimePerson:=False:C215
	End if 
	If ($_bo_Linked)
		If ($_bo_PassDateTimePerson)
			$_l_TimeSeconds:=$3*1
			$_t_TimeString:=Time string:C180($_l_TimeSeconds)
			$_t_DateString:=String:C10($2)
			ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW"; $_t_DateString; $_t_TimeString; SD_t_CurrentDiaryInitials)
		Else 
			ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW")
		End if 
	Else 
		If ($_bo_PassDateTimePerson)
			$_l_TimeSeconds:=$3*1
			
			$_t_TimeString:=Time string:C180($_l_TimeSeconds)
			$_t_DateString:=String:C10($2)
			ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; $_t_DateString; $_t_TimeString; SD_t_CurrentDiaryInitials)
		Else 
			
			ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW")
		End if 
	End if 
	
Else 
	SD_l_RecNeedssaving:=1
	SD_l_EditingDiaryRecord:=0
	//SD_AutoAddRec
	//SD_l_EditingDiaryRecord:=1
	If (SD_RecordModified(->[DIARY:12]))
		SuperDiary_SaveChk
	End if 
	READ WRITE:C146([DIARY:12])
	CREATE RECORD:C68([DIARY:12])
	
	WT_hl_DiaryDETAIL3
	[DIARY:12]Action_Code:9:=$1
	RELATE ONE:C42([DIARY:12]Action_Code:9)
	DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
	
	If (Count parameters:C259>=4)
		$_bo_Linked:=$4
	Else 
		$_bo_Linked:=False:C215
	End if 
	
	If ($_bo_Linked)
		Diary_InB
		If (Count parameters:C259>=3)
			[DIARY:12]Date_Do_From:4:=$2
			[DIARY:12]Date_Do_To:33:=$2
			$_ti_TimeDoFrom:=$3
			If ($3=?00:00:00?)
				If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
					$_ti_TimeDoFrom:=Current time:C178(*)
				Else 
					$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
				End if 
			End if 
			[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
			//the following bit finds the first time slot of the amount needed after(or at)
			//the prefferred time it returns an end time for the event
			//`so after calling recalc the start time
			[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
		End if 
		
		
	Else 
		If ([DIARY:12]Diary_Code:3="")
			DiarySetCode
		End if 
		[DIARY:12]Date_Do_From:4:=$2
		[DIARY:12]Date_Do_To:33:=$2
		$_ti_TimeDoFrom:=$3
		If ($1#"TASK")  // | (True)
			If ($3=?00:00:00?)
				If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
					$_ti_TimeDoFrom:=Current time:C178(*)
				Else 
					$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
				End if 
			End if 
			[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
			//the following bit finds the first time slot of the amount needed after(or at)
			//the prefferred time it returns an end time for the event
			//`so after calling recalc the start time
			If ($1#"EVENT") & ($1#"TASK")  // | (True)
				[DIARY:12]Time_Do_To:35:=SD_GETAVAILABLETIMESLOT(SD_t_CurrentDiaryInitials; [DIARY:12]Date_Do_From:4; $_ti_TimeDoFrom; SD_l_SettingsTimeLen)
			End if 
			[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180([DIARY:12]Time_Do_To:35-(SD_l_SettingsTimeLen*60)))
			
		Else 
			If (Count parameters:C259>=3)
				[DIARY:12]Date_Do_From:4:=$2
				[DIARY:12]Date_Do_To:33:=$2
				$_ti_TimeDoFrom:=$3
				If ($3=?00:00:00?)
					If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
						$_ti_TimeDoFrom:=Current time:C178(*)
					Else 
						$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
					End if 
				End if 
				[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
				//the following bit finds the first time slot of the amount needed after(or at)
				//the prefferred time it returns an end time for the event
				//`so after calling recalc the start time
				If ($1#"EVENT") & ($1#"TASK")  // | (True)
					[DIARY:12]Time_Do_To:35:=SD_GETAVAILABLETIMESLOT(SD_t_CurrentDiaryInitials; [DIARY:12]Date_Do_From:4; $_ti_TimeDoFrom; SD_l_SettingsTimeLen)
				End if 
				[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180([DIARY:12]Time_Do_To:35-(SD_l_SettingsTimeLen*60)))
				
				
			Else 
				
				$_ti_TimeDoFrom:=?00:00:00?
				$_ti_TimeDoTo:=?00:00:00?
			End if 
			
		End if 
		
	End if 
	
	If (SD_at_PersonInitials{SD_at_DiaryOwners}#"")
		[DIARY:12]Person:8:=SD_at_PersonInitials{SD_at_DiaryOwners}
	Else 
		[DIARY:12]Person:8:=SD_t_DiaryDefaultUser
	End if 
	RELATE ONE:C42([DIARY:12]Person:8)
	SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
	SD_SetFieldsTrue
	DB_MenuAction("Functions"; ""; 2; "")
	
	//ENABLE MENU ITEM(3;0)
	SD_bo_AddingDiaryRecord:=True:C214
	SD_SetVisible(True:C214)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
	OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
	OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oHoursHLList"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
	
	$_l_Event:=Form event code:C388
	$_l_PriorityRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
	If ($_l_PriorityRow>0)
		SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityRow}
		SD_t_PriorityName:=SD_at_PRIORITYNM{$_l_PriorityRow}
	Else 
		$_l_PriorityRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11(<>DefPrior))
		If ($_l_PriorityRow>0)
			SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityRow}
			SD_t_PriorityName:=SD_at_PriorityNM{$_l_PriorityRow}
			[DIARY:12]Priority:17:=String:C10(SD_al_PriorityNUM{$_l_PriorityRow})
		Else 
			SD_al_PriorityNUM:=3
			SD_t_PriorityName:="Normal"
		End if 
		
	End if 
	
	SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
	SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
	CB_ActionDone:=Num:C11([DIARY:12]Done:14)
	
	WS_KeepFocus
	UNLOAD RECORD:C212([PERSONNEL:11])
End if 
ERR_MethodTrackerReturn("SD_AutoAddRec"; $_t_oldMethodName)
