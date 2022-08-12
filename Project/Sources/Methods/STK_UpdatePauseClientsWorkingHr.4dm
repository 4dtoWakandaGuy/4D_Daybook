//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UpdatePauseClientsWorkingHr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/08/2011 15:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Stk_bo_PauseWorkingClient; $1; $set)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdatePauseClientsWorkingHr")
If (Count parameters:C259>=1)
	$Set:=$1
Else 
	$Set:=True:C214
End if 
SET PROCESS VARIABLE:C370(-1; <>Stk_bo_PauseWorkingClient; $Set)
ERR_MethodTrackerReturn("STK_UpdatePauseClientsWorkingHr"; $_t_oldMethodName)