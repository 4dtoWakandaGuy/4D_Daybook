//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_GetHTTP
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_WDAV_GetHTTP (domain; port; path{; user name:password})
	
	// Gets the contants of an file using HTTP.
	// Sets 4D's Error variable.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : DomainName
	//   $2 : Text : Port number
	//   $3 : Text : Path
	//   $4 : Text : username:password (optional)
	
	// Returns: Nothing
	
	// Created by Julien Feasson, 4D, Inc.
	//   Method originally named WDAV_GET.
	// Modified by Dave Batton on May 17, 2004
	//   Changed the variable names to my style.
	//   Made the username:password parameter optional.
	//   Now sets 4D's Error variable rather than returning the error number.
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:29`Method: Cal4D_iCal_WDAV_GetHTTP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CAL_blb_iCalWDAVBody; <>CAL_blb_iCalWDAVReceived)
	C_LONGINT:C283($0; $2)
	C_TEXT:C284($_t_Authentication; $_t_DoubleCRLF; $_t_ErrorText; $_t_oldMethodName; $_t_ResponseText; $1; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_GetHTTP")


Error:=0

If (Count parameters:C259>=4)  // DB040517 - Added this test.
	$_t_Authentication:=$4
	If ($_t_Authentication#"No")
		$_t_Authentication:="Authorization: Basic "+Cal4D_iCal_WDAV_EncodeB64($_t_Authentication)
	End if 
Else 
	$_t_Authentication:="No"
End if 

If (Error=0)
	Cal4D_iCal_WDAV_SendRequest($1; $2; $3; ""; "GET"; "No"; $_t_Authentication; "No")
	
	If (Error=0)
		$_t_DoubleCRLF:=Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
		
		If (Error=0)
			$_t_ResponseText:=BLOB to text:C555(<>CAL_blb_iCalWDAVReceived; Mac text without length:K22:10)
			$_t_ErrorText:=Substring:C12($_t_ResponseText; Position:C15("HTTP/1."; $_t_ResponseText)+9; 3)
			COPY BLOB:C558(<>CAL_blb_iCalWDAVReceived; <>CAL_blb_iCalWDAVBody; Position:C15($_t_DoubleCRLF; $_t_ResponseText)+3; 0; BLOB size:C605(<>CAL_blb_iCalWDAVReceived)-Position:C15($_t_DoubleCRLF; $_t_ResponseText)-3)
			If ($_t_ErrorText#"200")
				Error:=1000+Num:C11($_t_ErrorText)  // So is this mean just to confuse me?  - DB
			End if 
		Else 
			Error:=1016
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_GetHTTP"; $_t_oldMethodName)