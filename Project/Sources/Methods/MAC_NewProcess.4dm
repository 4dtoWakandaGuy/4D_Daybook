//%attributes = {}
If (False:C215)
	//Project Method Name:      MAC_NewProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/01/2012 14:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Param1; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAC_NewProcess")

Gen_Alert("New Process called"+String:C10(Count parameters:C259))

$_ti_Param1:=$1
ALERT:C41(String:C10($1))
ERR_MethodTrackerReturn("MAC_NewProcess"; $_t_oldMethodName)
