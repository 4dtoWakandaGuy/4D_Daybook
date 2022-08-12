//%attributes = {}

If (False:C215)
	//Project Method Name:      EMail_Send2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/10/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_LongPopUp;0)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Per_bo_EmailCOPY; <>UserGr_EmailCopytoOption; $_bo_AddressisValid; $_bo_Exit; $_bo_OK; $_Bo_RetryIfFail; $_bo_SendisOK; $_bo_ShowLongString; $_bo_Static; $10)
	C_BOOLEAN:C305(DB_bo_SendingEmail; Email_bo_TestMailing; Gen_bo_Create; GEN_Bo_ShowCreate; PER_bo_UseSSL)
	C_DATE:C307($_d_EmailDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BuildHosts; $_l_CountRecipients; $_l_EmailID; $_l_errorNumber; $_l_Index; $_l_Indexsadoc; $_l_MaxEmailRecipients; $_l_NumberOfRecipients; $_l_OK; $_l_PdfPosition)
	C_LONGINT:C283($_l_RecipientNum; $_l_SMTPAuthError; $_l_SMTPAuthType; $_l_SMTPError; $_l_SmtpSetPrefs; $_l_TestAddressIndex; Bsave; PER_l_UseAuthentication; Per_l_UserAuthtype; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_OBJECT:C1216($_obj_Mail; $_obj_ServerSetup; $_Obj_Status; $_obj_Transporter)
	C_POINTER:C301($_Ptr_attachments; $_Ptr_RecipientContexts; $_Ptr_RecipientEmailAddresses; $_ptr_RecipientNames; $_ptr_TextBody; $1; $2; $3; $8; $9)
	C_TEXT:C284(<>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserName; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>UserGr_EmailTo; $_t_AddressToText; $_t_AttachmentPath; $_t_BCCtoEmailAddress)
	C_TEXT:C284($_t_BCCtoName; $_t_CCtoEmailAddress; $_t_CCtoName; $_t_DocumentName; $_t_EmailBCC; $_t_EmailCC; $_t_EmailComments; $_t_EmailFrom; $_t_EmailReplyTo; $_t_EmailSenderName; $_t_EmailTo)
	C_TEXT:C284($_t_EncodedPath; $_t_oldMethodName; $_t_password; $_t_PersonnelOverRideSMTP; $_t_RequestPassword; $_t_RequestUser; $_t_SMTPErrorMessage; $_t_SMTPHeaderInfo; $_t_SMTPServer; $_t_Subject; $_t_user)
	C_TEXT:C284($0; $11; $12; $13; $14; $4; $5; $6; $7; DB_t_Methodname; DB_t_WindowTitle)
	C_TEXT:C284(PER_t_UserName; PER_t_UserPass; PER_t_UserPassword; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
	C_TIME:C306($_ti_DocumentRef; $_ti_EmailTime)
End if 
//Code Starts Here

If (False:C215)
	//Project Method Name:      Email_Send
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
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_LongPopUp;0)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Per_bo_EmailCOPY; <>UserGr_EmailCopytoOption; $_bo_AddressisValid; $_bo_Exit; $_bo_OK; $_Bo_RetryIfFail; $_bo_SendisOK; $_bo_ShowLongString; $_bo_Static; $10)
	C_BOOLEAN:C305(DB_bo_SendingEmail; Email_bo_TestMailing; Gen_bo_Create; GEN_Bo_ShowCreate; PER_bo_UseSSL)
	C_DATE:C307($_d_EmailDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BuildHosts; $_l_CountRecipients; $_l_EmailID; $_l_errorNumber; $_l_Index; $_l_Indexsadoc; $_l_MaxEmailRecipients; $_l_NumberOfRecipients; $_l_OK; $_l_PdfPosition)
	C_LONGINT:C283($_l_RecipientNum; $_l_SMTPAuthError; $_l_SMTPAuthType; $_l_SMTPError; $_l_SmtpSetPrefs; $_l_TestAddressIndex; Bsave; PER_l_UseAuthentication; Per_l_UserAuthtype; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_Ptr_attachments; $_Ptr_RecipientContexts; $_Ptr_RecipientEmailAddresses; $_ptr_RecipientNames; $_ptr_TextBody; $1; $2; $3; $8; $9)
	C_TEXT:C284(<>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserName; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>UserGr_EmailTo; $_t_AddressToText; $_t_AttachmentPath; $_t_BCCtoEmailAddress)
	C_TEXT:C284($_t_BCCtoName; $_t_CCtoEmailAddress; $_t_CCtoName; $_t_DocumentName; $_t_EmailBCC; $_t_EmailCC; $_t_EmailComments; $_t_EmailFrom; $_t_EmailReplyTo; $_t_EmailSenderName; $_t_EmailTo)
	C_TEXT:C284($_t_EncodedPath; $_t_oldMethodName; $_t_password; $_t_PersonnelOverRideSMTP; $_t_RequestPassword; $_t_RequestUser; $_t_SMTPErrorMessage; $_t_SMTPHeaderInfo; $_t_SMTPServer; $_t_Subject; $_t_user)
	C_TEXT:C284($0; $11; $12; $13; $14; $4; $5; $6; $7; DB_t_Methodname; DB_t_WindowTitle)
	C_TEXT:C284(PER_t_UserName; PER_t_UserPass; PER_t_UserPassword; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
	C_TIME:C306($_ti_DocumentRef; $_ti_EmailTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Email_Send")

//$_t_oldMethodName:=ERR_MethodTracker ("Email_Send")
$_bo_Exit:=True:C214  //Default is to exist but if an error of certain types is encountered we try again
DB_bo_SendingEmail:=True:C214  // To prevent recursive errors if one happens during send of an email
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")


DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=10)
	Repeat 
		
		//or a pointer to a variable or field with recipients
		//or a pointer to a variable or field with recipient email address
		//the next are optional
		
		
		//If ((GenValidatePointer ($_Ptr_RecipientContexts)) & (GenValidatePointer ($_ptr_RecipientNames)) & (GenValidatePointer ($_Ptr_RecipientEmailAddresses)) & (GenValidatePointer ($_Ptr_attachments)) & (GenValidatePointer ($_ptr_TextBody)))
		
		//this method will send an email
		//GET EMAIL DATA
		//email_send
		
		//bsw 13/10/03
		//bsw 13/10/03 ends
		Case of   //SMTP server address
			: (<>Per_t_PersonnelNames_EmailSMTP#"")
				$_t_SMTPServer:=<>Per_t_PersonnelNames_EmailSMTP
			: (<>DB_t_UserGrEmailSMTP#"")
				$_t_SMTPServer:=<>DB_t_UserGrEmailSMTP
			Else 
				$_t_SMTPServer:=<>EMAIL_t_DefaultSMTPhost
		End case 
		$_obj_MailServer:=New object:C1471
		//$_obj_MailServer.host:=$_t_SMTPServer
		//$_obj_MailServer.port:=465
		//
		//$_l_SMTPError:=SMTP_New($_l_EmailID)
		
		//$_l_SMTPError:=SMTP_Host($_l_EmailID; $_t_SMTPServer)
		
		$_l_NumberOfRecipients:=0
		$_t_EmailTo:=""
		$_t_EmailCC:=""
		$_t_EmailBCC:=""
		//$_l_SMTPError:=-1
		
		//$_l_EmailID:=0
		//$_l_SmtpSetPrefs:=SMTP_SetPrefs(1; 1; 0)
		$_t_PersonnelOverRideSMTP:=""
		$_Ptr_RecipientContexts:=$1
		$_ptr_RecipientNames:=$2
		$_Ptr_RecipientEmailAddresses:=$3
		
		If ($4="")
			$_t_EmailSenderName:=<>PER_t_CurrentUserName
		Else 
			$_t_EmailSenderName:=$4
		End if 
		
		If ($5="")
			$_t_EmailFrom:=<>PER_t_CurrentEmailFrom
		Else 
			$_t_EmailFrom:=$5
		End if 
		//$_obj_MailServer
		If ($6="")
			Case of   //Reply To address
				: (<>Per_t_PersonnelNames_EmailTo#"")
					$_t_EmailReplyTo:=<>Per_t_PersonnelNames_EmailTo
				: (<>DB_t_UserGrEmailSMTP#"")
					$_t_EmailReplyTo:=<>UserGr_EmailTo
				Else 
					$_t_EmailReplyTo:=<>EMAIL_t_DefaultReplyToAddress
			End case 
		Else 
			$_t_EmailReplyTo:=$6
		End if 
		$_t_Subject:=$7
		$_Ptr_attachments:=$8
		$_ptr_TextBody:=$9
		$_Bo_RetryIfFail:=$10
		If (Count parameters:C259>=12)
			$_t_CCtoName:=$11
			$_t_CCtoEmailAddress:=$12
			If (Count parameters:C259>=14)
				$_t_BCCtoName:=$13
				$_t_BCCtoEmailAddress:=$14
			End if 
		End if 
		
		
		//or a pointer to a variable or field with recipients
		//or a pointer to a variable or field with recipient email address
		//the next are optional
		
		Case of 
			: (Type:C295($_Ptr_RecipientContexts->)=21) | (Type:C295($_Ptr_RecipientContexts->)=18) | ((Type:C295($_ptr_RecipientNames->)=21) | (Type:C295($_ptr_RecipientNames->)=18))  //pointer to array=multiple recipients
				If (Type:C295($_Ptr_RecipientContexts->)=21) | (Type:C295($_Ptr_RecipientContexts->)=18)
					$_l_CountRecipients:=Size of array:C274($_Ptr_RecipientContexts->)
				Else 
					$_l_CountRecipients:=Size of array:C274($_ptr_RecipientNames->)
				End if 
			Else 
				$_l_CountRecipients:=1
		End case 
		If ($_l_CountRecipients>50)
			$_l_MaxEmailRecipients:=50  //DONT SEND to more than 50 people in one hit!
		Else 
			$_l_MaxEmailRecipients:=$_l_CountRecipients
		End if 
		$_l_RecipientNum:=1
		Repeat 
			If ($_l_RecipientNum+50>$_l_CountRecipients)
				$_l_MaxEmailRecipients:=$_l_CountRecipients-$_l_RecipientNum
			End if 
			
			Case of   //SMTP server address
				: ($_t_PersonnelOverRideSMTP#"")
					$_t_SMTPServer:=$_t_PersonnelOverRideSMTP
				: (<>Per_t_PersonnelNames_EmailSMTP#"")
					$_t_SMTPServer:=<>Per_t_PersonnelNames_EmailSMTP
				: (<>DB_t_UserGrEmailSMTP#"")
					$_t_SMTPServer:=<>DB_t_UserGrEmailSMTP
				Else 
					$_t_SMTPServer:=<>EMAIL_t_DefaultSMTPhost
			End case 
			
			$_d_EmailDate:=Current date:C33(*)
			$_ti_EmailTime:=Current time:C178(*)
			
			$_t_SMTPHeaderInfo:=$_t_EmailSenderName
			//$_t_EmailComments:="Sent via Daybook, 'the modular business system'."
			Case of 
				: ((Type:C295($_Ptr_RecipientContexts->)=21) | (Type:C295($_Ptr_RecipientContexts->)=18)) | ((Type:C295($_ptr_RecipientNames->)=21) | (Type:C295($_ptr_RecipientNames->)=18))
					//pointer to array=multiple recipients
					$_bo_Static:=False:C215
					$_bo_OK:=False:C215
					If ((Type:C295($_Ptr_RecipientContexts->)#21) & (Type:C295($_Ptr_RecipientContexts->)#18))
						$_bo_Static:=True:C214
						
						If ($_Ptr_RecipientContexts->="To")
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214
					End if 
					//"Felix Unger" <felix@pristine.com>
					If ($_bo_OK)
						For ($_l_Index; $_l_RecipientNum; $_l_RecipientNum+$_l_MaxEmailRecipients)
							$_l_NumberOfRecipients:=$_l_NumberOfRecipients+1
							If ($_bo_Static=False:C215)
								If ($_Ptr_RecipientContexts->{$_l_Index}="To")
									$_t_AddressToText:=$_Ptr_RecipientEmailAddresses->{$_l_Index}
									If ($_t_AddressToText#"")
										$_bo_AddressisValid:=False:C215
										For ($_l_TestAddressIndex; 1; Length:C16($_t_AddressToText))
											If (Character code:C91($_t_AddressToText[[$_l_TestAddressIndex]])=64)
												If ($_l_TestAddressIndex<Length:C16($_t_AddressToText))
													$_bo_AddressisValid:=True:C214
												End if 
											End if 
										End for 
										If ($_bo_AddressisValid)
											//here do a second test
											If ($_t_EmailTo#"")
												$_t_EmailTo:=$_t_EmailTo+","
											End if 
											$_t_EmailTo:=$_t_EmailTo+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
										End if 
									End if 
								End if 
							Else 
								If ($_Ptr_RecipientContexts->="To")
									$_t_AddressToText:=$_Ptr_RecipientEmailAddresses->{$_l_Index}
									If ($_t_AddressToText#"")
										$_bo_AddressisValid:=False:C215
										For ($_l_TestAddressIndex; 1; Length:C16($_t_AddressToText))
											If (Character code:C91($_t_AddressToText[[$_l_TestAddressIndex]])=64)
												If ($_l_TestAddressIndex<Length:C16($_t_AddressToText))
													$_bo_AddressisValid:=True:C214
												End if 
											End if 
										End for 
										If ($_bo_AddressisValid)
											///here do a second text
											
											If ($_t_EmailTo#"")
												$_t_EmailTo:=$_t_EmailTo+","
											End if 
											$_t_EmailTo:=$_Ptr_RecipientContexts->+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
										End if 
									End if 
								End if 
							End if 
						End for 
					Else 
						$_l_NumberOfRecipients:=0
					End if 
				Else   //  single recipeint
					$_l_NumberOfRecipients:=1
					$_t_EmailTo:=$_ptr_RecipientNames->+"  <"+$_Ptr_RecipientEmailAddresses->+">"
			End case 
			
			
			Case of 
				: ((Type:C295($_Ptr_RecipientContexts->)=21) | (Type:C295($_Ptr_RecipientContexts->)=18) | ((Type:C295($_ptr_RecipientNames->)=21) | (Type:C295($_ptr_RecipientNames->)=18)))  //pointer to array=multiple recipients
					//"Felix Unger" <felix@pristine.com>
					$_bo_Static:=False:C215
					$_bo_OK:=False:C215
					If ((Type:C295($_Ptr_RecipientContexts->)#21) & (Type:C295($_Ptr_RecipientContexts->)#18))
						$_bo_Static:=True:C214
						
						If ($_Ptr_RecipientContexts->="CC")
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214
					End if 
					If ($_bo_OK)
						For ($_l_Index; $_l_RecipientNum; $_l_RecipientNum+$_l_MaxEmailRecipients)
							//    $_l_NumberOfRecipients:=$_l_NumberOfRecipients+1
							If (Not:C34($_bo_Static))
								If ($_Ptr_RecipientContexts->{$_l_Index}="CC")
									If ($_t_EmailCC#"")
										$_t_EmailCC:=$_t_EmailCC+","
									End if 
									$_t_EmailCC:=$_t_EmailCC+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
								End if 
							Else 
								If ($_Ptr_RecipientContexts->="CC")
									If ($_t_EmailCC#"")
										$_t_EmailCC:=$_t_EmailCC+","
									End if 
									$_t_EmailCC:=$_Ptr_RecipientContexts->+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
								End if 
							End if 
						End for 
					End if 
				Else   //  single recipient
					
					If ($_t_CCtoName#"") & ($_t_CCtoEmailAddress#"")
						$_t_EmailCC:=$_t_CCtoName+"  <"+$_t_CCtoEmailAddress+">"
					Else 
						If ($_t_CCtoEmailAddress#"")
							$_t_EmailCC:=$_t_CCtoEmailAddress
						End if 
					End if 
					
					
			End case 
			Case of 
				: ((Type:C295($_Ptr_RecipientContexts->)=21) | (Type:C295($_Ptr_RecipientContexts->)=18) | ((Type:C295($_ptr_RecipientNames->)=21) | (Type:C295($_ptr_RecipientNames->)=18)))  //pointer to array=multiple recipients
					//"Felix Unger" <felix@pristine.com>
					$_bo_Static:=False:C215
					$_bo_OK:=False:C215
					If ((Type:C295($_Ptr_RecipientContexts->)#21) & (Type:C295($_Ptr_RecipientContexts->)#18))
						$_bo_Static:=True:C214
						
						If ($_Ptr_RecipientContexts->="BCC")
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214
					End if 
					If ($_bo_OK)
						For ($_l_Index; $_l_RecipientNum; $_l_RecipientNum+$_l_MaxEmailRecipients)
							// $_l_NumberOfRecipients:=$_l_NumberOfRecipients+1
							If (Not:C34($_bo_Static))
								If ($_Ptr_RecipientContexts->{$_l_Index}="BCC")
									If ($_t_EmailBCC#"")
										$_t_EmailBCC:=$_t_EmailBCC+","
									End if 
									$_t_EmailBCC:=$_t_EmailBCC+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
								End if 
							Else 
								If ($_Ptr_RecipientContexts->="BCC")
									If ($_t_EmailBCC#"")
										$_t_EmailBCC:=$_t_EmailBCC+","
									End if 
									$_t_EmailBCC:=$_Ptr_RecipientContexts->+$_ptr_RecipientNames->{$_l_Index}+" <"+$_Ptr_RecipientEmailAddresses->{$_l_Index}+">"
								End if 
							End if 
						End for 
					End if 
				Else   //  single recipeint
					
					If ($_t_BCCtoName#"") & ($_t_BCCtoEmailAddress#"")
						$_t_EmailBCC:=$_t_BCCtoName+"  <"+$_t_BCCtoEmailAddress+">"
					Else 
						If ($_t_BCCtoName#"")
							$_t_EmailBCC:=$_t_BCCtoEmailAddress
						End if 
						
					End if 
					
					
			End case 
			$_l_RecipientNum:=$_l_RecipientNum+$_l_NumberOfRecipients
			//we now have a maximum of 50 recipients
			If (<>Per_bo_EmailCOPY)
				If ($_t_EmailBCC#"")
					$_t_EmailBCC:=$_t_EmailBCC+","
				End if 
				$_t_EmailBCC:=$_t_EmailBCC+<>Per_t_PersonnelNames_EmailTo
			Else 
				
				If (<>UserGr_EmailCopytoOption)
					
					If ($_t_EmailBCC#"")
						$_t_EmailBCC:=$_t_EmailBCC+","
					End if 
					$_t_EmailBCC:=$_t_EmailBCC+<>UserGr_EmailTo
				End if 
			End if 
			$_obj_ServerSetup:=New object:C1471
			$_obj_ServerSetup.host:=$_t_SMTPServer
			//$_obj_ServerSetup.port
			//$_obj_ServerSetup.keepAlive
			//$_obj_ServerSetup.connectionTimeOut
			//$_obj_ServerSetup.authenticationMode
			//$_obj_ServerSetup.user
			//$_obj_ServerSetup.password
			//$_obj_ServerSetup.acceptUnsecureConnection:=True
			//$_obj_ServerSetup.logFile
			//$_obj_ServerSetup.headerCharset
			//$_obj_ServerSetup.bodyCharset
			
			$_obj_Transporter:=SMTP New transporter:C1608($_obj_ServerSetup)
			$_obj_Mail:=New object:C1471
			
			If ($_t_EmailTo#"") | ($_t_EmailBCC#"") | ($_t_EmailCC#"")
				
				C_OBJECT:C1216($_obj_ServerSetup)
				OB SET:C1220($_obj_ServerSetup; "host"; $_t_SMTPServer)
				
				If ($_t_EmailSenderName#"")
					$_obj_Mail.from:=$_t_EmailSenderName+" "+$_t_EmailFrom
					$_obj_Mail.sender:=$_t_EmailSenderName+" "+$_t_EmailFrom
					
				Else 
					$_obj_Mail.from:=$_t_EmailFrom
					$_obj_Mail.sender:=$_t_EmailFrom
					
					
				End if 
				$_obj_Mail.replyTo:=$_t_EmailReplyTo
				//$_l_SMTPError:=SMTP_ReplyTo($_l_EmailID; $_t_EmailReplyTo)
				
				$_obj_Mail.subject:=$_t_Subject
				//$_l_SMTPError:=SMTP_Subject($_l_EmailID; $_t_Subject)
				
				$_obj_Mail.to:=$_t_EmailTo
				//$_l_SMTPError:=SMTP_To($_l_EmailID; $_t_EmailTo)
				If ($_t_EmailCC#"")
					$_obj_Mail.cc:=$_t_EmailCC
					//$_l_SMTPError:=SMTP_Cc($_l_EmailID; $_t_EmailCC)
				End if 
				
				If ($_t_EmailBCC#"")
					$_obj_Mail.bcc:=$_t_EmailBCC
					//$_l_SMTPError:=SMTP_Bcc($_l_EmailID; $_t_EmailBCC)
				End if 
				
				$_obj_Mail.sendAt:=String:C10($_d_EmailDate; ISO date GMT:K1:10; $_ti_EmailTime)
				
				//$_l_SMTPError:=SMTP_Date($_l_EmailID; $_d_EmailDate; $_ti_EmailTime; 1)
				
				$_obj_Mail.comments:=$_t_EmailComments
				//$_l_SMTPError:=SMTP_Comments($_l_EmailID; $_t_EmailComments)
				
				
				//$_l_SMTPError:=SMTP_AddHeader ($_l_EmailID;$_t_SMTPHeaderInfo)
				
				
				Case of 
					: (Type:C295($_Ptr_attachments->)=21) | (Type:C295($_Ptr_attachments->)=18)  //pointer to array=multiple attachments
						
						For ($_l_Index; 1; Size of array:C274($_Ptr_attachments->))
							$_t_AttachmentPath:=$_Ptr_attachments->{$_l_Index}
							$_l_Indexsadoc:=Test path name:C476($_t_AttachmentPath)
							
							If ($_l_IndexsaDoc=1)
								$_l_PdfPosition:=Position:C15(".PDF"; $_t_AttachmentPath)
								If ($_l_PdfPosition>0)
									$_t_EncodedPath:=""
									//Thu, Feb 16, 2006 bwalia: added to fix bug of not been able to create temp encoded doc if alrreadye xists
									$_t_DocumentName:=FileNamefromPath($_t_AttachmentPath)
									$_t_EncodedPath:=Temporary folder:C486+$_t_DocumentName
									If (Test path name:C476($_t_EncodedPath)=Is a document:K24:1)
										DELETE DOCUMENT:C159($_t_EncodedPath)
									End if 
									
									$_l_SMTPError:=IT_Encode($_t_AttachmentPath; $_t_EncodedPath; 2)
									$_l_SMTPError:=SMTP_Attachment($_l_EmailID; $_t_EncodedPath; -2)
								Else 
									$_l_SMTPError:=SMTP_Attachment($_l_EmailID; $_t_AttachmentPath; 2)
								End if 
							End if 
						End for 
					Else 
						//single attachement
						If ($_Ptr_attachments->#"")
							$_t_AttachmentPath:=$_Ptr_attachments->
							$_l_Indexsadoc:=Test path name:C476($_t_AttachmentPath)
							If ($_l_IndexsaDoc=1)
								$_l_PdfPosition:=Position:C15(".PDF"; $_t_AttachmentPath)
								If ($_l_PdfPosition>0)
									$_t_DocumentName:=FileNamefromPath($_t_AttachmentPath)
									$_t_EncodedPath:=Temporary folder:C486+$_t_DocumentName
									If (Test path name:C476($_t_EncodedPath)=Is a document:K24:1)
										DELETE DOCUMENT:C159($_t_EncodedPath)
									End if 
									
									$_l_SMTPError:=IT_Encode($_t_AttachmentPath; $_t_EncodedPath; 2)
									$_l_SMTPError:=SMTP_Attachment($_l_EmailID; $_t_EncodedPath; -2)
								Else 
									$_l_SMTPError:=SMTP_Attachment($_l_EmailID; $_t_AttachmentPath; 2)
								End if 
							End if 
						End if 
						
				End case 
				Case of 
					: (Type:C295($_ptr_TextBody->)=Is text:K8:3)
						$_obj_Mail.textBody:=$_ptr_TextBody->
					Else 
				End case 
				//$_l_SMTPError:=SMTP_Body($_l_EmailID; $_ptr_TextBody->)
				
				If (Email_bo_TestMailing=False:C215)
					If (PER_t_UserName="") & (PER_t_UserPass="")
						Per_LOADSMTPAUTH(<>PER_l_CurrentUserID)
						$_bo_SendisOK:=True:C214
						If (PER_l_UseAuthentication=1)
							$_bo_SendisOK:=False:C215
							If (PER_t_UserName="") & (PER_t_UserPass="")
								If (SMTP_l_GeneralPassActive=0)  //NEED TO SET A PASSWORD FOR THIS USER
									If (<>PER_l_CurrentUserID>0)
										Gen_Confirm("To send email you need to set you SMTP authentication rights, please contact your a"+"dministrator if do not know what these are"; "Set"; "Cancel")
										If (OK=1)
											$_t_RequestUser:=Gen_Request("Please enter your SMTP auth name"; "")
											If (OK=1) & ($_t_RequestUser#"")
												$_t_user:=$_t_RequestUser
												$_t_RequestPassword:="'"
												$_t_RequestPassword:=Gen_Request("Please enter your SMTP Password"; "")
												If (OK=1) & ($_t_RequestPassword#"")
													$_t_password:=$_t_RequestPassword
													Per_SaveSMTPAuth(<>PER_l_CurrentUserID; PER_l_UseAuthentication; Per_l_UserAuthtype; $_t_user; $_t_password)
													$_bo_SendisOK:=True:C214
												Else 
													Gen_Alert("You will not be able to send this email")
												End if 
											Else 
												Gen_Alert("You will not be able to send this email")
											End if 
										End if 
									Else 
									End if 
								Else 
									//A GENERAL PASSWORD IS IN USE
									If (SMTP_t_GeneralPassName="") | (SMTP_t_GeneralPassAuth="")
										//CANT SEND TILL IT IS SET
										$_bo_SendisOK:=False:C215
									Else 
										$_t_user:=SMTP_t_GeneralPassName
										$_t_password:=SMTP_t_GeneralPassAuth
										$_bo_SendisOK:=True:C214
									End if 
									
								End if 
							Else 
								// A PASSWORD IS SET FOR THIS USER
								$_t_user:=PER_t_UserName
								$_t_password:=PER_t_UserPass
								$_bo_SendisOK:=True:C214
							End if 
							
							//this is a test
							If (Per_l_UserAuthtype=0)
								$_l_SMTPAuthType:=SMTP_l_GeneralPassType
							Else 
								$_l_SMTPAuthType:=Per_l_UserAuthtype
							End if 
							//$_l_SMTPAuthError:=SMTP_Auth($_l_EmailID; $_t_user; $_t_password; $_l_SMTPAuthType)
							
							
						End if 
					Else 
						$_t_user:=PER_t_UserName
						$_t_password:=PER_t_UserPassword
						$_bo_SendisOK:=True:C214
						//TRACE
						If (Per_l_UserAuthtype=0)
							$_l_SMTPAuthType:=SMTP_l_GeneralPassType
						Else 
							$_l_SMTPAuthType:=Per_l_UserAuthtype
						End if 
						////
						OB SET:C1220($_obj_ServerSetup; "host"; $_t_SMTPServer)
						//OB SET($_obj_ServerSetup;"port"// Optional
						//OB SET($_obj_ServerSetup;"keepAlive")//Optional
						//OB SET($_obj_ServerSetup;"connectionTimeOut")//Optional
						//OB SET($_obj_ServerSetup;"sendTimeOut")//Optional
						//PER_l_UseAuthentication =1 =use database setting. 2=most secure available 3=plain 4=password 5=CRAM-MD5
						Case of 
							: (Per_l_UserAuthtype=1)
								//dont think we should ever get this
							: (Per_l_UserAuthtype=2) | (Per_l_UserAuthtype=0)
								OB SET:C1220($_obj_ServerSetup; "authenticationMode"; "")
							: (Per_l_UserAuthtype=3)
								OB SET:C1220($_obj_ServerSetup; "authenticationMode"; SMTP authentication plain:K90:1)
							: (Per_l_UserAuthtype=4)
								OB SET:C1220($_obj_ServerSetup; "authenticationMode"; SMTP authentication login:K90:2)
							: (Per_l_UserAuthtype=5)
								OB SET:C1220($_obj_ServerSetup; "authenticationMode"; SMTP authentication CRAM MD5:K90:3)
						End case 
						//$_t_user;$_t_password
						TRACE:C157
						OB SET:C1220($_obj_ServerSetup; "user"; $_t_user)
						OB SET:C1220($_obj_ServerSetup; "password"; $_t_password)
						$_obj_Transporter:=SMTP New transporter:C1608($_obj_ServerSetup)
						
						//$_l_SMTPAuthError:=SMTP_Auth($_l_EmailID; $_t_user; $_t_password; $_l_SMTPAuthType)
						
					End if 
					TRACE:C157
					//$_l_errorNumber:=IT_SetPort(2; 587)  //standard STMP mode, port 587 for Exchange
					$_Obj_Status:=$_obj_Transporter.send($_obj_Mail)
					
					If ($_bo_SendisOK)
						If (PER_bo_UseSSL)
							//$_l_SMTPError:=SMTP_Send($_l_EmailID; 0)
						Else 
							//$_l_SMTPError:=SMTP_Send($_l_EmailID; 2)
						End if 
					End if 
				Else 
					$_ti_DocumentRef:=DB_CreateDocument($_t_Subject+String:C10($_l_RecipientNum); "TEXT")
					SEND PACKET:C103($_ti_DocumentRef; "ID "+String:C10($_l_EmailID)+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; "TO"+$_t_EmailTo+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; "CC"+$_t_EmailCC+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; "BCC"+$_t_EmailBCC+Char:C90(13))
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					
					
				End if 
				
				
				
				If ($_Bo_RetryIfFail)
					
					PER_GetEmailHosts(<>PER_t_CurrentUserName; <>PER_l_CurrentUserID)
					
					Case of 
							
							//added 27/10/08 v631b120a -kmw (provide nicer feedback if user has anti-virus software installed causing issue with emails)
						: ($_l_SMTPError=-10061)  // winsock error
							$_t_SMTPErrorMessage:="Winsock Error No 10061. Connection attempt was forcefully rejected. This is an er"+"ror reported by your ope"+"rating system. Contact your IT helpdesk. (Possible causes might include but are n"+"o"+"t necessarily limited to your firewall and/or antivirus settings.)"
							
							//added 27/10/08 v631b120a -kmw (provide nicer feedback if user has anti-virus software installed causing issue with emails)
						: ($_l_SMTPError=-10053)  // winsock error
							$_t_SMTPErrorMessage:="Winsock Error No 10053. Connection was aborted because of a timeout or other erro"+"r condition. This is an "+"error reported by your ope"+"rating system. Contact your IT helpdesk.  (Possible causes might include but are "+"n"+"o"+"t necessarily limited to your firewall and/or antivirus settings.)"
							
							//added 27/10/08 v631b120a -kmw (provide nicer feedback if user has anti-virus software installed causing issue with emails)
						: ($_l_SMTPError=61)  // bsd error
							$_t_SMTPErrorMessage:="BSD error No 61. Connection refused. This is an error reported by your operati"+"ng system. Contact y"+"our IT helpdesk. (Possible causes might include but are no"+"t necessarily limited to your firewall and/or antivirus settings.)"
							
							
						: ($_l_SMTPError=10030)  //-session closed by server
							$_t_SMTPErrorMessage:="Email not sent. Session closed by server"
						: ($_l_SMTPError=10031)  //-Error with POP3 APOP
							$_t_SMTPErrorMessage:="Email not sent. Error with POP3 APOP."
							
						: ($_l_SMTPError=10032)  //-Unknown or invalid response.
							$_t_SMTPErrorMessage:="Email not sent. Unknown or invalid response. "
							
						: ($_l_SMTPError=10033)  //-SMTP 421 - Service not available, closing transmission channel
							$_t_SMTPErrorMessage:="Email not sent. SMTP 421 - Service not available, closing transmission channel. "
							
						: ($_l_SMTPError=10034)  //-SMTP 450 - Requested mail action not taken: mailbox unavailable
							$_t_SMTPErrorMessage:="Email not sent. SMTP 450 - Requested mail action not taken: mailbox unavailable."
							
						: ($_l_SMTPError=10035)  //-SMTP 451 - Requested action aborted: local error in processing
							$_t_SMTPErrorMessage:="Email not sent. SMTP 451 - Requested action aborted: local error in processing."
							
						: ($_l_SMTPError=10036)  //-SMTP 452 - Requested action not taken: insufficient system storage
							$_t_SMTPErrorMessage:="Email not sent. SMTP 452 - Requested action not taken: insufficient system storag"+"e."
							
							//added 10042 (smtp 550) -22/07/08, kmw
						: ($_l_SMTPError=10042)  //-SMTP 550 - Requested action not taken: mailbox unavailable
							$_t_SMTPErrorMessage:="Email not sent. SMTP 550-Requested action not taken: mailbox unavailable."
							
						: ($_l_SMTPError=10044)  //-SMTP 552 - Requested mail action aborted: exceeded storage allocation
							$_t_SMTPErrorMessage:="Email not sent. SMTP 552 - Requested mail action aborted: exceeded storage alloca"+"tion."
							
						: ($_l_SMTPError=10064)  //-No response has been received within the given timeout period
							$_t_SMTPErrorMessage:="Email not sent. No response has been received within the given timeout period."
							
							//added 10113 -07/10/08 v631b120, kmw
						: ($_l_SMTPError=10113)  //-Error with AUTHENTICATION
							$_t_SMTPErrorMessage:="Email not sent. Error with AUTHENTICATION."
							
							
							
							
						Else 
							$_t_SMTPErrorMessage:=""
							//ALERT("Email not sent. Error Nº"+String($_l_SMTPError))
							Gen_Alert("Email not sent."+" Error No "+String:C10($_l_SMTPError)+".")
					End case 
					If ($_t_SMTPErrorMessage#"")
						$_l_OK:=1
						If (Size of array:C274(PER_at_EmailHostNames)>0)
							Gen_Confirm($_t_SMTPErrorMessage+". Select a different Mail Server?"; "Select"; "Cancel")
							$_l_OK:=OK
							If ($_l_OK=1)
								Repeat 
									ARRAY TEXT:C222(GEN_at_LongPopUp; 0)
									ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
									For ($_l_BuildHosts; 1; Size of array:C274(PER_at_EmailHostNames))
										APPEND TO ARRAY:C911(GEN_at_LongPopUp; PER_at_EmailHostNames{$_l_BuildHosts})
										APPEND TO ARRAY:C911(GEN_al_DropDownMenuID; $_l_BuildHosts)
									End for 
									WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
									
									DB_t_WindowTitle:="Select Mail Server"
									WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1986)
									GEN_Bo_ShowCreate:=True:C214
									$_bo_ShowLongString:=True:C214
									DIALOG:C40([USER:15]; "Gen_PopUpChoice")
									CLOSE WINDOW:C154
									WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
									
									$_bo_ShowLongString:=False:C215
									If (Gen_bo_Create)
										WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
										WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
										DIALOG:C40([USER:15]; "Per_EmailHosts")
										CLOSE WINDOW:C154
										WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
										If (Bsave=1)
											PER_SetEmailHosts(<>PER_t_CurrentUserName; <>PER_l_CurrentUserID)
											PER_GetEmailHosts(<>PER_t_CurrentUserName; <>PER_l_CurrentUserID)
										End if 
									Else 
										If (GEN_at_LongPopUp>0)
											$_t_SMTPServer:=GEN_at_LongPopUp{GEN_at_LongPopUp}
										Else 
											Gen_Alert("A mail Server was not selected")
										End if 
									End if 
								Until (GEN_at_LongPopUp>0) | (GEN_at_LongPopUp=-1)
								If (GEN_at_LongPopUp=-1)
									Gen_Confirm($_t_SMTPErrorMessage; "Retry"; "Cancel")
									$_l_OK:=OK
								End if 
							End if 
						Else 
							Gen_Confirm($_t_SMTPErrorMessage; "Retry"; "Cancel")
							$_l_OK:=OK
							
						End if 
						If ($_l_OK=1)
							$_bo_Exit:=False:C215
						Else 
							$_bo_Exit:=True:C214
						End if 
					End if 
					$0:=""  // 24/03/03 NG
					
					
				Else 
					$_bo_Exit:=True:C214
				End if 
				If ($_l_EmailID#0)
					
					$0:=String:C10($_l_EmailID)  // 27/03/03 pb
					//$_l_SMTPError:=SMTP_Clear($_l_EmailID)
					If ($_l_SMTPError#0)  //BSW 1/7/02 $0:=String($_l_EmailID)Else
						$0:=""
					End if 
					
				Else 
					$0:=""
				End if 
				
			Else 
				//  ALERT("There is no recipient")
				Gen_Alert("There is no recipient")
				$0:=""
			End if 
			
		Until ($_l_RecipientNum>=$_l_CountRecipients)
		
		
	Until ($_bo_Exit)
	
Else 
	$0:=""
End if 
DB_bo_SendingEmail:=False:C215
ERR_MethodTrackerReturn("Email_Send"; $_t_oldMethodName)
