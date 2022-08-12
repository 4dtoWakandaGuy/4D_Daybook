//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SelIfs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($OM)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vTDateF; SRCH_d_TransToDate)
	C_LONGINT:C283(ch0; ch1; vNo1; vNo2)
	C_REAL:C285(vAmountf; vAmountt)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; TR_t_ReconcilliationReference; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; vAnalCodeT; vChequeNo; vCompCode)
	C_TEXT:C284(vContCode; vContrCode; ACC_t_CurrencyCode; vJobCode; vLayer; ACC_t_PeriodFrom; ACC_t_PeriodTo; vPurchCode; vPurchInvNo; vTransCode; vType)
	C_TEXT:C284(vVATTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SelIfs")
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_Type_Code:1; vTransCode)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Company_Code:9; vCompCode)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Invoice_Number:4; vJobCode)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Purchase_invoice_number:19; vPurchInvNo)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]IO:18; vType)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]UK_EC:21; vContCode)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Purchase_Code:24; vPurchCode)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Job_Code:25; vContrCode)
Sel_SRadio(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Reconciled:14; ch0; True:C214)
Sel_S(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Reconciliation_Reference:33; TR_t_ReconcilliationReference)

Sel_SRadio(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Reconciled:14; ch1; False:C215)
Sel_SINum(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Batch_Number:7; vNo1; vNo2)
Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Account_Code:3; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo)
If (DB_t_CurrentFormUsage="VAT")
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
	$OM:=(Records in selection:C76([TRANSACTIONS:29])>0)
	If ($OM)
		CREATE SET:C116([TRANSACTIONS:29]; "OM")
	End if 
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27<=ACC_t_PeriodTo; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
	QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27=""; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo)
	If ($OM)
		CREATE SET:C116([TRANSACTIONS:29]; "NM")
		UNION:C120("OM"; "NM"; "NM")
		USE SET:C118("NM")
		CLEAR SET:C117("NM")
		CLEAR SET:C117("OM")
	End if 
	Master2(->[TRANSACTIONS:29])
Else 
	Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Period_Code:12; ACC_t_PeriodFrom; ACC_t_PeriodTo)
End if 
Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Analysis_Code:2; ACC_t_AnalysisCodeFrom; vAnalCodeT)
Sel_SIDate(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Trans_Date:5; vTDateF; SRCH_d_TransToDate)
Sel_SIDate(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Entry_Date:11; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
Sel_SIS(->[TRANSACTIONS:29])
Sel_SSNum(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Amount:6; vAmountf; vAmountt)
Sel_SSStrSin(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Cheque_Number:13; vChequeNo)
//Sel_SSStrSin (»[TRANSACTIONS];»[TRANSACTIONS]DC;vStatus)
Sel_SSStrSin(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Tax_Code:20; vVATTitle)
Sel_SCurr(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Currency_Code:22; ACC_t_CurrencyCode)
Sel_SLayer(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Layer_Code:23; vLayer)
ERR_MethodTrackerReturn("Trans_SelIfs"; $_t_oldMethodName)