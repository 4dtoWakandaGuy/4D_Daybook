//%attributes = {}
If (False:C215)
	//Project Method Name:      Email_Attachment_From_Server
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_EmailAttachmentBLOB; vEmail_Attachment_BLOB)
	C_BOOLEAN:C305($_bo_EmailGotAttachment; DOC_bo_EmailGotAttachment)
	C_LONGINT:C283(<>DOC_ServerComm; $_l_Process; $_l_ServerComm; $_l_Thermo; $_l_TIcks)
	C_TEXT:C284($_t_AttachmentCreator; $_t_EmailAttachmentType; $_t_LocalAttachFolder; $_t_LocalFolderPath; $_t_oldMethodName; $0; $1; $2; Email_Attachment_Creator; Email_Attachment_Type)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Email_Attachment_From_Server")
//$1 filename
//$2 Server file path
//$0 Local file path
//new comment

START_SEMAPHORE("GetAttachmentIntoBlob")  //Only one can update version at a time
If (Application type:C494=4D Remote mode:K5:5)
	$_l_Process:=Execute on server:C373("DS_attachmenttoBLOB"; 64000; "Attachment Into BLOB"; $2)
Else 
	$_l_Process:=New process:C317("DS_attachmenttoBLOB"; 64000; "Attachment Into BLOB"; $2)
	
End if 
Repeat 
	GET PROCESS VARIABLE:C371(-1; <>DOC_ServerComm; $_l_ServerComm)
	If ($_l_ServerComm<=0)
		DelayTicks(2)
	End if 
Until ($_l_ServerComm>0)  //this is because if we test the semaphore it may not be set yet..this stops us testing it till it is set
//by the time we get here it could already be unset because the server may have done all its work
While (Test semaphore:C652("Lifting_Document_On_Server"))  //note this does not set the sempahore
	DelayTicks(2)
End while 

$_t_LocalAttachFolder:="Db_Email_Attachments"
$_t_LocalFolderPath:=DB_GetDocumentPath+$_t_LocalAttachFolder+Directory_Symbol

//DelayTicks (60)  `Give 1 sec to server to put doc into blob
//SET_THERMOMETER ("Opening document please wait...";20)

If (Test path name:C476($_t_LocalFolderPath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_LocalFolderPath)
End if 

$_t_LocalFolderPath:=$_t_LocalFolderPath+$1

//DelayTicks (60)  `Give 1 more sec to server to put doc into blob
$_l_TIcks:=Tickcount:C458
//SET_THERMOMETER ("Opening document please wait...";30)
OK:=0
Error:=0
$_l_Thermo:=40
$0:=""
Repeat 
	//DelayTicks (60)<== NG with the other delays above this was a 3 second delay  regardless of anything too hit and miss
	
	GET PROCESS VARIABLE:C371($_l_Process; DOC_bo_EmailGotAttachment; $_bo_EmailGotAttachment)
	If ($_bo_EmailGotAttachment)
		GET PROCESS VARIABLE:C371($_l_Process; vEmail_Attachment_BLOB; $_blb_EmailAttachmentBLOB)
		//GET PROCESS VARIABLE($_l_Process;Email_Attachment_Creator;$_t_AttachmentCreator)
		GET PROCESS VARIABLE:C371($_l_Process; Email_Attachment_Type; $_t_EmailAttachmentType)
	End if 
	
	If ($_bo_EmailGotAttachment)
		
		If (Test path name:C476($_t_LocalFolderPath)=Is a document:K24:1)  //Delete if there is any old  doc with this name already
			DELETE DOCUMENT:C159($_t_LocalFolderPath)
			DelayTicks(20)  //putting this in because it may be a cause of error if the os has not already deleted it
		End if 
		
		If (Is macOS:C1572)
			$_ti_DocumentRef:=DB_CreateDocument($_t_LocalFolderPath)  // Save the document of your choice
		Else 
			If ($_t_EmailAttachmentType#"")
				$_ti_DocumentRef:=DB_CreateDocument($_t_LocalFolderPath; $_t_EmailAttachmentType)  // Save the document of your choice
			Else 
				$_ti_DocumentRef:=DB_CreateDocument($_t_LocalFolderPath)  // Save the document of your choice
			End if 
		End if 
		
		If (OK=1)  // If a document has been created
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			BLOB TO DOCUMENT:C526($_t_LocalFolderPath; $_blb_EmailAttachmentBLOB)
			If ((OK=1) & (Test path name:C476($_t_LocalFolderPath)=Is a document:K24:1))
				
				If (Is macOS:C1572)
					//If ($_t_AttachmentCreator#"")
					//_O_SET DOCUMENT CREATOR($_t_LocalFolderPath;$_t_AttachmentCreator)
					//Else
					//_O_SET DOCUMENT CREATOR($_t_LocalFolderPath;"    ")
					//End if
					//If ($_t_EmailAttachmentType#"")
					//_O_SET DOCUMENT TYPE($_t_LocalFolderPath;$_t_EmailAttachmentType)
					//Else
					//_O_SET DOCUMENT TYPE($_t_LocalFolderPath;"    ")
					//End if
				End if 
				
				$0:=$_t_LocalFolderPath
				
			End if 
		End if 
	Else 
		
		//if for some reason we get here then we need to delay...don't think there is any reason this should happen
		DelayTicks(20)
		
	End if 
	
	
	SET_THERMOMETER("Opening document please wait..."; $_l_Thermo)
	$_l_Thermo:=$_l_Thermo+10
Until ((Error#0) | ($_bo_EmailGotAttachment) | ((Tickcount:C458-$_l_TIcks)>2800) | (OK=1))
//NG The following is pointless...
//$_l_Process:=Execute on server("Reset_Attachment_Var";32000;"Reset_Attachment_Variable";False)  `Reset_Attachment_Var for others use
SET_THERMOMETER("Opening document please wait..."; 80)
Stop_Semaphore("GetAttachmentIntoBlob")
ERR_MethodTrackerReturn("Email_Attachment_From_Server"; $_t_oldMethodName)