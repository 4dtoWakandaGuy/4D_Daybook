//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_SendEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; Lic_bo_NotifiedToUs)
	C_DATE:C307(Lic_d_LicenceDate)
	C_LONGINT:C283($_l_Error)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_IPAddress)
	C_TEXT:C284($_t_oldMethodName; $_t_Subnet; EMAIL_t_EmailType; EMAIL_t_SendCalledFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_SendEmail")
DB_ErrorReportSettings
// Licence_SendEmail
// Sends an email to notify us when a licence is entered
// 27/03/03 pb
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")
EMAIL_t_EmailType:="To"  // 22/04/02 pb
$_t_EmailSentTo:="To"
$_t_EmailAttachment:=""
$_l_Error:=IT_MyTCPAddr($_t_IPAddress; $_t_Subnet)
$_t_EmailText:=""
$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+"The following licence number was installed: "+Lic_t_LicenceNumber+Char:C90(13)
$_t_EmailText:=$_t_EmailText+"Date of installation: "+String:C10(Lic_d_LicenceDate)+Char:C90(13)
If ($_t_IPAddress#"")
	$_t_EmailText:=$_t_EmailText+"User's IP address: "+$_t_IPAddress+Char:C90(13)
End if 
$_t_EmailText:=$_t_EmailText+"Company name: "+[USER:15]Organisation:1+Char:C90(13)+"Address: "+[USER:15]Add1:2+" "+[USER:15]Add2:3+" "+[USER:15]Town:4+" "+[USER:15]County:5+" "+[USER:15]Postcode:6+" "+[USER:15]Country:7+Char:C90(13)
$_t_EmailText:=$_t_EmailText+"Phone: "+[USER:15]Telephone:8+Char:C90(13)+"Fax: "+[USER:15]Fax:9+Char:C90(13)
EMAIL_t_SendCalledFrom:="Licence_SendEmail"
$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Licence Installed Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
If ($_t_EmailID#"")  // email was succesfully sent
	Lic_bo_NotifiedToUs:=True:C214
Else 
	Lic_bo_NotifiedToUs:=False:C215
End if 
ERR_MethodTrackerReturn("Licence_SendEmail"; $_t_oldMethodName)