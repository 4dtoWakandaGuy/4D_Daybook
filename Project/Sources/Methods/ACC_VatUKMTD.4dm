//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_VatUKMTD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_arrayHeader; 0)
	ARRAY TEXT:C222($_at_HeaderValue; 0)
	C_BLOB:C604($_blb_AuthKey)
	C_LONGINT:C283($_l_OK; $_l_Platform; $_l_Position)
	C_TEXT:C284($_t_AuthRequestContent; $_t_BaseURL; $_t_ClientID; $_t_Code; $_t_Command; $_t_ConsumerKey; $_t_ConsumerSecret; $_t_Content; $_t_DeviceID; $_t_EncodedText; $_t_Error)
	C_TEXT:C284($_t_Input; $_t_LiveURL; $_t_MacAddress; $_t_MyIP; $_t_Nul; $_t_OK; $_t_oldMethodName; $_t_Output; $_t_Password; $_T_redirect; $_t_RequestURI)
	C_TEXT:C284($_t_response; $_t_SentText; $_t_URI)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_VatUKMTD")

//1)  //open a window into which we all the login
$_t_BaseURL:="https://test-api.service.hmrc.gov.uk"
$_t_LiveURL:="https://api.service.hmrc.gov.uk"

$_t_ClientID:="121356823643"
$_t_Password:="Qobyrvuqlxzs"
$_t_Code:=Generate UUID:C1066
//TRACE
$_t_SentText:="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"

$_t_Input:=$_t_SentText
$_t_Nul:=""

LAUNCH EXTERNAL PROCESS:C811($_t_Input; $_t_Nul; $_t_Output; $_t_Error)
$_t_MyIP:=$_t_Output
$_t_MyIP:=Replace string:C233($_t_MyIP; Char:C90(10); "")
$_t_MyIP:=Replace string:C233($_t_MyIP; Char:C90(13); "")
$_t_MyIP:=Replace string:C233($_t_MyIP; Char:C90(34); "")




//_O_PLATFORM PROPERTIES($_l_Platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
$_t_Command:="ifconfig en0"
LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_Input; $_t_Output; $_t_Error)
$_t_MacAddress:=Substring:C12($_t_Output; Position:C15("en0"; $_t_Output)+77; 17)
$_t_MacAddress:=Replace string:C233($_t_MacAddress; " "; "")
$_t_MacAddress:=Replace string:C233($_t_MacAddress; ":"; "%3")
//If ($_l_Platform=Mac OS)
$_t_Command:="system_profiler SPHardwareDataType"
LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_Input; $_t_Output; $_t_Error)
$_l_Position:=Position:C15("Hardware UUID"; $_t_Output)
If ($_l_Position>0)
	
	$_t_DeviceID:=Substring:C12($_t_Output; $_l_Position)
	$_l_position:=Position:C15(":"; $_t_DeviceID)
	$_t_DeviceID:=STR_RemoveLeadTrailSpace(Substring:C12($_t_DeviceID; $_l_position+2))
	
	//$_t_MacAddress:=Replace string($_t_MacAddress;" ";"%3")
	
	//..  //Else 
	//$_t_Command:="ipconfig /all"
	//LAUNCH EXTERNAL PROCESS($_t_Command;$_t_Input;$_t_Output;$_t_Error)
	//$_t_MacAddress:=Substring($_t_Output;Position("Physical Address";$_t_Output)+36;17)
	//End if 
	
	//ALERT("Your MAC address is "+$_t_MacAddress)
	
	//dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
	
	$_t_DeviceID:=Generate UUID:C1066  // / have to store this one
	$_T_redirect:="http://localhost:9000"
	ARRAY TEXT:C222($_at_arrayHeader; 0)
	ARRAY TEXT:C222($_at_HeaderValue; 0)
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Connection-Method")
	APPEND TO ARRAY:C911($_at_HeaderValue; "DESKTOP_APP_DIRECT")
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Device-ID")
	APPEND TO ARRAY:C911($_at_HeaderValue; $_t_DeviceID)
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-User-IDs")
	APPEND TO ARRAY:C911($_at_HeaderValue; "os="+Current user:C182)
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Timezone")
	APPEND TO ARRAY:C911($_at_HeaderValue; "UTC+00:00")
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Local-IPs")
	APPEND TO ARRAY:C911($_at_HeaderValue; $_t_MyIP)
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-MAC-Addresses")
	APPEND TO ARRAY:C911($_at_HeaderValue; $_t_MacAddress)
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Screens")
	APPEND TO ARRAY:C911($_at_HeaderValue; "width="+String:C10(Screen width:C187)+"&"+"Height="+String:C10(Screen height:C188))
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-Window-Size")
	APPEND TO ARRAY:C911($_at_HeaderValue; "")
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-Client-User-Agent")
	APPEND TO ARRAY:C911($_at_HeaderValue; "Macintosh/OSX")
	
	APPEND TO ARRAY:C911($_at_arrayHeader; "Gov-CLient-Multi-Factor")
	APPEND TO ARRAY:C911($_at_HeaderValue; "Macintosh/OSX")
	//TRACE
	//APPEND TO ARRAY($_at_arrayHeader;"State")
	//APPEND TO ARRAY($_at_HeaderValue;$_t_Code)
	//APPEND TO ARRAY($_at_arrayHeader;"redirect")
	//APPEND TO ARRAY($_at_HeaderValue;$_T_redirect)
	$_t_URI:="?response_type=code&client_id="+$_t_ClientID+"&scope="+"scope_1"+"&state="+$_t_Code+"&redirect_uri="+$_T_redirect
	
	$_l_OK:=HTTP Request:C1158(HTTP GET method:K71:1; $_t_BaseURL+"/oauth/authorize"+$_t_URI; $_t_Content; $_t_response; $_at_arrayHeader; $_at_HeaderValue; *)  //;$_at_arrayHeader;$_at_HeaderValue;*)
	
	//HTTP Request(httpMethod;url;contents;response{;headerNames;headerValues}{;*})->Function result
	
	//TRACE
	//the following gets a processor ID on Windows.
	
	//C_TEXT($in)
	//C_TEXT($outCPN;$outPID;$outBSN;$outHDSN)  //Output of requested attribute
	//C_TEXT($errCPN;$errPID;$errBSN;$errHDSN)  //Error of Outputs
	//$in:=""
	//SET ENVIRONMENT VARIABLE("_4D_OPTION_HIDE_CONSOLE";"True")  // hide console
	//LAUNCH EXTERNAL PROCESS("wmic csproduct get name";$in;$outCPN;$errCPN)
	//SET ENVIRONMENT VARIABLE("_4D_OPTION_HIDE_CONSOLE";"True")  // hide console
	//LAUNCH EXTERNAL PROCESS("wmic cpu get ProcessorId";$in;$outPID;$errPID) 
	
	
	If (False:C215)
		$_t_ConsumerKey:=""
		$_t_ConsumerSecret:=""
		TEXT TO BLOB:C554($_t_ConsumerKey+":"+$_t_ConsumerSecret; $_blb_AuthKey; UTF8 text without length:K22:17)
		BASE64 ENCODE:C895($_blb_AuthKey; $_t_EncodedText)
		
		$_t_AuthRequestContent:=""
		ARRAY TEXT:C222($_at_arrayHeader; 0)
		ARRAY TEXT:C222($_at_HeaderValue; 0)
		$_t_RequestURI:="grant_type=authorization_code&redirect_uri"
	End if 
End if 
ERR_MethodTrackerReturn("ACC_VatUKMTD"; $_t_oldMethodName)