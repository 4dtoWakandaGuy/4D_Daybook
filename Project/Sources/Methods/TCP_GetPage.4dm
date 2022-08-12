//%attributes = {}
If (False:C215)
	//Project Method Name:      TCP_GetPage
	//------------------ Method Notes ------------------
	
	//Method:  TCP_GetPage
	//--------------------------------------------------------------------------------
	//$1 = Type (GET / POST)
	//$2 = Domain (E.g., www.apple.com)
	//$3 = Page (E.g., /aw/plistings/list/category365/index.html)
	//$4 = »BlobVar OR »TextVar
	//$5 = Referrer (may leave blank)
	//$6 = Field Data (for POST only, urlized)
	//$7 = Timeout
	//$8 = HTTP Header method - `0=do nothing, 1=strip it, 2=strip and set IWS_t_ResponseHeader using it
	
	// $0 = PageSize / ErrorCode (> 0 is page size, < 0 is error code)
	//--------------------------------------------------------------------------------
	//TCP_GetPage ("GET";"listings.ebay.com";"/aw/plistings/index.html";->xxTempBlob)
	
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Data)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Delay; $_bo_Done; $_bo_StartedReceiving)
	C_LONGINT:C283($_l_BytesReceived; $_l_BytesSend; $_l_CharPosition; $_l_Count; $_l_CountParameters; $_l_CurrentProcess; $_l_DataType; $_l_Delay; $_l_ErrorCode; $_l_HTTPHeaderMethod; $_l_MaxDelay)
	C_LONGINT:C283($_l_Port; $_l_PositionCRLF2; $_l_SendError; $_l_StartTicks; $_l_Status; $_l_StreamRef; $_l_TCPTotalErrors; $_l_TimeOut; $_l_TimoutOpen; $0; $7)
	C_LONGINT:C283($8)
	C_POINTER:C301($_ptr_Variable; $4)
	C_REAL:C285($_r_StartMilliseconds)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_CR; $_t_CRLF; $_t_Domain; $_t_DoubleCRLF; $_t_DoubleQuote; $_t_FieldData; $_t_HttpHeader; $_t_LF; $_t_oldMethodName)
	C_TEXT:C284($_t_Page; $_t_Port; $_t_Quote; $_t_ReceiveText; $_t_Referrer; $_t_SendText; $_t_Type; $1; $2; $3; $5)
	C_TEXT:C284($6; IWS_t_RemoteIPAddress; IWS_t_ResponseHeader)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TCP_GetPage")

$_t_DoubleQuote:=Char:C90(Double quote:K15:41)

$_t_Quote:=Char:C90(Quote:K15:44)
$_t_LF:=Char:C90(Line feed:K15:40)
$_t_CR:=Char:C90(Carriage return:K15:38)
$_t_CRLF:=$_t_CR+$_t_LF
$_l_CurrentProcess:=Current process:C322
$_t_crlf:=<>STR_t_CR+<>STR_t_LF
$_t_DoubleCRLF:=$_t_CRLF*2

$_l_CountParameters:=Count parameters:C259
$0:=-1  //General Error

$_bo_Done:=True:C214
$_l_StreamRef:=0
$_l_SendError:=0
$_l_TCPTotalErrors:=0
$_l_TimeOut:=90
$_l_HTTPHeaderMethod:=0

