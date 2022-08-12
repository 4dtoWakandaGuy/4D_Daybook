//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AgendaGetEvents
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
	C_BOOLEAN:C305($0; SD_bo_AgendaQueryDone; SD_bo_InAgendaHandler; SD_bo_NoAgendaEvent)
	C_DATE:C307($1; $2)
	C_LONGINT:C283($3; $4)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AgendaGetEvents")
While (Semaphore:C143("$INCALLBACK"))
	DelayTicks(2)
End while 

SD_bo_InAgendaHandler:=True:C214
If (Not:C34(SD_bo_NoAgendaEvent))
	If (Not:C34(SD_bo_AgendaQueryDone))
		REDUCE SELECTION:C351([DIARY:12]; 0)
		If (Count parameters:C259>=2)
			SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; $1; $2)
			SDiary_HL_DisplayDiary($1; $2)
		End if 
		
	Else 
		REDUCE SELECTION:C351([DIARY:12]; 0)
		
		USE SET:C118("AGTEMPSET_"+String:C10(Current process:C322))
		If (Count parameters:C259>=2)
			If (Records in selection:C76([DIARY:12])>0)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51>=$1)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51<=$2)
			End if 
		End if 
		SD_bo_AgendaQueryDone:=False:C215
	End if 
Else 
	REDUCE SELECTION:C351([DIARY:12]; 0)
	SD_bo_AgendaQueryDone:=False:C215
End if 
ERR_MethodTrackerReturn("SD_AgendaGetEvents"; $_t_oldMethodName)
SD_bo_InAgendaHandler:=False:C215
CLEAR SEMAPHORE:C144("$INCALLBACK")
$0:=True:C214
ERR_MethodTrackerReturn("SD_AgendaGetEvents"; $_t_oldMethodName)