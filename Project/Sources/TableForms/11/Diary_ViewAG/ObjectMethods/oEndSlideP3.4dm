If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oEndSlideP3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; SD_l_AgendaEndTime; SD_l_AgendaStartTime; SD_l_EndSlider; SD_l_StartSlider)
	C_TEXT:C284($_t_oldMethodName; SD_t_AgendaEndTime; SD_t_AgendaStartTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oEndSlideP3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4)
		SD_l_AgendaEndTime:=SD_l_EndSlider
End case 
If (SD_l_AgendaEndTime<SD_l_AgendaStartTime)
	SD_l_AgendaEndTime:=SD_l_AgendaStartTime+1
	If (SD_l_AgendaEndTime>24)
		SD_l_AgendaEndTime:=24
		SD_l_AgendaStartTime:=SD_l_AgendaEndTime-1
	End if 
	SD_l_EndSlider:=SD_l_AgendaEndTime
	SD_l_StartSlider:=SD_l_AgendaStartTime
End if 
If (SD_l_AgendaEndTime<10)
	SD_t_AgendaEndTime:="To 0"+String:C10(SD_l_AgendaEndTime)+"00 hrs"
Else 
	SD_t_AgendaEndTime:="To "+String:C10(SD_l_AgendaEndTime)+"00 hrs"
End if 
If (SD_l_AgendaStartTime<10)
	SD_t_AgendaStartTime:="From 0"+String:C10(SD_l_AgendaStartTime)+"00 hrs"
Else 
	SD_t_AgendaStartTime:="From "+String:C10(SD_l_AgendaStartTime)+"00 hrs"
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oEndSlideP3"; $_t_oldMethodName)
