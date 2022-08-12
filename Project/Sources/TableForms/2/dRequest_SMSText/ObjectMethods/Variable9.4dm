If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_SMSNumber; WS_t_EmailAddress)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable9"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		$_t_SMSNumber:=SMS_IntlPhoneNumber(->WS_t_EmailAddress)
		If ($_t_SMSNumber="")
			GOTO OBJECT:C206(WS_t_EmailAddress)
		Else 
			WS_t_EmailAddress:=$_t_SMSNumber
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable9"; $_t_oldMethodName)
