//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vDoDateF; vDoDateT; vIDateF; vIDateT; vRDateF; vRDateT; vSDateF; vSDateT)
	C_LONGINT:C283($_l_PeriodID)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; vChargesF; vChargesT; vDueF; vDueTo; VinvF)
	C_REAL:C285(vInvT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalCodeT)
	C_TEXT:C284(vArea; vCompCode; vCompName; vContCode; vEvent; vForename; vInvNoF; vInvNoT; vJob; vLayer; vName)
	C_TEXT:C284(vProdCode; vSales; vStage; vSurname; vTerms; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_SelPvs")
vCompCode:=""
vCompName:=""
vContCode:=""
If (DB_t_CurrentFormUsage="Rec")
	vIDateF:=<>DB_d_CurrentDate
	vIDateT:=<>DB_d_CurrentDate
Else 
	vIDateF:=!00-00-00!
	vIDateT:=!00-00-00!
End if 
vRDateF:=!00-00-00!
vRDateT:=!00-00-00!
vInvNoF:=""
vInvNoT:=""
vName:=""
vProdCode:=""
If (DB_t_CurrentFormUsage="Apple")
	If (DB_GetOrganisation="@vector@")
		vProdCode:="21AAPP@"
	End if 
	vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate-15); Year of:C25(<>DB_d_CurrentDate-15))
	$_l_PeriodID:=Check_Period
	ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
	ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
Else 
	If (DB_t_CurrentFormUsage="VAT")
		vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
		Check_Period
		ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
		vDate:=[PERIODS:33]To_Date:4-75
		Check_Period
		ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
		vName:="E"
	Else 
		ACC_t_PeriodFrom:=""
		ACC_t_PeriodTo:=""
	End if 
End if 
vForename:=""
vSurname:=""
vDueF:=0
vDueTo:=0
ACC_t_AnalysisCodeFrom:=""
vAnalCodeT:=""
vAmountF:=0
vAmountT:=0
vDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
vStage:=""
vJob:=""
vInvF:=0
vInvT:=0
vChargesF:=0
vChargesT:=0
ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
vArea:=""
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vLayer:=DB_GetLedgerActualLayer
vEvent:=""
Acc_t_AccountCodeFrom:=""
Acc_t_AccountCodeTo:=""
vSales:=""
vTerms:=""
vFilePtr:=->[INVOICES:39]
vTitle13:="vCompCode+vCompName+vContCode+vIDateF+vIDateT+vRDateF+vRDateT+"
vTitle13:=vTitle13+"vInvNoF+vInvNoT+vName+vProdCode+ACC_t_PeriodFrom+ACC_t_PeriodTo+vForename+vSurname+vDueF+"
vTitle13:=vTitle13+"vDueTo+ACC_t_AnalysisCodeFrom+vAnalCodeT+vAmountF+vAmountT+vDoDateF+vDoDateT+vStage+vJob+"
vTitle13:=vTitle13+"vInvF+vInvT+vChargesF+vChargesT+ACC_t_CurrencyCode+vArea+vSDateF+vSDateT+vLayer+"
vTitle13:=vTitle13+"vEvent+Acc_t_AccountCodeFrom+Acc_t_AccountCodeTo+r0+r1+ch0+c1+ch2+ch3+ch5+ch6+ch7+ch8+vSales+vTerms+"
ERR_MethodTrackerReturn("Invoices_SelPvs"; $_t_oldMethodName)