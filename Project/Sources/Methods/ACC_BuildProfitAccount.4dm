//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BuildProfitAccount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2014 16:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; ACC_t_ProfitAccount; ACC_t_ProfitAccountBFWD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BuildProfitAccount")
If (Count parameters:C259>=1)
	
	If (ACC_t_ProfitAccount="")
		ACC_t_ProfitAccount:=DB_GetLedgerProfitACC
	End if 
	If (ACC_t_ProfitAccountBFWD="")
		ACC_t_ProfitAccountBFWD:=DB_GetLedgerBroughtforwardACC
	End if 
	//We can filter out anything else here
	
	If ($1#ACC_t_ProfitAccount) & ($1#ACC_t_ProfitAccountBFWD)
		$0:=ACC_Buildunique(ACC_t_ProfitAccount; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
	Else 
		$0:=""
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_BuildProfitAccount"; $_t_oldMethodName)