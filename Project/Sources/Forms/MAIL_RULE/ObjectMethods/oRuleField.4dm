
If (False:C215)
	//Object Name:      MAIL_RULE.oRuleField
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_GotoObject)
	C_LONGINT:C283($_l_ContextBottom; $_l_ContextLeft; $_l_ContextRight; $_l_ContextTop; $_l_FieldNumber; $_l_FieldsBottom; $_l_FIeldsLeft; $_l_FieldsRight; $_l_FieldsTop; $_l_ObjectNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_ContextDropDOwn; $_ptr_CurrentObject; $_Ptr_FieldsDOwn; $_ptr_RuleValue)
	C_TEXT:C284($_t_ButtonName; $_t_ButtonName2; $_t_oldMethodName; $_t_VarName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/MAIL_RULE/oRuleField"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4)
		
		//OBJECT Get data source
		$_ptr_CurrentObject:=OBJECT Get pointer:C1124(Object current:K67:2)
		//OBJECT Get pointer (Object current)
		RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
		$_l_ObjectNumber:=Num:C11($_t_VarName)
		If ($_l_ObjectNumber>0)
			$_Ptr_FieldsDOwn:=Get pointer:C304("PER_at_MailRuleFields"+String:C10($_l_ObjectNumber))
			
			$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext"+String:C10($_l_ObjectNumber))
			$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue"+String:C10($_l_ObjectNumber))
		Else 
			$_Ptr_FieldsDOwn:=Get pointer:C304("PER_at_MailRuleFields")
			
			$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext")
			$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue")
		End if 
		$_bo_GotoObject:=True:C214
		Case of 
			: ($_Ptr_FieldsDOwn->{$_Ptr_FieldsDOwn->}="Sender is in Database") | ($_Ptr_FieldsDOwn->{$_Ptr_FieldsDOwn->}="Sender is not in Database") | ($_Ptr_FieldsDOwn->{$_Ptr_FieldsDOwn->}="Message Has Attachment")
				OBJECT GET COORDINATES:C663($_Ptr_ContextDropDOwn->; $_l_ContextLeft; $_l_ContextTop; $_l_ContextRight; $_l_ContextBottom)
				OBJECT GET COORDINATES:C663($_Ptr_FieldsDOwn->; $_l_FIeldsLeft; $_l_FieldsTop; $_l_FieldsRight; $_l_FieldsBottom)
				OBJECT SET COORDINATES:C1248($_Ptr_FieldsDOwn->; $_l_FIeldsLeft; $_l_FieldsTop; $_l_ContextRight; $_l_FieldsBottom)
				$_Ptr_ContextDropDOwn->{$_Ptr_ContextDropDOwn->}:="is equal to"
				OBJECT SET VISIBLE:C603($_Ptr_ContextDropDOwn->; False:C215)
				$_ptr_RuleValue->:="TRUE"
				OBJECT SET ENTERABLE:C238($_ptr_RuleValue->; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_RuleValue->; False:C215)
				If ($_l_ObjectNumber>0)
					$_t_ButtonName:="oAddCondition"+String:C10($_l_ObjectNumber)
					$_t_ButtonName2:="oDelCondition"+String:C10($_l_ObjectNumber)
				Else 
					$_t_ButtonName:="oAddCondition"
					$_t_ButtonName2:="oDelCondition"
				End if 
				
				OBJECT SET ENABLED:C1123(*; $_t_ButtonName; ($_ptr_RuleValue->#""))
				OBJECT SET ENABLED:C1123(*; $_t_ButtonName2; ($_ptr_RuleValue->#""))
				
				
				
			Else 
				//here we have to set the view of context and value to false again if the field is 'Sender is in Database' , 'Sender is not in Database", or 'Message Has Attachment'
				OBJECT GET COORDINATES:C663($_Ptr_ContextDropDOwn->; $_l_ContextLeft; $_l_ContextTop; $_l_ContextRight; $_l_ContextBottom)
				OBJECT GET COORDINATES:C663($_Ptr_FieldsDOwn->; $_l_FIeldsLeft; $_l_FieldsTop; $_l_FieldsRight; $_l_FieldsBottom)
				OBJECT SET COORDINATES:C1248($_Ptr_FieldsDOwn->; $_l_FIeldsLeft; $_l_FieldsTop; $_l_ContextLeft-6; $_l_FieldsBottom)
				//$_Ptr_ContextDropDOwn->{$_Ptr_ContextDropDOwn->}="is equal to"
				OBJECT SET VISIBLE:C603($_Ptr_ContextDropDOwn->; True:C214)
				If ($_ptr_RuleValue->="TRUE")
					$_ptr_RuleValue->:=""
				End if 
				OBJECT SET VISIBLE:C603($_ptr_RuleValue->; True:C214)
				
				
				If (($_Ptr_ContextDropDOwn->)>0) & (($_ptr_CurrentObject->)>0)
					OBJECT SET ENTERABLE:C238($_ptr_RuleValue->; True:C214)
					GOTO OBJECT:C206($_ptr_RuleValue->)
				Else 
					OBJECT SET ENTERABLE:C238($_ptr_RuleValue->; False:C215)
					GOTO OBJECT:C206($_ptr_RuleValue->)
				End if 
				If ($_l_ObjectNumber>0)
					$_t_ButtonName:="oAddCondition"+String:C10($_l_ObjectNumber)
					$_t_ButtonName2:="oDelCondition"+String:C10($_l_ObjectNumber)
				Else 
					$_t_ButtonName:="oAddCondition"
					$_t_ButtonName2:="oDelCondition"
				End if 
				
				OBJECT SET ENABLED:C1123(*; $_t_ButtonName; ($_ptr_RuleValue->#""))
				OBJECT SET ENABLED:C1123(*; $_t_ButtonName2; ($_ptr_RuleValue->#""))
				
				
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/MAIL_RULE/oRuleField"; $_t_oldMethodName)
