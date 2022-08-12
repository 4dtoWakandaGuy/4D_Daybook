If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 18:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_Enabled; CCM_bo_CardLog)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_EmailAttachment; $_t_EmailSentTo; $_t_EmailText; $_t_oldMethodName; CC_T_CCX99999999999; CCM_t_CardOwner; CCM_T_CardNumber; CCM_t_EmailAddress; EMAIL_t_EmailTo; EMAIL_t_SendCalledFrom)
	C_TEXT:C284(EmailAddress)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable17"; Form event code:C388)
Gen_Confirm("Warning: displaying the credit card details may result in a security violation."; "Stop"; "Display")
If (OK=0)
	If (CC_T_CCX99999999999#"")
		Gen_Alert("This card number is "+CC_T_CCX99999999999)
		
		If (CCM_bo_CardLog)
			If (CCM_t_EmailAddress#"")
				If (<>Email_bo_Enabled)
					//C_TEXT($_t_EmailSentTo;EMAIL_t_EmailTo;EmailAddress)
					
					$_t_EmailAttachment:=""
					$_t_EmailSentTo:="To"
					EMAIL_t_EmailTo:="Administrator"
					EmailAddress:=CCM_t_EmailAddress
					$_t_EmailText:="Credit card for "+CCM_t_CardOwner+" "+CCM_T_CardNumber
					$_t_EmailText:=$_t_EmailText+" Was decoded by "+<>PER_t_CurrentUserInitials+" on the "+String:C10(Current date:C33(*))+" at"+Time string:C180(Current time:C178(*))
					EMAIL_t_SendCalledFrom:="Cardinbunlock"
					//$ID:=Email_Send (->$_t_EmailSentTo;->EMAIL_t_EmailTo;->EmailAddress;<>PER_t_CurrentEmailFrom;<>EMAIL_t_DefaultReplyToAddress;<>EMAIL_t_DefaultReplyToAddress;"Credit Card Access Warning";->$_t_EmailAttachment;->$_t_EmailText;False)
				End if 
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ:CARD IN,Bunlock"; $_t_oldMethodName)
