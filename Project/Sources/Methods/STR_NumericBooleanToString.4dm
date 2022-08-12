//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_NumericBooleanToString
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STR_NumericBooleanToString")
//STR_NumericBooleanToString
//Rollo 23/9/2004

//convert 0 or 1 to "false" or "true"

If (Count parameters:C259>=1)
	
	If ($1=1)
		$0:="true"
	Else 
		$0:="false"
	End if 
Else 
	$0:="False"
End if 
ERR_MethodTrackerReturn("STR_NumericBooleanToString"; $_t_oldMethodName)
