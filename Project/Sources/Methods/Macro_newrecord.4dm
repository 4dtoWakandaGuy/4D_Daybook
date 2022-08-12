//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_newrecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 18:09 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283($_l_Process; DB_l_ButtonClickedFunction)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_newrecord")
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Click"; 0)
End if 
If (BUT_p_ButtonStringPointer->="In@")
	Gen_PostKey(1; 9; 256)
Else 
	$_l_Process:=Frontmost process:C327(*)
	SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
	POST OUTSIDE CALL:C329($_l_Process)
End if 
ERR_MethodTrackerReturn("Macro_newrecord"; $_t_oldMethodName)
