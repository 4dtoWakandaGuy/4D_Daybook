//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_ValidateDebtors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_TotalDebtDates; 0)
	ARRAY REAL:C219($_ar_TotalDebtAsAtNEW; 0)
	ARRAY REAL:C219($_ar_TotalDebtAsAtOLD; 0)
	C_DATE:C307(VDate)
	C_LONGINT:C283($_l_CountRecords; $_l_Index; $_l_RecordsinSelection; $_l_Sum1)
	C_REAL:C285($_r_Sum; $_r_Sum2; $_r_Sum3; $_r_Total)
	C_TEXT:C284($_t_InvoiceNumberc; $_t_oldMethodName; Acc_t_AccountCodeFrom)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_ValidateDebtors")
ARRAY REAL:C219($_ar_TotalDebtAsAtOLD; 0)
ARRAY REAL:C219($_ar_TotalDebtAsAtNEW; 0)
ARRAY DATE:C224($_ad_TotalDebtDates; 0)
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
Open window:C153(40; 40; 200; 200; -1984)

ALL RECORDS:C47([INVOICES:39])

CREATE SET:C116([INVOICES:39]; "ALL")
$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)

Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Debit_Account:4
For ($_l_Index; 1; $_l_RecordsinSelection)
	USE SET:C118("ALL")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
	VDate:=[INVOICES:39]Invoice_Date:4
	
	Repeat 
		USE SET:C118("ALL")
		GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
		If ([INVOICES:39]Total_Invoiced:5#0)
			
			ERASE WINDOW:C160
			MESSAGE:C88(" Invoice "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection)+"Date:"+String:C10(Vdate))
			
			If (vDate<DB_GetSalesLedgerFromDate)
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=[INVOICES:39]Invoice_Number:1; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
				$_l_Sum1:=(Round:C94((Sum:C1([TRANSACTIONS:29]Total:17)); 2))
			Else 
				If ([INVOICES:39]Invoice_Date:4<DB_GetSalesLedgerFromDate)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=[INVOICES:39]Invoice_Number:1; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<DB_GetSalesLedgerFromDate; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Date:3>=DB_GetSalesLedgerFromDate; *)
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Date:3<=vDate)
					$_l_Sum1:=Round:C94((Sum:C1([TRANSACTIONS:29]Total:17)-Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2)
					
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8>=DB_GetSalesLedgerFromDate)
					QUERY SELECTION:C341([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xTaxPointDate:8<=VDaTE)
					$_r_Sum2:=(Round:C94(INV_CalculateAllocations([XInvoiceAllocation:126]xInvoiceNumber:2; False:C215); 2))
					If ($_l_Sum1#$_r_Sum2)
						
					End if 
					
					
				Else 
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Date:3<=vDate)
					If ([INVOICES:39]State:10=-2)
						$_r_Sum:=Round:C94(([INVOICES:39]Total_Paid:6+Gen_AddSub(->[INVOICES:39]ALLOCATIONS:33; ->[INVOICES_ALLOCATIONS:162]Amount:2)); 2)
					Else 
						$_r_Sum:=Round:C94(([INVOICES:39]Total_Invoiced:5-Gen_AddSub(->[INVOICES:39]ALLOCATIONS:33; ->[INVOICES_ALLOCATIONS:162]Amount:2)); 2)
					End if 
					
					
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6<=VDaTE)
					$_r_Total:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2))
					
					If ([INVOICES:39]State:10=-2)
						$_r_Sum2:=Round:C94([INVOICES:39]Total_Paid:6+$_r_Total; 2)
					Else 
						$_r_Sum2:=Round:C94([INVOICES:39]Total_Invoiced:5-$_r_Total; 2)
					End if 
					If ($_r_Sum2#$_r_Sum)
						SEND PACKET:C103($_ti_DocumentRef; [INVOICES:39]Invoice_Number:1+Char:C90(13)+"Subrecords"+Char:C90(13))
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
						
						$_l_CountRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
						FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
						For ($_l_Index; 1; $_l_CountRecords)
							SEND PACKET:C103($_ti_DocumentRef; String:C10([INVOICES_ALLOCATIONS:162]Amount:2)+Char:C90(9)+[INVOICES_ALLOCATIONS:162]Invoice_Number:1+Char:C90(9)+String:C10([INVOICES_ALLOCATIONS:162]Date:3)+Char:C90(13)+Char:C90(9))
							NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
						End for 
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
						INV_GetAllocations([INVOICES:39]Invoice_Number:1)
						$_t_InvoiceNumberc:=[INVOICES:39]Invoice_Number:1
						SEND PACKET:C103($_ti_DocumentRef; "Allocations"+Char:C90(13))
						
						
						For ($_l_Index; 1; Records in selection:C76([XInvoiceAllocation:126]))
							Case of 
								: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumberc)
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xInvoiceNumber:2+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAllocationDate:6)+Char:C90(13))
								: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#$_t_InvoiceNumberc)
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xCreditNumber:3+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAllocationDate:6)+Char:C90(13))
								: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#$_t_InvoiceNumberc)
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xReceiptNumber:4+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAllocationDate:6)+Char:C90(13))
								: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#$_t_InvoiceNumberc)
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xDepositNumber:5+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAllocationDate:6)+Char:C90(13))
									
							End case 
							
							NEXT RECORD:C51([XInvoiceAllocation:126])
						End for 
						$_r_Sum:=0
						
					End if 
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8<=VDaTE)
					$_r_Total:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2))
					
					If ([INVOICES:39]State:10=-2)
						$_r_Sum3:=Round:C94([INVOICES:39]Total_Paid:6+$_r_Total; 2)
					Else 
						$_r_Sum3:=Round:C94([INVOICES:39]Total_Invoiced:5-$_r_Total; 2)
					End if 
					If ($_r_Sum3#$_r_Sum2)
						//how would this affect the output?
						
					End if 
					
					
				End if 
			End if 
			VDate:=VDate+1
			
		Else 
			$_r_Sum:=0
			VDate:=Current date:C33(*)+1
		End if 
		
		
	Until (VDate>Current date:C33(*)) | ($_r_Sum=0)
	NEXT RECORD:C51([INVOICES:39])
	
	
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("SI_ValidateDebtors"; $_t_oldMethodName)
