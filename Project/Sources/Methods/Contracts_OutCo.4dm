//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_OutCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_CostPrice)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_OutCo")
$_r_CostPrice:=Sum:C1([CONTRACTS:17]Contract_Cost:7)
vText:=vText+"Total Cost: "+String:C10($_r_CostPrice; "|Accounts")
ERR_MethodTrackerReturn("Contracts_OutCo"; $_t_oldMethodName)