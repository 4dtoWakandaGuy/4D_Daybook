//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41//Method Name: Errors_TCP
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 

// Errors_TCP
// Catches error codes when sending SMSs etc.
// Parameters: $1 = error code 9longint)
// 09/05/02 pb
$ErrorInMethod:=DB_t_TrackingMethodName
C_LONGINT:C283($errorcode)
$errorcode:=$1

Case of 
		// Open Transport errors
	: ($errorcode=-3211)
		$0:="-3211 Open Transport Out of Memory."
	: ($errorcode=-3201)
		$0:="-3201 Open Transport Not Found."
	: ($errorcode=-3216)
		$0:="-3216 Open Transport duplicate found."
	: ($errorcode=-3152)
		$0:="-3152 Missing access permission."
	: ($errorcode=-3162)
		//   $0:="-3162 No data available for reading"
		$0:="-3162 There is a problem with your internet connection."
	: ($errorcode=-3157)
		$0:="-3157 A system error occurred"
	: ($errorcode=-3168)
		$0:="-3168 State is changing - try again later"
	: ($errorcode=-3172)
		$0:="-3172 Address requested is already in use"
	: ($errorcode=-3178)
		$0:="-3178 An unspecified provider error occurred"
	: ($errorcode=-3200)
		$0:="-3200 Permission denied"
	: ($errorcode=-3204)
		$0:="-3204 I/O error"
	: ($errorcode=-3231)
		$0:="-3231 Broken pipe"
	: ($errorcode=-3249)
		$0:="-3249 Network is down"
	: ($errorcode=-3250)
		$0:="-3250 Network is unreachable"
	: ($errorcode=-3253)
		$0:="-3253 Connection reset by peer"
	: ($errorcode=-3254)
		$0:="-3254 No buffer space available"
	: ($errorcode=-3256)
		$0:="-3256 Socket is not connected"
	: ($errorcode=-3259)
		$0:="-3259 Connection timed out"
	: ($errorcode=-3260)
		$0:="-3260 Connection refused"
	: ($errorcode=-3263)
		$0:="-3263 Host is down"
	: ($errorcode=-3264)
		$0:="-3264 No route to host"
		
		// TCP errors
	: ($errorcode=10001)
		$0:="10001 unimplemented Internet command."
	: ($errorcode=10003)
		$0:="10003 no more (TCP,SMTP,POP3, etc. ) references available."
	: ($errorcode=100018)
		$0:="10018 invalid message number."
	: ($errorcode=10020)
		$0:="10020 invalid character length."
	: ($errorcode=10026)
		$0:="10026 Internet commands unavailable. Probably because MacTCP is not installed"
	: ($errorcode=10027)
		$0:="10027 Connection no longer exists"
	: ($errorcode=10032)
		$0:="10032 Unknown or invalid response."
	: ($errorcode=10064)
		$0:="10064 No response has been received within the given timeout period."
	: ($errorcode=10071)
		$0:="10071 TCP session was closed by the server"
	: ($errorcode=10074)
		$0:="10074 An asynchronous DNR call did not complete"
	: ($errorcode=10075)
		$0:="10075 An asynchronous OpenTransport call did not complete"
	: ($errorcode=10076)
		$0:="10076 OpenTransport bind failed"
	: ($errorcode=10077)
		$0:="10077 OpenTransport connect failed"
	: ($errorcode=10078)
		$0:="10078 Maximum MacTCP streams reached"
	Else 
		$0:=String:C10($errorcode)
End case 
$0:="TCP Error: "+$0