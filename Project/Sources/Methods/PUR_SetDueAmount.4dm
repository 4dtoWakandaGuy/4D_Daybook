//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_SetDueAmount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/10/2011 17:02 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Report)
	C_REAL:C285($_r_AllocationAmount; $_r_TotalPaid; $0; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseInvoiceCode; $_t_ReportString1; $_t_ReportString2; $_t_ReportString3; $_t_ReportString4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_SetDueAmount")
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
$_t_ReportString1:=""
$_t_ReportString2:=""
$_t_ReportString3:=""
$_t_ReportString4:=""
$_bo_Report:=False:C215
$_t_PurchaseInvoiceCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
$0:=[PURCHASE_INVOICES:37]Total_Due:9

If ($_t_PurchaseInvoiceCode#"")
	If ((Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2))#[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19)
		
		$_bo_Report:=True:C214
		[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2)
	End if 
	If ((Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2))#[PURCHASE_INVOICES:37]Total_Invoiced:7)
		$_bo_Report:=True:C214
		[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
	End if 
	If ((Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2))#[PURCHASE_INVOICES:37]Total_Tax:25)
		$_bo_Report:=True:C214
		[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
	End if 
	
	
	Case of 
		: ([PURCHASE_INVOICES:37]State:24=-3)  //receipt
			$0:=0
		: ([PURCHASE_INVOICES:37]State:24=-2)  // pre payment
			QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
			$_r_TotalPaid:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
			$_r_AllocationAmount:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2); 2; 2)
			vTotal:=Gen_Round((0-[PURCHASE_INVOICES:37]Total_Paid:8)-$_r_AllocationAmount; 2; 2)
			If ([PURCHASE_INVOICES:37]Total_Due:9#(Vtotal))
				$0:=vTotal
			End if 
			
		Else 
			
			QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
			$_r_TotalPaid:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
			If ([PURCHASE_INVOICES:37]Total_Due:9#([PURCHASE_INVOICES:37]Total_Invoiced:7-$_r_TotalPaid))
				$0:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-$_r_TotalPaid); 2; 2)
				
				$_bo_Report:=True:C214
			End if 
	End case 
	
Else 
	//zTRACE
End if 
ERR_MethodTrackerReturn("PUR_SetDueAmount"; $_t_oldMethodName)
