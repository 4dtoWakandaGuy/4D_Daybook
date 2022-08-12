If (False:C215)
	//object Name: Object Name:      ACC_ReconcileSelectTransactions.oButtonContinue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 16:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_Reconcile; ACC_bo_ReconcileManual; ACC_bo_ReconcileModified)
	C_REAL:C285(ACC_R_RemainingtoReconcile; ACC_R_SelectedReconcilles)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.oButtonContinue"; Form event code:C388)
If (ACC_R_SelectedReconcilles#0) | (ACC_bo_ReconcileModified)
	If (Not:C34(ACC_bo_ReconcileManual))
		If (ACC_R_RemainingtoReconcile#0)
			//If (Abs(ACC_R_SelectedReconcilles+[ACC_Bank_Statements]Bank_ReconciledAmount)>([ACC_Bank_Statements]Bank_CreditAmount+[ACC_Bank_Statements]Bank_DebitAmount))
			Gen_Alert("The selected transactions do not equal the value of the statement item, if you need to do a partial reconcile on a line hold the alt key as you select it")
			
		Else 
			ACC_bo_Reconcile:=True:C214
			CANCEL:C270
		End if 
	Else 
		ACC_bo_Reconcile:=True:C214
		CANCEL:C270
	End if 
Else 
	ACC_bo_Reconcile:=False:C215
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oButtonContinue"; $_t_oldMethodName)
