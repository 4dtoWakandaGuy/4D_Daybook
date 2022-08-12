//%attributes = {}

If (False:C215)
	//Project Method Name:      Email_SetParameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/11/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($13)
	C_BOOLEAN:C305($8; $9)
	C_LONGINT:C283($5)
	C_OBJECT:C1216($_obj_MailParameters)
	C_POINTER:C301($1; $12; $14; $15; $2; $3; $6; $7)
	C_TEXT:C284($10; $11; $4)
End if 
//Code Starts Here
$_obj_MailParameters:=New object:C1471
If (Count parameters:C259>=1)
	If (Type:C295($1->)=Is text:K8:3)  //to/cc/bcc or array of to/cc/bcc
		OB SET:C1220($_obj_MailParameters; "MailContext"; $1->)
	Else 
		OB SET ARRAY:C1227($_obj_MailParameters; "MailContexts"; $1->)
	End if 
	If (Count parameters:C259>=2)
		If (Type:C295($2->)=Is text:K8:3)  //name or array of names
			OB SET:C1220($_obj_MailParameters; "MailRecipient"; $2->)
		Else 
			OB SET ARRAY:C1227($_obj_MailParameters; "MailRecipients"; $2->)
		End if 
		If (Count parameters:C259>=3)
			If (Type:C295($3->)=Is text:K8:3)  //email address or array of email addresses
				OB SET:C1220($_obj_MailParameters; "MailAddress"; $3->)
			Else 
				OB SET ARRAY:C1227($_obj_MailParameters; "MailAddresses"; $3->)
			End if 
			If (Count parameters:C259>=4)
				If (Type:C295($4)=Is text:K8:3)
					If ($4#"")  //Mail Subject
						OB SET:C1220($_obj_MailParameters; "Subject"; $4)
					End if 
				End if 
				
				
				If (Count parameters:C259>=5)
					Case of 
						: ($5=Is text:K8:3)
							//the content is just text
							If (Type:C295($6->)=Is text:K8:3)  //Text Content
								OB SET:C1220($_obj_MailParameters; "TextContent"; $6->)
								
							End if 
						: ($5=Is text:K8:3+1024)  //HTML content
							If (Type:C295($6->)=Is text:K8:3)  //Text Content
								OB SET:C1220($_obj_MailParameters; "HtmlContent"; $6->)
								
							End if 
						: ($5=Is longint:K8:6)  //4D write reference content
							OB SET:C1220($_obj_MailParameters; "DocContent"; $6->)
					End case 
					
					If (Count parameters:C259>=6)
						If (Type:C295($6->)=Is text:K8:3)
							If ($6->#"")  //reply to address
								OB SET:C1220($_obj_MailParameters; "ReplyToAddress"; $6->)
							End if 
						End if 
						//the above are the only essential element-who it is to and what you are sending....
						//every parameter after this is optional
						If (Count parameters:C259>=7)
							If (Type:C295($7->)=Is text:K8:3)  //Attachment or array of attachments
								OB SET:C1220($_obj_MailParameters; "Attachment"; $7->)
							Else 
								OB SET ARRAY:C1227($_obj_MailParameters; "Attachments"; $7->)
							End if 
							//the above are the only essential element-who it is to and what you are sending....
							//
							If (Count parameters:C259>=8)
								OB SET:C1220($_obj_MailParameters; "RetryifFail"; $8)
								If (Count parameters:C259>=9)
									OB SET:C1220($_obj_MailParameters; "MarketingMail"; $9)
									If (Count parameters:C259>=10)
										If (Type:C295($10)=Is text:K8:3)
											If ($10#"")  //mail from Name-this is only neeeded if it is going from someone other than who is logged in
												OB SET:C1220($_obj_MailParameters; "MailSenderName"; $10)
											End if 
										End if 
										
										///the above are the only essen
										If (Count parameters:C259>=11)
											If (Type:C295($11)=Is text:K8:3)
												If ($11#"")  //mail from email address
													OB SET:C1220($_obj_MailParameters; "MailSenderAddress"; $11)
												End if 
											End if 
											
											
											
											//note that in the old parameters $10 was 'retry if fail'
											
											If (Count parameters:C259>=12)
												If (Type:C295($12->)=Is text:K8:3)
													If ($12->#"")  //name or array of names
														OB SET:C1220($_obj_MailParameters; "MailCCRecipient"; $12->)
													End if 
												Else 
													If (Size of array:C274($12->)>0)
														OB SET ARRAY:C1227($_obj_MailParameters; "MailCCRecipients"; $12->)
													End if 
												End if 
												If (Count parameters:C259>=13)
													If (Type:C295($13->)=Is text:K8:3)  //email address or array of email addresses
														If ($13->#"")
															OB SET:C1220($_obj_MailParameters; "MailCCAddress"; $13->)
														End if 
													Else 
														If (Size of array:C274($13->)>0)
															OB SET ARRAY:C1227($_obj_MailParameters; "MailAddresses"; $13->)
														End if 
													End if 
													If (Count parameters:C259>=14)
														If (Type:C295($14->)=Is text:K8:3)  //name or array of names
															If ($14->#"")
																OB SET:C1220($_obj_MailParameters; "MailBCCRecipient"; $14->)
															End if 
														Else 
															If (Size of array:C274($14->)>0)
																OB SET ARRAY:C1227($_obj_MailParameters; "MailCCRecipients"; $14->)
															End if 
														End if 
														If (Count parameters:C259>=15)
															If (Type:C295($15->)=Is text:K8:3)  //email address or array of email addresses
																If ($15->#"")
																	OB SET:C1220($_obj_MailParameters; "MailCCAddress"; $15->)
																End if 
															Else 
																If (Size of array:C274($15->)>0)
																	OB SET ARRAY:C1227($_obj_MailParameters; "MailAddresses"; $15->)
																End if 
															End if 
														End if 
														
													End if 
													
													
												End if 
												
											End if 
											
										End if 
									End if 
									//$11 was a CC name in the old parameters and $12 was a cc address $13 was a BCC name and $14 was a BCC address
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
$0:=$_obj_MailParameters

