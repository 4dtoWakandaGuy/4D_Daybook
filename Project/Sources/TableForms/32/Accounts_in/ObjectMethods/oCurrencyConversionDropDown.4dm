If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Variable10"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CUR_t_MultiCurrVal:=Cur_at_MultiCurrVal{Cur_at_MultiCurrVal}
		[ACCOUNTS:32]Multicurrency_Valuation:10:=Num:C11(CUR_t_MultiCurrVal="Current Rate")
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Variable10"; $_t_oldMethodName)
