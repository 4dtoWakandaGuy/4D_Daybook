//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobInvExclTaxTC
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobInvExclTaxTC")

//JC_UpdateJobInvExclTaxTC

//added 19/03/07 -kmw

//relies on job that is to be updated to be loaded
//relies on job stages belonging to that job to be in current selection
//relies on correct (invoiced) order items belonging to that job (but that do not belong to a specific job stage) to be in the current selection

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobInvExclTaxTC")
[JOBS:26]AS_Invoice_Excluding_Tax:12:=Sum:C1([JOB_STAGES:47]AS_Invoice_Excluding_Tax:9)+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
ERR_MethodTrackerReturn("JC_UpdateJobInvExclTaxTC"; $_t_oldMethodName)