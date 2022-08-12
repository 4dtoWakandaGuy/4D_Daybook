If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oDiaryResultsPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	C_TEXT:C284($_t_oldMethodName; SD_t_ResultsFilterCode; SD_t_ResultsFilter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oDiaryResultsPopup"; Form event code:C388)

If (SD2_at_ResultNames>0)
	//SD_t_ResultsFilter:=SD2_at_ResultCodes{SD2_at_ResultNames}
	//above line chanegd to the two lines below on 11/07/08 -kmw
	SD_t_ResultsFilter:=SD2_at_ResultNames{SD2_at_ResultNames}
	SD_t_ResultsFilterCode:=SD2_at_ResultCodes{SD2_at_ResultNames}
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
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oDiaryResultsPopup"; $_t_oldMethodName)
