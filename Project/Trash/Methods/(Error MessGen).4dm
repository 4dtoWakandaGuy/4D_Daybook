//%attributes = {"invisible":true}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: Error MessGen
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
C_BOOLEAN:C305(<>Err_bo_HandlerInited)
C_TEXT:C284($1)
DB_ErrorReportSettings
If ($1#"")
	If (<>Err_bo_HandlerInited)
		Gen_Alert($1; "Cancel")
		C_BOOLEAN:C305(<>Email_bo_PersonInited)
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
		$errTrackText:=ERR_GetTracking
		$DataChange:=ERR_GetDataChanges
		
		$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$1+Char:C90(13)+$errTrackText+Char:C90(13)+$DataChange
		If ($_t_EmailText="")
			$_t_EmailText:="Here-from Error MessGen  a blank email"
			
		End if 
		EMAIL_t_SendCalledFrom:="Error MessGen"
		$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
		
		
	Else 
		Error_MessIM($1; 0)
		OK:=0
		<>SYS_l_CancelProcess:=Current process:C322
	End if 
End if 