//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: ERR_ArchiveLogFile
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
$_t_oldMethodName:=ERR_MethodTracker("ERR_ArchiveLogFile")


C_TEXT:C284($_t_DocumentName; $_t_LogArchivePath)
C_BOOLEAN:C305(<>Email_bo_Enabled)
C_LONGINT:C283($_l_Applicationtype)

$_l_Applicationtype:=Application type:C494

$_t_DocumentName:="Object_access_Log.txt"
$_t_Documentpath:=DB_GetDocumentPath
$_t_DocumentName:=$_t_Documentpath+$_t_DocumentName
C_BOOLEAN:C305(<>Email_bo_PersonInited)
C_LONGINT:C283(<>SYS_l_LoggedInaccount)
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")


If (Test path name:C476($_t_DocumentName)=Is a document:K24:1)
	
	$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName)
	$_l_Start:=2
	$_l_DocumentSize:=Get document size:C479($_ti_DocumentRef; *)
	Repeat 
		SET DOCUMENT POSITION:C482($_ti_DocumentRef; -($_l_Start); 2)
		RECEIVE PACKET:C104($_ti_DocumentRef; $_t_ThisChar; 1)
		$_l_Start:=$_l_Start+1
	Until ($_t_ThisChar=Char:C90(13)) | ($_l_Start>$_l_DocumentSize)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName)
	SET DOCUMENT POSITION:C482($_ti_DocumentRef; -($_l_Start-1); 2)
	$_l_DocumentLength:=$_l_DocumentSize-($_l_DocumentSize-$_l_Start)
	If ($_l_DocumentLength>32000)
		$_l_DocumentLength:=32000
	End if 
	RECEIVE PACKET:C104($_ti_DocumentRef; $_t_LastLine; $_l_DocumentLength)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_l_ExitPosition:=Position:C15("Clean Exit"; $_t_LastLine)
	If ($_l_ExitPosition=0)
		$_l_ExitPosition:=Position:C15("Object Log Turned Off"; $_t_LastLine)
	End if 
	If ($_l_ExitPosition=0)
		//service did not quit cleanly
		If (<>Email_bo_Enabled)
			//well actually the data is not loaded
			DOC_bo_EmailEnabled:=<>Email_bo_Enabled
		Else 
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (<>SYS_l_LoggedInaccount=0)
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
			Else 
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
			End if 
			<>PER_t_CurrentEmailFrom:=[USER:15]Email From:232
			<>EMAIL_t_DefaultSMTPhost:=[USER:15]DEF_SMTP_HOST:236
			<>EMAIL_t_DefaultReplyToAddress:=[USER:15]Email From:232
			<>DefCopytoaddress:=[USER:15]DEF_Copy_to_email:237
			<>DefSignature:=[USER:15]Default_mail_signature:238
			<>Email_bo_Enabled:=(<>EMAIL_t_DefaultSMTPhost#"")
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			DOC_bo_EmailEnabled:=<>Email_bo_Enabled
			
		End if 
		If (DOC_bo_EmailEnabled)
			$_t_EmailSentTo:="To"
			$_t_EmailAttachment:=$_t_DocumentName
			$_t_ErrorTrackText:=""
			$_t_DataChange:=""
			ErrorReportPerson:="Support"
			ErrorReportAddress:="nigel.greenlee@me.com"
			$_t_EmailText:="Error File"+"From Machine"+Current machine:C483+" "+Current system user:C484
			<>Per_bo_EmailCOPY:=False:C215
			<>UserGr_EmailCopytoOption:=False:C215
			EMAIL_t_SendCalledFrom:="Error_ArchiveLogFIle"
			$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->ErrorReportPerson; ->ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "AUTO Daybook Error Log File"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
			
		End if 
		
	End if 
	If ($_l_Applicationtype=4D Remote mode:K5:5)
		$_t_LogArchivePath:=PathFromPathName(DB_GetDocumentPath)+"LogArchives"
	Else 
		$_t_LogArchivePath:=PathFromPathName(DB_GetDocumentPath)+"LogArchives"
	End if 
	If (Test path name:C476($_t_LogArchivePath)#Is a folder:K24:2)
		CREATE FOLDER:C475($_t_LogArchivePath)
	End if 
	$_t_LogArchivePath:=$_t_LogArchivePath+Directory_Symbol+"Log"+String:C10(GEN_TimeDateStamp)+".txt"
	MOVE_TO_ARCHIVE($_t_DocumentName; $_t_LogArchivePath)
End if 


ERR_MethodTrackerReturn("ERR_ArchiveLogFile"; $_t_oldMethodName)