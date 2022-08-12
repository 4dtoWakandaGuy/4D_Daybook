//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_RemLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 15:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; vDetails; vLayCode; vNumber; vOrderCode; vTitle; vTitle1; vTitle12; vTitle13; vTitle14; vTitle15)
	C_TEXT:C284(vTitle20; vTitle27; vTitle3; vTitle4; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_RemLP")
//Project Method Purch_RemLP 26/3/2(ID 32424-1464)

//Purch_RemLP
RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
Comp_DetailsI
If (vDetails="")
	Address_Details
End if 
vTitle1:="Remittance To"
vTitle3:="Remittance No"
vTitle4:="Date"
vTitle12:="Invoice No"
vTitle13:="Our Ref"
vTitle14:="Invoice Date"
vTitle15:="Payment "+[PURCHASE_INVOICES:37]Currency_Code:23
vTitle20:="Payment "+Char:C90(219)
vTitle7:="Total Payment "+[PURCHASE_INVOICES:37]Currency_Code:23
vTitle27:="Total Payment "+[PURCHASE_INVOICES:37]Currency_Code:23+"/"+"€"

vTitle:="REMITTANCE ADVICE"
vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
vNumber:=[PURCHASE_INVOICES:37]Purchase_Code:1
vTotal:=[PURCHASE_INVOICES:37]Total_Paid:8
If (vLayCode#[PURCHASE_INVOICES:37]Purchase_Code:1)
	QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
	ORDER BY:C49([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3; >)
	vLayCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
End if 
If ([COMPANIES:2]Autopay_Number:47#"")
	vTitle8:="Autopay No"
Else 
	vTitle8:=""
End if 
vOrderCode:=[COMPANIES:2]Autopay_Number:47
Forms_GenTit(->[PURCHASE_INVOICES:37]Analysis_Code:15)
ERR_MethodTrackerReturn("Purch_RemLP"; $_t_oldMethodName)