//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_DebugOn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Err_l_DebugLogStatus; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DebugOn")

//bsw 12/07/04
//can be used by macro to turn debug on or off
//without having to log out of daybook like
//EXECUTE("DB_DebugOn(1)") will turn on debug window
//EXECUTE("DB_DebugOn(2)") will turn on debug window and log dump into clipboard

$_t_oldMethodName:=ERR_MethodTracker("DB_DebugOn")


If (Count parameters:C259>0)
	//TRACE
	<>Err_l_DebugLogStatus:=$1
End if 
ERR_MethodTrackerReturn("DB_DebugOn"; $_t_oldMethodName)