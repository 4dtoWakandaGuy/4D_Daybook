//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_OnErrHandler
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
	C_LONGINT:C283(MIR_l_SOAP_LErrorNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_OnErrHandler")

MIR_l_SOAP_LErrorNumber:=Error
ERR_MethodTrackerReturn("MIR_OnErrHandler"; $_t_oldMethodName)