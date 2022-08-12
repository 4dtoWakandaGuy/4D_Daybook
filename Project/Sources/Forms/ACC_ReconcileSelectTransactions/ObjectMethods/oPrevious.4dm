If (False:C215)
	//object Name: Object Name:      ACC_ReconcileSelectTransactions.oPrevious
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/02/2012 15:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ABR_bo_PreviousRecord)
	C_REAL:C285(ACC_R_SelectedReconcilles)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.oPrevious"; Form event code:C388)

If (Abs:C99(ACC_R_SelectedReconcilles+[ACC_Bank_Statements:198]Bank_ReconciledAmount:11)>([ACC_Bank_Statements:198]Bank_CreditAmount:9+[ACC_Bank_Statements:198]Bank_DebitAmount:8))
	Gen_Alert("The selected transactions to reconcile exceed the value of the statement, if you need to do a partial reconcile on a line hold the alt key as you select it")
	
Else 
	ABR_bo_PreviousRecord:=True:C214
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oPrevious"; $_t_oldMethodName)
