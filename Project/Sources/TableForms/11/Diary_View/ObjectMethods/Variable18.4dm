If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(vSelMore)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction; WS_l_DiaryViewTABOld; xNext)
	C_TEXT:C284($_t_oldMethodName; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable18"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		xNext:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		WT_hl_DiaryDETAIL3
		WS_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
		SD_d_StartDateOLD:=SD_d_StartDate
		SD_d_EndDateOLD:=SD_d_EndDate
		SD_t_PeriodStrOLD:=SD_t_Periodstr
		SD_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
		SD_SetFieldsFalse
		vSelMore:=True:C214
		//TRACE
		DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Find")
		POST OUTSIDE CALL:C329(Current process:C322)
End case 
ERR_MethodTrackerReturn("OBJ:Diary_View,xFindNext"; $_t_oldMethodName)
