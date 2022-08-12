//%attributes = {}
If (False:C215)
	//Project Method Name:      MState_Calc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($No)
	C_REAL:C285(v0; v31; v61; v91; vDue; vInvoiced; vPaid)
	C_TEXT:C284($_t_oldMethodName; vCompany; vInvoices)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MState_Calc")
//MState_Calc
vCompany:=[COMPANIES:2]Company_Code:1
MState_CalcRel
vInvoiced:=0
vPaid:=0
vDue:=0
v91:=0
v61:=0
v31:=0
v0:=0
vInvoices:=""
While (Not:C34(End selection:C36([INVOICES:39])))
	vInvoices:=vInvoices+[INVOICES:39]Invoice_Number:1+Char:C90(9)+String:C10([INVOICES:39]Invoice_Date:4)+Char:C90(9)+String:C10([INVOICES:39]Total_Due:7; "|Accounts")+Char:C90(13)
	$No:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
	If ($No>DB_GetLedgerADStageThree)
		v91:=v91+[INVOICES:39]Total_Due:7
	End if 
	If (($No>DB_GetLedgerADStageTwo) & ($No<=DB_GetLedgerADStageThree))
		v61:=v61+[INVOICES:39]Total_Due:7
	End if 
	If (($No>DB_GetLedgerADStageOne) & ($No<=DB_GetLedgerADStageTwo))
		v31:=v31+[INVOICES:39]Total_Due:7
	End if 
	If ($No<=DB_GetLedgerADStageOne)
		v0:=v0+[INVOICES:39]Total_Due:7
	End if 
	vInvoiced:=vInvoiced+[INVOICES:39]Total_Invoiced:5
	vPaid:=vPaid+[INVOICES:39]Total_Paid:6
	vDue:=vDue+[INVOICES:39]Total_Due:7
	NEXT RECORD:C51([INVOICES:39])
End while 
//vInvoicedT:=String(vInvoiced;"|Accounts")
//vPaidT:=String(vPaid;"|Accounts")
//vDueT:=String(vDue;"|Accounts")
//vDue3T:=String(v91;"|Accounts")
//vDue2T:=String(v61;"|Accounts")
//vDue1T:=String(v31;"|Accounts")
//vDue0T:=String(v0;"|Accounts")
ERR_MethodTrackerReturn("MState_Calc"; $_t_oldMethodName)