//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_AgendaNewEventHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/07/2011 08:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($3; $5; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_Process; $1; $2; $7; CB_l_ScheduleFullPage; SD_l_ProcRelationRecordID; SD3_l_DiaryActionNum)
	C_REAL:C285(SD_LastEvent)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials)
	C_TIME:C306($4; $6)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD2_AgendaNewEventHandler")

SD_LastEvent:=$1

If (Count parameters:C259>=7)
	Case of 
		: ($1=0)  //AG_MouseClickInDateHeader )
			SD2_D_CurrentHighlightDay:=$3
		: ($1=0)  //AG_MouseDoubleClickInEvent )
			// Display a dialog box with the event info
			//Load in read only mode
			
			
			If ($2#0)
				$_l_Process:=New process:C317("SD2_EditScheduleDiary"; DB_ProcessMemoryinit(5); "Edit Diary Record"+String:C10($2); $2; Current process:C322; $3; $4; SD_t_CurrentDiaryInitials)
			Else 
				//new record
				$_l_Process:=New process:C317("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; String:C10($3); Time string:C180($4*1); SD_t_CurrentDiaryInitials)
			End if 
			
			
		: ($1=0)  //AG_MouseClickInAgenda )
			//Set the 'highlighted date'
			SD2_D_CurrentHighlightDay:=$3
		: ($1=0)  //AG_MouseClickInEvent )
			If (False:C215)
				If (Not:C34(CB_l_ScheduleFullPage=1))
					SD_l_ProcRelationRecordID:=$2
					SD3_l_DiaryActionNum:=-8
					POST OUTSIDE CALL:C329(Current process:C322)
				End if 
				
			End if 
		: ($1=0)  //AG_MouseDoubleClickInAgenda )
			// Create a new event
			If ($2#0)
				$_l_Process:=New process:C317("SD2_EditScheduleDiary"; DB_ProcessMemoryinit(5); "Edit Diary Record"+String:C10($2); $2; Current process:C322; $3; $4; SD_t_CurrentDiaryInitials)
			Else 
				//new record
				$_l_Process:=New process:C317("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; String:C10($3); Time string:C180($4*1); SD_t_CurrentDiaryInitials)
			End if 
		: ($1=0)  //AG_MouseDragInAgenda )
		: ($1=0)  //AG_MouseDragInEvent )
			//SD_AGDragEventHandler ($2;$5;$6)
		: ($1=0)  //AG_MouseResizeEventTop )
			//SD_AGDragEventHandler ($2;$3;$4;AG_MouseResizeEventTop )
		: ($1=0)  //AG_MouseResizeEventBottom )
			//SD_AGDragEventHandler ($2;$5;$6;AG_MouseResizeEventBottom )
			
	End case 
End if 
ERR_MethodTrackerReturn("SD2_AgendaNewEventHandler"; $_t_oldMethodName)
