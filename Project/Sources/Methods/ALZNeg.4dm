//%attributes = {}
If (False:C215)
	//Project Method Name:      ALZNeg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2012 01:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ALZNeg")

//zneg

If ($1<0)
	$0:=0
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("ALZNeg"; $_t_oldMethodName)
