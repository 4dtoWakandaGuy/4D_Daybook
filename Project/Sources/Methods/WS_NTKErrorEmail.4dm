//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_NTKErrorEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: WS_NTKErrorEmail
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Err_bo_PrefShowChainInErrorEmai; $_bo_NoTrack; $_bo_UnabletoWriteLog; SYS_bo_NoTrack)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_MaxTries; $_l_NumberOfTries; $_l_Retries; $_l_Process)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_DataChanges; $_t_EmailAttachment; $_t_EmailFromAddress)
	C_TEXT:C284($_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_ErrorText; $_t_errorTrackText; $_t_NonCallChainText; $_t_oldMethodName; $1; EMAIL_t_SendCalledFrom; EMAIL_t_EmailType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_NTKErrorEmail")
DB_ErrorReportSettings
//IWS_NTKErrorEmail

//Added 12/03/09 -kmw

//Called in new process from IWS_NTKErrorHandler

//$1=Email Text




$_t_ErrorText:=$1
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	SYS_bo_NoTrack:=True:C214
	
	LOGIN_SetEmail
	
	
	SYS_bo_NoTrack:=$_bo_NoTrack
End if 
CLEAR SEMAPHORE:C144("InitEmail")

If (<>Email_bo_PersonInited=False:C215)
	
	//LOGIN_SetEmail
	
	
	
	
	$_l_MaxTries:=30
	$_l_NumberOfTries:=0
	$_l_Retries:=0
	
	While ((Process state:C330($_l_Process)>=0) & ($_l_NumberOfTries<$_l_MaxTries))
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
		$_l_NumberOfTries:=$_l_NumberOfTries+1
	End while 
	
	If (Process state:C330($_l_Process)>=0)
		$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
		SYS_bo_NoTrack:=True:C214
		$_bo_UnabletoWriteLog:=LOG_text("'LOGIN_SetEmail' which was called in a new process from 'IWS_NTKErrorEmail' appea"+"red frozen and therefore was likely unable to initilise"+" email settings for User ID '"+String:C10(<>PER_l_CurrentUserID)+"'"; "DaybookNTKErrors.txt")  //Record all NTK errors to disk"
		SYS_bo_NoTrack:=$_bo_NoTrack
	End if 
	
End if 



Case of   //Sender Address
	: (<>Per_at_PersonnelNames_EmailFrom#"")
		$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
	: (<>DB_t_UserGrEmailSMTP#"")
		$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
	Else 
		$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
End case 
If ($_t_EmailFromAddress#"")
	//TRACE
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	SYS_bo_NoTrack:=True:C214
	EMAIL_t_EmailType:="To"
	$_t_EmailSentTo:="To"
	$_t_EmailAttachment:=""
	
	$_t_errorTrackText:=ERR_GetTracking
	If ($_t_errorTrackText="")
		$_t_errorTrackText:="(No Tracking Info Found)"
	End if 
	$_t_DataChanges:=ERR_GetDataChanges
	If ($_t_DataChanges="")
		$_t_DataChanges:="(No Data Change Info Found)"
	End if 
	
	If (<>Err_bo_PrefShowChainInErrorEmai)
		$_t_EmailText:=DB_GetDebugInfo
		$_t_EmailText:=$_t_EmailText+DB_GetOrganisation
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+$_t_ErrorText
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Tracking: "+$_t_errorTrackText
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Data Change: "+$_t_DataChanges
	Else 
		$_t_EmailText:=DB_GetDebugInfo
		$_t_EmailText:=$_t_EmailText+DB_GetOrganisation
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+$_t_NonCallChainText
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Tracking: "+$_t_errorTrackText
		$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Data Change: "+$_t_DataChanges
	End if 
	
	
	
	
	EMAIL_t_SendCalledFrom:="WS_NTKErrorEmail"
	$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
	
	
	
	SYS_bo_NoTrack:=$_bo_NoTrack  //False  `11/03/09 v631b120p -kmw
	
Else 
	//$_bo_NoTrack:=SYS_bo_NoTrack  `11/03/09 v631b120p -kmw
	//SYS_bo_NoTrack:=True  `11/03/09 v631b120p -kmw
	//If (◊ShowCallChainInErrors)
	//Gen_Alert ($_t_ErrorText;"Cancel")
	//Else
	//Gen_Alert ($_t_NonCallChainText;"Cancel")
	//End if
	//SYS_bo_NoTrack:=$_bo_NoTrack  `11/03/09 v631b120p -kmw
	
	//This is in a new process so don't want an alert - do nothing other than note that we could not email...
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	SYS_bo_NoTrack:=True:C214
	$_bo_UnabletoWriteLog:=LOG_text("'IWS_NTKErrorEmail' was unable to email error message due to not being able to de"+"t"+"ermine a from ad"+"dress."; "DaybookNTKErrors.txt")  //Already should have logged the error on disk so just note that we couldn't email it
	SYS_bo_NoTrack:=$_bo_NoTrack
End if 
ERR_MethodTrackerReturn("WS_NTKErrorEmail"; $_t_oldMethodName)