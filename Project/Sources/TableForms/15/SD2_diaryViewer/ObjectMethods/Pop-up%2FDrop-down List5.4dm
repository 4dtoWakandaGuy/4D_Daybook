If (False:C215)
	//object Name: [USER]SD2_diaryViewer.Pop-up%2FDrop-down List5
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
	//ARRAY LONGINT(SD2_al_Priority;0)
	//ARRAY TEXT(SD2_at_PriorityNM;0)
	C_LONGINT:C283(SD_l_priorityQuery)
	C_TEXT:C284($_t_oldMethodName; SD2_S5_PriorityFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List5"; Form event code:C388)
If (SD2_at_PriorityNM>0)
	SD_l_priorityQuery:=SD2_al_Priority{SD2_at_PriorityNM}
	SD2_S5_PriorityFIlter:=String:C10(SD_l_priorityQuery)
	SD2_at_PriorityNM:=0
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
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List5"; $_t_oldMethodName)
