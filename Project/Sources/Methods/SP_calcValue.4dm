//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_calcValue
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

$_t_oldMethodName:=ERR_MethodTracker("SP_calcValue")
//this method will calculate a probable value for an order
//based on the expected value*probability`
//this really only has value in calculation of the probable sum value of orders

If (Count parameters:C259>=2)
	$0:=Round:C94($1*$2; 2)
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("SP_calcValue"; $_t_oldMethodName)