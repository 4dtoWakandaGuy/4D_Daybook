//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans No
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans No")
[TRANSACTIONS:29]Batch_Number:7:=[TRANSACTION_BATCHES:30]Batch_Number:10
//Copied to Post_Amount
ERR_MethodTrackerReturn("Trans No"; $_t_oldMethodName)