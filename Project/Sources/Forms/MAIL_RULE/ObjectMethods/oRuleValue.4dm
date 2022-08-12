
If (False:C215)
	//Object Name:      MAIL_RULE.oRuleValue
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
	C_POINTER:C301($_ptr_CurrentObject)
	C_TEXT:C284($_t_ButtonName; $_t_ButtonName2; $_t_oldMethodName; $_t_VarName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/MAIL_RULE/oRuleValue"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		$_ptr_CurrentObject:=OBJECT Get pointer:C1124(Object current:K67:2)
		
		RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
		$_l_ObjectNumber:=Num:C11($_t_VarName)
		If ($_l_ObjectNumber>0)
			$_t_ButtonName:="oAddCondition"+String:C10($_l_ObjectNumber)
			$_t_ButtonName2:="oDelCondition"+String:C10($_l_ObjectNumber)
		Else 
			$_t_ButtonName:="oAddCondition"
			$_t_ButtonName2:="oDelCondition"
		End if 
		
		OBJECT SET ENABLED:C1123(*; $_t_ButtonName; ($_ptr_CurrentObject->#""))
		OBJECT SET ENABLED:C1123(*; $_t_ButtonName2; ($_ptr_CurrentObject->#""))
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/MAIL_RULE/oRuleValue"; $_t_oldMethodName)
