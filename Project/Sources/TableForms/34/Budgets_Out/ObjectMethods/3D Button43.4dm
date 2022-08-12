If (False:C215)
	//object Name: [ACCOUNT_BALANCES]Budgets_Out.3D Button43
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].Budgets_Out.3D Button43"; Form event code:C388)
//WT_SORT_TABLE_3 (->[ACC BALANCES];"Text5";->[ACC BALANCES]Account Code)
GEN_SortOutput(->[ACCOUNT_BALANCES:34]Account_Code:2)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].Budgets_Out.3D Button43"; $_t_oldMethodName)