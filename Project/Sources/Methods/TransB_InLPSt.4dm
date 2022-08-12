//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_InLPSt
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
	C_TEXT:C284($_t_oldMethodName; vInvTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InLPSt")
Case of 
	: ([TRANSACTION_BATCHES:30]State:15=0)
		vInvTitle:="UNPROCESSED TRANSACTIONS"
	: ([TRANSACTION_BATCHES:30]State:15=1)
		vInvTitle:="BATCHED TRANSACTIONS"
	: ([TRANSACTION_BATCHES:30]State:15=2)
		vInvTitle:="POSTED TRANSACTIONS"
End case 
ERR_MethodTrackerReturn("TransB_InLPSt"; $_t_oldMethodName)