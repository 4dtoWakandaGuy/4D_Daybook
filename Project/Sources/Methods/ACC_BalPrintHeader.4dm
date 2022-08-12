//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalPrintHeader
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAnalCodeT)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(vTitle2)
	C_TEXT:C284(ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; vAnalCodeT; vText; vTitle2; $_t_oldMethodName; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom)
	C_TEXT:C284(ACC_t_PeriodTo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalPrintHeader")
//ACC_BalPrintHeader
vTitle2:="Analyses: "
If ((ACC_t_AnalysisCodeFrom="") & (vAnalCodeT=""))
	vTitle2:=vTitle2+"All    Periods: "
Else 
	vTitle2:=vTitle2+ACC_t_AnalysisCodeFrom+" to "+vAnalCodeT+"    Periods: "
End if 
If ((ACC_t_PeriodFrom#"") | (ACC_t_PeriodTo#""))
	vTitle2:=vTitle2+ACC_t_PeriodFrom+" to "+ACC_t_PeriodTo
Else 
	vTitle2:=vTitle2+"All"
End if 
If (ACC_t_CurrencyCode#"")
	vTitle2:=vTitle2+"    Currency: "+ACC_t_CurrencyCode
End if 
If (vText#"")
	vTitle2:=vTitle2+"    Layer: "+vText
End if 
Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; 200)  //Changed June 2004
ERR_MethodTrackerReturn("ACC_BalPrintHeader"; $_t_oldMethodName)
