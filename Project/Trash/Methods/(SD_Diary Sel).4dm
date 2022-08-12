//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_Diary_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 10:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(SD_bo_SearchDone; vSelMore)
	C_DATE:C307($_d_CurrentViewDateOLD; $_d_EndDateOLD; $_d_StartDateOLD; SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_DiaryViewTABOld; SD_l_DiaryVIewType; SD_l_EditingDiaryRecord; SD3_l_DiaryActionNum; vD; WS_l_DiaryViewTABOld; WS_l_SELECTEDDIARYVIEWTAB; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodStrOLD; SD_t_Periodstr; SD_t_PeriodStrOLD; vButtDisO; VSrchRequest)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Diary_Sel")
//◊SuperDiary
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 


If (False:C215)  //having fixed the view
	
Else 
	
	$_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
	$_d_StartDateOLD:=SD_d_StartDate
	$_d_EndDateOLD:=SD_d_EndDate
	$_t_PeriodStrOLD:=SD_t_Periodstr
	$_d_CurrentViewDateOLD:=SD_D_CurrentViewDate
	
	OK:=1
	Diary_Sel(""; VSelMore)
	If (Ok=1)
		SD_bo_SearchDone:=True:C214
		vSelMore:=False:C215
		xNext:=0
		VSrchRequest:=""
		vButtDisO:="O        S S   D "
		Out_Buttons(->[DIARY:12])
		
		
		If (vD#0)
			WS_l_DiaryViewTABOld:=$_l_DiaryViewTABOld
			SD_d_StartDateOLD:=$_d_StartDateOLD
			SD_d_EndDateOLD:=$_d_EndDateOLD
			SD_t_PeriodStrOLD:=$_t_PeriodStrOLD
			SD_D_CurrentViewDateOLD:=$_d_CurrentViewDateOLD
			SD_l_DiaryVIewType:=-1
			SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; -1)
			If (False:C215)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
			End if 
			
			ARRAY TEXT:C222(WS_at_DiaryVIewTab; 4)
			WS_at_DiaryVIewTab{4}:="Diary Items"
			WS_at_DiaryVIewTab:=4
			WS_l_SELECTEDDIARYVIEWTAB:=4
			
			SD3_l_DiaryActionNum:=0
			FORM GOTO PAGE:C247(2)
		End if 
	Else 
		SD_bo_SearchDone:=False:C215
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_Diary_Sel"; $_t_oldMethodName)
