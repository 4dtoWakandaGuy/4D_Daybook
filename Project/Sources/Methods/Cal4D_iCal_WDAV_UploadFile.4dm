//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_UploadFile
	//------------------ Method Notes ------------------
	// Method: WDAV_Upload File
	//---------------------------------------------------
	// Description:
	//
	//     This command will upload a file to the specified WebDAV
	//     location. Full Path Doc is a document's full path name.
	//     Full Path WebDAV is a folder's full path name
	//
	//---------------------------------------------------
	// Parameters:
	//   Passed: Full Path Doc : Full path of the local document
	//                           to be uploaded (TXT)
	//        Full Path WebDAV : Full path of the folder where
	//                           you want to upload the file (TXT)
	//   Returned: error code or 0 in WDAV_error
	//---------------------------------------------------
	// By: Julien Feasson - 4D, Inc.
	//---------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:28`Method: Cal4D_iCal_WDAV_UploadFile
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_DocumentBody)
	C_LONGINT:C283($_l_WDAVportnumber; $_l_WDAVSlashPosition; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_WDAVDestination; $_t_WDAVDomainName; $_t_WDAVFolder; $_t_WDAVFolderName; $_t_WDAVFolderpath; $_t_WDAVURL; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_UploadFile")

$_t_WDAVURL:=$2

If ((Position:C15(":"; Substring:C12($_t_WDAVURL; 8))#0) & (Position:C15(":"; Substring:C12($_t_WDAVURL; 8))<Position:C15("/"; Substring:C12($_t_WDAVURL; 8))))
	$_t_WDAVDomainName:=Substring:C12($_t_WDAVURL; 8; Position:C15(":"; Substring:C12($_t_WDAVURL; 8))-1)
	$_l_WDAVportnumber:=Num:C11(Substring:C12($_t_WDAVURL; Position:C15(":"; Substring:C12($_t_WDAVURL; 8))+8; Position:C15("/"; Substring:C12($_t_WDAVURL; 8))-Position:C15(":"; Substring:C12($_t_WDAVURL; 8))-1))
Else 
	$_t_WDAVDomainName:=Substring:C12($_t_WDAVURL; 8; Position:C15("/"; Substring:C12($_t_WDAVURL; 8))-1)
	$_l_WDAVportnumber:=80
End if 

$_l_WDAVSlashPosition:=0
While (Position:C15("/"; $_t_WDAVURL)#0)
	$_l_WDAVSlashPosition:=$_l_WDAVSlashPosition+Position:C15("/"; $_t_WDAVURL)
	$_t_WDAVURL:=Substring:C12($_t_WDAVURL; Position:C15("/"; $_t_WDAVURL)+1)
End while 

$_t_WDAVURL:=$2
$_t_WDAVFolderpath:=Substring:C12($_t_WDAVURL; Position:C15("/"; Substring:C12($_t_WDAVURL; 8))+7; $_l_WDAVSlashPosition-(Position:C15("/"; Substring:C12($_t_WDAVURL; 8))+6))
$_t_WDAVFolderName:=Substring:C12($_t_WDAVURL; $_l_WDAVSlashPosition+1)
$_t_WDAVFolder:=$_t_WDAVFolderpath+$_t_WDAVFolderName

DOCUMENT TO BLOB:C525($1; $_blb_DocumentBody)

$0:=Cal4D_iCal_WDAV_PUT($_t_WDAVDomainName; $_l_WDAVportnumber; $_t_WDAVFolder; $_blb_DocumentBody; $3)
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_UploadFile"; $_t_oldMethodName)