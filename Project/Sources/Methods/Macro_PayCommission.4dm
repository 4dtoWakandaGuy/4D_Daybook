//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_PayCommission
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 06:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_PayCommission")
ERR_MethodTrackerReturn("Macro_PayCommission"; $_t_oldMethodName)