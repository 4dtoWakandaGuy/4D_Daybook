//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_onWebAuthentication
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_onWebAuthentication")

// Purpose:  Rejects invalid web connections

// Declare parameters

Case of 
	: (Not:C34(SOAP Request:C783))
		$0:=False:C215
	: (SOAP Get info:C784(SOAP method name:K46:3)#"MIR_SOAP_HandleEvents")
		$0:=False:C215
	Else 
		$0:=True:C214
End case 
// End of method
ERR_MethodTrackerReturn("MIR_onWebAuthentication"; $_t_oldMethodName)