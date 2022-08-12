//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetPage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(TCP Connection Closed)
	C_BOOLEAN:C305($_bo_Wait; $3)
	C_LONGINT:C283(<>ITK_l_StreamConnected; <>IWS_l_UseProxy; $_l_ColonPosition; $_l_PortNumber; $_l_Status; $_l_StreamNumber; $_r_TimeoutPoint)
	C_REAL:C285($_r_BytesReceived; $_r_BytesSend)
	C_TEXT:C284(<>IWS_t_ProxyPrefix; <>STR_t_CR; <>STR_t_LF; <>Web_t_ServerHandler; $_l_Page; $_t_Answer; $_t_Buffer; $_t_CrLF; $_t_Host; $_t_HtmlTEXT; $_t_oldMethodName)
	C_TEXT:C284($0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetPage")

$_t_Host:=$1
$_l_Page:=$2


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		If (<>IWS_l_UseProxy=1)
			$_l_Page:=<>IWS_t_ProxyPrefix+$_l_Page
		End if 
		If (Count parameters:C259=3)
			$_bo_Wait:=$3
		Else 
			$_bo_Wait:=True:C214
		End if 
		
		$0:=""
		$_t_Answer:=""
		$_l_ColonPosition:=Position:C15(":"; $_t_Host)
		If ($_l_ColonPosition>0)
			$_l_PortNumber:=Num:C11(Substring:C12($_t_Host; $_l_ColonPosition+1))
			If ($_l_PortNumber=0)  //in case it went wrong
				$_l_PortNumber:=80
			End if 
			$_t_Host:=Substring:C12($_t_Host; 1; $_l_ColonPosition-1)
		Else 
			$_l_PortNumber:=80
		End if 
		
		$_t_CrLF:=<>STR_t_CR+<>STR_t_LF
		$_t_HtmlTEXT:="GET /"+$_l_Page+" HTTP/1.0"+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"User-Agent: 4D"+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"Host: "+$_t_Host+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"Accept: */*"+$_t_CrLF+$_t_CrLF
		
		//$_l_StreamNumber:=ITK_TCPOpen ($_t_Host;$_l_PortNumber;32000) ITK OUT
		
		If ($_l_StreamNumber>0)
			$_r_TimeoutPoint:=Tickcount:C458+(60*10)  //10 second timeout period
			While (IWS_StreamStatus($_l_StreamNumber)#<>ITK_l_StreamConnected) & (Tickcount:C458<$_r_TimeoutPoint)
				DelayTicks(2)
			End while 
			//    $_l_Status:=ITK_TCPWaitConn ($_l_StreamNumber;◊ITK_i_StreamConnected;10)
			If (IWS_StreamStatus($_l_StreamNumber)=<>ITK_l_StreamConnected)
				//$Bytes:=ITK_TCPSend ($_l_StreamNumber;$_t_HtmlTEXT) ITK OUT
				If ($_bo_Wait)  //we're going to wait for our answer before firing off another request
					$_t_Answer:=""
					$_r_TimeoutPoint:=Tickcount:C458+(60*10)  //10 second timeout period
					Repeat 
						//$Err:=ITK_TCPRcv ($_l_StreamNumber;$_t_Buffer) ITK OUT
						$_t_Answer:=$_t_Answer+$_t_Buffer
						$_l_Status:=IWS_StreamStatus($_l_StreamNumber)
					Until ($_l_Status=14) | (Tickcount:C458>$_r_TimeoutPoint)
				End if 
			End if 
			//$Err:=ITK_TCPRelease ($_l_StreamNumber) ITK OUT
			
			$0:=$_t_Answer
			
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		If (<>IWS_l_UseProxy=1)
			$_l_Page:=<>IWS_t_ProxyPrefix+$_l_Page
		End if 
		If (Count parameters:C259=3)
			$_bo_Wait:=$3
		Else 
			$_bo_Wait:=True:C214
		End if 
		
		$0:=""
		$_t_Answer:=""
		$_l_ColonPosition:=Position:C15(":"; $_t_Host)
		If ($_l_ColonPosition>0)
			$_l_PortNumber:=Num:C11(Substring:C12($_t_Host; $_l_ColonPosition+1))
			If ($_l_PortNumber=0)  //in case it went wrong
				$_l_PortNumber:=80
			End if 
			$_t_Host:=Substring:C12($_t_Host; 1; $_l_ColonPosition-1)
		Else 
			$_l_PortNumber:=80
		End if 
		
		$_t_CrLF:=<>STR_t_CR+<>STR_t_LF
		$_t_HtmlTEXT:="GET /"+$_l_Page+" HTTP/1.0"+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"User-Agent: 4D"+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"Host: "+$_t_Host+$_t_CrLF
		$_t_HtmlTEXT:=$_t_HtmlTEXT+"Accept: */*"+$_t_CrLF+$_t_CrLF
		
		$_l_StreamNumber:=TCP Open($_t_Host; $_l_PortNumber)
		
		If ($_l_StreamNumber#0)
			
			$_r_BytesSend:=TCP Send($_l_StreamNumber; $_t_HtmlTEXT)
			If ($_bo_Wait)  //we're going to wait for our answer before firing off another request
				$_t_Answer:=""
				$_r_TimeoutPoint:=Tickcount:C458+(60*10)  //10 second timeout period
				Repeat 
					$_r_BytesReceived:=TCP Receive($_l_StreamNumber; $_t_Buffer)
					$_t_Answer:=$_t_Answer+$_t_Buffer
					$_l_Status:=TCP Get State($_l_StreamNumber)
				Until ($_l_Status=TCP Connection Closed) | (Tickcount:C458>$_r_TimeoutPoint)
			End if 
			
			TCP Close($_l_StreamNumber)
			
			$0:=$_t_Answer
			
		End if 
		//
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_GetPage"; $_t_oldMethodName)