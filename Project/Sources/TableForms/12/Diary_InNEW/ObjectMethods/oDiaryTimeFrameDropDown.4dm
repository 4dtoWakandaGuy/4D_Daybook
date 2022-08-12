If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oDiaryTimeFrameDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDiaryTimeFrameDropDown"; Form event code:C388)
If (SD3_at_TimeFrame>0)
	SD_at_TimeFrame:=SD3_at_TimeFrame{SD3_at_TimeFrame}
	SD_Updatereminder
	
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDiaryTimeFrameDropDown"; $_t_oldMethodName)
