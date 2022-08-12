//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Integer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Integer")
//Gen_Integer - used so that minuses don't round upwards (twds zero)
// but just lop off the decimals
If ($1<0)
	$0:=Round:C94((0-(Int:C8(0-$1))); 0)
Else 
	$0:=Int:C8($1)
End if 
ERR_MethodTrackerReturn("Gen_Integer"; $_t_oldMethodName)