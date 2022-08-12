If (False:C215)
	//object Name: Object Name:      ACC_ImportStatement.oFilterReconcilled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2012 12:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ABC_bo_UnReconciled)
	C_DATE:C307(ACC_D_TransactsFrom; ACC_D_Transactsto)
	C_TEXT:C284($_t_oldMethodName; ABC_t_AccountCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.oFilterReconcilled"; Form event code:C388)

QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
If (ACC_D_TransactsFrom>!00-00-00!)
	QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=ACC_D_TransactsFrom)
End if 
If (ACC_D_Transactsto>!00-00-00!)
	QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5<=ACC_D_Transactsto)
End if 
If (ABC_bo_UnReconciled)
	QUERY SELECTION BY FORMULA:C207([ACC_Bank_Statements:198]; Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11)<((Abs:C99([ACC_Bank_Statements:198]Bank_CreditAmount:9))+(Abs:C99([ACC_Bank_Statements:198]Bank_DebitAmount:8))))
End if 
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oFilterReconcilled"; $_t_oldMethodName)
