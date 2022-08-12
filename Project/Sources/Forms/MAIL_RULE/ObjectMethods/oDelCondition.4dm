
If (False:C215)
	//Object Name:      MAIL_RULE.oDelCondition
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
	//ARRAY LONGINT(PER_al_UsedObjectNumbers;0)
	C_LONGINT:C283($_l_ApBottom; $_l_ApLeft; $_l_ApRight; $_l_ApTop; $_l_DIfference; $_l_FieldNumber; $_l_Height; $_l_ObjectNumber; $_l_oBottom; $_l_OLeft; $_l_ORight)
	C_LONGINT:C283($_l_oTop; $_l_TableNumber; $_l_WindowBottom; $_l_WIndowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_POINTER:C301($_ptr_AddButton; $_Ptr_ContextDropDOwn; $_ptr_CurrentObject; $_ptr_DeleteButton; $_Ptr_FieldsDropDOwn; $_ptr_RuleValue)
	C_TEXT:C284($_t_oldMethodName; $_t_RowNumber; $_t_VarName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/MAIL_RULE/oDelCondition"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		Case of 
			: (Form event code:C388=On Clicked:K2:4)
				
				$_ptr_CurrentObject:=OBJECT Get pointer:C1124(Object current:K67:2)
				RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
				$_l_ObjectNumber:=Num:C11($_t_VarName)
				If ($_l_ObjectNumber>0)
					$_Ptr_FieldsDropDOwn:=Get pointer:C304("PER_at_MailRuleFields"+String:C10($_l_ObjectNumber))
					
					$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext"+String:C10($_l_ObjectNumber))
					$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue"+String:C10($_l_ObjectNumber))
				Else 
					$_Ptr_FieldsDropDOwn:=Get pointer:C304("PER_at_MailRuleFields")
					$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext")
					$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue")
				End if 
				If ($_l_ObjectNumber>0)
					$_t_RowNumber:=String:C10($_l_ObjectNumber)
				Else 
					$_t_RowNumber:=""
				End if 
				
				OBJECT GET COORDINATES:C663(*; "oRuleField"+$_t_RowNumber; $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
				If ($_l_ObjectNumber>0)
					$_Ptr_FieldsDropDOwn:=Get pointer:C304("PER_at_MailRuleFields"+String:C10($_l_ObjectNumber))
					$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext"+String:C10($_l_ObjectNumber))
					$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue"+String:C10($_l_ObjectNumber))
					$_ptr_DeleteButton:=Get pointer:C304("PER_but_Delcondition"+String:C10($_l_ObjectNumber))
					$_ptr_AddButton:=Get pointer:C304("PER_but_Addcondition"+String:C10($_l_ObjectNumber))
				Else 
					$_Ptr_FieldsDropDOwn:=Get pointer:C304("PER_at_MailRuleFields")
					$_Ptr_ContextDropDOwn:=Get pointer:C304("PER_at_MailContext")
					$_ptr_RuleValue:=Get pointer:C304("PER_t_MailRuleValue")
					$_ptr_DeleteButton:=Get pointer:C304("PER_but_Delcondition")
					$_ptr_AddButton:=Get pointer:C304("PER_but_Addcondition")
				End if 
				$_ptr_RuleValue->:=""  //note how we clear the value here when we save we dont save blank rules
				$_l_Height:=$_l_oBottom-$_l_oTop
				If ($_l_ObjectNumber>0)
					If (Find in array:C230(PER_al_UsedObjectNumbers; $_l_ObjectNumber)<0)
						APPEND TO ARRAY:C911(PER_al_UsedObjectNumbers; $_l_ObjectNumber)
						//this is so if we re-add the line we do not duplicate the objects we just make them re-appear
					End if 
					OBJECT SET VISIBLE:C603(*; "oRuleField"+(String:C10($_l_ObjectNumber)); False:C215)
					OBJECT SET VISIBLE:C603(*; "oRuleContext"+(String:C10($_l_ObjectNumber)); False:C215)
					OBJECT SET VISIBLE:C603(*; "oRuleValue"+(String:C10($_l_ObjectNumber)); False:C215)
					OBJECT SET VISIBLE:C603(*; "oDelCondition"+(String:C10($_l_ObjectNumber)); False:C215)
					OBJECT SET VISIBLE:C603(*; "oAddCondition"+(String:C10($_l_ObjectNumber)); False:C215)
					
					OBJECT GET COORDINATES:C663(*; "oRuleField"+(String:C10($_l_ObjectNumber)); $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
					//now if there is a 'next row we need to shift everything up//actually i am going make my lif simple and only allow deletion of the LAST row
					//now we need to enable the add button on the LAST row
					If ($_l_ObjectNumber>1)
						OBJECT GET COORDINATES:C663(*; "oRuleField"+(String:C10($_l_ObjectNumber-1)); $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
						
						OBJECT SET ENABLED:C1123(*; "oAddCondition"+(String:C10($_l_ObjectNumber-1)); True:C214)
						OBJECT SET ENABLED:C1123(*; "oDelCondition"+(String:C10($_l_ObjectNumber-1)); True:C214)
						GOTO OBJECT:C206(*; "oRuleValue"+(String:C10($_l_ObjectNumber-1)))
					Else 
						//these are false because there is no rule value for the object-we just cleared it.
						
						OBJECT SET ENABLED:C1123(*; "oAddCondition"; True:C214)
						OBJECT SET ENABLED:C1123(*; "oDelondition"; True:C214)
						GOTO OBJECT:C206(*; "oRuleValue")
						OBJECT GET COORDINATES:C663(*; "oRuleField"; $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
						
					End if 
					
				Else 
					OBJECT GET COORDINATES:C663(*; "oRuleField"; $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
					//this is the first row enable the add for this row
					//these are false because there is no rule value for the object-we just cleared it.
					
					OBJECT SET ENABLED:C1123(*; "oAddCondition"; False:C215)
					OBJECT SET ENABLED:C1123(*; "oDelondition"; False:C215)
					GOTO OBJECT:C206(*; "oRuleValue")
				End if 
				OBJECT GET COORDINATES:C663(*; "oActionPlan"; $_l_ApLeft; $_l_ApTop; $_l_ApRight; $_l_ApBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WIndowHeight:=($_l_WindowBottom-$_l_windowTop)
				If ($_l_ApTop>($_l_oBottom+8))
					$_l_DIfference:=$_l_ApTop-($_l_oBottom+8)
					RESIZE FORM WINDOW:C890(0; (-$_l_DIfference))
					//SET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_windowTop+50+($_l_oBottom+150))
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/MAIL_RULE/oDelCondition"; $_t_oldMethodName)
