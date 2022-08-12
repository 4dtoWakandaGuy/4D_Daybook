//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_Proxy_SOAP_HandleLogEvents
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
	C_LONGINT:C283($0; MIR_l_SOAP_LErrorNumber; MIR_l_SOAP_LResult)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $5; $tMirrorAction; $tMirrorDatabaseName; $tMirrorIPAddress)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_Proxy_SOAP_HandleLogEvents")

// Purpose: Handles all calls to the Mirror database

// Declare parameters

// Declare local variables

// Reassign for readability
$tMirrorDatabaseName:=$1
$tMirrorAction:=$2
$tMirrorIPAddress:=$3

WEB SERVICE SET PARAMETER:C777("MIR_T_SOAP_tDatabaseName"; $tMirrorDatabaseName)
WEB SERVICE SET PARAMETER:C777("MIR_T_SOAP_tAction"; $tMirrorAction)
If (Count parameters:C259>3)
	WEB SERVICE SET PARAMETER:C777("MIR_BL_SOAP_oBLOB"; $4->)
	WEB SERVICE SET PARAMETER:C777("MIR_t_SOAP_tLogFile"; $5)
End if 

ON ERR CALL:C155("MIR_SOAP_OnConnectionErr")
MIR_l_SOAP_LErrorNumber:=0
WEB SERVICE CALL:C778("http://"+$tMirrorIPAddress+"/4DSOAP/"; "A_WebService#MIR_SOAP_CallEvents"; "MIR_SOAP_CallEvents"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)
ON ERR CALL:C155("")

MIR_l_SOAP_LResult:=0

If (OK=1)  // JYFH Modif
	WEB SERVICE GET RESULT:C779(MIR_l_SOAP_LResult; "MIR_l_SOAP_LResult"; *)  // Memory clean-up on the final return value.
	$0:=0
Else 
	If (MIR_l_SOAP_LErrorNumber=0)
		MIR_l_SOAP_LErrorNumber:=-9949  // web services  License expired
	End if 
	$0:=MIR_l_SOAP_LErrorNumber
End if 


//End of method  `
ERR_MethodTrackerReturn("MIR_Proxy_SOAP_HandleLogEvents"; $_t_oldMethodName)