If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/06/2011 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_BatchItemID; ACC_l_ItemViewContext; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransAmountCredit; ACC_R_TransAmountDebit; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTaxAmtCredit; ACC_R_TransTaxAmtDebit; ACC_R_TransTotal; ACC_R_TransTotalCredit; ACC_R_TransTotalDebit)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransCoCode; ACC_t_TransEventCode; ACC_t_TransInvoiceNo; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransJobCode; ACC_t_CompanyName; ACC_t_TransChequeNo; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred)
	C_TEXT:C284(ACC_t_UKEC; ACC_t_UKECCred; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeCred; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_t_TransTransCode; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME)
	C_TEXT:C284(ACC_t_DebitAccountName; ACC_T_TransDescription)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable7"; Form event code:C388)
//This button will send the data back to the main process
Case of 
	: (ACC_l_ItemViewContext=1)  //
		//ACC_t_BatchItemAnalysisCode:=""
		ACC_R_TransAmount:=0
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
		ACC_R_TransAmountDebit:=0
		ACC_R_TransTaxAmtDebit:=0
		ACC_R_TransTotalDebit:=0
		ACC_t_TransCurrencyCodeCred:=""
		ACC_R_TransAmountCredit:=0
		ACC_t_TransTaxCodeCred:=""
		ACC_t_UKECCred:=""
		ACC_R_TransTaxAmtCredit:=0
		ACC_R_TransTotalCredit:=0
		ACC_SUBITEMSETDISPLAY
		//
		
End case 
ERR_MethodTrackerReturn("OBJ:SubItemDisplay,BtranClear"; $_t_oldMethodName)
