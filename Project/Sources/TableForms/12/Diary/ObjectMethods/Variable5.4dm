If (False:C215)
	//object Name: [DIARY]Variable5
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
	//ARRAY TEXT(SD_at_History;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary.Variable5"; Form event code:C388)
Diary_DiaryHist(SD_at_History)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary.Variable5"; $_t_oldMethodName)