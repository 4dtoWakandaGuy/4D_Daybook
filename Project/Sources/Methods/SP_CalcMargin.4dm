//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_CalcMargin
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
	C_REAL:C285($0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_CalcMargin")
//this method will calculate the gross margin value
//(value-costs)
If (Count parameters:C259>=2)
	$0:=Round:C94($1-$2; 2)
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("SP_CalcMargin"; $_t_oldMethodName)