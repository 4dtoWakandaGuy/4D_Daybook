If (False:C215)
	//object Name: [DIARY]Diary_ListT.Field6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_ListT.Field6"; Form event code:C388)
RELATE ONE:C42([DIARY:12]Person:8)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_ListT.Field6"; $_t_oldMethodName)