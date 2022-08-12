//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_PUT
	//------------------ Method Notes ------------------
	// Method: WDAV_PUT
	//---------------------------------------------------
	// Description:
	// Put a local file into the WDAV collection
	//
	//---------------------------------------------------
	// Parameters:
	// $0 - Error code or 0
	// $1 - DomainName
	// $2 - PortNumber
	// $3 - Folder/Path
	// $4 - Blob to be saved
	// $5 - Username:Password/No
	//---------------------------------------------------
	// By: Julien Feasson - 4D, Inc.
	//---------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:29`Method: Cal4D_iCal_WDAV_PUT
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CAL_blb_iCalWDAVReceived; $4)
	C_LONGINT:C283($0; $2)
	C_TEXT:C284($_t_Authentication; $_t_oldMethodName; $_t_WDAVErrorCode; $_t_WDAVRequestBody; $_t_WDAVServerResponse; $1; $3; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_PUT")

$_t_Authentication:=$5
If ($5#"No")
	$_t_Authentication:="Authorization: Basic "+Cal4D_iCal_WDAV_EncodeB64($5)
End if 

$0:=Cal4D_iCal_WDAV_SendUpload($1; $2; $3; $4; "PUT"; "No"; $_t_Authentication; "No")

If ($0=0)
	$_t_WDAVServerResponse:=BLOB to text:C555(<>CAL_blb_iCalWDAVReceived; Mac text without length:K22:10)
	$_t_WDAVErrorCode:=Substring:C12($_t_WDAVServerResponse; Position:C15("HTTP/1."; $_t_WDAVServerResponse)+9; 3)
	If (($_t_WDAVErrorCode#"204") & ($_t_WDAVErrorCode#"201"))
		$0:=1000+Num:C11($_t_WDAVErrorCode)
	End if 
Else 
	$0:=1016
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_PUT"; $_t_oldMethodName)