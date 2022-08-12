//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AN_ViaURL_TEMP
	//------------------ Method Notes ------------------
	//this is example code from David Ringsmith
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 12:50`Method: CCM_AN_ViaURL_TEMP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Timeout)
	C_LONGINT:C283($_l_IPSendMS; $_l_IPTimeout; $_l_PortNumber; $_l_TCPID)
	C_REAL:C285(vTCPCloseError; vTCPOpenError; vTCPReceiveError; vTCPSendError; vTCPState; vTCPStateError)
	C_TEXT:C284($_t_Buffer; $_t_oldMethodName; $_t_TempFullString; $_t_Webpage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_AN_ViaURL_TEMP")

//$vhOpenStart:=Milliseconds
vTCPOpenError:=TCP_Open("secure.nelix.com"; $_l_PortNumber; $_l_TCPID; 2)
//$vhSendStart:=Milliseconds

vTCPSendError:=TCP_Send($_l_TCPID; $_t_TempFullString)
//$vhSendEnd:=Milliseconds
$_t_Webpage:=""
vTCPState:=0
//$vhStartTime:=Milliseconds
$_l_IPTimeout:=120000  //Give it 2 minutes  until timeout

//$vhReceiveStart:=Milliseconds
$_bo_Timeout:=False:C215
//$_l_IPSendMS:=$vhSendEnd-$vhSendStart
If ($_l_IPTimeout>$_l_IPSendMS)  //Did the "Send" time-out?
	Repeat 
		vTCPReceiveError:=TCP_Receive($_l_TCPID; $_t_Buffer)
		vTCPStateError:=TCP_State($_l_TCPID; vTCPState)
		$_t_Webpage:=$_t_Webpage+$_t_Buffer
		
	Until ((vTCPState=0) | (vTCPReceiveError#0) | (vTCPStateError#0) | ($_bo_Timeout))
Else 
	//$_t_Webpage:="Send Time-out:"+$_t_crlf
	
	//$_t_Webpage:=$_t_Webpage+"Open:"+String($vhOpenStart;"###,###,###,##0")+$_t_crlf
	//$_t_Webpage:=$_t_Webpage+"Send"
	//Start:"+String($vhSendStart;"###,###,###,##0")+$_t_crlf"
	//$_t_Webpage:=$_t_Webpage+"Send"
	//End:"+String($vhSendEnd;"###,###,###,##0")+$_t_crlf"
	//$_t_Webpage:=$_t_Webpage+"Send"
	//Time:"+String($_l_IPSendMS;"###,###,###,##0")+$_t_crlf"
	
	//$_t_Webpage:=$_t_Webpage+"Time-Out:"+String($_l_IPTimeout;"###,###,###,##0")
End if 

vTCPCloseError:=TCP_Close($_l_TCPID)
//$vhReceiveEnd:=Milliseconds

//_____ this example Parses the response

//atKeyIC_Response{1}:=`atKeyIC_Response{1}+"Status"
//Code:"+$TranStatus+$_t_crlf+"Gateway Response:"+$HeaderRsp+$_t_crlf"
//`atKeyIC_Response{2}:=Substring_After_Upto
//($tResult;"trans_id=";"&")
//atKeyIC_Response{3}:=Substring_After_Upto
//($tResult;"auth_msg=";"&")
//atKeyIC_Response{4}:=Substring_After_Upto
//($tResult;"auth_code=";"&")
//atKeyIC_Response{5}:=Substring_After_Upto
//($tResult;"ticket_code=";"&")
//atKeyIC_Response{6}:=Substring_After_Upto
//($tResult;"avs_code=";"&")
//atKeyIC_Response{7}:=Substring_After_Upto
//($tResult;"reason_code2=";"&")
//atKeyIC_Response{8}:=Substring_After_Upto
//($tResult;"cvv2_code=";"&")
//atKeyIC_Response{9}:=Substring_After_Upto
//($tResult;"status_code=";"&")
ERR_MethodTrackerReturn("CCM_AN_ViaURL_TEMP"; $_t_oldMethodName)