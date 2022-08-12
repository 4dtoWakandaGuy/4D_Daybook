If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_ViewAG.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 09:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307($_D_CurrentViewDateOLD; $_d_EndDateOLD; $_d_StartDateOLD; SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_CurrentDiaryViewTab; $_l_CurrentTab; $_l_DiaryViewTabOLD; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; CB_l_ScheduleFullPage; SD_l_DiaryVIewType; SD_l_TabWidth; SD_l_TopSplitter)
	C_LONGINT:C283(vD; WS_l_CachedSelectionName; WS_l_DiaryViewTABOld; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodstrOLD; SD_t_LastQuery; SD_t_Periodstr; SD_t_PeriodStrOLD; vSelPrev; VSrchRequest)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable26"; Form event code:C388)
If (False:C215)
	If (VSrchRequest#"")
		xNext:=0
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		
		WT_hl_DiaryDETAIL3
		SD_SetFieldsFalse
		$_l_DiaryViewTabOLD:=WS_at_DiaryVIewTab
		$_d_StartDateOLD:=SD_d_StartDate
		$_d_EndDateOLD:=SD_d_EndDate
		$_t_PeriodstrOLD:=SD_t_Periodstr
		$_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
		
		$_l_CurrentTab:=WS_at_DiaryVIewTab
		$_l_CurrentDiaryViewTab:=4
		vSelPrev:=""
		Diary_Sel(VSrchRequest)
		SD_t_LastQuery:=VSrchRequest
		SD_t_Periodstr:=SD_t_LastQuery
		
		OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
		
		If (vD#0)
			WS_l_DiaryViewTABOld:=$_l_DiaryViewTabOLD
			SD_d_StartDateOLD:=$_d_StartDateOLD
			SD_d_EndDateOLD:=$_d_EndDateOLD
			SD_t_PeriodStrOLD:=$_t_PeriodstrOLD
			SD_D_CurrentViewDateOLD:=$_D_CurrentViewDateOLD
			$_l_CurrentDiaryViewTab:=WS_at_DiaryVIewTab
			SD_l_DiaryVIewType:=-1
			SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; SD_l_DiaryVIewType)
			//  SDiary_HL_DisplayDiary (SD_d_StartDate;SD_d_EndDate)
			WS_l_CachedSelectionName:=0
			WS_at_DiaryVIewTab:=$_l_CurrentDiaryViewTab
			SD_DIARYSELECTIONMANAGER
		End if 
		
		VSrchRequest:=""
		If (CB_l_ScheduleFullPage>0)
			
			
			OBJECT SET VISIBLE:C603(*; "oDiaryInputObject"+"@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryTimeSettingDropDown"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryTimeSetting"; False:C215)
			OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
			OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
			OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
			OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryPersonName"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPersonNameDropDown"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryPersonsPicture"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDescriptionLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "SD_l_oSplitter1"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "PICT_SMSR"; True:C214)
			OBJECT SET VISIBLE:C603(*; "PICT_EmailR"; True:C214)
			OBJECT SET VISIBLE:C603(*; "PICT_SnailMailR"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oResCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryResultPicture"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oResDescLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oScriptLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oUnitsLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oStatusLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oRelationLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oRelations"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryActionDesc"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
			OBJECT SET VISIBLE:C603(SD_l_TopSplitter; True:C214)
			
			If (SD_l_TabWidth>0)
				OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				
				OBJECT MOVE:C664(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+SD_l_TabWidth; $_l_ObjectBottom; *)
				
			End if 
			
			
		End if 
		
	End if 
	
Else 
	//NG changed Code
	//VSrchRequest
	
	
	ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; VSrchRequest)
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Variable26"; $_t_oldMethodName)
