//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_NTKErrorHandler
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
	//C_UNKNOWN(NTK OS Error)
	//C_UNKNOWN(NTK Parameter Error)
	//C_UNKNOWN(NTK SSL Error)
	C_BOOLEAN:C305(<>Email_bo_Enabled; <>Email_bo_PersonInited; <>Err_bo_PrefShowChainInErrorEmai; <>Err_bo_PrefShowChainInErrorMess; $_bo_NoTrack; SYS_bo_NoTrack)
	C_LONGINT:C283($1; $2; $IWS_l_NTKErrorClass; $IWS_l_NTKSocket)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_AdditionalText; $_t_DataChanges; $_t_EmailAttachment)
	C_TEXT:C284($_t_EmailFromAddress; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_ErrorTrackingText; $_t_NonCallChainText; $_t_oldMethodName; $3; $IWS_l_NTKErrorMessageText; DB_t_ErrTrackingStack; EMAIL_t_SendCalledFrom)
	C_TEXT:C284(EMAIL_t_EmailType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_NTKErrorHandler")
DB_ErrorReportSettings
//IWS_NTKErrorHandler

//Added 06/10/08 -kmw

//Set via setup call to NTK plugin method "NTK Set Error Handler"
//(At time of writing this setup call is made in IWS_Init)

//$1=Socket longint
//$2=Error class longint
//$3=Error message text

$IWS_l_NTKSocket:=$1
//
$IWS_l_NTKErrorClass:=$2
//
$IWS_l_NTKErrorMessageText:=$3
//
//
$_t_AdditionalText:="Error in NTK Plugin Call."
Case of 
	: ($IWS_l_NTKErrorClass=NTK Parameter Error)
		$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+"Parameter Error - An invalid parameter was "+"passed to the plugin."
	: ($IWS_l_NTKErrorClass=NTK OS Error)
		$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+"OS Error - An error occurred at the OS lev"+"e"+"l."
	: ($IWS_l_NTKErrorClass=NTK SSL Error)
		$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+"SSL Error - An error occurred at the SSL le"+"vel (OpenSSL)."
End case 
$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+"Socket: "+String:C10($IWS_l_NTKSocket)
$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+"Error Details: "+$IWS_l_NTKErrorMessageText
//
$_t_NonCallChainText:=$_t_AdditionalText
If (<>Err_bo_PrefShowChainInErrorMess) | (<>Err_bo_PrefShowChainInErrorEmai)
	
	$_t_AdditionalText:=$_t_AdditionalText+Char:C90(13)+Char:C90(13)
	If (DB_t_ErrTrackingStack="")
		$_t_AdditionalText:=$_t_AdditionalText+"Call Chain: "+"(No Call Chain Info Found)"
	Else 
		
		$_t_AdditionalText:=$_t_AdditionalText+"Call Chain: "+DB_t_ErrTrackingStack
		
	End if 
End if 
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")

If (<>Email_bo_Enabled)
	
	Case of   //Sender Address
		: (<>Per_at_PersonnelNames_EmailFrom#"")
			$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
		: (<>DB_t_UserGrEmailSMTP#"")
			$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
		Else 
			$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
	End case 
	If ($_t_EmailFromAddress#"")
		
		$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
		//TRACE
		SYS_bo_NoTrack:=True:C214
		
		EMAIL_t_EmailType:="To"
		$_t_EmailSentTo:="To"
		$_t_EmailAttachment:=""
		
		$_t_ErrorTrackingText:=ERR_GetTracking
		If ($_t_ErrorTrackingText="")
			$_t_ErrorTrackingText:="(No Tracking Info Found)"
		End if 
		$_t_DataChanges:=ERR_GetDataChanges
		If ($_t_DataChanges="")
			$_t_DataChanges:="(No Data Change Info Found)"
		End if 
		
		If (<>Err_bo_PrefShowChainInErrorEmai)
			$_t_EmailText:=DB_GetDebugInfo
			$_t_EmailText:=$_t_EmailText+DB_GetOrganisation
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+$_t_AdditionalText
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Tracking: "+$_t_ErrorTrackingText
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Data Change: "+$_t_DataChanges
		Else 
			$_t_EmailText:=DB_GetDebugInfo
			$_t_EmailText:=$_t_EmailText+DB_GetOrganisation
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+$_t_NonCallChainText
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Tracking: "+$_t_ErrorTrackingText
			$_t_EmailText:=$_t_EmailText+Char:C90(13)+Char:C90(13)+"Data Change: "+$_t_DataChanges
		End if 
		EMAIL_t_SendCalledFrom:="IWS_NTKErrorHandler"
		$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
		
		SYS_bo_NoTrack:=$_bo_NoTrack
		
	Else 
		$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
		//TRACE
		SYS_bo_NoTrack:=True:C214
		
		If (<>Err_bo_PrefShowChainInErrorMess)
			Gen_Alert($_t_AdditionalText; "Cancel")
		Else 
			Gen_Alert($_t_NonCallChainText; "Cancel")
		End if 
		SYS_bo_NoTrack:=$_bo_NoTrack
	End if 
Else 
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	//TRACE
	SYS_bo_NoTrack:=True:C214
	If (<>Err_bo_PrefShowChainInErrorMess)
		Gen_Alert($_t_AdditionalText; "Cancel")
	Else 
		Gen_Alert($_t_NonCallChainText; "Cancel")
	End if 
	SYS_bo_NoTrack:=$_bo_NoTrack
End if 
ERR_MethodTrackerReturn("IWS_NTKErrorHandler"; $_t_oldMethodName)