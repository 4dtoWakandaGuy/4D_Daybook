//%attributes = {}
If (False:C215)
	//Project Method Name:      Send_Email_Menu
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
	C_BOOLEAN:C305(EMAIL_bo_ConfirmBefore)
	C_LONGINT:C283($1; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Send_Email_Menu")
SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; DB_GetButtonFunction("OK"))
EMAIL_bo_ConfirmBefore:=False:C215  //dont confirm(always true by default
POST OUTSIDE CALL:C329($1)
ERR_MethodTrackerReturn("Send_Email_Menu"; $_t_oldMethodName)