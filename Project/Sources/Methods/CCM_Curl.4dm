//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_Curl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2009 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_All; $_blb_Help; $_blb_Received; $_blb_Send)
	C_BOOLEAN:C305($_bo_Follow; $_bo_FollowRedirect; $8)
	C_LONGINT:C283($_l_binOffset; $_l_BlobOffset; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_ChunkSIze; $_l_DestBlobOffset; $_l_DestPosition; $_l_EncodeIndex; $_l_Error; $_l_FollowNB; $_l_Index)
	C_LONGINT:C283($_l_Length; $_l_offset; $_l_Offset2; $_l_PositionOffset; $_l_ResultPosition; $_l_SessionID; $_l_SessionState; $_l_Shift; $_l_SrcPosition; $_l_SSL; $_l_ThisCharacterNumber)
	C_LONGINT:C283($_l_ThisCharacterNumberMod16; $_l_ThisCharacterPosition; $_l_TimeOut; $7)
	C_PICTURE:C286($_pic_HelpPicture)
	C_POINTER:C301($_ptr_Result; $2)
	C_TEXT:C284($_l_DomainPort; $_t_ChunkSizeB16; $_t_Cookie; $_t_Cookie2; $_t_CR; $_t_DomainFolder; $_t_DomainName; $_t_DomainName2; $_t_ErrorCode; $_t_ErrorText; $_t_Function)
	C_TEXT:C284($_t_HeaderURL; $_t_HTTPRequest; $_t_HTTPResponse; $_t_LF; $_t_oldMethodName; $_t_Post; $_t_Referer; $_t_Response; $_t_Result; $_t_TextFragment; $_t_ThisCharacter)
	C_TEXT:C284($_t_Title; $_t_URL; $_t_URLEncodeString; $_t_URLNew; $0; $1; $3; $4; $5; $6)
	C_TIME:C306($_ti_Timer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_Curl")

//  $_t_Result= CCM_Curl ($_t_Function;$_ptr_Result;$_t_URL;$_t_Referer;$_t_Cookie;$_t_Post;$_ti_Timer;$dontFollowRedirect)
//  needs 4D v11 SQL Release 2 or newer and 4D Internet Commands

// allows HTTP Download, as blob (raw), text (first 32k), or picture (Mac picture)

//  example for usage
//  $_t_Result:=CCM_Curl("Picture";->[Logos]Bildfeld;"http://www.test.com/mypict.jpg")

//  $_t_Result:=CCM_Curl("blob";->$myblob;"http://www.test.com/song.mp3")
//  BLOB TO DOCUMENT("mysong.mp3";$myblob)  ` Note: original name of file is contained in HTTP Header

// $_t_Result:=CCM_Curl("text";->$mytext;"127.0.0.1:8080/4DAction/test")

// $_t_Result contains by correct calls the HTTP Header in form
// "HTTP/1.x 200 OK....."
// or "HTTP/1.x 404....."  = page not found. Look for "@200 OK@"
// the HTTP Header contains other useable info like Cookies
// in addition to a HTTP header it may contain error messages with these text:
// CCM_Curl - Error: URL required       `  3 Parameter are minimum, wrong call
// CCM_Curl - Error: Wrong result type, blob expected     `  Call with Parameter 1 = blob, Pointer is not a Blob
// CCM_Curl - Error: Wrong result type, picture expected     `  Call with Parameter 1 = picture, Pointer is not a Picture
// CCM_Curl - Error: Wrong result type, text expected     `  Call with Parameter 1 = text, Pointer is not a Text
// CCM_Curl - Error: HTTP Request not sent, please check the URL     `  TCP Connection not possible
// CCM_Curl - Error: Connection failed   `  TCP Open not possible

// the First_Parameter defines the return type (Text, Picture or Blob)
// Parameter 2 is a pointer to a variable of these typ, it can be a local variable
// Parameter 3 is the URL, should start with http:// or https://,  http:// is automatically added if missing

//the other parameters are optional
// Parameter 4 is referer, which is required from some web page. Usualy the previous URL. Only send to HTTP server if # ""
// Parameter 5 contains cookies. Only send if # ""
// Example: "Cookie: 4D-font=sizemediumtext; ID=5"
// or "4D-font=sizemediumtext; ID=5"  - in this case the routine automatically add "Cookie: "
// Cookies are automatically handled for HTTP Redirects, like needed for Amazon. If the server set's a cookie in the HTTP Redirect it is read and send for the
// next URL request. The final cookie can be read from the HTTP Header
// Parameter 6 contains values for Post. If passed the HTTP Download is send as POST, not as GET. Parameters are passed as  x-www-form-urlencoded
// if value starts with "Content-Type" the whole content is passed through without modification, this allows the usage of other codings.
// Parameter 7 allows to set a timeout, maximal wait for an answer. Default value = 30 seconds.
// Parameter 8 (Boolean) allows to disable the automatic following from redirects (HTTP 301, 302, 307). Pass FALSE to disable. Default is TRUE.
// außer Wert beginnt direkt mit "Content-Type", dann wird der gesamte Inhalt einfach durchgereicht, das erlaubt andere Codierungen

// Usage in 4D versions older than 2004.1 not possible, this method use pointer on local variables
// the method does not use any global variables or other methods, it works recursiv. This allows to put all code in one single method
// single methods as this are complex and difficult to debug - creating such complex methods is normally not a good idea.
// in this case it contains well debugged code and allows easy installation
// a simple copy&paste allows to add the full functionality.

// Thomas Maul, 4D Deutschland, 5.7.05 - code based on TN 2002-05, Julien Feasson and Frank Chang
// last modified February 2009 (minor issue, wrong HTML character in published code)

$_t_Referer:=""
$_t_Cookie:=""
$_t_Post:=""
$_l_TimeOut:=30
$_bo_FollowRedirect:=True:C214

// internal variables


If (Count parameters:C259<3)  //  3 parameter is minimum
	$_t_ErrorText:="CCM_Curl - Error: URL requiered"
Else 
	$_t_Function:=$1
	$_ptr_Result:=$2
	$_t_URL:=$3
	If (Count parameters:C259>3)
		$_t_Referer:=$4
	End if 
	If (Count parameters:C259>4)
		$_t_Cookie:=$5
	End if 
	If (Count parameters:C259>5)
		$_t_Post:=$6
	End if 
	If (Count parameters:C259>6)
		$_l_TimeOut:=$7
	End if 
	If (Count parameters:C259>7)
		$_bo_FollowRedirect:=$8
	End if 
	
	$_t_ErrorText:=""
	Case of 
		: ($_t_Function="Blob")
			If (Type:C295($_ptr_Result->)=Is BLOB:K8:12)
				$_t_DomainName:=""
				$_l_DomainPort:=""
				$_t_DomainFolder:=""
				$_t_ErrorText:=CCM_Curl("URL_SendRequest"; $_ptr_Result; $_t_URL; $_t_Referer; $_t_Cookie; $_t_Post; $_l_TimeOut; $_bo_FollowRedirect)
			Else 
				$_t_ErrorText:="CCM_Curl - Error: Wrong result type, blob expected"
			End if 
			
		: ($_t_Function="Text")
			If (Type:C295($_ptr_Result->)=Is text:K8:3)
				$_t_ErrorText:=CCM_Curl("Blob"; ->$_blb_Help; $_t_URL; $_t_Referer; $_t_Cookie; $_t_Post; $_l_TimeOut; $_bo_FollowRedirect)
				If (Get database parameter:C643(Unicode mode:K37:40)=0)
					$_ptr_Result->:=BLOB to text:C555($_blb_Help; Mac text without length:K22:10)
				Else 
					$_ptr_Result->:=Convert to text:C1012($_blb_Help; "ISO-8859-1")
				End if 
				
			Else 
				$_t_ErrorText:="CCM_Curl - Error: Wrong result type, text expected"
			End if 
			
		: ($_t_Function="Picture")
			$_ptr_Result->:=$_pic_HelpPicture
			If (Type:C295($_ptr_Result->)=Is picture:K8:10)
				$_t_ErrorText:=CCM_Curl("Blob"; ->$_blb_Help; $_t_URL; $_t_Referer; $_t_Cookie; $_t_Post; $_l_TimeOut; $_bo_FollowRedirect)
				If ($_t_ErrorText="HTTP@")
					BLOB TO PICTURE:C682($_blb_Help; $_ptr_Result->)
				End if 
			Else 
				$_t_ErrorText:="CCM_Curl - Error: Wrong result type, picture expected"
			End if 
			
			
			//   ******  the following routine may be useful if you need to encode your URL
			// example:  "www.test.com/my method"  contains a blank, so needs to be converted to "www.test.com/my%20method"
			// call it like CCM_Curl("URL_Encoder";->$encodedurl;$_t_URL)
			
		: ($_t_Function="URL_Encoder")  // encodes umlauts, blanks and other special chars in an URL
			$_t_Result:=""
			$_t_URLEncodeString:=$_t_URL
			
			// If the charset is different than Latin-1 please add your translation below
			// Parse the string and translate the special characters
			For ($_l_EncodeIndex; 1; Length:C16($_t_URLEncodeString))
				$_t_ThisCharacter:=Substring:C12($_t_URLEncodeString; $_l_EncodeIndex; 1)
				//unicode test
				$_l_ThisCharacterNumber:=Character code:C91($_t_ThisCharacter)
				//unicode test
				If ((($_l_ThisCharacterNumber>=Character code:C91("a'")) & ($_l_ThisCharacterNumber<=Character code:C91("z'"))) | (($_l_ThisCharacterNumber>=Character code:C91("A")) & ($_l_ThisCharacterNumber<=Character code:C91("Z"))) | (($_l_ThisCharacterNumber>=Character code:C91("0")) & ($_l_ThisCharacterNumber<=Character code:C91("9"))) | ($_t_ThisCharacter="*") | ($_t_ThisCharacter="-") | ($_t_ThisCharacter=".") | ($_t_ThisCharacter="_") | ($_t_ThisCharacter="/"))
					$_t_Result:=$_t_Result+$_t_ThisCharacter
				Else 
					$_t_Result:=$_t_Result+"%"
					//unicode test
					$_l_ThisCharacterNumberMod16:=Character code:C91($_t_ThisCharacter)\16
					If ($_l_ThisCharacterNumberMod16<10)
						$_t_Result:=$_t_Result+String:C10($_l_ThisCharacterNumberMod16)
					Else 
						$_t_Result:=$_t_Result+Char:C90(Character code:C91("A")+$_l_ThisCharacterNumberMod16-10)
					End if 
					$_l_ThisCharacterNumberMod16:=Character code:C91($_t_ThisCharacter)%16
					If ($_l_ThisCharacterNumberMod16<10)
						$_t_Result:=$_t_Result+String:C10($_l_ThisCharacterNumberMod16)
					Else 
						$_t_Result:=$_t_Result+Char:C90(Character code:C91("A")+$_l_ThisCharacterNumberMod16-10)
					End if 
				End if 
			End for 
			$_ptr_Result->:=$_t_Result
			
			
			//   ******  the following routine may be useful if you need to extract the cookies from the header
			// call it like HTTPHeader:=CCM_Curl ("text";->TextResult;"http://www.amazon.com/")
			// $_t_Result:=CCM_Curl ("Get_Cookie";->HTTPCookies;HTTPHeader;char(13))
			// Use Parameter 4 to delimit the cookies. Use char(13) if you want to read it - or ", " if you want to use it later for the next call
			
		: ($_t_Function="Get_Cookie")
			If ($_t_Referer="")
				$_t_Referer:=", "
			End if 
			$_t_Cookie:=""
			$_t_HeaderURL:=$_t_URL
			$_t_Title:="Set-Cookie: "
			//UNICODE TEST
			$_l_CharacterPosition:=Position:C15($_t_Title; $_t_HeaderURL; *)
			While ($_l_CharacterPosition>0)
				$_t_HeaderURL:=Substring:C12($_t_HeaderURL; $_l_CharacterPosition+Length:C16($_t_Title))
				//UNICODE TEST
				$_l_CharacterPosition2:=Position:C15(Char:C90(13)+Char:C90(10); $_t_HeaderURL; *)
				If ($_l_CharacterPosition2>0)
					$_t_Cookie2:=Substring:C12($_t_HeaderURL; 1; $_l_CharacterPosition2-1)
					$_t_HeaderURL:=Substring:C12($_t_HeaderURL; $_l_CharacterPosition2+2)
					$_l_CharacterPosition:=Position:C15($_t_Title; $_t_HeaderURL)
				Else 
					$_t_Cookie2:=$_t_HeaderURL
					$_l_CharacterPosition:=0
				End if 
				If ($_t_Cookie="")
					$_t_Cookie:=$_t_Cookie2
				Else 
					$_t_Cookie:=$_t_Cookie+$_t_Referer+$_t_Cookie2
				End if 
			End while 
			$_ptr_Result->:=$_t_Cookie
			
			
			//   ******  the following routine may be useful if you need to extract the name of a downloaded file
			// sometimes the HTTP Header contains a useable file name
			// if not  we can use at least the end of the URL, which should be the file name
			// call it like this
			// $_t_URL:="http://www.test.com/song.mp3"
			// $HTTPHeader:=CCM_Curl("blob";->$myblob;$_t_URL)
			// $_t_Filename:=CCM_Curl ("Filename";->$HTTPHeader;$_t_URL)
			// note that you need to pass both HTTPHeader and used URL. Routine tries to find the file name in the header and use URL only if no file name is found
		: ($_t_Function="File_name")
			//UNICODE TEST
			$_l_CharacterPosition:=Position:C15("name=\""; $_ptr_Result->; *)
			If ($_l_CharacterPosition>0)
				$_t_Result:=Substring:C12($_ptr_Result->; $_l_CharacterPosition)
				//UNICODE TEST
				$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Result; *)
				If ($_l_CharacterPosition>0)
					$_t_ErrorText:=Substring:C12($_t_Result; 1; $_l_CharacterPosition)  //  $_t_ErrorText is returned as $0
				Else 
					$_t_ErrorText:=$_t_Result
				End if 
			Else 
				// find last /
				$_l_Length:=Length:C16($_t_URL)
				$_l_CharacterPosition:=0
				For ($_l_Index; $_l_Length; 1; -1)
					If ($_t_URL[[$_l_Index]]="/")
						$_l_CharacterPosition:=$_l_Index
						$_l_Index:=0
					End if 
				End for 
				If ($_l_CharacterPosition>0)
					$_t_ErrorText:=Substring:C12($_t_URL; $_l_CharacterPosition+1)
				Else 
					$_t_ErrorText:=$_t_URL
				End if 
			End if 
			
			
			
			//   ******  the following parts are internal commands. The method calls itself to avoid needing additional methods
			// this makes it easier to install the method, only one is needed
			// long methods are no problem anymore (starting with 2003), modern computers have enough memory
			
		: ($_t_Function="URL_Parse_@")  // parses the URL and returns the Domain name, Port or Folder as target
			$_t_DomainName:=""
			$_l_DomainPort:=""
			$_t_DomainFolder:=""
			//Check if the user specified the protocol http
			Case of 
				: (Substring:C12($_t_URL; 0; 7)="http://")
					$_l_Shift:=8
				: (Substring:C12($_t_URL; 0; 8)="https://")
					$_l_Shift:=9
				Else 
					$_l_Shift:=1
			End case 
			//Retrieve the domainname and the portnumber
			//UNICODE TEST
			If ((Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)#0) & (Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)<Position:C15("/"; Substring:C12($_t_URL; $_l_Shift); *)))
				$_t_DomainName:=Substring:C12($_t_URL; $_l_Shift; Position:C15(":"; Substring:C12($_t_URL; $_l_Shift))-1)
				If (Position:C15("/"; Substring:C12($_t_URL; $_l_Shift); *)#0)
					$_l_DomainPort:=String:C10(Num:C11(Substring:C12($_t_URL; Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)+$_l_Shift; Position:C15("/"; Substring:C12($_t_URL; $_l_Shift); *)-Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)-1)))
				Else 
					$_l_DomainPort:=String:C10(Num:C11(Substring:C12($_t_URL; Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)+$_l_Shift; $_l_Shift-Position:C15(":"; Substring:C12($_t_URL; $_l_Shift); *)-1)))
				End if 
			Else 
				If (Position:C15("/"; Substring:C12($_t_URL; $_l_Shift))#0)
					$_t_DomainName:=Substring:C12($_t_URL; $_l_Shift; Position:C15("/"; Substring:C12($_t_URL; $_l_Shift); *)-1)
				Else 
					$_t_DomainName:=Substring:C12($_t_URL; $_l_Shift)
				End if 
				If ($_t_URL="https@")
					$_l_DomainPort:="443"
				Else 
					$_l_DomainPort:="80"
				End if 
			End if 
			If (Position:C15("/"; $_t_URL)#0)
				$_t_URL:=Substring:C12($_t_URL; $_l_Shift)
				$_t_DomainFolder:=Substring:C12($_t_URL; Position:C15("/"; $_t_URL; *))
			Else 
				$_t_DomainFolder:="/"
			End if 
			Case of 
				: ($_t_Function="URL_Parse_Domain")
					$_ptr_Result->:=$_t_DomainName
				: ($_t_Function="URL_Parse_Port")
					$_ptr_Result->:=$_l_DomainPort
				: ($_t_Function="URL_Parse_Folder")
					$_ptr_Result->:=$_t_DomainFolder
				Else 
					$_ptr_Result->:="error"
			End case 
			
		: ($_t_Function="URL_SendRequest")  // does the real job - finally...
			$_t_CR:=Char:C90(Carriage return:K15:38)
			$_t_LF:=Char:C90(Line feed:K15:40)
			$_bo_Follow:=True:C214
			$_l_FollowNB:=0
			$_t_HTTPResponse:=""
			CCM_Curl("URL_Parse_Domain"; ->$_t_DomainName; $_t_URL)  // it is not nice to call it 3 times, but this avoids that we need more methods or more parameter
			CCM_Curl("URL_Parse_Port"; ->$_l_DomainPort; $_t_URL)
			CCM_Curl("URL_Parse_Folder"; ->$_t_DomainFolder; $_t_URL)
			
			While (($_bo_Follow) & ($_l_FollowNB<4))
				$_bo_Follow:=False:C215
				$_l_FollowNB:=$_l_FollowNB+1
				If ($_t_Post="")
					$_t_HTTPRequest:="GET "
				Else 
					$_t_HTTPRequest:="POST "
				End if 
				$_t_HTTPRequest:=$_t_HTTPRequest+$_t_DomainFolder
				$_t_HTTPRequest:=$_t_HTTPRequest+" HTTP/1.1"+$_t_CR+$_t_LF
				$_t_HTTPRequest:=$_t_HTTPRequest+"User-Agent: "+"4D_HTTP-Client"+$_t_CR+$_t_LF
				$_t_HTTPRequest:=$_t_HTTPRequest+"Host: "+$_t_DomainName
				If (Num:C11($_l_DomainPort)#80)
					$_t_HTTPRequest:=$_t_HTTPRequest+":"+$_l_DomainPort
				End if 
				$_t_HTTPRequest:=$_t_HTTPRequest+$_t_CR+$_t_LF
				$_t_HTTPRequest:=$_t_HTTPRequest+"Connection: "+"Close"+$_t_CR+$_t_LF
				If ($_t_Cookie#"")
					If ($_t_Cookie="Cookie@")  // Post contains already header and prepared data, simply pass it through
						$_t_HTTPRequest:=$_t_HTTPRequest+$_t_Cookie+$_t_CR+$_t_LF
					Else 
						$_t_HTTPRequest:=$_t_HTTPRequest+"Cookie: "+$_t_Cookie+$_t_CR+$_t_LF
					End if 
				End if 
				If ($_t_Post#"")
					If ($_t_Post="Content-Type@")  // Post contains already header and prepared data, simply pass it through
						$_t_HTTPRequest:=$_t_HTTPRequest+$_t_Post
					Else 
						$_t_HTTPRequest:=$_t_HTTPRequest+"Content-type: application/x-www-form-urlencoded"+$_t_CR+$_t_LF
						$_t_HTTPRequest:=$_t_HTTPRequest+"Content-length: "+String:C10(Length:C16($_t_Post))
						$_t_HTTPRequest:=$_t_HTTPRequest+$_t_CR+$_t_LF+$_t_CR+$_t_LF
						$_t_HTTPRequest:=$_t_HTTPRequest+$_t_Post
					End if 
				End if 
				$_t_HTTPRequest:=$_t_HTTPRequest+$_t_CR+$_t_LF
				
				If ($_l_DomainPort="443")
					$_l_SSL:=2
				Else 
					$_l_SSL:=0
				End if 
				$_l_Error:=TCP_Open($_t_DomainName; Num:C11($_l_DomainPort); $_l_SessionID; $_l_SSL)
				If ($_l_Error=0)
					SET BLOB SIZE:C606($_blb_Send; 0)
					TEXT TO BLOB:C554($_t_HTTPRequest; $_blb_Send; Mac text without length:K22:10; *)
					$_l_Error:=TCP_SendBLOB($_l_SessionID; $_blb_Send)  // Send the request
					SET BLOB SIZE:C606($_blb_All; 0)
					If ($_l_Error=0)
						$_ti_Timer:=Current time:C178+$_l_TimeOut
						Repeat   // Loop to retrieve the answer
							$_l_Error:=TCP_ReceiveBLOB($_l_SessionID; $_blb_Received)
							$_l_Error:=TCP_State($_l_SessionID; $_l_SessionState)
							$_l_SrcPosition:=0
							If (BLOB size:C605($_blb_Received)#0)
								$_ti_Timer:=Current time:C178+$_l_TimeOut  // reset timer
							End if 
							$_l_DestPosition:=BLOB size:C605($_blb_All)
							//Concatenating received Blobs
							COPY BLOB:C558($_blb_Received; $_blb_All; $_l_SrcPosition; $_l_DestPosition; BLOB size:C605($_blb_Received))
						Until (($_l_SessionState=0) | ($_l_Error#0) | (Current time:C178>$_ti_Timer))
						// Blob received
						$_l_Error:=TCP_Close($_l_SessionID)
						$_t_Response:=BLOB to text:C555($_blb_All; Mac text without length:K22:10)
						//UNICODE TEST
						$_t_ErrorCode:=Substring:C12($_t_Response; Position:C15("HTTP/1."; $_t_Response; *)+9; 3)
						If ((($_t_ErrorCode="302") | ($_t_ErrorCode="301") | ($_t_ErrorCode="307")) & $_bo_FollowRedirect)  // forwarding
							// Cookie Management
							$_t_Cookie:=""
							$_l_CharacterPosition:=Position:C15(Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10); $_t_Response; *)
							If ($_l_CharacterPosition>0)
								$_t_HeaderURL:=Substring:C12($_t_Response; 1; $_l_CharacterPosition)
								$_t_Result:=CCM_Curl("Get_Cookie"; ->$_t_Cookie; $_t_HeaderURL; ", ")
							End if 
							
							$_bo_Follow:=True:C214
							//UNICODE TEST
							$_t_URLNew:=Substring:C12($_t_Response; Position:C15("Location: "; $_t_Response)+10; Position:C15($_t_CR; Substring:C12($_t_Response; Position:C15("Location: "; $_t_Response)+10))-1)
							CCM_Curl("URL_Parse_Domain"; ->$_t_DomainName2; $_t_URLNew)  // it is not nice to call it 3 times, but this avoids that we need more methods or more parameter
							CCM_Curl("URL_Parse_Port"; ->$_l_DomainPort; $_t_URLNew)
							CCM_Curl("URL_Parse_Folder"; ->$_t_DomainFolder; $_t_URLNew)
							If ($_t_DomainName2#"")
								$_t_DomainName:=$_t_DomainName2
							End if 
						End if 
					Else 
						$_t_ErrorText:="CCM_Curl - Error: HTTP Request not sent, please check the URL"
					End if 
				Else 
					$_t_ErrorText:="CCM_Curl - Error: Connection failed"
				End if 
			End while 
			$_ptr_Result->:=$_blb_All
			//UNICODE TEST
			$_l_CharacterPosition:=Position:C15(Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10); $_t_Response; *)
			If ($_l_CharacterPosition>0)
				If ($_t_ErrorText="")
					$_t_ErrorText:=Substring:C12($_t_Response; 1; $_l_CharacterPosition)
					DELETE FROM BLOB:C560($_ptr_Result->; 0; $_l_CharacterPosition+3)
					//UNICODE TEST
					If (Position:C15("Transfer-Encoding: chunked"; $_t_ErrorText; *)>0)
						If (False:C215)
							BLOB TO DOCUMENT:C526("resultblob.txt"; $_ptr_Result->)
						End if 
						CCM_Curl("Chunk"; $_ptr_Result; "")
					End if 
				End if 
			End if 
			
			
		: ($_t_Function="Chunk")  // remove chunk
			$_t_CR:=Char:C90(Carriage return:K15:38)
			$_t_LF:=Char:C90(Line feed:K15:40)
			
			If (Type:C295($_ptr_Result->)=Is BLOB:K8:12)
				$_l_DestBlobOffset:=0
				SET BLOB SIZE:C606($_blb_Help; $_l_DestBlobOffset)
				$_t_ChunkSizeB16:="-1"
				$_t_Result:=""
				While ((($_t_ChunkSizeB16#"0") & ($_t_ChunkSizeB16#($_t_LF+"0"))) & ($_t_ChunkSizeB16#""))
					$_l_CharacterPosition:=Num:C11(CCM_Curl("Position_Blob"; $_ptr_Result; $_t_CR+$_t_LF))
					$_l_BlobOffset:=0
					$_t_ChunkSizeB16:=BLOB to text:C555($_ptr_Result->; Mac text without length:K22:10; $_l_BlobOffset; $_l_CharacterPosition-1)
					$_t_ErrorText:=CCM_Curl("HexToDec"; ->$_t_Response; $_t_ChunkSizeB16)
					$_l_ChunkSIze:=Num:C11($_t_Response)
					COPY BLOB:C558($_ptr_Result->; $_blb_Help; $_l_CharacterPosition+1; $_l_DestBlobOffset; $_l_ChunkSIze)  // TM 2007-02-19, chunk starts 1 byte after crlf
					$_l_DestBlobOffset:=$_l_DestBlobOffset+$_l_ChunkSIze
					If (False:C215)
						BLOB TO DOCUMENT:C526("resultblobchunk.txt"; $_blb_Help)
					End if 
					$_l_offset:=$_l_ChunkSIze+2+Length:C16($_t_ChunkSizeB16)+2
					DELETE FROM BLOB:C560($_ptr_Result->; 0; $_l_offset)
					If (False:C215)
						BLOB TO DOCUMENT:C526("resultblobchunk2.txt"; $_ptr_Result->)
					End if 
				End while 
				If (BLOB size:C605($_blb_Help)#0)
					If ($_blb_Help{0}=10)
						DELETE FROM BLOB:C560($_ptr_Result->; 0; 1)
					End if 
				End if 
				$_ptr_Result->:=$_blb_Help
				
				
			Else   //  response = Text
				$_t_HTTPResponse:=$_t_URL
				$_t_ChunkSizeB16:="-1"
				$_t_Result:=""
				//UNICODE TEST
				While ((($_t_ChunkSizeB16#"0") & ($_t_ChunkSizeB16#($_t_LF+"0"))) & ($_t_ChunkSizeB16#""))
					$_t_ChunkSizeB16:=Substring:C12($_t_HTTPResponse; 1; Position:C15($_t_CR+$_t_LF; $_t_HTTPResponse; *)-1)
					$_t_ErrorText:=CCM_Curl("HexToDec"; ->$_t_Response; $_t_ChunkSizeB16)
					$_l_ChunkSIze:=Num:C11($_t_Response)
					$_t_Result:=$_t_Result+Substring:C12($_t_HTTPResponse; Position:C15($_t_CR+$_t_LF; $_t_HTTPResponse; *)+1; $_l_ChunkSIze)
					$_l_offset:=$_l_ChunkSIze+2+Length:C16($_t_ChunkSizeB16)+2
					$_t_HTTPResponse:=Substring:C12($_t_HTTPResponse; $_l_offset)
				End while 
				If ($_t_Result#"")
					If (Character code:C91($_t_Result[[1]])=10)
						$_t_Result:=Substring:C12($_t_Result; 2)
					End if 
				End if 
				$_ptr_Result->:=$_t_Result
			End if 
			
		: ($_t_Function="HexToDec")  // needed for Chunk
			$_l_ThisCharacterPosition:=1
			$_l_binOffset:=1
			$_l_Shift:=0
			While ($_l_ThisCharacterPosition<=Length:C16($_t_URL))
				$_t_ThisCharacter:=Substring:C12($_t_URL; Length:C16($_t_URL)-$_l_ThisCharacterPosition+1; 1)
				Case of 
					: ($_t_ThisCharacter="a")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*10)
					: ($_t_ThisCharacter="b")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*11)
					: ($_t_ThisCharacter="c")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*12)
					: ($_t_ThisCharacter="d")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*13)
					: ($_t_ThisCharacter="e")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*14)
					: ($_t_ThisCharacter="f")
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*15)
					: (($_t_ThisCharacter>="0") & ($_t_ThisCharacter<="9"))
						$_l_Shift:=$_l_Shift+((16^($_l_binOffset-1))*Num:C11($_t_ThisCharacter))
					Else 
						$_l_binOffset:=$_l_binOffset-1
				End case 
				$_l_ThisCharacterPosition:=$_l_ThisCharacterPosition+1
				$_l_binOffset:=$_l_binOffset+1
			End while 
			$_ptr_Result->:=String:C10($_l_Shift)
			
		: ($_t_Function="Position_Blob")  // like Position, just for blob not for string
			//  ("Position_Blob";->Blob;"suchtext")  -> position als string
			$_l_ResultPosition:=0
			$_l_offset:=0
			$_l_PositionOffset:=0
			$_t_TextFragment:=BLOB to text:C555($2->; Mac text without length:K22:10; $_l_offset; 30000)
			$_l_ResultPosition:=Position:C15($3; $_t_TextFragment)
			While (($_l_offset<BLOB size:C605($2->)) & ($_l_ResultPosition=0))
				$_l_Length:=Length:C16($_t_TextFragment)-1000
				$_l_PositionOffset:=$_l_PositionOffset+$_l_Length-1
				$_t_TextFragment:=Substring:C12($_t_TextFragment; $_l_Length)+BLOB to text:C555($2->; Mac text without length:K22:10; $_l_offset; 30000)
				//UNICODE TEST
				$_l_ResultPosition:=Position:C15($3; $_t_TextFragment; *)
			End while 
			If ($_l_ResultPosition>0)
				$_t_ErrorText:=String:C10($_l_ResultPosition+$_l_PositionOffset)
			Else 
				$_t_ErrorText:="0"
			End if 
			
		Else 
			$_t_ErrorText:="CCM_Curl - Error: Unknown parameter #1"
	End case 
End if 
$0:=$_t_ErrorText
ERR_MethodTrackerReturn("CCM_Curl"; $_t_oldMethodName)