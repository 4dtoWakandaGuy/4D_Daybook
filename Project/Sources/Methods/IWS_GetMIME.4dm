//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetMIME
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Filename; $sign; IWS_t_Filename; IWS_t_MIME; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetMIME")
// IWS_GetMIME
// get mime type of a specific document


IWS_t_CurrentMethodName:="IWS_GetMIME"  // *** MODIFIED BY  John, 1/11/99

$_t_Filename:=IWS_DocNormalize(IWS_t_Filename)
IWS_t_MIME:="text/html"  // default mime type is set to HTML

Case of 
	: ($_t_Filename="@.class")
		IWS_t_MIME:="application/java"
	: ($_t_Filename="@.js")
		IWS_t_MIME:="application/x-javascript"  // *** MODIFIED BY  John, 1/11/99
		
	Else 
		If (Test path name:C476($_t_Filename)=Is a document:K24:1)  // modified: 11-Mar-98, Ju
			$sign:=_o_Document type:C528($_t_Filename)  // hope this works, modified: 11-Mar-98, Ju
		Else 
			$sign:=""
		End if 
		
		If ($sign#"")
			Case of 
				: ($sign="TEXT")
					Case of 
						: (($_t_Filename="@.txt") | ($_t_Filename="@.text"))  // plain text documents
							IWS_t_MIME:="text/plain"
						: ($_t_Filename="@.hqx")  // binhex 4.0 format
							IWS_t_MIME:="application/mac-binhex40"
						: (True:C214)
							IWS_t_MIME:="text/html"
					End case 
				: ($sign="gif")  // gif image
					IWS_t_MIME:="image/gif"
				: (($sign="jpeg") | ($sign="jfif") | ($sign="jpg"))  // jpeg image
					IWS_t_MIME:="image/jpeg"
				: ($sign="pict")  // pict image
					IWS_t_MIME:="image/pict"
				: (($sign="mov") | ($sign="moov"))  // quicktime movie
					IWS_t_MIME:="video/quicktime"
				Else 
					Case of 
						: (($_t_Filename="@.txt") | ($_t_Filename="@.text"))
							IWS_t_MIME:="text/plain"
						: ($_t_Filename="@.gif")
							IWS_t_MIME:="image/gif"
						: (($_t_Filename="@.jpg") | ($_t_Filename="@.jpeg") | ($_t_Filename="@.jfif"))
							IWS_t_MIME:="image/jpeg"
						: ($_t_Filename="@.pict")
							IWS_t_MIME:="image/pict"
						: (($_t_Filename="@.mov") | ($_t_Filename="@.moov"))
							IWS_t_MIME:="video/quicktime"
						Else 
							IWS_t_MIME:="text/html"
					End case 
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("IWS_GetMIME"; $_t_oldMethodName)