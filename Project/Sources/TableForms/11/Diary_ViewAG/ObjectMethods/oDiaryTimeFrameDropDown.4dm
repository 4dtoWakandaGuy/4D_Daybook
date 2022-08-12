If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oDiaryTimeFrameDropDown
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
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_TEXT:C284($_t_oldMethodName; SD_at_TimeFrame)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oDiaryTimeFrameDropDown"; Form event code:C388)
If (SD3_at_TimeFrame>0)
	SD_at_TimeFrame:=SD3_at_TimeFrame{SD3_at_TimeFrame}
	SD_Updatereminder
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oDiaryTimeFrameDropDown"; $_t_oldMethodName)
