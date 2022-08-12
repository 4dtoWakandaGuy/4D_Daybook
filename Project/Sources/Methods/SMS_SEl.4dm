//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SEl
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SEl")
// SMS_Sel
// 14/01/03 pb

// this probably needs to be a bit more sophisticated ...

QUERY:C277([SMS_Log:124])
ERR_MethodTrackerReturn("SMS_SEl"; $_t_oldMethodName)