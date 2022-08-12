//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_ScrRepLPTit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; $_t_titleCompany; $_t_titleCompanyName; $_t_titleCreditLimit; $_t_titleDays; $_t_titleDays2Range; $_t_titleDays3; $_t_titleDays3Range; $_t_titleTotalDue; ACC_t_PeriodFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ScrRepLPTit")

//Gen_ScrRepLPTit
$_t_oldMethodName:=ERR_MethodTracker("Gen_ScrRepLPTit")
$_t_titleCompany:="Company Code"
$_t_titleCompanyName:="Company Name"
$_t_titleCreditLimit:="Credit Limit"
$_t_titleTotalDue:="Total Due"
If (r1=1)
	$_t_titleDays:="<"+String:C10(DB_GetLedgerADStageOne)+" days"
	$_t_titleDays2Range:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)+" days"
	$_t_titleDays3Range:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days"
	$_t_titleDays3:=">"+String:C10(DB_GetLedgerADStageThree)+" days"
Else 
	MESSAGES OFF:C175
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_t_PeriodFrom)
	ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
	REDUCE SELECTION:C351([PERIODS:33]; 4)
	ORDER BY:C49([PERIODS:33]Period_Code:1; >)
	$_t_titleDays:="to "+[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	$_t_titleDays2Range:=[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	$_t_titleDays3Range:=[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	$_t_titleDays3:="from "+[PERIODS:33]Period_Code:1
	MESSAGES ON:C181
End if 
LB_SetColumnHeaders(->GEN_lb_ItemsArea; "INVi_L"; 1; $_t_titleCompany; $_t_titleCompanyName; $_t_titleCreditLimit; $_t_titleTotalDue; $_t_titleDays; $_t_titleDays2Range; $_t_titleDays3Range; $_t_titleDays3)
ERR_MethodTrackerReturn("Gen_ScrRepLPTit"; $_t_oldMethodName)
