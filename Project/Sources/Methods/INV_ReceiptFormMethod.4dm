//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ReceiptFormMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/01/2014 00:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld; DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; vDetails; vLayCode; vNumber; vOrderCode; vTitle; vTitle1; vTitle12; vTitle14; vTitle15; vTitle3)
	C_TEXT:C284(vTitle4; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ReceiptFormMethod")

//Set_Fonts ("vNumber+vDate+vDetails+vOrderCode";◊DataSize)
//Set_Fonts ("vTitReg+vTitDepCo+vTitAdd";◊TextSize)
RELATE ONE:C42([INVOICES:39]Company_Code:2)
Comp_DetailsI
If (vDetails="")
	Address_Details
End if 
vTitle1:="Remittance From"
vTitle3:="Receipt No"
vTitle4:="Date"
vTitle12:="Invoice No"
vTitle14:="Invoice Date"
vTitle15:="Receipt "+[INVOICES:39]Currency_Code:27
vTitle7:="Total Receipt "+[INVOICES:39]Currency_Code:27
vTitle:="REMITTANCE RECEIPT"
vDate:=[INVOICES:39]Invoice_Date:4
vNumber:=[INVOICES:39]Invoice_Number:1
vTotal:=[INVOICES:39]Total_Paid:6
Set_FontsTitle
If (vLayCode#[INVOICES:39]Invoice_Number:1)
	$_bo_UseOld:=False:C215
	If ($_bo_UseOld)
		
	Else 
		INV_GetAllocations([INVOICES:39]Invoice_Number:1)
		ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6)
		
		Case of 
			: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#[INVOICES:39]Invoice_Number:1)
				vLayCode:=[XInvoiceAllocation:126]xInvoiceNumber:2
			: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#[INVOICES:39]Invoice_Number:1)
				vLayCode:=[XInvoiceAllocation:126]xCreditNumber:3
			: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#[INVOICES:39]Invoice_Number:1)
				vLayCode:=[XInvoiceAllocation:126]xReceiptNumber:4
			: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#[INVOICES:39]Invoice_Number:1)
				vLayCode:=[XInvoiceAllocation:126]xDepositNumber:5
		End case 
	End if 
	
	
End if 
If ([COMPANIES:2]Autopay_Number:47#"")
	vTitle8:="Autopay No"
Else 
	vTitle8:=""
End if 
vOrderCode:=[COMPANIES:2]Autopay_Number:47
Forms_GenTit(->[INVOICES:39]Analysis_Code:17)
ERR_MethodTrackerReturn("INV_ReceiptFormMethod"; $_t_oldMethodName)