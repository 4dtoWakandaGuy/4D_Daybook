//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_Diary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_Diary")
ZProc("Diary_Diary"; DB_ProcessMemoryinit(4); "Diary All")
ERR_MethodTrackerReturn("ZDiary_Diary"; $_t_oldMethodName)
