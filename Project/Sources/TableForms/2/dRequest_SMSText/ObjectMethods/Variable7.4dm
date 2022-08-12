If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable7
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
	C_TEXT:C284($_t_oldMethodName; SMS_From)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable7"; Form event code:C388)
If (Self:C308->="")
	//  ALERT("The Sender must be completed!")
	Gen_Alert("The Sender must be completed!")
	Self:C308->:=SMS_From
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable7"; $_t_oldMethodName)
