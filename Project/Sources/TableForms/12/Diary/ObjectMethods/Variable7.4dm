If (False:C215)
	//object Name: [DIARY]Variable7
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary.Variable7"; Form event code:C388)
//Diary_DiaryCal
If (Process number:C372("View SuperDiary")>0)
	SHOW PROCESS:C325(Process number:C372("Schedule"))
	RESUME PROCESS:C320(Process number:C372("Schedule"))
	BRING TO FRONT:C326(Process number:C372("Schedule"))
Else 
	ZDiary_Mod
End if 
ERR_MethodTrackerReturn("OBJ:Diary,xSort"; $_t_oldMethodName)
