If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oDiaryActionsPopup1
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
	//ARRAY TEXT(SD_at_DiaryActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActions;0)
	C_DATE:C307(SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283(<>PER_l_CurrentUserSepDiaryWindow)
	C_TEXT:C284($_t_oldMethodName; SD_t_ActionFilterCode; SD_t_ActionFilter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oDiaryActionsPopup1"; Form event code:C388)
//◊SuperDiary
If (Self:C308->>0)
	SD_t_ActionFilter:=SD_at_DiaryActions{SD_at_DiaryActions}
	SD_t_ActionFilterCode:=SD_at_DiaryActionCodes{SD_at_DiaryActions}
	//************** commented out 11/07/08 -kmw *************
	//If (SD2_T_SearchValue#"")
	//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
	//Else
	//SD2_DiaryVIewManageView (-1)
	//End if
	//**************************************************************
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oDiaryActionsPopup1"; $_t_oldMethodName)
