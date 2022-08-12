//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_MovePostLevelinProcess
	//------------------ Method Notes ------------------
	//This method only exists because Move_PostLevCurr had $1 as a pointer. This needs a string
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 13:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2; $7)
	C_REAL:C285($8; $9)
	C_TEXT:C284($_t_oldMethodName; $_t_StockType; $1; $3; $4; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_MovePostLevelinProcess")
If (Count parameters:C259>=9)
	$_t_StockType:=$1
	Move_PostLevCur(->$_t_StockType; $2; $3; $4; $5; $6; $7; $8; $9)
	
End if 
ERR_MethodTrackerReturn("STK_MovePostLevelinProcess"; $_t_oldMethodName)
