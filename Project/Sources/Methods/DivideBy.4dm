//%attributes = {}
If (False:C215)
	//Project Method Name:      DivideBy
	//------------------ Method Notes ------------------
	// DivideBy
	// 17/02/04 pb
	// this function should be used whenever you need to divide
	// one number by another.
	// It returns 0 if the divisor  is 0, thus preventing NANs
	// and it also rounds the resulting calculation
	// Parameters: $1 = Number to divide into
	//         $2 = the divisor (number doing the dividing)
	//         $3 (optional) - no. of decimal places for rounding
	// example call: DivideBy(DivideMe;ByMe;Rounding) - all numerics
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($3)
	C_REAL:C285($0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DivideBy")


If ($2=0)
	$0:=0
Else 
	If (Count parameters:C259=3)
		$0:=Round:C94($1/$2; $3)
	Else   // default to 2 decimal places
		$0:=Round:C94($1/$2; 2)
	End if 
End if 
ERR_MethodTrackerReturn("DivideBy"; $_t_oldMethodName)