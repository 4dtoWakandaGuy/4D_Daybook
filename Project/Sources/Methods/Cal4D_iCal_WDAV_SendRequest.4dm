//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_SendRequest
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_WDAV_SendRequest
	
	// Send a HTTP request and get the response.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : Domain Name
	//   $ : Longint : Port Number
	//   $ : Text : Folder/Path
	//   $ : Text : HTTP Body
	//   $ : Text : HTTP Method
	//   $ : Text : HTTP Header 1
	//   $ : Text : HTTP Header 2
	//   $ : Text : HTTP Header 3
	
	// Returns: Nothing
	
	// Created by Julien Feasson, 4D, Inc.
	//   Method originally named WDAV_SendRequest.
	// Modified by Dave Batton on May 18, 2004
	//   Now sets 4D's Error variable rather than returning an error number.
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:29`Method: Cal4D_iCal_WDAV_SendRequest
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CAL_blb_iCalWDAVReceived; $_blb_WDAVBlobALL; $_blb_WDAVReceived; $_blb_WDAVSend)
	C_LONGINT:C283($_l_IgnoreError; $_l_WDAVSessionID; $2)
	C_REAL:C285($_l_WDAVdstposition; $_l_WDAVSrcPosition; $_l_WDAVState)
	C_TEXT:C284($_t_oldMethodName; $_t_WDAVHttpRequest; $1; $3; $4; $5; $6; $7; $8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_SendRequest")


Error:=TCP_Open($1; $2; $_l_WDAVSessionID; 0)

If (Error=0)
	// building the HTTP request
	$_t_WDAVHttpRequest:=$5+" "
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+$3
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+" HTTP/1.0"
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+"User-Agent: 4D WebDAV Client"
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+"Host: "+$1
	If ($2#80)
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+":"+String:C10($2)
	End if 
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	If ($6#"No")
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+$6
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	End if 
	If ($7#"No")
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+$7
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	End if 
	If ($8#"No")
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+$7
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
		$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	End if 
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+"Content-Length: "+String:C10(Length:C16($4))
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+$4
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Carriage return:K15:38)
	$_t_WDAVHttpRequest:=$_t_WDAVHttpRequest+Char:C90(Line feed:K15:40)
	
	TEXT TO BLOB:C554($_t_WDAVHttpRequest; $_blb_WDAVSend; Mac text without length:K22:10; *)
	
	Error:=TCP_SendBLOB($_l_WDAVSessionID; $_blb_WDAVSend)  // Send the request
	
	If (Error=0)
		
		Repeat   // Loop to retrieve the answer
			Error:=TCP_ReceiveBLOB($_l_WDAVSessionID; $_blb_WDAVReceived)
			$_l_IgnoreError:=TCP_State($_l_WDAVSessionID; $_l_WDAVState)
			$_l_WDAVSrcPosition:=0
			$_l_WDAVdstposition:=BLOB size:C605($_blb_WDAVBlobALL)
			//Concatenating received Blobs
			COPY BLOB:C558($_blb_WDAVReceived; $_blb_WDAVBlobALL; $_l_WDAVSrcPosition; $_l_WDAVdstposition; BLOB size:C605($_blb_WDAVReceived))
		Until (($_l_WDAVState=0) | (Error#0))
		// Blob received
		Error:=TCP_Close($_l_WDAVSessionID)
	Else 
		Error:=1010
	End if 
	<>CAL_blb_iCalWDAVReceived:=$_blb_WDAVBlobALL
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_SendRequest"; $_t_oldMethodName)