//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Confirm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $1; vMTitle2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Macro_Confirm")

vMTitle2:="Gen "+$1
$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+vMTitle2)

EXECUTE FORMULA:C63(vmTitle2)
ERR_MethodTrackerReturn("Macro_Confirm"; $_t_oldMethodName)
