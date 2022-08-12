
If (False:C215)
	//Object Name:      [ACCOUNTS].Accounts_in.oFIlterAccounts
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/07/2019
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS]Accounts_in.oFIlterAccounts"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(*; "oSubFormContainer"; True:C214)
		
		EXECUTE METHOD IN SUBFORM:C1085("oSubFormContainer"; "ACC_ShowFiltersSubform")
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS]Accounts_in.oFIlterAccounts"; $_t_oldMethodName)
