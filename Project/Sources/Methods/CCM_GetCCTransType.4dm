//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetCCTransType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 18:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetCCTransType")
$0:=DB_GetLedgerTRANSRECpost
ERR_MethodTrackerReturn("CCM_GetCCTransType"; $_t_oldMethodName)