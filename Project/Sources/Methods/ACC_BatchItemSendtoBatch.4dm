//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchItemSendtoBatch
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
	C_BOOLEAN:C305($_bo_Close)
	C_DATE:C307(ACC_D_BatchDate; ACC_D_TransDate)
	C_LONGINT:C283($1; ACC_l_BatchItemID; ACC_l_CurrentBatchNumber; ACC_l_ParentProcessNumber; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; DB_l_ButtonClickedFunction)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransAmountCredit; ACC_R_TransAmountDebit; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTaxAmtCredit; ACC_R_TransTaxAmtDebit; ACC_R_TransTotal; ACC_R_TransTotalCredit; ACC_R_TransTotalDebit)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName; ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc)
	C_TEXT:C284(ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeCred; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode)
	C_TEXT:C284(ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred; ACC_t_TransTransCode; ACC_t_TransTransCodeOLD; ACC_t_UKEC; ACC_t_UKECCred)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchItemSendtoBatch")
//NG July 2004 this method sends a batch item to the batch entry screen from the batch item entry screen
If (UTI_Semaphore("$_"+String:C10(ACC_l_CurrentBatchNumber)))
	
	If (ACC_t_TransPeriodCode#"")
		If (ACC_R_TransAmount#0) & ((ACC_t_TransCreditAcc#"") | (ACC_t_TransDebitAcc#""))
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_R_TransAmount; ACC_R_TransAmount)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_TransBatchItemID; ACC_l_TransBatchItemID)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransChequeNo; ACC_t_TransChequeNo)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransCoCode; ACC_t_TransCoCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransCreditAcc; ACC_t_TransCreditAcc)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransCreditIO; ACC_t_TransCreditIO)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_TransCreditID; ACC_l_TransCreditID)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransDebitAcc; ACC_t_TransDebitAcc)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransDebitIO; ACC_t_TransDebitIO)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_TransDebitID; ACC_l_TransDebitID)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_T_TransDescription; ACC_T_TransDescription)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransEventCode; ACC_t_TransEventCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransInvoiceNo; ACC_t_TransInvoiceNo)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransJobCode; ACC_t_TransJobCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransLayerCode; ACC_t_TransLayerCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransPeriodCode; ACC_t_TransPeriodCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransPurchinvno; ACC_t_TransPurchinvno)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransPurchCode; ACC_t_TransPurchCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_R_TransSecondAmt; ACC_R_TransSecondAmt)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_R_TransTaxAmt; ACC_R_TransTaxAmt)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransTaxCode; ACC_t_TransTaxCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_R_TransTotal; ACC_R_TransTotal)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_TransTransCode; ACC_t_TransTransCode)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_D_TransDate; ACC_D_TransDate)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_UKEC; ACC_t_UKEC)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_CURRENCYNAME; ACC_t_CURRENCYNAME)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_DebitAccountName; ACC_t_DebitAccountName)  //²
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_CreditAccountName; ACC_t_CreditAccountName)  //²
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_CompanyName; ACC_t_CompanyName)  //²
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_AnalysisNames; ACC_t_AnalysisNames)  //²
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_t_LayerName; ACC_t_LayerName)  //)²
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_BatchItemID; ACC_l_BatchItemID)
			SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_GetButtonFunction("AddBatchItem"))
			POST OUTSIDE CALL:C329(ACC_l_ParentProcessNumber)
		End if 
		
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
		
		
		If (Count parameters:C259>=1)
			$_bo_Close:=($1=DB_GetButtonFunction("OK")) | ($1=DB_GetButtonFunction("Cancel")) | ($1=DB_GetButtonFunction("Next")) | ($1=DB_GetButtonFunction("Previous"))
			
			
		Else 
			$_bo_Close:=False:C215
		End if 
		If (Not:C34($_bo_Close))
			
			ACC_D_TransDate:=ACC_D_BatchDate
			If (False:C215)
				ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1; ->ACC_t_TransTransCode; True:C214)
				ACC_t_TransTransCodeOLD:=ACC_t_TransTransCode
				If (ACC_t_TransPeriodCode="")
					ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; ->ACC_D_TransDate)
				End if 
			End if 
			
			ACC_SUBITEMSETDISPLAY
		End if 
		
		
	Else 
		Gen_Alert("You must enter a valid period to save a batch item!")
	End if 
	UTI_ClearSemaphore("$_"+String:C10(ACC_l_CurrentBatchNumber))
End if 
ERR_MethodTrackerReturn("ACC_BatchItemSendtoBatch"; $_t_oldMethodName)
