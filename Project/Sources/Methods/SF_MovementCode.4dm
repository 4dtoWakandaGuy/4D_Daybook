//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_MovementCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2011 14:20 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_AddToStart; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_MovementCode")
If (Count parameters:C259>=1)
	$_t_AddToStart:=$1
Else 
	$_t_AddToStart:=""
End if 
$0:=$_t_AddToStart+Gen_CodePref(10; ->[SF_STOCKMOVEMENTS:193]Movement_Code:2)
ERR_MethodTrackerReturn("SF_MovementCode"; $_t_oldMethodName)
