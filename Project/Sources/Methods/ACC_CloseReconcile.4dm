//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_CloseReconcile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2013 15:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_Reconcile; ACC_bo_ReconcileModified)
	C_REAL:C285(ACC_R_RemainingtoReconcile; ACC_R_SelectedReconcilles)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_CloseReconcile")
If (ACC_R_SelectedReconcilles#0) | (ACC_bo_ReconcileModified)
	ACC_bo_Reconcile:=True:C214
	Gen_Confirm("Save Reconciliation?"; "Yes"; "No")
	If (OK=1)
		If (ACC_R_RemainingtoReconcile#0)
			//If (Abs(ACC_R_SelectedReconcilles+[ACC_Bank_Statements]Bank_ReconciledAmount)>([ACC_Bank_Statements]Bank_CreditAmount+[ACC_Bank_Statements]Bank_DebitAmount))
			Gen_Alert("The selected transactions do not equal the value of the statement item, if you need to do a partial reconcile on a line hold the alt key as you select it")
			
		Else 
			ACC_bo_Reconcile:=False:C215
			CANCEL:C270
		End if 
	Else 
		ACC_bo_Reconcile:=False:C215
		CANCEL:C270
	End if 
Else 
	ACC_bo_Reconcile:=False:C215
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("ACC_CloseReconcile"; $_t_oldMethodName)