//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_EmailCollect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_MessageNumbers; 0)
	ARRAY LONGINT:C221($_al_MessageSizes; 0)
	//ARRAY LONGINT(SD2_AL_PersonIDS;0)
	ARRAY TEXT:C222($_at_EnclosuresListnclosureList; 0)
	ARRAY TEXT:C222($_at_MessageIDS; 0)
	//ARRAY TEXT(SD2_at_AttachmentDocs;0)
	C_BOOLEAN:C305($_bo_CreateDiary)
	C_DATE:C307(SD2_d_DateSent)
	C_LONGINT:C283($_l_AttachementsIndex; $_l_docCharIndex; $_l_Error; $_l_FolderIsOK; $_l_MessageCount; $_l_MessageIndex; $_l_MessageSize; $_l_offset; $_l_POP3ID; $_l_TextLength; $_l_AppendIndex)
	C_LONGINT:C283($_l_AttachementsIndex; $_l_docCharIndex; $_l_Error; $_l_FolderIsOK; $_l_MessageCount; $_l_MessageIndex; $_l_MessageSize; $_l_offset; $_l_POP3ID; $_l_TextLength; SD_l_ApopLogin)
	C_TEXT:C284($_t_DocumentCodeOLD; $_t_DocumentName; $_t_EmailReference; $_t_Extension; $_t_FolderPath; $_t_MessageText; $_t_oldMethodName; $_t_TempFolderPath; DOC_t_DocumentCode; Folder separator:K24:12; SD2_T_EMailPassword)
	C_TEXT:C284(SD2_T_EmailPopServer; SD2_T_FromEmailAddress; SD2_T_FromName; $_t_ApplicationPath; $_t_DocumentCodeOLD; $_t_DocumentName; $_t_EmailReference; $_t_Extension; $_t_FolderPath; $_t_MessageText; $_t_oldMethodName)
	C_TEXT:C284($_t_TempFolderPath; DOC_t_DocumentCode; SD2_T_EmailAccountName; SD2_T_EMailPassword; SD2_T_EmailPopServer; SD2_T_FromEmailAddress; SD2_T_FromName)
	C_TIME:C306(SD2_ti_TimeSent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EmailCollect")

If (False:C215)
	
End if 

$_t_oldMethodName:=ERR_MethodTracker("SD2_EmailCollect")

//This method will watch a single email addresss.
//this only runs on 4D server(or single user) so the files don;t need to be moved. the 'temp' folder will be the document folder which is already structured to subdivide. This will create folders for emails and attachments as well

//It will collect incoming mail from that address and create a diary and document with an immediate reminder for the person the email came from.
//if that person cannot be found then it will go to a predifined person
//1) Setup a TEMP folder for incoming mails
//Folder separator:=DB_DirSymbol 
$_t_ApplicationPath:=PathFromPathName(Data file:C490)
$_t_FolderPath:=$_t_ApplicationPath+"EMAILS"  //make a folder for the folders
$_l_FolderIsOK:=Test path name:C476($_t_FolderPath)
If ($_l_FolderIsOK<0)  //folder does not exist
	//so create it
	CREATE FOLDER:C475($_t_FolderPath)
End if 
$_t_FolderPath:=$_t_FolderPath+Folder separator:K24:12+String:C10(Year of:C25(Current date:C33(*)))
If (Test path name:C476($_t_FolderPath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_FolderPath)
End if 
SD2_CheckDefaultAction("IMR")
QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1="IMR")
SD2_ActionAttributesToArrays


$_l_Error:=POP3_SetPrefs(-1; $_t_TempFolderPath; $_t_TempFolderPath)  // stripLineFeed; msgFolder; attachFolder
If ($_l_Error=0)
	$_l_Error:=POP3_Login(SD2_T_EmailPopServer; SD2_T_EmailAccountName; SD2_T_EMailPassword; SD_l_ApopLogin; $_l_POP3ID)
	POP3_Login
	If ($_l_Error=0)
		$_l_Error:=POP3_BoxInfo($_l_POP3ID; $_l_MessageCount; $_l_MessageSize)
		If ($_l_Error=0)
			If ($_l_MessageCount>0)
				ARRAY LONGINT:C221($_al_MessageSizes; 0)
				ARRAY LONGINT:C221($_al_MessageNumbers; 0)
				ARRAY TEXT:C222($_at_MessageIDS; 0)
				$_l_Error:=POP3_MsgLstInfo($_l_POP3ID; 1; $_l_MessageCount; $_al_MessageSizes; $_al_MessageNumbers; $_at_MessageIDS)
				For ($_l_MessageIndex; 1; Size of array:C274($_at_MessageIDS))
					If (Not:C34(SD2_TestEmailReceived($_at_MessageIDS{$_l_MessageIndex})))
						$_bo_CreateDiary:=False:C215
						CREATE RECORD:C68([DOCUMENTS:7])
						[DOCUMENTS:7]EMail_ServerDocID:24:=$_at_MessageIDS{$_l_MessageIndex}
						[DOCUMENTS:7]Document_Type:13:="IMR"
						$_l_Error:=POP3_Download($_l_POP3ID; $_al_MessageNumbers{$_l_MessageIndex}; 0; $_t_DocumentName)
						
						If ($_l_Error=0)  // Get and store a copy of the message header.
							$_l_offset:=0
							$_l_TextLength:=MAXTEXTLENBEFOREV11:K35:3
							$_l_Error:=MSG_GetHeaders($_t_DocumentName; $_l_offset; $_l_TextLength; $_t_MessageText)
							
							[DOCUMENTS:7]EMail_Header:25:=$_t_MessageText
							
							
							If ($_l_Error=0)
								$_l_Error:=MSG_FindHeader($_t_DocumentName; "Subject"; $_t_MessageText)
								[DOCUMENTS:7]Heading:2:=$_t_MessageText
							End if 
							
							// Get the body text.
							If ($_l_Error=0)
								$_l_offset:=0
								$_l_TextLength:=MAXTEXTLENBEFOREV11:K35:3
								$_l_Error:=MSG_GetBody($_t_DocumentName; $_l_offset; $_l_TextLength; $_t_MessageText)
								[DOCUMENTS:7]Text:3:=$_t_MessageText
							End if 
							If ($_l_Error=0)
								$_l_Error:=MSG_FindHeader($_t_DocumentName; "From"; $_t_MessageText)
								SD2_ParseEmailAddress($_t_MessageText; ->SD2_T_FromName; ->SD2_T_FromEmailAddress)
								If (SD2_T_FromName="")
									SD2_T_FromName:=SD2_T_FromEmailAddress
								End if 
							End if 
							If ($_l_Error=0)
								$_l_Error:=MSG_FindHeader($_t_DocumentName; "Date"; $_t_MessageText)
								SD2_GetDateandTimeFromString($_t_MessageText; ->SD2_d_DateSent; ->SD2_ti_TimeSent)
							End if 
							[DOCUMENTS:7]Document_Class:14:=-14
							$_t_DocumentCodeOLD:=DOC_t_DocumentCode
							Let_No("IE")
							[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
							DOC_t_DocumentCode:=$_t_DocumentCodeOLD
							
							DB_SaveRecord(->[DOCUMENTS:7])
							$_t_EmailReference:=[DOCUMENTS:7]Document_Code:1
							$_bo_CreateDiary:=True:C214
							ARRAY TEXT:C222(SD2_at_AttachmentDocs; 0)
							//At this point need to save the document...need the attachment thread stored so can open the email correctly
							
							// Get any attachments. Decode if possible. Save them in the [EM4D_ATTACHMENT]
							//   table as a BLOB.
							If ($_l_Error=0)
								$_t_TempFolderPath:=SD2_SetDocumentPath
								ARRAY TEXT:C222($_at_EnclosuresListnclosureList; 0)
								$_l_Error:=MSG_Extract($_t_DocumentName; 1; $_t_TempFolderPath; $_at_EnclosuresListnclosureList)
								For ($_l_AttachementsIndex; 1; Size of array:C274($_at_EnclosuresListnclosureList))
									//``
									If (Test path name:C476($_t_TempFolderPath+Folder separator:K24:12+$_at_EnclosuresListnclosureList{$_l_AttachementsIndex})=Is a document:K24:1)
										$_t_DocumentName:=FileNamefromPath($_t_TempFolderPath+Folder separator:K24:12+$_at_EnclosuresListnclosureList{$_l_AttachementsIndex})
										CREATE RECORD:C68([DOCUMENTS:7])
										[DOCUMENTS:7]Document_Class:14:=-15  //Email attachment==really a document but filtered out of other stuff
										[DOCUMENTS:7]DOC_PATH:21:=$_t_TempFolderPath+Folder separator:K24:12+$_at_EnclosuresListnclosureList{$_l_AttachementsIndex}
										GET DOCUMENT ICON:C700([DOCUMENTS:7]DOC_PATH:21; [DOCUMENTS:7]DOC_ICON:20; 16)
										$_t_DocumentName:=DocNameFromPath([DOCUMENTS:7]DOC_PATH:21)
										[DOCUMENTS:7]Heading:2:=$_t_DocumentName
										For ($_l_docCharIndex; Length:C16($_t_DocumentName); 1; -1)
											If ($_t_DocumentName[[$_l_docCharIndex]]=".")
												$_t_Extension:=Substring:C12($_t_DocumentName; $_l_docCharIndex; Length:C16($_t_DocumentName))
												$_l_docCharIndex:=0
											End if 
										End for 
										//[DOCUMENTS]DOC_CREATOR:=_o_Document creator([DOCUMENTS]DOC_PATH)
										$_t_DocumentCodeOLD:=DOC_t_DocumentCode
										Let_No("IA")
										[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
										DOC_t_DocumentCode:=$_t_DocumentCodeOLD
										DB_SaveRecord(->[DOCUMENTS:7])  // This should set the OK variable to 1 for us.
										APPEND TO ARRAY:C911(SD2_at_AttachmentDocs; [DOCUMENTS:7]Document_Code:1)
									Else 
										
									End if 
								End for 
								
							End if 
							If (Size of array:C274(SD2_at_AttachmentDocs)>0)  //The email has attachments-record them on the email in the blob(not I may modify outgoing emails to do this as well)]
								For ($_l_AppendIndex; 1; Size of array:C274(SD2_at_AttachmentDocs))
									QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_EmailReference)
									SET BLOB SIZE:C606([DOCUMENTS:7]Email_AttachedDocCodes:26; 0)
									VARIABLE TO BLOB:C532(SD2_at_AttachmentDocs{$_l_AppendIndex}; [DOCUMENTS:7]Email_AttachedDocCodes:26; *)
								End for 
								DB_SaveRecord(->[DOCUMENTS:7])
							End if 
							
						End if 
						If ($_bo_CreateDiary)
							ARRAY LONGINT:C221(SD2_AL_PersonIDS; 0)
							SD2_FindEmailOwner(SD2_T_FromName; SD2_T_FromEmailAddress; ->SD2_AL_PersonIDS)
							SD2_CreateIncomingMailreceipt(->SD2_AL_PersonIDS; [DOCUMENTS:7]Heading:2; SD2_d_DateSent; SD2_ti_TimeSent; [DOCUMENTS:7]Document_Code:1)
							
						End if 
					End if 
				End for 
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_EmailCollect"; $_t_oldMethodName)
