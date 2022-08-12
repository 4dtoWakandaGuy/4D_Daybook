If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oDiaryTimeFrameNumber
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDiaryTimeFrameNumber"; Form event code:C388)
SD_Updatereminder
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDiaryTimeFrameNumber"; $_t_oldMethodName)
