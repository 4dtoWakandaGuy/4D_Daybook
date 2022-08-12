//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	C_REAL:C285(SD2_at_StatusNM)
	C_TEXT:C284($_t_oldMethodName; SD2_t_StatusFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List1"; Form event code:C388)
If (SD2_at_StatusNM>0)
	SD2_t_StatusFIlter:=SD_at_StatusCodes{SD2_at_StatusNM}
	SD2_at_StatusNM:=0
	//************** commented out 03/07/08 -kmw **************
	//If (SD2_T_SearchValue#"")
	//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
	//Else
	//SD2_DiaryViewManageSelection
	//SD2_DiaryVIewManageView (-1)
	//End if
	//**************************************************************
	SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List1"; $_t_oldMethodName)
