//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_BalStatementLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/05/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_FormData; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_obj_FormData:=$1
	If ($_obj_FormData.Bank_Transaction_Details=Null:C1517)
		$_obj_FormData.Bank_Transaction_Details:=""
	End if 
	If ($_obj_FormData.Bank_CreditAmount=Null:C1517)
		$_obj_FormData.Bank_CreditAmount:=0
	End if 
	If ($_obj_FormData.Bank_debitAmount=Null:C1517)
		$_obj_FormData.Bank_debitAmount:=0
	End if 
	If ($_obj_FormData.Bank_TransactionType=Null:C1517)
		$_obj_FormData.Bank_TransactionType:=""
	End if 
	If ($_obj_FormData.Bank_TransactionReference=Null:C1517)
		$_obj_FormData.Bank_TransactionReference:=""
	End if 
	If ($_obj_FormData.Bank_TransactionDate=Null:C1517)
		$_obj_FormData.Bank_TransactionDate:=!00-00-00!
	End if 
	If ($_obj_FormData.Bank_Account_Number="")
		$_obj_FormData.Bank_Account_Number:=""
	End if 
End if 
If (Not:C34($_obj_FormData.x_ID=Null:C1517))
	If ($_obj_FormData.x_ID=0)
		$_obj_FormData.x_ID:=AA_GetNextID(->[ACC_Bank_Statements:198]x_ID:1)
	End if 
Else 
	$_obj_FormData.x_ID:=AA_GetNextID(->[ACC_Bank_Statements:198]x_ID:1)
End if 
