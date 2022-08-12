//%attributes = {}
If (False:C215)
	//Project Method Name:      TRANS_BuildUniqueTAX
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
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRANS_BuildUniqueTAX")

$0:=ACC_Buildunique(""; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
ERR_MethodTrackerReturn("TRANS_BuildUniqueTAX"; $_t_oldMethodName)
