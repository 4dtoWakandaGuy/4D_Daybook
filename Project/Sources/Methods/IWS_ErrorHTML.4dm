//%attributes = {}

If (False:C215)
	//Project Method Name:      IWS_ErrorHTML
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
	C_LONGINT:C283($_l_BytesSend; IWS_l_Stream)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_ErrorHTML; $_t_oldMethodName; IWS_t_ErrorHTML)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ErrorHTML")

//$_t_oldMethodName:=ERR_MethodTracker ("IWS_ErrorHTML")
//LOG_SetMethod ("IWS_ErrorHTML")


$_t_ErrorHTML:=IWS_t_ErrorHTML

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
	: (<>Web_t_ServerHandler="NTK")
		$_l_BytesSend:=TCP Send(IWS_l_Stream; $_t_ErrorHTML)
	Else 
		
End case 

//LOG_ResetMethod
//ERR_MethodTrackerReturn ("IWS_ErrorHTML";$_t_oldMethodName)