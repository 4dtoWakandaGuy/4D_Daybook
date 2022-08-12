//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SetMIMEType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 17:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $sExtension; IWS_t_MIMEType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SetMIMEType")
//Method: IWS_SetMIMEType
//
//Purpose: Set the MIME Type according to an extension parameter
//separate method so that the extension can be 'faked'
//
//$1 - string(21) -File type Extension


$sExtension:=$1

//Rollo 6/22/99 - Note: see a $iMaxExtensionLength var in IWS_GetFileExtension

Case of 
		
	: ($sExtension="htm") | ($sExtension="html") | ($sExtension="") | ($sExtension="upload")
		IWS_t_MIMEType:="text/html"
		
	: ($sExtension="css")
		IWS_t_MIMEType:="text/css"
		
	: ($sExtension="xls")  //Rollo 6/16/99
		IWS_t_MIMEType:="application/vnd.ms-excel"  //Rollo 6/11/2001   - was "application/ms-excel"
		
	: ($sExtension="js")
		IWS_t_MIMEType:="application/x-javascript"
		
	: ($sExtension="jpeg") | ($sExtension="jpg") | ($sExtension="jfif")
		IWS_t_MIMEType:="image/jpeg"
		
	: ($sExtension="gif")
		IWS_t_MIMEType:="image/gif"
	: ($sExtension="png")  //Added 30/03/09 -kmw v631b120p
		IWS_t_MIMEType:="image/png"
		
	: (($sExtension="txt") | ($sExtension="text"))  // plain text documents
		IWS_t_MIMEType:="text/plain"
		
	: ($sExtension="class")
		IWS_t_MIMEType:="application/java"
		
	: ($sExtension="pict")  // pict image
		IWS_t_MIMEType:="image/pict"
		
	: ($sExtension="pdf")
		IWS_t_MIMEType:="application/pdf"
		
	: ($sExtension="zip")
		IWS_t_MIMEType:="application/zip"
		
	: ($sExtension="gz") | ($sExtension="gzip")
		IWS_t_MIMEType:="application/x-gzip"
		
	: ($sExtension="doc")
		IWS_t_MIMEType:="application/msword"
		
		
	: ($sExtension="hqx")  // binhex 4.0 format
		IWS_t_MIMEType:="application/mac-binhex40"
		
		
	: ($sExtension="tif") | ($sExtension="tiff")
		IWS_t_MIMEType:="image/tiff"
		
	: ($sExtension="mov") | ($sExtension="moov")
		IWS_t_MIMEType:="video/quicktime"
		
	: ($sExtension="4d")
		IWS_t_MIMEType:="4d"
		
	Else 
		IWS_t_MIMEType:="text/html"  // default mime type is set to HTML
End case 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_SetMIMEType"; $_t_oldMethodName)