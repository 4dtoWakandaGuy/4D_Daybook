//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_DownloadFile
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_WDAV_DownloadFile (local file path; URL{; username:password})
	
	// This command will download a file from the WebDAV server to the specified location.
	// The document name will be retrieved from the Full Path WebDAV.
	// Full Path Doc will not contain the document's name.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : Path to file to create
	//   $2 : Text : Full WebDAV URL
	//   $3 : Text : username:password (optional)
	
	// Returns:
	//   $0 : Longint : Error
	
	// Original author unknown. May have been Julien Feasson, 4D, Inc.
	//   Method originally named Cal4D_iCal_WDAV_Download File.
	// Modified by Dave Batton on May 17, 2004
	//   Modified the variable names. Cleaned up the code.
	//   Made the username:password paramter optional.
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_iCal_WDAV_DownloadFile
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CAL_blb_iCalWDAVBody)
	C_LONGINT:C283($_l_Error; $_l_FoundPosition; $_l_WDAVPortNumber; $_l_WDAVslashposition; $0)
	C_TEXT:C284($_t_LocalFilePath; $_t_oldMethodName; $_t_RemotePath; $_t_TempURL; $_t_URL; $_t_UserNamePassword; $_t_WDAVDestination; $_t_WDAVDomainName; $_t_WDAVFolder; $_t_WDAVFolderName; $1)
	C_TEXT:C284($2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_DownloadFile")


$_t_LocalFilePath:=$1
$_t_URL:=$2
If (Count parameters:C259>=3)
	$_t_UserNamePassword:=$3
Else 
	$_t_UserNamePassword:=""
End if 

$_l_Error:=0

$_l_FoundPosition:=Position:C15("//"; $_t_URL)

If ((Position:C15(":"; Substring:C12($_t_URL; 8))#0) & (Position:C15(":"; Substring:C12($_t_URL; 8))<Position:C15("/"; Substring:C12($_t_URL; 8))))
	$_t_WDAVDomainName:=Substring:C12($_t_URL; 8; Position:C15(":"; Substring:C12($_t_URL; 8))-1)
	$_l_WDAVPortNumber:=Num:C11(Substring:C12($_t_URL; Position:C15(":"; Substring:C12($_t_URL; 8))+8; Position:C15("/"; Substring:C12($_t_URL; 8))-Position:C15(":"; Substring:C12($_t_URL; 8))-1))
Else 
	$_t_WDAVDomainName:=Substring:C12($_t_URL; $_l_FoundPosition+2)
	$_t_WDAVDomainName:=Substring:C12($_t_WDAVDomainName; 1; Position:C15("/"; $_t_WDAVDomainName)-1)
	$_l_WDAVPortNumber:=80
End if 

$_t_TempURL:=$_t_URL
$_l_WDAVslashposition:=0
While (Position:C15("/"; $_t_TempURL)#0)
	$_l_WDAVslashposition:=$_l_WDAVslashposition+Position:C15("/"; $_t_TempURL)
	$_t_TempURL:=Substring:C12($_t_TempURL; Position:C15("/"; $_t_TempURL)+1)
End while 

$_t_RemotePath:=Substring:C12($_t_URL; $_l_FoundPosition+2)
$_t_RemotePath:=Substring:C12($_t_RemotePath; Position:C15("/"; $_t_RemotePath))
$_t_WDAVFolder:=$_t_RemotePath

Error:=Cal4D_iCal_WDAV_GetHTTP($_t_WDAVDomainName; $_l_WDAVPortNumber; $_t_WDAVFolder; $_t_UserNamePassword)

If (Error=0)
	BLOB TO DOCUMENT:C526($_t_LocalFilePath; <>CAL_blb_iCalWDAVBody)
	If (OK#1)
		Error:=1084
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_DownloadFile"; $_t_oldMethodName)