If (False:C215)
	//object Name: [ACCOUNT_BALANCES]AccBal_Out.3D Button4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].AccBal_Out.3D Button4"; Form event code:C388)

GEN_SortOutput(->[ACCOUNT_BALANCES:34]Currency_Code:6)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].AccBal_Out.3D Button4"; $_t_oldMethodName)