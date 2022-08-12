//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetLSCookie
	//------------------ Method Notes ------------------
	//WS_GetLSCookie
	//John 12/13/2000
	
	//Returns the same value that will be used by
	//real forwarder cookies to refer to each LS
	//when passed the IP address and port
	//of the LS you want
	
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_AddressBlob)
	C_LONGINT:C283($_l_CharPosition; $_l_Port; $2)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Address; $_t_FullAddress; $_t_oldMethodName; $_t_Substring; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetLSCookie")

$_t_Address:=$1
$_l_Port:=$2

Case of 
	: (<>Web_t_ServerHandler="ITK")
		$_t_FullAddress:=$_t_Address+":"+String:C10($_l_Port)
		//$0:=Substring(ITK_Text2B64 ($_t_FullAddress);1;79) ITK OUT
		
	: (<>Web_t_ServerHandler="NTK")
		$_t_FullAddress:=$_t_Address+":"+String:C10($_l_Port)
		
		TEXT TO BLOB:C554($_t_FullAddress; $_blb_AddressBlob; Mac text without length:K22:10)  //v11 Mac text without length
		BASE64 ENCODE:C895($_blb_AddressBlob)
		$_t_Substring:=Substring:C12(BLOB to text:C555($_blb_AddressBlob; Mac text without length:K22:10); 1; 79)  //v11 ditto
		
		// Remove the padding characters added by 4D
		$_l_CharPosition:=Position:C15("="; $_t_Substring)
		If ($_l_CharPosition>0)
			$_t_Substring:=Substring:C12($_t_Substring; 1; $_l_CharPosition-1)
		End if 
		
		$0:=$_t_Substring
		
	Else 
		
		
End case 

//If ($_t_Substring≤Length($_t_Substring)≥#"&")
// $_t_Substring:=$_t_Substring+"&"
//End if

//$URLEncoded:=ITK_Text2URL ($_t_Substring)

//$0:=Substring($URLEncoded;1;79)
ERR_MethodTrackerReturn("IWS_GetLSCookie"; $_t_oldMethodName)