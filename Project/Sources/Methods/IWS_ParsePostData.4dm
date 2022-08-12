//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParsePostData
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
	//ARRAY TEXT(IME_at_FieldNames;0)
	//ARRAY TEXT(IME_at_Fields;0)
	C_BLOB:C604(IWS_blb_PostDataBLOB)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharIndex; $_l_offset; $_l_StringLength)
	C_TEXT:C284(<>STR_t_CRLF; $_t_Line; $_t_oldMethodName; $_t_PostDataTEMP; IWS_t_ContentType; IWS_t_Error; IWS_t_Extension; IWS_t_PostData)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParsePostData")
//Method: IWS_ParsePostData
//
//Written by  Rollo on 12/31/98
//Extensively modified by John, 7/18/2000, to use blob or document as source

//Purpose: Parse Post Data into arrays
//

Case of 
	: (IWS_t_ContentType="multipart/form-data")
		If (IWS_t_Extension="upload")
			IWS_HandleUpload
		Else 
			IWS_t_Error:="The system is only set up to handle input of  type 'multipart/form-data'"+" which has an extension of 'upload'."
			IWS_SendToLog(IWS_t_Error)
		End if 
		
	: (True:C214)
		
		//Rollo 9/17/2000 - commented all this out because still using WS
		
		// ((IWS_t_ContentType="application/x-www-form-urlencoded") |
		// (IWS_t_ContentType="x-www-form-urlencoded") |
		// (IWS_t_ContentType="x-www-form-encoded"))
		
		// If (BLOB size(IWS_x_PostData)=0)
		// IWS_t_Error:="IWS_x_PostData contained no data
		// - perhaps a memory problem?"
		//IWS_SendToLog (IWS_t_Error)
		//Else
		
		
		//for the moment we are assuming that any non-file-upload post data must
		//of necessity be less than 32000 bytes - any more will cause an error
		$_l_offset:=0
		IWS_t_PostData:=BLOB to text:C555(IWS_blb_PostDataBLOB; Mac text without length:K22:10; $_l_offset)
		SET BLOB SIZE:C606(IWS_blb_PostDataBLOB; 0)
		$_t_PostDataTEMP:=IWS_t_PostData
		$_l_StringLength:=STR_CountStr($_t_PostDataTEMP; "=")
		//Possible problem here? What if the equals sign is actually present in
		//a field value? We would end up with the wrong number of fields.
		//(This will be only be the case if the ENCTYPE is
		//something other than application/x-www-form-urlencoded, though).
		
		UTI_ArrayResize($_l_StringLength; ->IME_at_Fields; ->IME_at_FieldNames)
		For ($_l_CharIndex; 1; $_l_StringLength)
			$_l_CharacterPosition:=Position:C15("&"; $_t_PostDataTEMP)
			If ($_l_CharacterPosition=0)
				$_l_CharacterPosition:=Position:C15(<>STR_t_CRLF; $_t_PostDataTEMP)
				If ($_l_CharacterPosition>0)
					$_t_Line:=Substring:C12($_t_PostDataTEMP; 1; $_l_CharacterPosition-1)
					$_t_PostDataTEMP:=Substring:C12($_t_PostDataTEMP; $_l_CharacterPosition+2)
				Else 
					$_t_Line:=$_t_PostDataTEMP
					$_t_PostDataTEMP:=""
					$_l_CharacterPosition:=Length:C16($_t_Line)
				End if 
			Else 
				$_t_Line:=Substring:C12($_t_PostDataTEMP; 1; $_l_CharacterPosition-1)
				$_t_PostDataTEMP:=Substring:C12($_t_PostDataTEMP; $_l_CharacterPosition+1)
			End if 
			If ($_l_CharacterPosition>0)
				$_l_CharacterPosition:=Position:C15("="; $_t_Line)
				If ($_l_CharacterPosition>0)
					//IME_at_FieldNames{$_l_CharIndex}:=ITK_URL2Text (Substring($_t_Line;1;$_l_CharacterPosition-1))
					//IME_at_Fields{$_l_CharIndex}:=ITK_URL2Text (Substring($_t_Line;$_l_CharacterPosition+1))
					IME_at_FieldNames{$_l_CharIndex}:=STR_URLDecode(Substring:C12($_t_Line; 1; $_l_CharacterPosition-1))
					IME_at_Fields{$_l_CharIndex}:=STR_URLDecode(Substring:C12($_t_Line; $_l_CharacterPosition+1))
				End if 
			End if 
		End for 
		//
		//End if   `blob size
		
	Else 
		IWS_t_Error:="The content type'"+IWS_t_ContentType+"' cannot be handled by IWS_ParsePostData."
		IWS_SendToLog(IWS_t_Error)
End case 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_ParsePostData"; $_t_oldMethodName)