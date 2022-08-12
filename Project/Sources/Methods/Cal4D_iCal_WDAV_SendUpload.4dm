//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_SendUpload
	//------------------ Method Notes ------------------
	// Method: WDAV_SendUpload
	//---------------------------------------------------
	// Description:
	// Upload a document by
	// Sending the HTTP request and geting the response
	//
	//---------------------------------------------------
	// Parameters:
	// $0 - Error code or 0
	// $1 - DomainName
	// $2 - PortNumber
	// $3 - Folder/Path
	// $4 - Blob to be uploaded
	// $5 - HTTP Method
	// $6 - HTTP Header 1
	// $7 - HTTP Header 2
	// $8 - HTTP Header 3
	//---------------------------------------------------
	// By: Julien Feasson - 4D, Inc.
	//---------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:29`Method: Cal4D_iCal_WDAV_SendUpload
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CAL_blb_iCalWDAVReceived; $_blb_AllReceivedPackets; $_blb_HttpRequest; $_blb_OneReceivedPacket; $4)
	C_LONGINT:C283($_l_DestinationPosition; $_l_Error; $_l_SessionID; $_l_SourcePosition; $_l_TcpState; $0; $2)
	C_TEXT:C284($_t_HttpRequest; $_t_oldMethodName; $1; $3; $5; $6; $7; $8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_SendUpload")

$_l_Error:=0

$_l_Error:=TCP_Open($1; $2; $_l_SessionID; 0)

If ($_l_Error=0)
	// building the HTTP request
	$_t_HttpRequest:=$5+" "
	$_t_HttpRequest:=$_t_HttpRequest+$3
	$_t_HttpRequest:=$_t_HttpRequest+" HTTP/1.0"+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	$_t_HttpRequest:=$_t_HttpRequest+"User-Agent: 4D WebDAV Client a1"+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	$_t_HttpRequest:=$_t_HttpRequest+"Host: "+$1
	If ($2#80)
		$_t_HttpRequest:=$_t_HttpRequest+":"+String:C10($2)
	End if 
	$_t_HttpRequest:=$_t_HttpRequest+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	If ($6#"No")
		$_t_HttpRequest:=$_t_HttpRequest+$6+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	End if 
	If ($7#"No")
		$_t_HttpRequest:=$_t_HttpRequest+$7+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	End if 
	If ($8#"No")
		$_t_HttpRequest:=$_t_HttpRequest+$7+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	End if 
	$_t_HttpRequest:=$_t_HttpRequest+"Content-Length: "+String:C10(BLOB size:C605($4))+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
	
	TEXT TO BLOB:C554($_t_HttpRequest; $_blb_HttpRequest; Mac text without length:K22:10; *)
	COPY BLOB:C558($4; $_blb_HttpRequest; 0; BLOB size:C605($_blb_HttpRequest); BLOB size:C605($4))
	
	$_l_Error:=TCP_SendBLOB($_l_SessionID; $_blb_HttpRequest)  // Send the request
	
	If ($_l_Error=0)
		Repeat   // Loop to retrieve the answer
			$_l_Error:=TCP_ReceiveBLOB($_l_SessionID; $_blb_OneReceivedPacket)
			$_l_Error:=TCP_State($_l_SessionID; $_l_TcpState)
			$_l_SourcePosition:=0
			$_l_DestinationPosition:=BLOB size:C605($_blb_AllReceivedPackets)
			//Concatenating received Blobs
			COPY BLOB:C558($_blb_OneReceivedPacket; $_blb_AllReceivedPackets; $_l_SourcePosition; $_l_DestinationPosition; BLOB size:C605($_blb_OneReceivedPacket))
		Until (($_l_TcpState=0) | ($_l_Error#0))
		// Blob received
		$_l_Error:=TCP_Close($_l_SessionID)
	Else 
		$_l_Error:=1010
	End if 
	<>CAL_blb_iCalWDAVReceived:=$_blb_AllReceivedPackets
Else 
	//ALERT("TCP connection failed: "+String($_l_Error))
End if 

$0:=$_l_Error
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_SendUpload"; $_t_oldMethodName)