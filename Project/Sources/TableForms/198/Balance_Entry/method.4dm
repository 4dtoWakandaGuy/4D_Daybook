
If (False:C215)
	//Object Name:      [ACC_Bank_Statements].Balance_Entry
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [ACC_Bank_Statements]Balance_Entry"; Form event code:C388)

BankStatementIN_LP(Form event code:C388)
ERR_MethodTrackerReturn("FM [ACC_Bank_Statements]Balance_Entry"; $_t_oldMethodName)
