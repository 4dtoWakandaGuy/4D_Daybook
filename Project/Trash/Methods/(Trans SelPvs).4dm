//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 10:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; vDate; vTDateF)
	C_LONGINT:C283($_l_PeriodID; vNo1; vNo2)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vChequeNo)
	C_TEXT:C284(vCompCode; vConfCode; vContCode; vContrCode; vJobCode; vLayer; vPurchCode; vPurchInvNo; vStatus; vTitle13; vTransCode)
	C_TEXT:C284(vType; vVatTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SelPvs")
//Trans_SelPvs
vTransCode:=""
SelPvs_AnalysesCode
vCompCode:=""
vJobCode:=""
vNo1:=0
vNo2:=0
Acc_t_AccountCodeFrom:=""
Acc_t_AccountCodeTo:=""
ACC_t_PeriodFrom:=""
ACC_t_PeriodTo:=""
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vTDateF:=!00-00-00!
SRCH_d_TransToDate:=!00-00-00!
vAmountF:=0
vAmountT:=0
vChequeNo:=""
vStatus:=""
vType:=""
vContCode:=""
vPurchInvNo:=""
vVatTitle:=""
Case of 
	: (DB_t_CurrentFormUsage="Rec")
		Acc_t_AccountCodeFrom:=DB_GetSalesLedgerBankFrom
		Acc_t_AccountCodeTo:=DB_GetSalesLedgerBankFrom
		ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
		vLayer:=DB_GetLedgerActualLayer
	: (DB_t_CurrentFormUsage="VAT")
		vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
		$_l_PeriodID:=Check_Period
		ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
		vDate:=[PERIODS:33]To_Date:4-75
		$_l_PeriodID:=Check_Period
		ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
		ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
		vLayer:=DB_GetLedgerActualLayer
	Else 
		ACC_t_CurrencyCode:=""
		vLayer:=""
End case 
vContrCode:=""
vConfCode:=""
vPurchCode:=""
vFilePtr:=->[TRANSACTIONS:29]
vTitle13:="vTransCode+ACC_t_AnalysisCodeFrom+vAnalCodeT+vCompCode+vJobCode+vNo1+vNo2+Acc_t_AccountCodeFrom+"
vTitle13:=vTitle13+"Acc_t_AccountCodeTo+ACC_t_PeriodFrom+ACC_t_PeriodTo+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vTDateF+SRCH_d_TransToDate+"
vTitle13:=vTitle13+"vAmountF+vAmountT+vChequeNo+vStatus+vType+vContCode+vPurchInvNo+vVatTitle+"
vTitle13:=vTitle13+"ACC_t_CurrencyCode+vLayer+vContrCode+vConfCode+vPurchCode+ch0+ch1+"
ERR_MethodTrackerReturn("Trans_SelPvs"; $_t_oldMethodName)