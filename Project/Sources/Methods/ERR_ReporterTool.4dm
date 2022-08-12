//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: ERR_ReporterTool
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
//NG this method is used to report an error or feature request for Daybook
If (<>Email_bo_Enabled)
	DB_ErrorReportSettings
	C_BOOLEAN:C305(<>Email_bo_PersonInited)
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	
	Case of   //Sender Address
		: (<>Per_at_PersonnelNames_EmailFrom#"")
			$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
		: (<>DB_t_UserGrEmailSMTP#"")
			$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
		Else 
			$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
	End case 
	If ($_t_EmailFromAddress#"")
		EMAIL_t_EmailType:="To"  // 22/04/02 pb
		
		$_t_EmailSentTo:="To"
		$_t_EmailAttachment:=""
		$errTrackText:=ERR_GetTracking
		$DataChange:=ERR_GetDataChanges
		
		If (<>PER_t_CurrentUserName#"")
			$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$errTrackText+Char:C90(13)+$DataChange
			C_LONGINT:C283(Err_l_Manualreport)
			Err_l_Manualreport:=1
			Err_T_InfoText:=""
			Err_T_DetailText:=$_t_EmailText
			Err_T_UserText:=""
			$_l_WindowType:=1
			ARRAY TEXT:C222(Err_at_aAttachements; 0)
			ARRAY TEXT:C222(Err_at_aAttachementsPATH; 0)
			$_l_HalfScreenWidth:=Screen width:C187/2
			C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_HalfScreenWidth; 110; $_l_HalfScreenWidth; 110; $_l_WindowType)
			
			
			DIALOG:C40([USER:15]; "Error_Report")
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			CLOSE WINDOW:C154
			Case of 
				: (ERR_l_ReportAction=1)
					$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+Err_T_InfoText+Char:C90(13)+Err_T_DetailText+Char:C90(13)+Err_T_UserText
					//Need to add attackments list here
					$_t_EmailSentTo:="To"
					If ($_t_EmailText="")
						$_t_EmailText:="Here-from Err_ReporterTool   a blank email"
						
					End if 
					EMAIL_t_SendCalledFrom:="Error_ReporterTool"
					$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook User Issue Report"; ->Err_at_aAttachementsPATH; ->$_t_EmailText; False:C215)
			End case 
			
			
		Else 
		End if 
		
		
	Else 
		Gen_Alert("Sorry email is not set-up properly so this cannot be done"; "CANCEL")
		
	End if 
	
Else 
	
	Gen_Alert("Sorry you can only do this is email is set-up"; "CANCEL")
	
	
End if 