Case of 
	: ($_l_CountParameters<4)
		$0:=-2
		
	: (($1="GET") | ($1="POST"))
		$_t_Type:=$1
		$_t_Domain:=$2
		
		$_l_CharPosition:=Position:C15(":"; $_t_Domain)
		If ($_l_CharPosition>0)
			$_l_Port:=Num:C11(Substring:C12($_t_Domain; $_l_CharPosition+1))
			$_t_Domain:=Substring:C12($_t_Domain; 1; $_l_CharPosition-1)
		Else 
			$_l_Port:=80
		End if 
		
		$_t_Page:=$3
		$_ptr_Variable:=$4
		
		If ($_l_CountParameters>=5)
			$_t_Referrer:=$5  //May Leave Blank
			If ($_l_CountParameters>=6)
				$_t_FieldData:=$6  //Used Only For Type POST
				
				If ($_l_CountParameters>=7)
					$_l_TimeOut:=$7
					If ($_l_CountParameters>=8)
						$_l_HTTPHeaderMethod:=$8
					End if 
				End if 
				
			Else 
				$_t_FieldData:=""
			End if 
		Else 
			$_t_Referrer:=""
			$_t_FieldData:=""
		End if 
		$0:=-3  //Bad Parameter Data
		Case of 
			: (Type:C295($_ptr_Variable)#Is pointer:K8:14)
			: ((Type:C295($_ptr_Variable->)#Is text:K8:3) & (Type:C295($_ptr_Variable->)#Is BLOB:K8:12))
			: (($_t_Domain="") | ($_t_Page=""))
			: ($_t_Type="GET")
				$0:=0
			: (Length:C16($_t_FieldData)>2)
				$0:=0
		End case 
		
	Else 
		$0:=-99
End case 

$_l_TimoutOpen:=$_l_TimeOut/6

If ($0>=0)
	$_l_DataType:=Type:C295($_ptr_Variable->)
	If ($_l_DataType=Is BLOB:K8:12)
		SET BLOB SIZE:C606($_ptr_Variable->; 0)
	Else 
		$_ptr_Variable->:=""
	End if 
	
	$_t_SendText:=$_t_Type+" "+$_t_Page+" HTTP/1.0"+$_t_CRLF
	If ($_t_Referrer#"")
		$_t_SendText:=$_t_SendText+"Referer: "+$_t_Referrer+$_t_CRLF
	End if 
	//$_t_SendText:=$_t_SendText+"Connection: Keep-Alive"+$_t_CRLF
	$_t_SendText:=$_t_SendText+"User-Agent: Mozilla/4.74 (Macintosh; U; PPC)"+$_t_CRLF
	$_t_SendText:=$_t_SendText+"Host: "+$_t_Domain+$_t_CRLF
	$_t_SendText:=$_t_SendText+"Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*"+$_t_CRLF
	//$_t_SendText:=$_t_SendText+"Accept-Encoding: gzip"+$_t_CRLF
	$_t_SendText:=$_t_SendText+"Accept-Language: en"+$_t_CRLF
	$_t_SendText:=$_t_SendText+"Accept-Charset: iso-8859-1,*,utf-8"+$_t_CRLF
	If ($_t_Type="POST")
		$_t_SendText:=$_t_SendText+"Content-type: application/x-www-form-urlencoded"+$_t_CRLF
		$_t_SendText:=$_t_SendText+"Content-length: "+String:C10(Length:C16($_t_FieldData))+$_t_CRLF  //NOTE:  length is the field data length (excluding any CrLfs at the end)
		$_t_SendText:=$_t_SendText+$_t_CRLF
		$_t_SendText:=$_t_SendText+$_t_FieldData+$_t_CRLF
	End if 
	$_t_SendText:=$_t_SendText+$_t_CRLF
	
	
	If ($_l_DataType=Is BLOB:K8:12)
		
		$_l_StartTicks:=Tickcount:C458
		
		// Convert the headers to a blob
		TEXT TO BLOB:C554($_t_SendText; $_blb_Data; Mac text without length:K22:10)
		
		// Set the timeout and open a connection
		$_l_StreamRef:=TCP Open($_t_Domain; $_l_Port; "connect-timeout=3 select-timeout=0.5")
		
		// If we have a connection
		If ($_l_StreamRef#0)
			
			// Send the request
			$_l_BytesSend:=TCP Send Blob($_l_StreamRef; $_blb_Data)
			
			// Get the response (wait until the connection is closed)
			While ((TCP Get State($_l_StreamRef)#TCP Connection Closed) & (((Tickcount:C458-$_l_StartTicks)/60)<=$_l_TimeOut))
				If (TCP Receive Blob($_l_StreamRef; $_blb_Data)>0)
					COPY BLOB:C558($_blb_Data; $_ptr_Variable->; 0; BLOB size:C605($_ptr_Variable->); BLOB size:C605($_blb_Data))
				Else 
					DELAY PROCESS:C323(Current process:C322; 1)
				End if 
			End while 
			
			// Close the connection
			TCP Close($_l_StreamRef)
			
			// Strip the HTTP headers from the response
			If ($_l_HTTPHeaderMethod>0)
				$_t_ReceiveText:=BLOB to text:C555($_ptr_Variable->; Mac text without length:K22:10)
				$_l_PositionCRLF2:=Position:C15($_t_DoubleCRLF; $_t_ReceiveText)
				If ($_l_PositionCRLF2>0)
					$_t_HttpHeader:=Substring:C12($_t_ReceiveText; 1; $_l_PositionCRLF2+3)
					If ($_l_HTTPHeaderMethod=2)
						IWS_t_ResponseHeader:=$_t_HttpHeader
						If (Position:C15("X-Forwarder-For"; $_t_HttpHeader)<1)
							IWS_AddToResponseHeader("X-Forwarder-For"; IWS_t_RemoteIPAddress)
						End if 
					End if 
					$_l_PositionCRLF2:=$_l_PositionCRLF2+4
					DELETE FROM BLOB:C560($_ptr_Variable->; 0; $_l_PositionCRLF2-1)
				End if 
			End if 
			
			$0:=BLOB size:C605($_ptr_Variable->)
			
		End if 
		
	Else 
		Repeat 
			
			$_r_StartMilliseconds:=0  //Milliseconds
			$_l_Delay:=1
			$_l_MaxDelay:=0
			$_l_StreamRef:=TCP Open($_t_Domain; $_l_Port; "select-timeout=0")
			$_l_Status:=TCP Get State($_l_StreamRef)
			
			
			If ($_l_Status=TCP Connection Established)
				
				
				
				$_t_ReceiveText:=""
				$_l_BytesReceived:=0
				$_bo_Continue:=True:C214
				$_l_StartTicks:=Tickcount:C458
				
				$_l_BytesSend:=TCP Send($_l_StreamRef; $_t_SendText)
				
				$_l_Count:=0
				$_l_Delay:=0  //start it at 1.5 .seconds, then reduce when start receiving?
				$_bo_StartedReceiving:=False:C215
				
				While (($_l_SendError>=0) & ($_bo_Continue))
					
					$_t_ReceiveText:=""
					$_l_BytesReceived:=0
					$_l_BytesReceived:=TCP Receive($_l_StreamRef; $_t_ReceiveText)  //;32000)
					$_l_Status:=TCP Get State($_l_StreamRef)
					
					Case of 
							
						: ($_l_Status=TCP Connection Closed)
							$_bo_Continue:=False:C215
							
						: (((Tickcount:C458-$_l_StartTicks)/60)>$_l_TimeOut)
							$_l_Count:=$_l_Count+1
							If (($_t_ReceiveText="") | ($_l_Count>5))  //allow to continue for a while if receiving data
								$_bo_Continue:=False:C215
								$0:=-10  //Timeout
							End if 
							
						: ($_l_Delay>180)
							//stop increasing once has reached 3 seconds
							
						: ($_bo_StartedReceiving=False:C215)
							//$_l_Delay:=$_l_Delay+10
							
					End case 
					
					If ($_t_ReceiveText#"")
						$_bo_StartedReceiving:=True:C214
						//$_l_Delay:=5
						
						If ($_l_HTTPHeaderMethod>0)
							$_l_PositionCRLF2:=Position:C15($_t_DoubleCRLF; $_t_ReceiveText)
							If ($_l_PositionCRLF2>0)
								$_t_HttpHeader:=Substring:C12($_t_ReceiveText; 1; $_l_PositionCRLF2+3)
								If ($_l_HTTPHeaderMethod=2)
									IWS_t_ResponseHeader:=$_t_HttpHeader
									If (Position:C15("X-Forwarder-For"; $_t_HttpHeader)<1)
										IWS_AddToResponseHeader("X-Forwarder-For"; IWS_t_RemoteIPAddress)
									End if 
								End if 
								$_t_ReceiveText:=Substring:C12($_t_ReceiveText; $_l_PositionCRLF2+4)
								$_l_HTTPHeaderMethod:=0
							End if 
						End if 
						
						If ($_l_DataType=Is BLOB:K8:12)
							TEXT TO BLOB:C554($_t_ReceiveText; $_ptr_Variable->; Mac text without length:K22:10; *)  //v11 Mac text without length
						Else 
							If ((Length:C16($_ptr_Variable->)+Length:C16($_t_ReceiveText))<=32000)
								$_ptr_Variable->:=$_ptr_Variable->+Replace string:C233(Replace string:C233($_t_ReceiveText; $_t_CRLF; $_t_CR); $_t_LF; $_t_CR)
							Else 
								$_ptr_Variable->:=$_ptr_Variable->+Replace string:C233(Replace string:C233(Substring:C12($_t_ReceiveText; 1; (32000-Length:C16($_ptr_Variable->))); $_t_CRLF; $_t_CR); $_t_LF; $_t_CR)
								$_bo_Continue:=False:C215
							End if 
						End if 
						$_t_ReceiveText:=""
						
					End if 
					
					If ($_bo_Continue)
						DELAY PROCESS:C323($_l_CurrentProcess; $_l_Delay)
						//LOG This ("Delay2="+String($_l_Delay))
					End if 
					
					IDLE:C311
					
				End while 
				
				TCP Close($_l_StreamRef)
				
				If ($0>=0)
					If ($_l_DataType=Is BLOB:K8:12)
						$0:=BLOB size:C605($_ptr_Variable->)
					Else 
						$0:=Length:C16($_ptr_Variable->)
					End if 
				End if 
				
			End if 
			
			If (($_l_StreamRef<=0) | ($_l_SendError<0))
				$_bo_Delay:=False:C215
				$_l_TCPTotalErrors:=$_l_TCPTotalErrors+1
			End if 
			
		Until ($_bo_Done)
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("TCP_GetPage"; $_t_oldMethodName)
