//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_SendEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 17:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; $0)
	C_LONGINT:C283($_l_Error)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_oldMethodName; $1; $2; $3; $4)
	C_TEXT:C284(EMAIL_t_EmailType; EMAIL_t_SendCalledFrom; t_BackupAdminEmailFrom; t_BackupAdminEmailto; t_BackupAdminName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_SendEmail")
//All params are a must otherwise email will not be sent
//$1 Email Message From
//$2 Email Message To
//$3 Subject
//$4 Message Body


//C_TEXT($_t_EmailSentTo;t_BackupAdminName;t_BackupAdminEmailto;$_t_EmailAttachment;$_t_EmailText)

If (($1#"") & ($2#"") & ($3#"") & ($4#""))
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	
	
	EMAIL_t_EmailType:="To"
	$_t_EmailSentTo:="To"
	$_t_EmailAttachment:=""
	t_BackupAdminEmailFrom:=$1
	t_BackupAdminEmailto:=$2
	$_t_EmailText:=$4
	t_BackupAdminName:="Daybook Remote Backup"
	EMAIL_t_SendCalledFrom:="BP_SendEmail"
	$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->t_BackupAdminName; ->t_BackupAdminEmailto; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; $3; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
	
	If (False:C215)
		//$_l_Error:=SMTP_QuickSend ($MailSrvr_S80;$1;$2;$3;$4)
	End if 
	
	If ($_l_Error#0)
		//WEB_LOG("EMAIL ERR : "+String($_l_Error)+" EMAIL NOT Sent From "+$2+" to "+$1)
	End if 
	$0:=$_l_Error=0
Else 
	// WEB_LOG("EMAIL ERR : Email not enabled - "+$2+" - from "+$1+" - Subject "+$3+"
End if 
ERR_MethodTrackerReturn("BP_SendEmail"; $_t_oldMethodName)
