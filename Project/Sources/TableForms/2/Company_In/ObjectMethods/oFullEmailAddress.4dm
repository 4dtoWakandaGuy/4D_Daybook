
If (False:C215)
	//Object Name:      [COMPANIES].Company_In.oFullEmailAddress
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Validate)
	C_TEXT:C284(COM_t_EmailAddress)
End if 
//Code Starts Here

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		If (EmailValidateAddress(COM_t_EmailAddress; ->[COMPANIES:2]Email_Before_At:58; ->[COMPANIES:2]EMail_After_At:55))
			
		Else 
			Gen_Alert("This email address is badly formed. Please re-enter")
			COM_t_EmailAddress:=""
			GOTO OBJECT:C206(*; "oFullEmailAddress")
		End if 
		
		
		
		
End case 


