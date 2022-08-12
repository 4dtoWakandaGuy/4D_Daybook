//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_l_ShowHistory
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:26
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

$_t_oldMethodName:=ERR_MethodTracker("SD_l_ShowHistory")

ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; ""; ""; "1")
ERR_MethodTrackerReturn("SD_l_ShowHistory"; $_t_oldMethodName)