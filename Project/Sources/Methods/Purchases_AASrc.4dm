//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_AASrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2011 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_AASrc")
$0:=False:C215
If ([PURCHASE_INVOICES:37]Invoice_Date:5<=vDate)
	If ([PURCHASE_INVOICES:37]Total_Due:9#0)
		$0:=True:C214
	Else 
		If (vDate<DB_GetSalesLedgerFromDate)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=[PURCHASE_INVOICES:37]Company_Code:2; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
			$0:=(Round:C94((Sum:C1([TRANSACTIONS:29]Total:17)); 2)#0)
		Else 
			If ([PURCHASE_INVOICES:37]Invoice_Date:5<DB_GetSalesLedgerFromDate)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=[PURCHASE_INVOICES:37]Company_Code:2; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<DB_GetSalesLedgerFromDate; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3>=DB_GetSalesLedgerFromDate; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
				$0:=(Round:C94(((0-Sum:C1([TRANSACTIONS:29]Total:17))-Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)); 2)#0)
			Else 
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
				
				If ([PURCHASE_INVOICES:37]State:24=-2)
					$0:=(Round:C94(([PURCHASE_INVOICES:37]Total_Paid:8+Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)); 2)#0)
				Else 
					$0:=(Round:C94(([PURCHASE_INVOICES:37]Total_Invoiced:7-Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)); 2)#0)
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Purchases_AASrc"; $_t_oldMethodName)