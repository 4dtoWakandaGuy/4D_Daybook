//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_MailAttachment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BLOB:C604($_blb_DocumentBlob)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_Base64Total; $_l_BlobSize; $_l_Error; $_l_Index; $_l_IndexIteration; $_l_offset; $_l_Stream; $_l_WholeLoops; $_l_WindowReferenceRow; $1; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_BytesSent; $_r_TotalReadBytes)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_AttachmentHeader; $_t_AttachmentPath; $_t_AttachmentPath2; $_t_Base64Text; $_t_Boundary; $_t_CR; $_t_CRLF; $_t_Encoding; $_t_LF)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_MailAttachment")
//Method: IWS_MailAttachment
//Purpose: Sends mail attachments

// $1 - longint, stream
// $2 - text, pathname of attachment  (optional)
// $3 - text, encoding system for attachment - UUEncode or Base64

$_l_Stream:=$1
$_t_AttachmentPath:=$2
$_t_Encoding:=$3
$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=$_t_CR+$_t_LF
If (Test path name:C476($_t_AttachmentPath)=1)
	$_t_AttachmentHeader:="--"+$_t_Boundary+$_t_CRLF
	If ($_t_Encoding="Base64")
		//***** Rollo 28/5/2004 **** Implement HFS Replacement to make attachments work
		$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: octet-stream; name="  //+STR_InQuotes (HFSShortName ($_t_AttachmentPath))+$_t_CRLF
		$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Transfer-Encoding: base64"+$_t_CRLF
		$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_AttachmentPath))+$_t_CRLF+$_t_CRLF
		//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_AttachmentHeader;0))ITK OUT AUgust 2009
		UTI_WinCenter(300; 65; 0)
		GOTO XY:C161(0; 0)
		MESSAGE:C88("Copying document to BLOB"+$_t_CR)
		DOCUMENT TO BLOB:C525($_t_AttachmentPath; $_blb_DocumentBlob)
		$_l_BlobSize:=BLOB size:C605($_blb_DocumentBlob)
		$_r_TotalReadBytes:=0
		$_r_BytesSent:=0
		$_l_Error:=0
		$_l_Base64Total:=4/3*$_l_BlobSize  //gives predicted size of Base64 version
		$_l_WholeLoops:=$_l_BlobSize\57
		$_l_offset:=0
		For ($_l_Index; 0; $_l_BlobSize-1; 57)
			$_l_IndexIteration:=$_l_IndexIteration+1
			$_t_Text:=BLOB to text:C555($_blb_DocumentBlob; Mac text without length:K22:10; $_l_offset; 57)
			If ($_l_IndexIteration>$_l_WholeLoops)  //it's on last loop
				//$_t_Base64Text:=ITK_Text2B64 ($_t_Text;0)+"=="+$_t_CRLF)ITK OUT AUgust 2009
			Else 
				//$_t_Base64Text:=ITK_Text2B64 ($_t_Text;0)+$_t_CRLF)ITK OUT AUgust 2009
			End if 
			If ((Length:C16($_t_Base64Text)-2)>76)
				//ALERT("Line longer than 76 characters!")
			End if 
			GOTO XY:C161(0; 1)
			$_r_BytesSent:=$_r_BytesSent+Length:C16($_t_Base64Text)
			//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_Base64Text;1))ITK OUT AUgust 2009
			MESSAGE:C88("Base64-encoded bytes sent = "+String:C10($_r_BytesSent)+" of "+String:C10($_l_Base64Total))
			IDLE:C311
		End for 
		SET BLOB SIZE:C606($_blb_DocumentBlob; 0)
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
	Else 
		If ($_t_AttachmentPath#"@.uu")
			$_t_AttachmentPath2:=$_t_AttachmentPath+".uu"
			//$Err:=ITK_Mac2uu ($_t_AttachmentPath;$_t_AttachmentPath2))ITK OUT AUgust 2009
		End if 
		$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: application/uuencode; name="  //+STR_InQuotes (HFSShortName ($_t_AttachmentPath2))+$_t_CRLF
		$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_AttachmentPath2))+$_t_CRLF+$_t_CRLF
		
		//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_AttachmentHeader;0))ITK OUT AUgust 2009
		//$Err:=ITK_TCPSendFile ($_l_Stream;$_t_AttachmentPath2;0))ITK OUT AUgust 2009
		If ($_t_AttachmentPath#"@.uu")
			DELETE DOCUMENT:C159($_t_AttachmentPath2)
		End if 
	End if 
	//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_CRLF;0))ITK OUT AUgust 2009
End if   //If (Test path name($_t_AttachmentPath)=1)
ERR_MethodTrackerReturn("IWS_MailAttachment"; $_t_oldMethodName)