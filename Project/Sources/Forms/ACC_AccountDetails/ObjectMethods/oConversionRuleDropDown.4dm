If (False:C215)
	//object Name: Object Name:      ACC_AccountDetails.oConversionRuleDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cur_at_MultiCurrVal;0)
	C_TEXT:C284($_t_oldMethodName; CUR_t_MultiCurrVal)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_AccountDetails.oConversionRuleDropDown"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CUR_t_MultiCurrVal:=Cur_at_MultiCurrVal{Cur_at_MultiCurrVal}
		[ACCOUNTS:32]Multicurrency_Valuation:10:=Num:C11(CUR_t_MultiCurrVal="Current Rate")
End case 
ERR_MethodTrackerReturn("OBJ ACC_AccountDetails.oConversionRuleDropDown"; $_t_oldMethodName)
