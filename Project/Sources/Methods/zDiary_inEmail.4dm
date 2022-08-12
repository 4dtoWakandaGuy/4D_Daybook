//%attributes = {}
If (False:C215)
	//Project Method Name:      zDiary_inEmail
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
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("zDiary_inEmail")
If (Count parameters:C259=0)
	ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail")
Else 
	ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; $1; $2; $3)
End if 
ERR_MethodTrackerReturn("zDiary_inEmail"; $_t_oldMethodName)
