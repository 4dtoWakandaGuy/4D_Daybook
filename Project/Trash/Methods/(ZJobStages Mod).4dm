//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZJobStages_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZJobStages_Mod")
If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("JobStages_Mod"; DB_ProcessMemoryinit(2); "View Job Stages"; $1; $2)
Else 
	
	ZProc("JobStages_Mod"; DB_ProcessMemoryinit(2); "View Job Stages")
End if 
ERR_MethodTrackerReturn("ZJobStages_Mod"; $_t_oldMethodName)