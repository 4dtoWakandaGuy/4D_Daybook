//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobInvInclTaxTC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobInvInclTaxTC")

//JC_UpdateJobInvInclTaxTC

//added 19/03/07 -kmw

//relies on job that is to be updated to be loaded
//relies on job stages belonging to that job to be in current selection
//relies on correct (invoiced) order items belonging to that job (but that do not belong to a specific job stage) to be in the current selection

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobInvInclTaxTC")
[JOBS:26]AS_Invoice_Including_Tax:13:=Sum:C1([JOB_STAGES:47]AS_Invoice_Including_Tax:28)+Sum:C1([ORDER_ITEMS:25]Total_Amount:9)
ERR_MethodTrackerReturn("JC_UpdateJobInvInclTaxTC"; $_t_oldMethodName)