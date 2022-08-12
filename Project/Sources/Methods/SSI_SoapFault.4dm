//%attributes = {}
If (False:C215)
	//Project Method Name:      SSI_SoapFault
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
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_SoapFault")
If (Count parameters:C259>3)
	Case of 
		: ($1=1)  //client faults
			Case of 
				: ($2=1)  //Insufficient parameters
					SOAP SEND FAULT:C781(SOAP client fault:K46:5; "An invalid number of parameters have been sent to the method"+$3)
				: ($2=2)  //missing paramter
					SOAP SEND FAULT:C781(SOAP client fault:K46:5; "An required  parameter"+$4+" has not been sent to the method"+$3)
				: ($2=3)  //Record not found
					SOAP SEND FAULT:C781(SOAP client fault:K46:5; "The"+$4+" record cannot be found for the data sent to"+$3+"This may be a server problem")
				: ($2=4)  //General exception
					SOAP SEND FAULT:C781(SOAP client fault:K46:5; $4)
					
			End case 
		: ($1=2)  //server faults
		Else 
			SOAP SEND FAULT:C781(SOAP server fault:K46:6; "Sorry an unknown error has occoured")
			
	End case 
Else 
	SOAP SEND FAULT:C781(SOAP server fault:K46:6; "Sorry an unknown error has occoured")
End if 
ERR_MethodTrackerReturn("SSI_SoapFault"; $_t_oldMethodName)
