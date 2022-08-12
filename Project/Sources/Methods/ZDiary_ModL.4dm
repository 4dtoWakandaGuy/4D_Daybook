//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_ModL
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
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_ModL")
If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Diary_ModL"; DB_ProcessMemoryinit(4); "View Letters & "+Term_OrdWT("Quotes"); $1; $2)
	
Else 
	
	ZProc("Diary_ModL"; DB_ProcessMemoryinit(4); "View Letters & "+Term_OrdWT("Quotes"))
End if 
ERR_MethodTrackerReturn("ZDiary_ModL"; $_t_oldMethodName)
