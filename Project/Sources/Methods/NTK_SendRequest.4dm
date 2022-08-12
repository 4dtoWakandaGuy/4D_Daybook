//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_SendRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:09`Method: NTK_SendRequest
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(TCP Connection Closed)
	C_BLOB:C604($_blb_Data)
	C_LONGINT:C283($_l_BytesSend; $_l_CharacterPosition; $_l_Error; $_l_Socket; $0; HTTP_Port; HTTP_TimeOut)
	C_POINTER:C301($_ptr_DataBlobPointer; $_ptr_Response; $2; $3)
	C_REAL:C285($_r_timeoutAT)
	C_TEXT:C284($_t_CrLF; $_t_Headers; $_t_oldMethodName; $_t_Options; $_t_Path; $_t_RequestMethod; $_t_Text; $1; HTTP_Host; HTTP_Path; HTTP_Protocol)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_SendRequest")

// (PM) HTTP_SendRequest
// Performs the actual HTTP request
// $1 = Request method (GET or POST)
// $2 = Pointer to blob with response
// $0 = Error code

If (Count parameters:C259>=3)
	$_ptr_DataBlobPointer:=$3
	$_t_RequestMethod:=$1
	$_ptr_Response:=$2
	$_l_Error:=-1
	
	// Clear the response blob
	SET BLOB SIZE:C606($_ptr_Response->; 0)
	
	$_t_Path:=HTTP_Path
	
	// If we have a GET request append the data as request parameters
	If (($_t_RequestMethod="GET") & (BLOB size:C605($_ptr_DataBlobPointer->)>0))
		$_t_Path:=$_t_Path+"?"+BLOB to text:C555($_ptr_DataBlobPointer->; Mac text without length:K22:10)
	End if 
	
	// Build the HTTP headers
	$_t_CrLF:=Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	$_t_Headers:=$_t_RequestMethod+" "+$_t_Path+" HTTP/1.1"+$_t_CrLF
	$_t_Headers:=$_t_Headers+"User-Agent: 4D HTTP Client"+$_t_CrLF
	$_t_Headers:=$_t_Headers+"Host: "+HTTP_Host+$_t_CrLF
	$_t_Headers:=$_t_Headers+"Accept: */*"+$_t_CrLF
	$_t_Headers:=$_t_Headers+"Connection: close"+$_t_CrLF
	
	// For a POST request we need to add a content-length header
	If ($_t_RequestMethod="POST")
		$_t_Headers:=$_t_Headers+"Content-Length: "+String:C10(BLOB size:C605($_ptr_DataBlobPointer->))+$_t_CrLF
		$_t_Headers:=$_t_Headers+"Content-Type: application/x-www-form-urlencoded"+$_t_CrLF
	End if 
	
	// Important: the headers must end with a blank line
	$_t_Headers:=$_t_Headers+$_t_CrLF
	
	// Convert the headers to a blob
	TEXT TO BLOB:C554($_t_Headers; $_blb_Data; Mac text without length:K22:10)
	
	// For a POST request we append the data to the headers
	If ($_t_RequestMethod="POST")
		COPY BLOB:C558($_ptr_DataBlobPointer->; $_blb_Data; 0; BLOB size:C605($_blb_Data); BLOB size:C605($_ptr_DataBlobPointer->))
	End if 
	
	$_t_Options:="connect-timeout="+String:C10(HTTP_TimeOut)
	
	If (HTTP_Protocol="https")
		$_t_Options:=$_t_Options+" ssl=true"
	End if 
	
	// Set the timeout and open a connection
	$_l_Socket:=TCP Open(HTTP_Host; HTTP_Port; $_t_Options)
	$_t_Text:=BLOB to text:C555($_blb_Data; 3)
	SET TEXT TO PASTEBOARD:C523($_t_Text)
	// If we have a connection
	If ($_l_Socket#0)
		
		// Send the request
		$_l_BytesSend:=TCP Send Blob($_l_Socket; $_blb_Data)
		$_r_timeoutAT:=Milliseconds:C459+(HTTP_TimeOut*1000)
		
		// Get the response (wait until the connection is closed)
		While ((TCP Get State($_l_Socket)#TCP Connection Closed) & (Milliseconds:C459<$_r_timeoutAT))
			If (TCP Receive Blob($_l_Socket; $_blb_Data)>0)
				COPY BLOB:C558($_blb_Data; $_ptr_Response->; 0; BLOB size:C605($_ptr_Response->); BLOB size:C605($_blb_Data))
			Else 
				DELAY PROCESS:C323(Current process:C322; 1)
			End if 
		End while 
		
		// Close the connection
		TCP Close($_l_Socket)
		
		// Strip the HTTP headers from the response
		$_t_Headers:=BLOB to text:C555($_ptr_Response->; Mac text without length:K22:10)
		$_l_CharacterPosition:=Position:C15($_t_CrLF+$_t_CrLF; $_t_Headers)
		If ($_l_CharacterPosition>0)
			$_l_Error:=0
			$_l_CharacterPosition:=$_l_CharacterPosition+4
			DELETE FROM BLOB:C560($_ptr_Response->; 0; $_l_CharacterPosition-1)
		End if 
		// Strip the Response header from the response
		$_t_Headers:=BLOB to text:C555($_ptr_Response->; Mac text without length:K22:10)
		$_l_CharacterPosition:=Position:C15($_t_CrLF+$_t_CrLF; $_t_Headers)
		If ($_l_CharacterPosition>0)
			$_l_Error:=0
			$_l_CharacterPosition:=$_l_CharacterPosition+4
			DELETE FROM BLOB:C560($_ptr_Response->; 0; $_l_CharacterPosition-1)
		End if 
	End if 
End if 
$0:=$_l_Error
ERR_MethodTrackerReturn("NTK_SendRequest"; $_t_oldMethodName)
