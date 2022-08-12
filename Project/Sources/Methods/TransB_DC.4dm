//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_DC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 17:19
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

$_t_oldMethodName:=ERR_MethodTracker("TransB_DC")
If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
	If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#[ACCOUNTS:32]Account_Code:2)
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
	End if 
	[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
	If ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="")
		[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
	End if 
Else 
	[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
End if 

If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
	If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#[ACCOUNTS:32]Account_Code:2)
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
	End if 
	[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
	If ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="")
		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
	End if 
Else 
	[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
End if 
ERR_MethodTrackerReturn("TransB_DC"; $_t_oldMethodName)