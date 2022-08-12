//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_InL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 14:30`Method: ZDiary_InL
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

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_InL")
ZProc("Diary_InL"; DB_ProcessMemoryinit(6); "Enter Letters")
ERR_MethodTrackerReturn("ZDiary_InL"; $_t_oldMethodName)
