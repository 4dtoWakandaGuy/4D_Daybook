//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UpdatePauseWorking
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Stk_bo_PauseWorking; $1; $set)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdatePauseWorking")

If (Count parameters:C259>=1)
	$Set:=$1
Else 
	$Set:=True:C214
End if 
SET PROCESS VARIABLE:C370(-1; <>Stk_bo_PauseWorking; $Set)
ERR_MethodTrackerReturn("STK_UpdatePauseWorking"; $_t_oldMethodName)