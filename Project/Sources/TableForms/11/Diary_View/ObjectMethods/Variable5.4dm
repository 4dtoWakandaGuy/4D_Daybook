If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 08:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307($_D_CurrentViewDateOLD; $_d_EndDateOLD; $_d_StartDateOLD; SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_DiaryVIewTab; $_l_DiaryViewTABOld; $_l_Tab; SD_l_DiaryVIewType; vD; WS_l_CachedSelectionName; WS_l_DiaryViewTABOld; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodStrOLD; SD_t_LastQuery; SD_t_Periodstr; SD_t_PeriodStrOLD; vSelPrev; VSrchRequest)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable5"; Form event code:C388)
If (VSrchRequest#"")
	xNext:=0
	If (SD_RecordModified(->[DIARY:12]))
		SuperDiary_SaveChk
	End if 
	
	WT_hl_DiaryDETAIL3
	SD_SetFieldsFalse
	$_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
	$_d_StartDateOLD:=SD_d_StartDate
	$_d_EndDateOLD:=SD_d_EndDate
	$_t_PeriodStrOLD:=SD_t_Periodstr
	$_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
	
	$_l_Tab:=WS_at_DiaryVIewTab
	$_l_DiaryVIewTab:=4
	vSelPrev:=""
	Diary_Sel(VSrchRequest)
	SD_t_LastQuery:=VSrchRequest
	SD_t_Periodstr:=SD_t_LastQuery
	
	OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
	OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
	
	If (vD#0)
		WS_l_DiaryViewTABOld:=$_l_DiaryViewTABOld
		SD_d_StartDateOLD:=$_d_StartDateOLD
		SD_d_EndDateOLD:=$_d_EndDateOLD
		SD_t_PeriodStrOLD:=$_t_PeriodStrOLD
		SD_D_CurrentViewDateOLD:=$_D_CurrentViewDateOLD
		$_l_DiaryVIewTab:=WS_at_DiaryVIewTab
		SD_l_DiaryVIewType:=-1
		SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; -1)
		//  SDiary_HL_DisplayDiary (SD_d_StartDate;SD_d_EndDate)
		WS_l_CachedSelectionName:=0
		WS_at_DiaryVIewTab:=$_l_DiaryVIewTab
		SD_DIARYSELECTIONMANAGER
	End if 
	
	VSrchRequest:=""
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Variable5"; $_t_oldMethodName)
