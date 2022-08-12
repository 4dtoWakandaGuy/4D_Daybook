If (False:C215)
	//object Name: [ACCOUNT_BALANCES]Budgets_Out.3D Button2
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].Budgets_Out.3D Button2"; Form event code:C388)
//WT_SORT_TABLE_3 (->[ACC BALANCES];"Text2";
GEN_SortOutput(->[ACCOUNT_BALANCES:34]Period_Code:4)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].Budgets_Out.3D Button2"; $_t_oldMethodName)