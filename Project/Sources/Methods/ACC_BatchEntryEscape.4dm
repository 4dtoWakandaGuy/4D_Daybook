//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchEntryEscape
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 07:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_BatchItemID; ACC_l_ItemEntryProcess; ACC_l_ParentProcessNumber; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID)
	C_REAL:C285(ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc)
	C_TEXT:C284(ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTransCode; ACC_t_UKEC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchEntryEscape")
//Escape  `This button will send the data back to the main process

//ACC_t_BatchItemAnalysisCode:=""
ACC_l_TransBatchItemID:=0
ACC_t_TransChequeNo:=""
ACC_t_TransCoCode:=""
ACC_t_TransCreditAcc:=""
ACC_t_TransCreditIO:=""
ACC_l_TransCreditID:=0
ACC_t_TransCurrencyCode:=""
ACC_t_TransDebitAcc:=""
ACC_t_TransDebitIO:=""
ACC_l_TransDebitID:=0
ACC_T_TransDescription:=""
ACC_t_TransEventCode:=""
ACC_t_TransInvoiceNo:=""
ACC_t_TransJobCode:=""
//ACC_t_TransLayerCode:=""
//ACC_t_TransPeriodCode:=""
ACC_t_TransPurchinvno:=""
ACC_t_TransPurchCode:=""
ACC_R_TransSecondAmt:=0
ACC_R_TransTaxAmt:=0
ACC_t_TransTaxCode:=""
ACC_R_TransTotal:=0
ACC_t_TransTransCode:=""
//ACC_D_TransDate:=
ACC_t_UKEC:=""
ACC_t_CURRENCYNAME:=""
ACC_t_DebitAccountName:=""
ACC_t_CreditAccountName:=""
ACC_t_CompanyName:=""
//ACC_t_AnalysisNames:=
//ACC_t_LayerName:=
ACC_l_BatchItemID:=0
ACC_SUBITEMSETDISPLAY
CANCEL:C270
ACC_l_ItemEntryProcess:=0
SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_ItemEntryProcess; ACC_l_ItemEntryProcess)

BRING TO FRONT:C326(ACC_l_ParentProcessNumber)
ERR_MethodTrackerReturn("ACC_BatchEntryEscape"; $_t_oldMethodName)
