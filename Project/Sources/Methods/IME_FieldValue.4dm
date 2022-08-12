//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_FieldValue
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_FieldValue")
//IME_FieldValue
If (Count parameters:C259=1)
	$0:=IME_FieldValue2($1)
Else 
	$0:=IME_FieldValue2($1; $2)
End if 
ERR_MethodTrackerReturn("IME_FieldValue"; $_t_oldMethodName)