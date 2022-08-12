//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AgendaEventHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($3; $5; SD_D_AddDate)
	C_LONGINT:C283($_l_Process; $1; $2; $7; CB_l_ScheduleFullPage; IPREPLYSELF; SD_l_ProcRelationRecordID; SD3_l_DiaryActionNum; SD3_l_DiarySourceProcess)
	C_REAL:C285(AG_MouseResizeEventBottom; AG_MouseResizeEventTop; SD_LastEvent)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName; SD_t_CurrentDiaryInitials)
	C_TIME:C306($4; $6; SD_ti_AddTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AgendaEventHandler")

SD_LastEvent:=$1

Case of 
	: ($1=0)  //AG_MouseDoubleClickInEvent )
		// Display a dialog box with the event info
		//Load in read only mode
		If (CB_l_ScheduleFullPage=1)
			If ($2#0)
				$_l_Process:=New process:C317("SDAG_EditInProcess"; 64000; "Edit Diary Record"+String:C10($2); $2; Current process:C322)
				
				
			Else 
				//new record
				$_l_Process:=New process:C317("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; String:C10($3); Time string:C180($4*1); SD_t_CurrentDiaryInitials)
			End if 
			
		Else 
			SD_l_ProcRelationRecordID:=$2
			SD3_l_DiaryActionNum:=-88
			POST OUTSIDE CALL:C329(Current process:C322)
			
		End if 
		
		
	: ($1=0)  //AG_MouseClickInAgenda )
	: ($1=0)  //AG_MouseClickInEvent )
		If (Not:C34(CB_l_ScheduleFullPage=1))
			SD_l_ProcRelationRecordID:=$2
			SD3_l_DiaryActionNum:=-8
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		
		
	: ($1=0)  //AG_MouseDoubleClickInAgenda )
		// Create a new event
		
		If (CB_l_ScheduleFullPage=1)
			If ($2#0)
				$_l_Process:=New process:C317("SDAG_EditInProcess"; 64000; "Edit Diary Record"+String:C10($2); $2; Current process:C322)
				
				
			Else 
				//new record
				
				
				$_l_Process:=New process:C317("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; String:C10($3); Time string:C180($4*1); SD_t_CurrentDiaryInitials)
			End if 
			
		Else 
			//load in right hand pain
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
			//``
			
			If ([DIARY:12]Company_Code:1#"")
				<>CompCode:=[DIARY:12]Company_Code:1
			End if 
			If ([DIARY:12]Contact_Code:2#"")
				<>ContCode:=[DIARY:12]Contact_Code:2
			End if 
			
			IPReplySELF:=[DIARY:12]Data_Source_Table:49
			If (IPReplySELF=0)
				IPReplySELF:=-1
			End if 
			
			SD_D_AddDate:=$3
			SD_ti_AddTime:=$4
			SD3_l_DiarySourceProcess:=Current process:C322
			SD3_l_DiaryActionNum:=4
			POST OUTSIDE CALL:C329(Current process:C322)
			
			
		End if 
		
		
	: ($1=0)  //AG_MouseDragInAgenda )
	: ($1=0)  //AG_MouseDragInEvent )
		SD_AGDragEventHandler($2; $5; $6)
	: ($1=0)  //AG_MouseResizeEventTop )
		SD_AGDragEventHandler($2; $3; $4; AG_MouseResizeEventTop)
	: ($1=0)  //AG_MouseResizeEventBottom )
		SD_AGDragEventHandler($2; $5; $6; AG_MouseResizeEventBottom)
		
End case 
ERR_MethodTrackerReturn("SD_AgendaEventHandler"; $_t_oldMethodName)
