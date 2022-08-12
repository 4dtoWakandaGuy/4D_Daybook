//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ClosePeriods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:50
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_CLosePeriods")
Close_Process
ERR_MethodTrackerReturn("ACC_CLosePeriods"; $_t_oldMethodName)