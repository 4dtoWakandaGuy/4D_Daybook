//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_PlayButt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 16:20 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283($_l_Process; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_ButtonClickedFunction)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayButt")
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Click"; 0)
End if 
//DB_t_ButtonClickedFunction:=$1
If (Application type:C494#4D Server:K5:6)
	$_l_Process:=Frontmost process:C327(*)
	Case of 
		: ($1="-1@")
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("-1"))
		: ($1="M:@")
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("M:"))
		Else 
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction($1))
	End case 
	If ($1="-1@") | ($1="M:@")
		SET PROCESS VARIABLE:C370($_l_Process; DB_t_ButtonClickedFunction; $1)
	End if 
	POST OUTSIDE CALL:C329(Frontmost process:C327(*))
End if 
ERR_MethodTrackerReturn("Record_PlayButt"; $_t_oldMethodName)
