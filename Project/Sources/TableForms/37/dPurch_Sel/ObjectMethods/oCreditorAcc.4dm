If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oCreditorAcc
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oCreditorAcc"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->Acc_t_AccountCodeFrom; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oCreditorAcc"; $_t_oldMethodName)
