//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZInvStages_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvStages_Mod")
If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("InvStages_Mod"; DB_ProcessMemoryinit(2); "Credit Stages"; $1; $2)
	
Else 
	
	ZProc("InvStages_Mod"; DB_ProcessMemoryinit(2); "Credit Stages")
End if 
ERR_MethodTrackerReturn("ZInvStages_Mod"; $_t_oldMethodName)