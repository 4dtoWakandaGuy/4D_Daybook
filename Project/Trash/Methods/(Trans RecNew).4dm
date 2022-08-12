//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_RecNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_RecNew")
If (DB_t_CurrentFormUsage="BRTrans")
	If (([TRANSACTIONS:29]Account_Code:3>=Acc_t_AccountCodeFrom) & ([TRANSACTIONS:29]Account_Code:3<=Acc_t_AccountCodeTo))
		ADD TO SET:C119([TRANSACTIONS:29]; "Master")
	End if 
End if 
ERR_MethodTrackerReturn("Trans_RecNew"; $_t_oldMethodName)