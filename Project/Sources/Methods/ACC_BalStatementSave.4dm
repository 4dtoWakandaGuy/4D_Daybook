//%attributes = {}
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_AccBalanceStatement; $_obj_AccBalanceStatements; $_obj_FormData; $1)
End if 
//Code Starts Here

If (Count parameters:C259>=1)
	$_obj_FormData:=$1
	If ($_obj_FormData.id>0)
		$_obj_AccBalanceStatements:=ds:C1482.ACC_Bank_Statements.query("x_ID =:1"; $_obj_FormData.id)
		If ($_obj_AccBalanceStatements.length=0)
			$_obj_AccBalanceStatement:=ds:C1482.ACC_Bank_Statements.new()
			$_obj_AccBalanceStatement.x_ID:=$_obj_FormData.id
		Else 
			$_obj_AccBalanceStatement:=$_obj_AccBalanceStatements[0]
		End if 
	Else 
		$_obj_AccBalanceStatement:=ds:C1482.ACC_Bank_Statements.new()
		
	End if 
	$_obj_AccBalanceStatement.Bank_Transaction_Details:=$_obj_FormData.Bank_Transaction_Details
	$_obj_AccBalanceStatement.Bank_Account_Number:=$_obj_FormData.Bank_Account_Number
	$_obj_AccBalanceStatement.Bank_TransactionDate:=$_obj_FormData.Bank_TransactionDate
	$_obj_AccBalanceStatement.Bank_TransactionReference:=$_obj_FormData.Bank_TransactionReference
	$_obj_AccBalanceStatement.Bank_TransactionType:=$_obj_FormData.Bank_TransactionType
	$_obj_AccBalanceStatement.Bank_debitAmount:=$_obj_FormData.Bank_debitAmount
	$_obj_AccBalanceStatement.Bank_CreditAmount:=$_obj_FormData.Bank_CreditAmount
	DB_SaveEntity($_obj_AccBalanceStatement)
End if 
