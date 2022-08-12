//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vIDateF; vIDateT; vPDateF; vPDateT; vRDateF; vRDateT)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; vChargesF; vChargesT; vDueF; vDueTo; VinvF)
	C_REAL:C285(vInvT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; vCompCode; vCompName; vEvent; vJob)
	C_TEXT:C284(vLayer; vName; vOrderNo; ACC_t_PeriodFrom; ACC_t_PeriodTo; vProdCode; vPurchCode; vPurchInvNo; vStage; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch SelPvs")
vCompCode:=""
vCompName:=""
vPurchInvNo:=""


If (DB_t_CurrentFormUsage="Cheq")
	vIDateF:=<>DB_d_CurrentDate
	vIDateT:=<>DB_d_CurrentDate
Else 
	vIDateF:=!00-00-00!
	vIDateT:=!00-00-00!
End if 
vRDateF:=!00-00-00!
vRDateT:=!00-00-00!
vPDateF:=!00-00-00!
vPDateT:=!00-00-00!
vPurchCode:=""
vProdCode:=""
vOrderNo:=""
vInvF:=0
vInvT:=0
vChargesF:=0
vChargesT:=0
vDueF:=0
vDueTo:=0
ACC_t_PeriodFrom:=""
ACC_t_PeriodTo:=""
SelPvs_AnalysesCode
vName:=""
vAmountF:=0
vAmountT:=0
ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
vLayer:=DB_GetLedgerActualLayer
vEvent:=""
Acc_t_AccountCodeFrom:=""
Acc_t_AccountCodeTo:=""
vStage:=""
vJob:=""
vFilePtr:=->[PURCHASE_INVOICES:37]
vTitle13:="vCompCode+vCompName+vPurchInvNo+vIDateF+vIDateT+vRDateF+vRDateT+vPDateF+"
vTitle13:=vTitle13+"vPDateT+vPurchCode+vProdCode+vOrderNo+vInvF+vInvT+vChargesF+vChargesT+"
vTitle13:=vTitle13+"vDueF+vDueTo+ACC_t_PeriodFrom+ACC_t_PeriodTo+ACC_t_AnalysisCodeFrom+vAnalCodeT+vName+vAmountF+"
vTitle13:=vTitle13+"vAmountT+ACC_t_CurrencyCode+vLayer+vEvent+Acc_t_AccountCodeFrom+Acc_t_AccountCodeTo+"
vTitle13:=vTitle13+"ch0+ch1+ch2+ch3+ch4+ch5+ch6+ch7+r0+r1+vStage+vJob+"
ERR_MethodTrackerReturn("Purch SelPvs"; $_t_oldMethodName)