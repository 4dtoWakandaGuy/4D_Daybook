If (False:C215)
	//object Name: [DIARY]Diary_ListT.Field4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_ListT.Field4"; Form event code:C388)
RELATE ONE:C42([DIARY:12]Stage_Code:21)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_ListT.Field4"; $_t_oldMethodName)