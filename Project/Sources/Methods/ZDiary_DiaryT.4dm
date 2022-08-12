//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_DiaryT
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
	C_LONGINT:C283(<>SD3_l_DiaryVersion)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_DiaryT")
Case of 
	: (<>SD3_l_DiaryVersion=0)
		ZProc("Diary_DiaryT"; DB_ProcessMemoryinit(4); "Diary To Do")
		//Copied to Functions Palette
	Else 
		//new style diary
		ZDiary_Mod
End case 
ERR_MethodTrackerReturn("ZDiary_DiaryT"; $_t_oldMethodName)
