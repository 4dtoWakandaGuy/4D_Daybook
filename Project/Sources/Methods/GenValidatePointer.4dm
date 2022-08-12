//%attributes = {}

If (False:C215)
	//Project Method Name:      GenValidatePointer
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
	C_BOOLEAN:C305(<>Email_bo_Enabled; <>Email_bo_PersonInited; $_bo_emailSent; $_bo_SendError; $0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_FieldNumber; $_l_TableNumber; $_l_Type)
	C_POINTER:C301($_ptr_Variable; $1)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_EmailAttachment; $_t_EmailFromAddress)
	C_TEXT:C284($_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_NonCallChainText; $_t_oldMethodName; $_t_ProcessName; $_t_Text; $_t_VariableName; DB_t_error; DB_t_ErrTrackingStack; DB_t_Methodname)
	C_TEXT:C284(EMAIL_t_SendCalledFrom)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("GenValidatePointer")

//$_t_oldMethodName:=ERR_MethodTracker ("GenValidatePointer")

//This method wraps a 4D function
If (False:C215)
	$_t_oldMethodName:=""
	$_t_ProcessName:=Process_Name(Current process:C322)
	
	DB_ErrorReportSettings
	//This is so that we can do something if the pointer is nil
	//``send an email
	
	$_bo_SendError:=False:C215
	If (Count parameters:C259>=1)
		If (DB_t_Methodname="")
		End if 
		//TRACE
		
		
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
		If ($_t_VariableName#"") | ($_l_TableNumber>0)  //it is valid
			If ($_t_VariableName#"")
				$_l_CharacterPosition:=Position:C15("$"; $_t_VariableName)
				If ($_l_CharacterPosition#1)
					$_ptr_Variable:=Get pointer:C304($_t_VariableName)
					$_bo_SendError:=False:C215
					$_l_Type:=Type:C295($_ptr_Variable->)
					Case of 
						: ($_l_Type=5)
							$0:=False:C215
							$_bo_SendError:=True:C214
						: ($_l_Type=Array 2D:K8:24)
							If ($_l_TableNumber>0)
								$_ptr_Variable:=Get pointer:C304($_t_VariableName)
								If (Size of array:C274($_ptr_Variable->)<$_l_TableNumber)
									//Pointing at an illegal element of an array
									$_bo_SendError:=True:C214
									$0:=False:C215
								Else 
									$0:=True:C214
									$_bo_SendError:=False:C215
								End if 
							Else 
								$_bo_SendError:=False:C215
								$0:=True:C214
							End if 
						: ($_l_Type=Boolean array:K8:21) | ($_l_Type=Date array:K8:20) | ($_l_Type=Integer array:K8:18) | ($_l_Type=LongInt array:K8:19) | ($_l_Type=Picture array:K8:22) | ($_l_Type=Pointer array:K8:23) | ($_l_Type=Real array:K8:17) | ($_l_Type=String array:K8:15) | ($_l_Type=Text array:K8:16)
							
							
							If ($_l_TableNumber>0)
								$_ptr_Variable:=Get pointer:C304($_t_VariableName)
								If (Size of array:C274($_ptr_Variable->)<$_l_TableNumber)
									//Pointing at an illegal element of an array
									$_bo_SendError:=True:C214
									$0:=False:C215
								Else 
									$_bo_SendError:=False:C215
									$0:=True:C214
								End if 
							Else 
								$0:=True:C214
								$_bo_SendError:=False:C215
							End if 
						Else 
							$_bo_SendError:=False:C215
							$0:=True:C214
					End case 
					If ($_bo_SendError)
						If (<>Email_bo_Enabled)
							$_t_Text:=""
							$_t_oldMethodName:=ERR_MethodTracker("GenValidatePointer")
							$_t_NonCallChainText:=$_t_Text  //added 26/10/07 -kmw
							
							If (DB_t_ErrTrackingStack="")
								$_t_Text:=$_t_Text+"Call Chain: "+"(No Call Chain Info Found)"+$_t_oldMethodName+DB_t_Methodname+DB_t_error+$_t_ProcessName
								
							Else 
								$_t_Text:=$_t_Text+"Call Chain: "+DB_t_ErrTrackingStack+$_t_oldMethodName+DB_t_Methodname+DB_t_error+$_t_ProcessName
							End if 
							
							$_t_Text:=$_t_Text+Char:C90(13)+"This email is not the result of an on screen error, the user will be unaware of t"+"his"+" This should not be logged as a Daybook error, the problem will be picked up by t"+"he programmers"
							$_t_EmailSentTo:="To"
							$_t_EmailAttachment:=""
							$_bo_emailSent:=False:C215
							$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_Text+Char:C90(13)+"Invalid Pointer"+Char:C90(13)+$_t_Text
							
							While (Semaphore:C143("InitEmail"))
								DelayTicks(2)
							End while 
							If (<>Email_bo_PersonInited=False:C215)
								LOGIN_SetEmail
							End if 
							CLEAR SEMAPHORE:C144("InitEmail")
							
							
							If ($_bo_emailSent=False:C215)  //``send to owner as well
								Case of   //Sender Address
									: (<>Per_at_PersonnelNames_EmailFrom#"")
										$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
									: (<>DB_t_UserGrEmailSMTP#"")
										$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
									Else 
										$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
								End case 
								
								If (<>PER_t_CurrentUserName#"")
									If ($_t_EmailText="")
										If (DB_t_MethodName="Email_send")
											$_t_EmailText:="Here-from Gen Validate Pointer   a blank email"+DB_t_Methodname+"Called from"+EMAIL_t_SendCalledFrom+DB_t_error+$_t_ProcessName
										Else 
											
											$_t_EmailText:="Here-from Gen Validate Pointer   a blank email"+DB_t_Methodname+$_t_ProcessName+DB_t_error
										End if 
									End if 
									EMAIL_t_SendCalledFrom:="GenValidatePointer(1)"
									$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
								Else 
									If ($_t_EmailText="")
										$_t_EmailText:="Here-from Gen Validate Pointer   a blank emai(2)"+$_t_ProcessName+DB_t_error
									End if 
									EMAIL_t_SendCalledFrom:="GenValidatePointer(2)"
									$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
								End if 
								
								
								
							End if 
							
						Else 
							If ($_l_TableNumber>0)
								$_t_Text:="Invalid Pointer"+$_t_VariableName+String:C10($_l_TableNumber)+"Illegal element"
							Else 
								$_t_Text:="Invalid Pointer"+$_t_VariableName
							End if 
							
							$_t_NonCallChainText:=$_t_Text  //added 26/10/07 -kmw
							
							If (DB_t_ErrTrackingStack="")
								$_t_Text:=$_t_Text+"Call Chain: "+"(No Call Chain Info Found)"+DB_t_Methodname+DB_t_error+$_t_ProcessName
							Else 
								
								$_t_Text:=$_t_Text+"Call Chain: "+DB_t_ErrTrackingStack+DB_t_error+$_t_ProcessName
								
							End if 
							
							ALERT:C41($_t_Text)
						End if 
					End if 
				Else 
					
					$0:=True:C214
				End if 
			Else 
				$0:=True:C214
			End if 
		Else 
			$0:=False:C215
			If (<>Email_bo_Enabled)
				
				$_t_Text:=""
				$_t_oldMethodName:=ERR_MethodTracker("GenValidatePointer")
				$_t_NonCallChainText:=$_t_Text  //added 26/10/07 -kmw
				
				If (DB_t_ErrTrackingStack="")
					$_t_Text:=$_t_Text+"Call Chain: "+"(No Call Chain Info Found)"+$_t_oldMethodName+DB_t_Methodname+$_t_ProcessName+DB_t_error
				Else 
					
					$_t_Text:=$_t_Text+"Call Chain: "+DB_t_ErrTrackingStack+$_t_oldMethodName+DB_t_Methodname+$_t_ProcessName+DB_t_error
					
				End if 
				If (DB_T_MethodName="Email_send")
					$_t_Text:=$_t_Text+"Called From"+EMAIL_t_SendCalledFrom+$_t_oldMethodName+$_t_ProcessName+DB_t_error
				End if 
				$_t_Text:=$_t_Text+Char:C90(13)+"This email is not the result of an on screen error, the user will be unaware of t"+"his"+" This should not be logged as a Daybook error, the problem will be picked up by t"+"he programmers"
				$_t_EmailSentTo:="To"
				$_t_EmailAttachment:=""
				$_bo_emailSent:=False:C215
				$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_Text+Char:C90(13)+"Invalid Pointer"+Char:C90(13)+$_t_Text
				
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					LOGIN_SetEmail
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				
				If ($_bo_emailSent=False:C215)  //``send to owner as well
					Case of   //Sender Address
						: (<>Per_at_PersonnelNames_EmailFrom#"")
							$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
						: (<>DB_t_UserGrEmailSMTP#"")
							$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
						Else 
							$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
					End case 
					
					If (<>PER_t_CurrentUserName#"")
						If ($_t_EmailText="")
							$_t_EmailText:="Here-from Gen Validate Pointer   a blank email(3)"+$_t_ProcessName+DB_t_error
							
						End if 
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					Else 
						If ($_t_EmailText="")
							$_t_EmailText:="Here-from Gen Validate Pointer   a blank email(4)"+$_t_ProcessName+DB_t_error
							
						End if 
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					End if 
					
					
					
				End if 
				
			Else 
				$_t_Text:="Invalid Pointer Pointer does not resolve"
				$_t_NonCallChainText:=$_t_Text  //added 26/10/07 -kmw
				If (DB_t_ErrTrackingStack="")
					$_t_Text:=$_t_Text+"Call Chain: "+"(No Call Chain Info Found)"+DB_t_Methodname+DB_t_error
				Else 
					$_t_Text:=$_t_Text+"Call Chain: "+DB_t_ErrTrackingStack+DB_t_error
					
				End if 
				
				ALERT:C41($_t_Text)
				
			End if 
		End if 
	End if 
Else 
	$0:=True:C214
End if 
//ERR_MethodTrackerReturn ("GenValidatePointer";$_t_oldMethodName)