
If (False:C215)
	//Object Name:      [ACC_Bank_Statements].Balance_Entry.oCreditAmount
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(formBank_CreditAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACC_Bank_Statements]Balance_Entry.oCreditAmount"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		If (formBank_CreditAmount#0)
			OBJECT SET ENTERABLE:C238(*; "oDebitAmount"; False:C215)
		Else 
			OBJECT SET ENTERABLE:C238(*; "oDebitAmount"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACC_Bank_Statements]Balance_Entry.oCreditAmount"; $_t_oldMethodName)
