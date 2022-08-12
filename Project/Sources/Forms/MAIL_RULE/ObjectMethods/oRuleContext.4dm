
If (False:C215)
	//Object Name:      MAIL_RULE.oRuleContext
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
	C_LONGINT:C283($_l_FieldNumber; $_l_ObjectNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_ContextDropDOwn; $_ptr_CurrentObject; $_Ptr_FieldDropDOwn; $_ptr_RuleValue)
	C_TEXT:C284($_t_oldMethodName; $_t_VarName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/MAIL_RULE/oRuleContext"; Form event code:C388)


Case of 
	: (Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4)
		
		//OBJECT Get data source
		$_ptr_CurrentObject:=OBJECT Get pointer:C1124(Object current:K67:2)
		//OBJECT Get pointer (Object current)
		RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
		$_l_ObjectNumber:=Num:C11($_t_VarName)
		If ($_l_ObjectNumber>0)
			$_Ptr_FieldDropDOwn:=Get pointer:C304("PER_at_MailRuleFields"+String:C10($_l_ObjectNumber))
			$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue"+String:C10($_l_ObjectNumber))
		Else 
			$_Ptr_FieldDropDOwn:=Get pointer:C304("PER_at_MailRuleFields")
			$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue")
		End if 
		If (($_Ptr_FieldDropDOwn->)>0) & (($_ptr_CurrentObject->)>0)
			OBJECT SET ENTERABLE:C238($_ptr_RuleValue->; True:C214)
			GOTO OBJECT:C206($_ptr_RuleValue->)
		Else 
			OBJECT SET ENTERABLE:C238($_ptr_RuleValue->; False:C215)
			GOTO OBJECT:C206($_ptr_RuleValue->)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/MAIL_RULE/oRuleContext"; $_t_oldMethodName)
