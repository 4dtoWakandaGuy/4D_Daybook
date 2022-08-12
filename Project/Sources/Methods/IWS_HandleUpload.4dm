//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_HandleUpload
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IME_at_FieldNames;0)
	//ARRAY TEXT(IME_at_Fields;0)
	C_BLOB:C604($_blb_SkipTable; IWS_blb_PostDataBLOB)
	C_BOOLEAN:C305($_bo_FatalError)
	C_LONGINT:C283($_l_BlobSize; $_l_DoubleCRLFPos; $_l_offset; $_l_Position; $_l_ReadBytes; $_l_SearchStringLength; $_l_WriteBytes)
	C_TEXT:C284(<>STR_s_Sep; <>STR_t_CR; <>STR_t_LF; $_t_Boundary; $_t_CR; $_t_crlf; $_t_DocumentName; $_t_DocumentPath2; $_t_DoubleCRLF; $_t_EndBoundary; $_t_LF)
	C_TEXT:C284($_t_Line; $_t_oldMethodName; $_t_Path; $_t_SearchString; $_t_TempText; IWS_t_Error; IWS_t_Filename; IWS_t_UploadDocName; IWS_t_UploadsFolder)
	C_TIME:C306($_ti_DocumentRef; IWS_ti_UploadDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_HandleUpload")
//******************************************************************************
//
//Method: IWS_HandleUpload
//
//Written by  John on 7/18/2000
//
//Purpose: Parse uploaded file data
//
//Copyright 2000 Bizfnity, Inc
//
//
//******************************************************************************

$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_crlf:=<>STR_t_CR+<>STR_t_LF
$_t_DoubleCRLF:=$_t_crlf*2

//**** Rollo 27/5/2004  **** HFS Replacements needed to get uploads working

IWS_t_UploadsFolder:=""  //HFSParentName (Data file)+"Uploads"
If (False:C215)  //(HFSExists (IWS_t_UploadsFolder)=0)
	CREATE FOLDER:C475(IWS_t_UploadsFolder)
End if 

IWS_ti_UploadDoc:=DB_OpenDocument(IWS_t_UploadDocName)
If (OK=1)
	//IWS_SendToLog ("Document opened successfully")
	RECEIVE PACKET:C104(IWS_ti_UploadDoc; $_t_TempText; MAXTEXTLENBEFOREV11:K35:3)
	TEXT TO BLOB:C554($_t_TempText; IWS_blb_PostDataBLOB; Mac text without length:K22:10)
	$_l_Position:=UTI_FindInBlob($_t_crlf; ->IWS_blb_PostDataBLOB)
	If ($_l_Position=-1)
		IWS_t_Error:="Could not get first boundary marker"
	Else 
		$_l_offset:=0
		$_t_Boundary:=BLOB to text:C555(IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset; $_l_Position)
		//we have the boundary string now
		UTI_ArrayResize(0; ->IME_at_Fields; ->IME_at_FieldNames)
		$_blb_SkipTable:=UTI_BuildBMSkipTable($_t_crlf)
		Repeat 
			$_l_offset:=$_l_Position+2
			$_l_Position:=UTI_FindInBlob($_t_crlf; ->IWS_blb_PostDataBLOB; $_l_offset; $_blb_SkipTable)
			If ($_l_Position#-1)
				$_t_Line:=BLOB to text:C555(IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset; $_l_Position-$_l_offset)
				If ($_t_Line="Content-Disposition: form-data; name=@")
					
					$_t_Path:=IWS_GetMIMEParameter($_t_Line; "filename")
				Else 
					$_t_Path:=""
				End if   // If (($_t_Line#"")†&†($_t_Line#$_t_Boundary))
			End if   // If ($_l_Position#-1)
		Until (($_t_Path#"") | ($_l_Position=-1))
		If ($_t_Path="")
			IWS_t_Error:="Could not find Content-Disposition field containing filename"
		Else 
			$_t_DocumentName:=""  //HFSShortName ($_t_Path)
			$_t_DocumentPath2:=IWS_t_UploadsFolder+Folder separator:K24:12+$_t_DocumentName
			
			$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPath2)
			//IWS_SendToLog ("Created 'real' upload document: "+Document)
			//Move our offset to the beyond the end of the line
			$_l_offset:=$_l_Position+2
			$_l_Position:=UTI_FindInBlob($_t_DoubleCRLF; ->IWS_blb_PostDataBLOB; $_l_offset)
			If ($_l_Position=-1)
				IWS_t_Error:="Could not find CRLF pair marking end of header"
			Else 
				$_l_offset:=$_l_Position+4
				DELETE FROM BLOB:C560(IWS_blb_PostDataBLOB; 0; $_l_offset)
				$_l_offset:=0
				//Next we find where it ends, by looking for the boundary marker
				//It appears to add a CRLF before the boundary marker, so this needs
				//to go too
				$_t_SearchString:=$_t_crlf+$_t_Boundary
				$_l_SearchStringLength:=Length:C16($_t_SearchString)
				//IWS_SendToLog ("Searching for end boundary marker (length "+String($_t_SearchString
				$_blb_SkipTable:=UTI_BuildBMSkipTable($_t_SearchString)
				Repeat 
					$_l_offset:=0
					$_l_Position:=UTI_FindInBlob($_t_SearchString; ->IWS_blb_PostDataBLOB; $_l_offset; $_blb_SkipTable)
					If ($_l_Position=-1)
						//we didn't find the terminating string, but it may be that it falls
						//across a boundary of text chunks. So to make sure we don't miss it, we
						//only write out and delete from the blob everything up to searchstringlength
						//short of the end. This then becomes the new blob, to which we append a
						//number of bytes from the document equal to MAXTEXTLEN minus this length
						$_l_offset:=0
						$_l_WriteBytes:=BLOB size:C605(IWS_blb_PostDataBLOB)-$_l_SearchStringLength
						$_t_TempText:=BLOB to text:C555(IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset; $_l_WriteBytes)
						SEND PACKET:C103($_ti_DocumentRef; $_t_TempText)
						DELETE FROM BLOB:C560(IWS_blb_PostDataBLOB; 0; $_l_WriteBytes)
						$_l_ReadBytes:=MAXTEXTLENBEFOREV11:K35:3-$_l_SearchStringLength
						RECEIVE PACKET:C104(IWS_ti_UploadDoc; $_t_TempText; $_l_ReadBytes)
						If ($_t_TempText#"")
							$_l_offset:=$_l_SearchStringLength
							TEXT TO BLOB:C554($_t_TempText; IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset)
						End if 
					End if 
					IDLE:C311
				Until ($_l_Position>=0) | ($_t_TempText="")
				If ($_l_Position=-1)
					IWS_t_Error:="Could not find end boundary marker"
				Else 
					DELETE FROM BLOB:C560(IWS_blb_PostDataBLOB; $_l_Position; BLOB size:C605(IWS_blb_PostDataBLOB)-$_l_Position)
					$_l_offset:=0
					$_t_TempText:=BLOB to text:C555(IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TempText)
				End if   //IWS_t_Error:="Could not find end boundary marker"
				
			End if   // IWS_t_Error:="Could not find CRLF pair marking end of header"
		End if   //IWS_t_Error:="Could not find Content-Disposition field containing filename"
	End if   //"Could not get first boundary marker"
	SET BLOB SIZE:C606(IWS_blb_PostDataBLOB; 0)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	CLOSE DOCUMENT:C267(IWS_ti_UploadDoc)
	DELETE DOCUMENT:C159(IWS_t_UploadDocName)
	If (OK=0)
		IWS_SendToLog("Could not delete document: "+IWS_t_UploadDocName)
	End if 
	
Else 
	IWS_t_Error:="Could not open temporary upload file :"+IWS_t_UploadDocName
End if 
If (IWS_t_Error#"")
	IWS_SendToLog(IWS_t_Error)
	IWS_t_Filename:=""
Else 
	IWS_t_Filename:=$_t_DocumentName
End if 
ERR_MethodTrackerReturn("IWS_HandleUpload"; $_t_oldMethodName)