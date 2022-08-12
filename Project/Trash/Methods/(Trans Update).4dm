//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 21:53
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

$_t_oldMethodName:=ERR_MethodTracker("Trans Update")
//Trans Update
Start_Process
Gen_Confirm("This Utility deletes all Transactions, then reposts them from the "+"original Batches."+Char:C90(13)+"NB: Bank Reconciliations will be lost."; ""; "")
If (OK=1)
	Are_You_Sure
	If (OK=1)
		Gen_Confirm("Are you really sure?"; "No"; "Yes")
		If (OK=0)
			OK:=1
			READ WRITE:C146([TRANSACTIONS:29])
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			READ WRITE:C146([ACCOUNT_BALANCES:34])
			
			//DEFAULT TABLE([TRANSACTIONS])
			ALL RECORDS:C47([TRANSACTIONS:29])
			DELETE SELECTION:C66([TRANSACTIONS:29])
			
			//DEFAULT TABLE([ACC BALANCES])
			ALL RECORDS:C47([ACCOUNT_BALANCES:34])
			DELETE SELECTION:C66([ACCOUNT_BALANCES:34])
			//DEFAULT TABLE([TRANS IN])
			ALL RECORDS:C47([TRANSACTION_BATCHES:30])
			Trans_Update2
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Trans Update"; $_t_oldMethodName)