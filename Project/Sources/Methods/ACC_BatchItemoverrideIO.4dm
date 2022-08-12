//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchItemoverrideIO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchItemoverrideIO")
If (Count parameters:C259>=1)
	If ($1->="N") & ($2->="N")
		//the user would have manually 'fixed' this
		If ($1->#[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15)
			//they changed the debit
			$1->:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
		Else 
			$2->:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_BatchItemoverrideIO"; $_t_oldMethodName)
