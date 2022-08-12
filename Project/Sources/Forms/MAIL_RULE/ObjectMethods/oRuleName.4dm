
If (False:C215)
	//Object Name:      MAIL_RULE.oRuleName
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; PER_t_MailRuleName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/MAIL_RULE/oRuleName"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		OBJECT SET ENABLED:C1123(*; "oRuleField"; (PER_t_MailRuleName#""))
		OBJECT SET ENABLED:C1123(*; "oRuleContext"; (PER_t_MailRuleName#""))
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/MAIL_RULE/oRuleName"; $_t_oldMethodName)
