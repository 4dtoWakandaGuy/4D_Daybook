//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_SOAP_onConnectionErr
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
	C_LONGINT:C283($LPosition)
	C_REAL:C285(MirrorSOAP_LErrorNumber)
	C_TEXT:C284($_t_oldMethodName; $tErrorMessage; MirrorSOAP_tErrorMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SOAP_onConnectionErr")

If (False:C215)
	// Purpose: Handles SOAP Errors
	
	// Variables for Insider
	
End if 



$tErrorMessage:=WEB SERVICE Get info:C780(0)
Case of 
	: ($tErrorMessage="9910")
		$tErrorMessage:=WEB SERVICE Get info:C780(1)
		If ($tErrorMessage[[1]]="-")
			$LPosition:=Position:C15("-"; Substring:C12($tErrorMessage; 2))
			MirrorSOAP_LErrorNumber:=Num:C11(Substring:C12($tErrorMessage; 1; $LPosition-1))
			MirrorSOAP_tErrorMessage:=Substring:C12($tErrorMessage; $LPosition+3)
		Else 
			MirrorSOAP_LErrorNumber:=Num:C11($tErrorMessage)
			MirrorSOAP_tErrorMessage:=$tErrorMessage
		End if 
	: ($tErrorMessage="9912")
		MirrorSOAP_LErrorNumber:=Num:C11($tErrorMessage)
		$tErrorMessage:=WEB SERVICE Get info:C780(1)
		MirrorSOAP_tErrorMessage:=$tErrorMessage
		ALERT:C41($tErrorMessage)
		
	: ($tErrorMessage="9913")  //Connection error
		MirrorSOAP_LErrorNumber:=Num:C11($tErrorMessage)
		$tErrorMessage:=WEB SERVICE Get info:C780(1)
		MirrorSOAP_tErrorMessage:=$tErrorMessage
		
	Else 
		MirrorSOAP_LErrorNumber:=Num:C11($tErrorMessage)
End case 
ERR_MethodTrackerReturn("MIR_SOAP_onConnectionErr"; $_t_oldMethodName)