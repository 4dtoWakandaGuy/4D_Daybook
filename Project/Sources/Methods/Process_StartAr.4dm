//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_StartAr
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
	C_LONGINT:C283(<>ProcProc; $1; $e; WS_ProcMainWIndow)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_StartAr")
//Process_StartAr
//Also in ZProc
PROC_SetProcess($1; WS_ProcMainWIndow; Current process:C322)
If (<>ProcProc#0) & (Application type:C494#4D Server:K5:6)
	POST OUTSIDE CALL:C329(<>ProcProc)
End if 
ERR_MethodTrackerReturn("Process_StartAr"; $_t_oldMethodName)