//%attributes = {}
If (False:C215)
	//Project Method Name:      SetTransinStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/05/2010 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SetTransinStatus")
If ([TRANSACTION_BATCHES:30]Batch_Number:10#0)
	Case of 
		: ([TRANSACTION_BATCHES:30]State:15=0)
			$0:="Not Posted"
		: ([TRANSACTION_BATCHES:30]State:15=1)
			$0:="Batched"
		: ([TRANSACTION_BATCHES:30]State:15=2)
			$0:="Posted"
	End case 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SetTransinStatus"; $_t_oldMethodName)