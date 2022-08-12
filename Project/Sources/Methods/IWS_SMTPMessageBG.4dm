//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPMessageBG
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
	C_BLOB:C604($_blb_MailBLOB)
	C_LONGINT:C283($_l_Platform; $0)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284($_t_Addressee; $_t_Attachment; $_t_Encoding; $_t_LocalAddress; $_t_Message; $_t_oldMethodName; $_t_SMTPHost; $_t_Subject; $1; $2; $3)
	C_TEXT:C284($4; $5; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPMessageBG")
//
//Method: IWS_SMTPMessageBG

//Purpose: Sends SMTP message to specified recipient
//via a background process
//
// $1 - string 80, SMTP server address
// $2 - string 80, email address of sender
// $3 - string 80, email address of addressee (recipient)
// $4 - string 80,  message subject
// $5 - text, message
// $6 - text, pathname of attachment  (optional)
// $7 - text, encoding system for attachment - UUEncode or Base64


If (Count parameters:C259>4)
	
	$_t_SMTPHost:=$1
	$_t_LocalAddress:=$2
	$_t_Addressee:=$3
	$_t_Subject:=$4
	$_t_Message:=$5
	If (Count parameters:C259<6)
		$_t_Attachment:=""
	Else 
		$_t_Attachment:=$6
		If (Count parameters:C259=7)
			$_t_Encoding:=$7
		Else 
			$_t_Encoding:="UUEncode"
		End if 
	End if 
	VARIABLE TO BLOB:C532($_t_LocalAddress; $_blb_MailBLOB; *)
	VARIABLE TO BLOB:C532($_t_Addressee; $_blb_MailBLOB; *)
	VARIABLE TO BLOB:C532($_t_Subject; $_blb_MailBLOB; *)
	VARIABLE TO BLOB:C532($_t_Message; $_blb_MailBLOB; *)
	VARIABLE TO BLOB:C532($_t_Attachment; $_blb_MailBLOB; *)
	VARIABLE TO BLOB:C532($_t_Encoding; $_blb_MailBLOB; *)
	
	//Rollo 4/9/2000 - this method doesn't work
	//$_pic_Picture:=B2P_BlobToPict2 ($_blb_MailBLOB;<>SYS_i_Platform)
	
	//$_pic_Picture:=ITK_Blob2Pict ($_blb_MailBLOB)
	$_pic_Picture:=BLOBtoPicture($_blb_MailBLOB)  //replaced  ITK_Blob2Pict 14/03/08
	
	IWS_PutInMailQueue($_t_SMTPHost; $_pic_Picture)
	
	$0:=0
	
Else 
	
	$0:=-1
	
End if 
ERR_MethodTrackerReturn("IWS_SMTPMessageBG"; $_t_oldMethodName)